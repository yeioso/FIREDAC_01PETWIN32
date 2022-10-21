unit Form_Depurador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,
  UtConexion;

type
  TFrDepurador = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BtnAceptar: TSpeedButton;
    BtnCancelar: TSpeedButton;
    Panel3: TPanel;
    Label1: TLabel;
    BtnInicializar: TSpeedButton;
    Dato: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnInicializarClick(Sender: TObject);
    procedure BtnAceptarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure DatoChange(Sender: TObject);
  private
    { Private declarations }
    FDATA : TMANAGER_DATA;
    Function Abrir : Boolean;
    Procedure Execute_Delete;
    Function Eliminar_Dependencias(Const pTabla : Integer; Const pField, pCodigo_Producto : String) : Boolean;
    Function Update_Dependencias(pCodigo_Producto : String) : Boolean;
  public
    { Public declarations }
  end;

var
  FrDepurador: TFrDepurador;
  Procedure Form_Depurador_Show;

implementation
{$R *.dfm}
Uses
  Math,
  UtFunciones,
  UtInfoTablas,
  UtVariablesGlobales;

procedure TFrDepurador.BtnAceptarClick(Sender: TObject);
begin
  Execute_Delete;
end;

procedure TFrDepurador.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrDepurador.BtnInicializarClick(Sender: TObject);
Var
  lSQL : String;
Begin
  lSQL := ' UPDATE ' + Retornar_Info_Tabla(Id_Producto).Name + ' ' + ' SET TAG_INFO = 0';
  If SiNo('Está seguro(a) de inicializar?') Then
    If gVariableGlobal.CNX.SQL_Boolean(lSQL, 'TFrDepurador.BtnInicializarClick') Then
      Mensajes('Inicializaciòn exitosa');
end;

procedure TFrDepurador.DatoChange(Sender: TObject);
begin
  Abrir;
end;

procedure TFrDepurador.DBGrid1DblClick(Sender: TObject);
begin
  Try
    FDATA.QR.Edit;
    FDATA.QR.FieldByName('TAG_INFO').AsInteger := IfThen(FDATA.QR.FieldByName('TAG_INFO').AsInteger = 0, 1, 0);
    FDATA.QR.Post;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDepurador.DBGrid1DblClick', 'Error', E.Message]);
  End;
end;

procedure TFrDepurador.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   If Key = VK_F10 Then
   Begin
     DBGrid1DblClick(Nil);
     Key := 0;
   End;
end;

Function TFrDepurador.Eliminar_Dependencias(Const pTabla : Integer; Const pField, pCodigo_Producto : String) : Boolean;
Var
  lSQL : String;
Begin
  lSQL := ' DELETE FROM ' + Retornar_Info_Tabla(pTabla).Name + ' ' +
          ' WHERE ' + pField + ' = ' + QuotedStr(Trim(pCodigo_Producto));
  Result := gVariableGlobal.CNX.SQL_Boolean(lSQL, 'TFrDepurador.Eliminar_Dependencias');
End;

Function TFrDepurador.Update_Dependencias(pCodigo_Producto : String) : Boolean;
Var
  lSQL : String;
Begin
  lSQL := ' UPDATE ' + Retornar_Info_Tabla(Id_Producto).Name + ' ' +
          ' SET PRODUCTO_PADRE = NULL ' +
          ' WHERE PRODUCTO_PADRE = ' + QuotedStr(Trim(pCodigo_Producto));
  Result := gVariableGlobal.CNX.SQL_Boolean(lSQL, 'TFrDepurador.Update_Dependencias');
End;

Procedure TFrDepurador.Execute_Delete;
Begin
  If (Not SiNo('Està seguro(a) de eliminar esta información?')) Or (Not Abrir) Then
    Exit;
  Try
    FDATA.QR.First;
    While Not FDATA.QR.Eof Do
    Begin
      If FDATA.QR.FieldByName('TAG_INFO').AsInteger <> 0 Then
      Begin
        FDATA.QR.Edit;
        FDATA.QR.FieldByName('PRODUCTO_PADRE').Clear;
        FDATA.QR.Post;
        If Update_Dependencias(FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString) And
           Eliminar_Dependencias(Id_Producto_Observacion, 'CODIGO_PRODUCTO', FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString) And
           Eliminar_Dependencias(Id_Hoja_Inventario     , 'CODIGO_PRODUCTO', FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString) And
           Eliminar_Dependencias(Id_Documento_Obs_Aux   , 'CODIGO_PRODUCTO', FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString) And
           Eliminar_Dependencias(Id_Documento_Obs       , 'CODIGO_PRODUCTO', FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString) And
           Eliminar_Dependencias(Id_Documento_Det       , 'CODIGO_PRODUCTO', FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString) And
           Eliminar_Dependencias(Id_Documento_Det_Aux   , 'CODIGO_PRODUCTO', FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString) And
           Eliminar_Dependencias(Id_Documento_Rec       , 'CODIGO_PRODUCTO', FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString) And
           Eliminar_Dependencias(Id_Documento_Rec_Aux   , 'CODIGO_PRODUCTO', FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString) And
           Eliminar_Dependencias(Id_Producto_Baja       , 'CODIGO_PRODUCTO', FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString) And
           Eliminar_Dependencias(Id_Producto_Receta     , 'CODIGO_PRODUCTO', FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString) And
           Eliminar_Dependencias(Id_Producto_Receta     , 'PRODUCTO_PADRE' , FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString) And
           Eliminar_Dependencias(Id_Producto_Tercero    , 'CODIGO_PRODUCTO', FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString) And
           Eliminar_Dependencias(Id_Ajuste_Kardex       , 'CODIGO_PRODUCTO', FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString) And
           Eliminar_Dependencias(Id_Producto_LP         , 'CODIGO_PRODUCTO', FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString) Then
        Begin
           FDATA.QR.Delete;
           FDATA.QR.First;
        End
        Else
           FDATA.QR.Next;
      End
      Else
        FDATA.QR.Next;
    End;
  Except
   On E: Exception Do
     gVariableGlobal.Add_Log(E, ['Origen', 'TFrDepurador.DBGrid1DblClick', 'Error', E.Message]);
  End;
End;

Function TFrDepurador.Abrir : Boolean;
Begin
  Result := False;
  Try
    FDATA.QR.Active := False;
    FDATA.QR.SQL.Clear;
    FDATA.QR.SQL.Add(' SELECT * FROM PRODUCTO ');
    If Not Vacio(Dato.Text) Then
      FDATA.QR.SQL.Add(' WHERE NOMBRE LIKE ' + QuotedStr('%' + Trim(Dato.Text)+ '%'));
    FDATA.QR.Active := True;
    Result := FDATA.QR.Active;
  Except
   On E: Exception Do
     gVariableGlobal.Add_Log(E, ['Origen', 'TFrDepurador.Abrir', 'Error', E.Message]);
  End;
End;

procedure TFrDepurador.FormCreate(Sender: TObject);
begin
  Self.Caption := 'Depurador';
  FDATA := TMANAGER_DATA.Create(Retornar_Info_Tabla(Id_Producto).Name, Retornar_Info_Tabla(Id_Producto).Caption);
  FDATA.QR.Connection := gVariableGlobal.CNX;
end;

procedure TFrDepurador.FormDestroy(Sender: TObject);
begin
  If FDATA.QR.Active Then
    FDATA.QR.Active := False;
end;

Procedure Form_Depurador_Show;
Begin
  FrDepurador := TFrDepurador.Create(Nil);
  If FrDepurador.Abrir Then
    FrDepurador.ShowModal;
  FrDepurador.DisposeOf;
End;

end.
