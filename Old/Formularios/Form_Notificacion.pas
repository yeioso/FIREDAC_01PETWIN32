unit Form_Notificacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, UtConexion, Grids, DBGrids, ExtCtrls, UtFormularios, Vcl.Buttons;

type
  TFrNotificacion = class(TObjForm)
    DsNotificacion: TDataSource;
    DBGrid1: TDBGrid;
    QrNotificacion: TQuery;
    Timer1: TTimer;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  Protected
  private
    { Private declarations }
    Function Abrir_Tabla : Boolean;
  public
    { Public declarations }
  end;

var
  FrNotificacion: TFrNotificacion;
  Function Show_Form_Notificacion : Boolean;
  Function Elimina_Notificados : Integer;

implementation
{$R *.dfm}

Uses
  UtFecha,
  UtConexion,
  
  UtFunciones,
  UtException,
  UtConstantes,
  UtInfoTablas,
  UtHomologacion,
  Form_CiruelaKardex,
  UtVariablesGlobales;

Var
  gNumero_Registros : Integer = 0;

Procedure Agregar_Notificacion(pNotificacion, pDescripcion : String);
Var
  lSQL : TQuery;
Begin
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gConexion;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Notificacion).Name);
    lSQL.SQL.Add(' WHERE ' +  Trim_Sentence('NOTIFICACION') + ' = ' + QuotedStr(Trim(pNotificacion)));
    lSQL.Active := True ;
    If lSQL.Active Then
    Begin
      If lSQL.RecordCount <= 0 Then
      Begin
        lSQL.Append;
        lSQL.FieldByName('NOTIFICACION').AsString := Copy(pNotificacion, 1, lSQL.FieldByName('NOTIFICACION').Size);
      End
      Else
        lSQL.Edit;
      lSQL.FieldByName('DESCRIPCION').AsString := Copy(Trim(pDescripcion), 1, lSQL.FieldByName('DESCRIPCION').Size);
      lSQL.Post;
    End;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E : Exception Do
      Ingresar_Inconsistencias(E, 'Form_Notificacion, Agregar_Notificacion', '');
  End;
End;

Procedure Buscar_Notificacion_Stock;
Var
  lSQL : TQuery;
Begin
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gConexion;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto).Name + ' ');
    lSQL.SQL.Add(' WHERE CANTIDAD < STOCK_MINIMO ');
    lSQL.SQL.Add(' OR    CANTIDAD > STOCK_MAXIMO ');
    lSQL.Active := True ;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        If lSQL.FieldByName('CANTIDAD').AsFloat < lSQL.FieldByName('STOCK_MINIMO').AsFloat Then
           Agregar_Notificacion('Stock - ' + lSQL.FieldByName('NOMBRE').AsString, 'Existencia : ' + FormatFloat('###,###,##0', lSQL.FieldByName('CANTIDAD').AsFloat) + ', stock minimo ' +  FormatFloat('###,###,##0', lSQL.FieldByName('STOCK_MINIMO').AsFloat))
        Else
          If lSQL.FieldByName('CANTIDAD').AsFloat > lSQL.FieldByName('STOCK_MAXIMO').AsFloat Then
             Agregar_Notificacion('Stock - ' +lSQL.FieldByName('NOMBRE').AsString, 'Existencia : ' + FormatFloat('###,###,##0', lSQL.FieldByName('CANTIDAD').AsFloat) + ', stock maximo ' +  FormatFloat('###,###,##0', lSQL.FieldByName('STOCK_MAXIMO').AsFloat));
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E : Exception Do
      Ingresar_Inconsistencias(E, 'Form_Notificacion, Buscar_Notificacion_Stock', '');
  End;
End;

Procedure Buscar_Notificacion_Fecha_Vencimiento;
Var
  lSQL : TQuery;
  lFecha : TFecha_Info;
Begin
  lFecha := Return_Type_Date(Now + gDIAS_PREAVISO);
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gConexion;
    lSQL.SQL.Add(' SELECT ');
    lSQL.SQL.Add('    PRODUCTO.NOMBRE, ');
    lSQL.SQL.Add('    DOCUMENTO_DET.CONSECUTIVO, ');
    lSQL.SQL.Add('    DOCUMENTO_DET.FECHA_VENCIMIENTO ');
    lSQL.SQL.Add(' FROM DOCUMENTO_DET ');
    lSQL.SQL.Add(' INNER JOIN PRODUCTO ');
    lSQL.SQL.Add(' ON DOCUMENTO_DET.CODIGO_PRODUCTO = PRODUCTO.CODIGO_PRODUCTO ');
    lSQL.SQL.Add(' WHERE PRODUCTO.ID_FECHA_VENCIMIENTO = ' + QuotedStr('S') + ' ');
    lSQL.SQL.Add(' AND DOCUMENTO_DET.TIPO_DOCUMENTO  = ' + QuotedStr(Const_Documento_Compra) + ' ');
    lSQL.SQL.Add(' AND DOCUMENTO_DET.FECHA_VENCIMIENTO BETWEEN ' + QuotedStr(FormatDateTime('YYYY-MM-DD', Now)) + ' AND ' + QuotedStr(Trim(lFecha.yyyy_mm_dd)));
    lSQL.Active := True ;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        Agregar_Notificacion(lSQL.FieldByName('NOMBRE').AsString, 'Fecha de Vencimiento: ' + lSQL.FieldByName('FECHA_VENCIMIENTO').AsString);
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E : Exception Do
      Ingresar_Inconsistencias(E, 'Form_Notificacion, Buscar_Notificacion_Fecha_Vencimiento', '');
  End;
End;

Function Numero_Registros_Notificados : Integer;
Var
  lSQL : TQuery;
Begin
  Result := 0;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gConexion;
    lSQL.SQL.Add(' SELECT COUNT(*) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Notificacion).Name + ' ');
    lSQL.Active := True ;
    If lSQL.Active Then
      Result := lSQL.FieldByName('RESULTADO').AsInteger;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E : Exception Do
      Ingresar_Inconsistencias(E, 'Form_Notificacion, Numero_Registros_Notificados', '');
  End;
End;

Function Elimina_Notificados : Integer;
Var
  lSQL : TQuery;
Begin
  Result := 0;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gConexion;
    lSQL.SQL.Add(' DELETE FROM ' + Retornar_Info_Tabla(Id_Notificacion).Name + ' ');
    lSQL.ExecSQL;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E : Exception Do
      Ingresar_Inconsistencias(E, 'Form_Notificacion, Numero_Registros_Notificados', '');
  End;
End;

procedure TFrNotificacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
end;

procedure TFrNotificacion.FormCreate(Sender: TObject);
begin
  gNumero_Registros := 0;
  Self.Caption := Retornar_Info_Tabla(Id_Notificacion).Caption;
  Self.Setting_Form(Self, -1, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;  
end;

procedure TFrNotificacion.FormDestroy(Sender: TObject);
begin
  If QrNotificacion.Active Then
    QrNotificacion.Active := False;
end;

procedure TFrNotificacion.SpeedButton1Click(Sender: TObject);
begin
  If SiNo('Esta seguro(a) de no mostrar las notificaciones?') Then
  Begin
    If Assigned(FrCiruelaKardex) Then
    Begin
      FreeAndNil(FrCiruelaKardex);
    End;
  End;
end;

procedure TFrNotificacion.Timer1Timer(Sender: TObject);
begin
  Buscar_Notificacion_Stock;
  Buscar_Notificacion_Fecha_Vencimiento;
  If gNumero_Registros <> Numero_Registros_Notificados Then
  Begin
    gNumero_Registros := Numero_Registros_Notificados;
    Abrir_Tabla;
  End;
end;

Function TFrNotificacion.Abrir_Tabla : Boolean;
Begin
  Try
    QrNotificacion.Active := False;
    QrNotificacion.Connection := gConexion;
    QrNotificacion.SQL.Clear;
    QrNotificacion.SQL.Add('SELECT * FROM ' + Retornar_Info_Tabla(Id_Notificacion).Name + ' ');
    QrNotificacion.Active := True;
  Except
    On E : Exception Do
      Ingresar_Inconsistencias(E, 'TFrNotificacion.Abrir_Tabla', '');
  End;
End;

Function Show_Form_Notificacion : Boolean;
Begin
  Result := True;
  If (gID_STOCK = 'S') Or (gID_F_VENCIMIENTO = 'S') Then
  Begin
    If (Not Assigned(FrNotificacion)) Then
    Begin
      FrNotificacion := TFrNotificacion.Create(Nil);
      FrNotificacion.Top := 10;
      FrNotificacion.Left := 10;
    End;
    FrNotificacion.ShowModal;
  End;
End;

end.
