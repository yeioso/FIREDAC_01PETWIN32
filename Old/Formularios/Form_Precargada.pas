unit Form_Precargada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,  ComCtrls, ovcdbfcb,
  ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrPrecargada = class(TObjForm)
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
    Label4: TLabel;
    BtnCODIGO_TERCERO: TSpeedButton;
    lbNombre_CODIGO_TERCERO: TLabel;
    Label8: TLabel;
    BtnCODIGO_SINONIMO: TSpeedButton;
    lbNombre_CODIGO_SINONIMO: TLabel;
    Label12: TLabel;
    BtnLISTA_PRECIO: TSpeedButton;
    lbNombre_LISTA_PRECIO: TLabel;
    Label14: TLabel;
    BtnCODIGO_VENDEDOR: TSpeedButton;
    lbNombre_CODIGO_VENDEDOR: TLabel;
    Label16: TLabel;
    BtnCODIGO_BASE: TSpeedButton;
    lbNombre_CODIGO_BASE: TLabel;
    CODIGO_TERCERO: TOvcDbPictureField;
    CODIGO_SINONIMO: TOvcDbPictureField;
    LISTA_PRECIO: TOvcDbPictureField;
    CODIGO_VENDEDOR: TOvcDbPictureField;
    CODIGO_BASE: TOvcDbPictureField;
    Label1: TLabel;
    Label2: TLabel;
    CODIGO_PERIODO: TOvcDbPictureField;
    NOMBRE: TOvcDbPictureField;
    Label3: TLabel;
    BtnProducto: TSpeedButton;
    lbNombre_CODIGO_PRODUCTO: TLabel;
    CODIGO_PRODUCTO: TOvcDbPictureField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CODIGO_PERIODOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure CODIGO_TERCEROExit(Sender: TObject);
    procedure CODIGO_TERCEROKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_TERCEROUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure BtnCODIGO_TERCEROClick(Sender: TObject);
    procedure CODIGO_SINONIMOExit(Sender: TObject);
    procedure CODIGO_SINONIMOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_SINONIMOUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure BtnCODIGO_SINONIMOClick(Sender: TObject);
    procedure LISTA_PRECIOExit(Sender: TObject);
    procedure LISTA_PRECIOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LISTA_PRECIOUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure BtnLISTA_PRECIOClick(Sender: TObject);
    procedure CODIGO_VENDEDORExit(Sender: TObject);
    procedure CODIGO_VENDEDORKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_VENDEDORUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure BtnCODIGO_VENDEDORClick(Sender: TObject);
    procedure CODIGO_BASEExit(Sender: TObject);
    procedure CODIGO_BASEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_BASEUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure BtnCODIGO_BASEClick(Sender: TObject);
    procedure PDD_NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure FCT_CODIGO_TERCEROUserValidation(Sender: TObject;  var ErrorCode: Word);
    procedure CODIGO_PRODUCTOExit(Sender: TObject);
    procedure CODIGO_PRODUCTOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnProductoClick(Sender: TObject);
    procedure CODIGO_PRODUCTOUserValidation(Sender: TObject;
      var ErrorCode: Word);
    private
    { Private declarations }
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    procedure StateChange(Sender: TObject); Override;
    procedure DataChange(Sender: TObject; Field: TField); Override;
  Protected
  public
    { Public declarations }
  end;

Var
  FrPrecargada: TFrPrecargada;
  Procedure Show_Form_Precargada;

implementation
{$R *.dfm}

Uses
  UtExcel,
  Printers,
  UtConexion,
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  Form_Busqueda,
  Form_Seleccion,
  UtVariablesGlobales;


procedure TFrPrecargada.DataChange(Sender: TObject; Field: TField);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_TERCERO.Field.FullName)) Then
    lbNombre_CODIGO_TERCERO.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [CODIGO_TERCERO.Field.AsString], ['NOMBRE'], 'TFrPrecargada.DataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_SINONIMO.Field.FullName)) Then
    lbNombre_CODIGO_SINONIMO.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [CODIGO_TERCERO.Field.AsString, CODIGO_SINONIMO.Field.AsString], ['NOMBRE'], 'TFrPrecargada.DataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = LISTA_PRECIO.Field.FullName)) Then
    lbNombre_LISTA_PRECIO.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero_LP).Name, ['CODIGO_TERCERO_LP', 'CODIGO_TERCERO'], [LISTA_PRECIO.Field.AsString, CODIGO_TERCERO.Field.AsString], ['NOMBRE'], 'TFrPrecargada.DataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_VENDEDOR.Field.FullName)) Then
    lbNombre_CODIGO_VENDEDOR.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [CODIGO_VENDEDOR.Field.AsString], ['NOMBRE'], 'TFrPrecargada.DataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_BASE.Field.FullName)) Then
    lbNombre_CODIGO_BASE.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Base).Name, ['CODIGO_BASE'], [CODIGO_BASE.Field.AsString], ['NOMBRE'], 'TFrPrecargada.DataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_PRODUCTO.Field.FullName)) Then
    lbNombre_CODIGO_PRODUCTO.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [CODIGO_PRODUCTO.Field.AsString], ['NOMBRE'], 'TFrPrecargada.DataChange');
end;

procedure TFrPrecargada.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_PERIODO.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled       := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled      := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled      := (Not Modo_Edicion);
  NOMBRE.Enabled         := Modo_Edicion;
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CODIGO_PERIODO.Enabled Then
                   CODIGO_PERIODO.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrPrecargada.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Precargada).Name;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Precargada, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 1);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Self.Tag := gVariableGlobal.VALOR_TAG;
end;

procedure TFrPrecargada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrPrecargada.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrPrecargada.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
    CODIGO_PERIODO.Field.AsString := FormatDateTime('YYYY', Now);
  End;
end;

Function TFrPrecargada.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Precargada).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_PERIODO']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_PERIODO', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

Procedure TFrPrecargada.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrPrecargada.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_PERIODO'], [CODIGO_PERIODO.Field.FullName], Retornar_Info_Tabla(Id_Precargada).Name, '', Retornar_Info_Tabla(Id_Precargada).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_PERIODO.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrPrecargada.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Precargada).Caption);
end;

procedure TFrPrecargada.CODIGO_PERIODOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDBPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrPrecargada.CODIGO_PRODUCTOExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrPrecargada.CODIGO_PRODUCTOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnProducto.Click;
end;

procedure TFrPrecargada.CODIGO_PRODUCTOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrPrecargada.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

//****************************************************************************
//****************************************************************************
//****************************************************************************

procedure TFrPrecargada.BtnCODIGO_TERCEROClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO'], ['CODIGO_TERCERO'], Retornar_Info_Tabla(Id_Tercero).Name, '', Retornar_Info_Tabla(Id_Tercero).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_TERCERO.Field.AsString := lResult01;
end;

procedure TFrPrecargada.CODIGO_TERCEROExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrPrecargada.CODIGO_TERCEROKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnCODIGO_TERCERO.Click;
end;

procedure TFrPrecargada.CODIGO_TERCEROUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrPrecargada.CODIGO_SINONIMOExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrPrecargada.CODIGO_SINONIMOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnCODIGO_SINONIMO.Click;
end;

procedure TFrPrecargada.CODIGO_SINONIMOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [CODIGO_TERCERO.EditString, TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrPrecargada.BtnCODIGO_BASEClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_BASE'], ['CODIGO_BASE'], Retornar_Info_Tabla(Id_Base).Name, '', Retornar_Info_Tabla(Id_Base).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_BASE.Field.AsString := lResult01;
end;

procedure TFrPrecargada.BtnCODIGO_SINONIMOClick(Sender: TObject);
Var
  lFiltro : String;
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
  Begin
    lFiltro := CNX.Trim_Sentence('CODIGO_TERCERO') + ' = ' + QuotedStr(Trim(CODIGO_TERCERO.EditString));
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_SINONIMO', 'CODIGO_TERCERO'], ['CODIGO_SINONIMO'], Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, lFiltro, Retornar_Info_Tabla(Id_Tercero_Sinonimo).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_SINONIMO.Field.AsString := lResult01;
  End;
end;

procedure TFrPrecargada.LISTA_PRECIOExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrPrecargada.LISTA_PRECIOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnLISTA_PRECIO.Click;
end;

procedure TFrPrecargada.LISTA_PRECIOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero_LP).Name, ['CODIGO_TERCERO', 'CODIGO_TERCERO_LP'], [CODIGO_TERCERO.EditString, TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrPrecargada.BtnLISTA_PRECIOClick(Sender: TObject);
Var
  lFiltro : String;
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
  Begin
    lFiltro := CNX.Trim_Sentence('CODIGO_TERCERO') + ' = ' + QuotedStr(Trim(CODIGO_TERCERO.EditString));
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO_LP'], ['CODIGO_TERCERO_LP'], Retornar_Info_Tabla(Id_Tercero_LP).Name, lFiltro, Retornar_Info_Tabla(Id_Tercero_LP).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      LISTA_PRECIO.Field.AsString := lResult01;
  End;
end;

procedure TFrPrecargada.BtnProductoClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_PRODUCTO'], ['CODIGO_PRODUCTO'], Retornar_Info_Tabla(Id_Producto).Name, '', Retornar_Info_Tabla(Id_Producto).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_PRODUCTO.Field.AsString := lResult01;
end;

procedure TFrPrecargada.CODIGO_VENDEDORExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrPrecargada.CODIGO_VENDEDORKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnCODIGO_VENDEDOR.Click;
end;

procedure TFrPrecargada.CODIGO_VENDEDORUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrPrecargada.BtnCODIGO_VENDEDORClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO'], ['CODIGO_TERCERO'], Retornar_Info_Tabla(Id_Tercero).Name, '', Retornar_Info_Tabla(Id_Tercero).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_VENDEDOR.Field.AsString := lResult01;
end;

procedure TFrPrecargada.CODIGO_BASEExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrPrecargada.CODIGO_BASEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnCODIGO_BASE.Click;
end;

procedure TFrPrecargada.CODIGO_BASEUserValidation(Sender: TObject; var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Base).Name, ['CODIGO_BASE'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrPrecargada.PDD_NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin

end;
//****************************************************************************
//****************************************************************************
//****************************************************************************

//****************************************************************************
//****************************************************************************
//****************************************************************************

procedure TFrPrecargada.FCT_CODIGO_TERCEROUserValidation(Sender: TObject; var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

//****************************************************************************
//****************************************************************************
//****************************************************************************

Procedure Show_Form_Precargada;
Begin
  FrPrecargada := TFrPrecargada.Create(Application);
  If FrPrecargada.Abrir_Archivos Then
    FrPrecargada.ShowModal;
  FrPrecargada.Free;
End;

end.
