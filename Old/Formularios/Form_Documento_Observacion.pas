unit Form_Documento_Observacion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,   Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, UtConexion;

type
  TFrDocumento_Observacion = class(TForm)
    GRID_ORIGEN: TDBGrid;
    DSORIGEN: TDataSource;
    GRID_DESTINO: TDBGrid;
    DSDESTINO: TDataSource;
    BtnAceptar: TSpeedButton;
    BtnAdd: TSpeedButton;
    procedure BtnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GRID_ORIGENDblClick(Sender: TObject);
    procedure GRID_DESTINODblClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
  private
    { Private declarations }
    QRORIGEN : TQUERY;
    QRDESTINO : TQUERY;
    FDATAKEY : String;
    FCONSECUTIVO : String;
    FCODIGO_PRODUCTO : String;
    Function Crear_Observacion : Boolean;
    Function Abrir : Boolean;
    Function Insertar_Destino : Boolean;
  public
    { Public declarations }
  end;

Var
  FrDocumento_Observacion: TFrDocumento_Observacion;
  Procedure Form_Documento_Observacion_Show(Const pCodigo_Producto, pDatakey, pConsecutivo : String);

implementation
{$R *.dfm}
Uses
  UtFunciones,
  UtInfoTablas,
  UtVariablesGlobales;

Function TFrDocumento_Observacion.Crear_Observacion : Boolean;
Var
  lValue : String;
Begin
  lValue := '';
  Try
    If InputQuery('Observación', 'Observación', lValue) And (Not Vacio(lValue)) Then
    Begin
      QRORIGEN.Append;
      QRORIGEN.FieldByName('CODIGO_PRODUCTO'   ).AsString := FCODIGO_PRODUCTO;
      QRORIGEN.FieldByName('CODIGO_OBSERVACION').AsString := gVariableGlobal.CNX.Next(Retornar_Info_Tabla(Id_Producto_Observacion).Name, '0', ['CODIGO_OBSERVACION'], ['CODIGO_PRODUCTO'], [FCODIGO_PRODUCTO], QRORIGEN.FieldByName('CODIGO_OBSERVACION').Size);
      QRORIGEN.FieldByName('NOMBRE'            ).AsString := AnsiUpperCase(lValue);
      QRORIGEN.Post;
      Insertar_Destino;
      QRDESTINO.Active := False;
      QRDESTINO.Active := True;
    End;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Observacion.Crear_Observacion']);
  End;
End;

procedure TFrDocumento_Observacion.BtnAceptarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrDocumento_Observacion.BtnAddClick(Sender: TObject);
begin
  Crear_Observacion;
end;

procedure TFrDocumento_Observacion.FormCreate(Sender: TObject);
begin
  QRORIGEN := TQUERY.Create(Nil);
  QRDESTINO := TQUERY.Create(Nil);

  DSORIGEN.DataSet := QRORIGEN;
  DSDESTINO.DataSet := QRDESTINO;
end;

procedure TFrDocumento_Observacion.FormDestroy(Sender: TObject);
begin
  If Assigned(QRDESTINO) Then
  Begin
    QRDESTINO.Active := False;
    FreeAndNil(QRDESTINO);
  End;

  If Assigned(QRORIGEN) Then
  Begin
    QRORIGEN.Active := False;
    FreeAndNil(QRORIGEN);
  End;
end;

Function TFrDocumento_Observacion.Insertar_Destino : Boolean;
Var
  lSQL : TQUERY;
Begin
  Try
    lSQL := TQUERY.Create(Nil);
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Obs_Aux).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_PRODUCTO') + ' = ' + QuotedStr(Trim(FCODIGO_PRODUCTO)) + ' ');
    lSQL.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('CONSECUTIVO') + ' = ' + QuotedStr(Trim(FCONSECUTIVO)) + ' ');
    lSQL.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(FDATAKEY)) + ' ');
    lSQL.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('CODIGO_OBSERVACION') + ' = ' + QuotedStr(Trim(QRORIGEN.FieldByName('CODIGO_OBSERVACION').AsString)) + ' ');
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount <= 0) Then
    Begin
      lSQL.Append;
      lSQL.FieldByName('CODIGO_PRODUCTO'   ).AsString := FCODIGO_PRODUCTO;
      lSQL.FieldByName('CONSECUTIVO'       ).AsString := FCONSECUTIVO    ;
      lSQL.FieldByName('DATAKEY'           ).AsString := FDATAKEY        ;
      lSQL.FieldByName('CODIGO_OBSERVACION').AsString := QRORIGEN.FieldByName('CODIGO_OBSERVACION').AsString;
      lSQL.FieldByName('NOMBRE'            ).AsString := QRORIGEN.FieldByName('NOMBRE'            ).AsString;
      lSQL.Post;
    End;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Observacion.Insertar_Destino']);
  End;
End;

procedure TFrDocumento_Observacion.GRID_DESTINODblClick(Sender: TObject);
begin
  Try
    If QRDESTINO.RecordCount > 0 Then
    Begin
      QRDESTINO.Delete;
    End;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Observacion.GRID_ORIGENDblClick']);
  End;
end;

procedure TFrDocumento_Observacion.GRID_ORIGENDblClick(Sender: TObject);
begin
  Try
    If QRORIGEN.RecordCount > 0 Then
    Begin
      GRID_DESTINO.Visible := False;
      QRDESTINO.Active := False;
      Insertar_Destino;
      QRDESTINO.Active := True;
      GRID_DESTINO.Visible := True;
    End;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Observacion.GRID_ORIGENDblClick']);
  End;
end;

Function TFrDocumento_Observacion.Abrir : Boolean;
Begin
  Try
    QRORIGEN.Active := False;
    QRDESTINO.Active := False;
    QRORIGEN.SQL.Clear;
    QRDESTINO.SQL.Clear;

    QRORIGEN.SQL.Add(' SELECT * FROM  ' + Retornar_Info_Tabla(Id_Producto_Observacion).Name + ' ');
    QRORIGEN.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_PRODUCTO') + ' = ' + QuotedStr(Trim(FCODIGO_PRODUCTO)) + ' ');

    QRDESTINO.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Obs_Aux).Name + ' ');
    QRDESTINO.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_PRODUCTO') + ' = ' + QuotedStr(Trim(FCODIGO_PRODUCTO)) + ' ');
    QRDESTINO.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('CONSECUTIVO') + ' = ' + QuotedStr(Trim(FCONSECUTIVO)) + ' ');
    QRDESTINO.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(FDATAKEY)) + ' ');

    QRORIGEN.Active := True;
    QRDESTINO.Active := True;

    Result := QRORIGEN.Active And QRDESTINO.Active And (QRORIGEN.RecordCount > 0);
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Observacion.Abrir']);
  End;
End;

Procedure Form_Documento_Observacion_Show(Const pCodigo_Producto, pDatakey, pConsecutivo : String);
Begin
  FrDocumento_Observacion := TFrDocumento_Observacion.Create(Nil);
  FrDocumento_Observacion.FDATAKEY := pDatakey;
  FrDocumento_Observacion.FCONSECUTIVO := pConsecutivo;
  FrDocumento_Observacion.FCODIGO_PRODUCTO := pCodigo_Producto;
  If FrDocumento_Observacion.Abrir Then
   FrDocumento_Observacion.ShowModal;
  FreeAndNil(FrDocumento_Observacion);
End;

end.
