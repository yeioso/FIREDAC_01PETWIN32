unit Form_Producto_Baja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,  ComCtrls, ovcdbfcb,
  ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrProducto_Baja = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    OvcController1: TOvcController;
    PnlNavegador: TPanel;
    DBNavigator1: TDBNavigator;
    PnlGrid: TPanel;
    Registros: TDBGrid;
    Estado_Actual: TStatusBar;
    Barra_Ayuda01: TStatusBar;
    Barra_Ayuda02: TStatusBar;
    PnlOpcionales: TPanel;
    BtnExcel: TSpeedButton;
    BtnBuscar: TSpeedButton;
    BtnFiltrado: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    BtnAplicar: TSpeedButton;
    DATAKEY: TOvcDbPictureField;
    NOMBRE: TOvcDbPictureField;
    CANTIDAD: TOvcDbPictureField;
    Label3: TLabel;
    CODIGO_PRODUCTO: TOvcDbPictureField;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbNombre_Usuario: TLabel;
    FECHA: TOvcDbPictureField;
    HORA: TOvcDbPictureField;
    CODIGO_USUARIO: TOvcDbPictureField;
    BtnProducto: TSpeedButton;
    lbNombreProducto: TLabel;
    Label4: TLabel;
    lbNombre_Responsable: TLabel;
    CODIGO_RESPONSABLE: TOvcDbPictureField;
    BtnResponsable: TSpeedButton;
    OBSERVACION: TDBMemo;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure CODIGO_RECAUDADORExit(Sender: TObject);
    procedure VALORUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnAplicarClick(Sender: TObject);
    procedure BtnProductoClick(Sender: TObject);
    procedure CODIGO_PRODUCTOExit(Sender: TObject);
    procedure CODIGO_PRODUCTOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_PRODUCTOUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure CANTIDADUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnResponsableClick(Sender: TObject);
    procedure CODIGO_RESPONSABLEExit(Sender: TObject);
    procedure CODIGO_RESPONSABLEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_RESPONSABLEUserValidation(Sender: TObject;
      var ErrorCode: Word);
  private
    { Private declarations }
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    Procedure Procesar_Before_Post; Override;
    procedure DataChange(Sender: TObject; Field: TField); Override;
    procedure StateChange(Sender: TObject); Override;
  Protected
  public
    { Public declarations }
  end;

Var
  FrProducto_Baja: TFrProducto_Baja;
  Procedure Show_Form_Producto_Baja;

implementation
{$R *.dfm}

Uses
  UtExcel,
  UtFecha,
  Printers,
  UtConexion,
  Form_Fecha,
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  Form_Busqueda,
  UtVariablesGlobales;

Procedure TFrProducto_Baja.Procesar_Before_Post;
Begin
  Inherited;
  If Modo_Edicion Then
    If Vacio(OBSERVACION.Lines.Text) Then
    Begin
      If OBSERVACION.Enabled Then
        ActiveControl := OBSERVACION;
      Mensajes('Debe ingresar el motivo de la baja');
      Abort;
    End;
End;


procedure TFrProducto_Baja.DataChange(Sender: TObject; Field: TField);
Var
  lSaldo : Double;
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_USUARIO.Field.FullName)) Then
    lbNombre_Usuario.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [CODIGO_USUARIO.Field.AsString], ['NOMBRE'], 'TFrProducto_Baja.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_RESPONSABLE.Field.FullName)) Then
    lbNombre_Responsable.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [CODIGO_RESPONSABLE.Field.AsString], ['NOMBRE'], 'TFrProducto_Baja.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_PRODUCTO.Field.FullName)) Then
    lbNombreProducto.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [CODIGO_PRODUCTO.Field.AsString], ['NOMBRE'], 'TFrProducto_Baja.DsMaestroDataChange');

  BtnAplicar.Enabled := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1) And (tbMaestro.FieldByName('ID_ACTUALIZADO').AsString <> 'S');
  Self.Cancelar_Eliminacion := (tbMaestro.FieldByName('ID_ACTUALIZADO').AsString = 'S');
  Self.No_Permitir_Modificar := (tbMaestro.FieldByName('ID_ACTUALIZADO').AsString = 'S');

end;

procedure TFrProducto_Baja.StateChange(Sender: TObject);
begin
  Inherited;
  If Not tbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion And (tbMaestro.FieldByName('ID_ACTUALIZADO').AsString <> 'S'));
  DATAKEY.Enabled        := False;
  CODIGO_USUARIO.Enabled := False;
  FECHA.Enabled          := False;
  HORA.Enabled           := False;
  BtnAplicar.Enabled     := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1) And (tbMaestro.FieldByName('ID_ACTUALIZADO').AsString <> 'S');
  BtnExcel.Enabled       := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled      := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled      := (Not Modo_Edicion);
  NOMBRE.Enabled         := Modo_Edicion;
  Self.Cancelar_Eliminacion := (tbMaestro.FieldByName('ID_ACTUALIZADO').AsString = 'S');;
  Self.No_Permitir_Modificar := (tbMaestro.FieldByName('ID_ACTUALIZADO').AsString = 'S');;
  Case DsMaestro.State Of
    dsInsert : Begin
                 Inicializar_Labels_Formulario(Self, ['lb'], '');
                 If DATAKEY.Enabled Then
                   DATAKEY.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrProducto_Baja.FormCreate(Sender: TObject);
begin
  Inicializar_Labels_Formulario(Self, ['lb'], '');
  Caption := Retornar_Info_Tabla(Id_Producto_Baja).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Producto_Baja, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.Tag := gVariableGlobal.VALOR_TAG;
end;

Procedure TFrProducto_Baja.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrProducto_Baja.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrProducto_Baja.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
    HORA.Field.AsString := FormatDateTime('HH:NN:SS.Z', Now);
    FECHA.Field.AsString := gVariableGlobal.Fecha_Actual.yyyy_mm_dd ;
    DATAKEY.Field.AsString := FormatDateTime('YYYYMMDDHHNNSSZZZZZZ', Now);
    tbMaestro.FieldByName('ID_ACTUALIZADO').AsString := 'N';
    CODIGO_USUARIO.Field.AsString := gVariableGlobal.Usuario_Actual;
  End;
end;

procedure TFrProducto_Baja.VALORUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If TOvcDbPictureField(Sender).AsFloat <= 0 Then
       ErrorCode := IE_VALUE_INVALID;
end;

Function TFrProducto_Baja.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto_Baja).Name);
  Self.Abrir_Archivo(TbMaestro, ['DATAKEY']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['DATAKEY', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrProducto_Baja.BtnAplicarClick(Sender: TObject);
Var
  lSQL : String;
begin
  lSQL := 'UPDATE ' + Retornar_Info_Tabla(Id_Producto_Baja).Name + ' ' +
          ' SET ID_ACTUALIZADO = ' + QuotedStr('S') + ' ' +
          ' WHERE ' + CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(DATAKEY.EditString));
  If CNX.SQL_Boolean(lSQL, 'TFrProducto_Baja.BtnAplicarClick') Then
  Begin
    Mensajes('Baja actualizada');
    Try
      DBNavigator1.BtnClick(nbRefresh);
    Except
      On E: Exception Do
        gVariableGlobal.Add_Log(e, ['Origen', 'TFrProducto_Baja.BtnAplicarClick']);
    End;
  End
  Else
    Mensajes('Baja no actualizada');
end;

procedure TFrProducto_Baja.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'DATAKEY'], [DATAKEY.Field.FullName], Retornar_Info_Tabla(Id_Producto_Baja).Name, '', Retornar_Info_Tabla(Id_Producto_Baja).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(DATAKEY.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrProducto_Baja.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Producto_Baja).Caption);
end;

procedure TFrProducto_Baja.BtnProductoClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_PRODUCTO'], ['CODIGO_PRODUCTO'], Retornar_Info_Tabla(Id_Producto).Name, '', Retornar_Info_Tabla(Id_Producto).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_PRODUCTO.Field.AsString := lResult01;
end;

procedure TFrProducto_Baja.BtnResponsableClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_USUARIO'], ['CODIGO_USUARIO'], Retornar_Info_Tabla(Id_Usuario).Name, '', Retornar_Info_Tabla(Id_Usuario).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_RESPONSABLE.Field.AsString := lResult01;
end;

procedure TFrProducto_Baja.CANTIDADUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If TOvcDbPictureField(Sender).AsFloat <= 0 Then
      ErrorCode := IE_VALUE_INVALID;
end;

Procedure TFrProducto_Baja.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrProducto_Baja.CODIGO_PRODUCTOExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrProducto_Baja.CODIGO_PRODUCTOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnProducto.Click;
end;

procedure TFrProducto_Baja.CODIGO_PRODUCTOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrProducto_Baja.CODIGO_RECAUDADORExit(Sender: TObject);
begin
  If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
  Begin
    TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
  End;
end;

procedure TFrProducto_Baja.CODIGO_RESPONSABLEExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrProducto_Baja.CODIGO_RESPONSABLEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnResponsable.Click;
end;

procedure TFrProducto_Baja.CODIGO_RESPONSABLEUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrProducto_Baja.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

Procedure Show_Form_Producto_Baja;
Begin
  FrProducto_Baja := TFrProducto_Baja.Create(Application);
  If FrProducto_Baja.Abrir_Archivos Then
    FrProducto_Baja.Show
  Else
  Begin
    FrProducto_Baja.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.

