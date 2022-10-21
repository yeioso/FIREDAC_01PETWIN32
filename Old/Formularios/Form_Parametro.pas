unit Form_Parametro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrParametro = class(TObjForm)
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
    pnlHead: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    CODIGO_PERIODO: TOvcDbPictureField;
    NOMBRE: TOvcDbPictureField;
    Paginas: TPageControl;
    Pag00: TTabSheet;
    Pag01: TTabSheet;
    Pag02: TTabSheet;
    Label3: TLabel;
    ID_EMPRESA: TOvcDbPictureField;
    Label4: TLabel;
    NOMBRE_EMPRESA: TOvcDbPictureField;
    Label5: TLabel;
    DIRECCION_EMPRESA: TOvcDbPictureField;
    Label6: TLabel;
    TELEFONO_EMPRESA: TOvcDbPictureField;
    Label7: TLabel;
    MUNICIPIO_EMPRESA: TOvcDbPictureField;
    Label8: TLabel;
    DEPARTAMENTO_EMPRESA: TOvcDbPictureField;
    Label9: TLabel;
    PAIS_EMPRESA: TOvcDbPictureField;
    GBCODIGOBARRAS: TGroupBox;
    Label10: TLabel;
    ID_VENDEDOR: TOvcDbPictureField;
    ID_PRODUCTO: TOvcDbPictureField;
    Label11: TLabel;
    ID_STOCK: TDBCheckBox;
    ID_ABRIR_CAJA: TDBCheckBox;
    ID_AGRUPAR_PRODUCTO: TDBCheckBox;
    ID_CORTAR_TIRILLA: TDBCheckBox;
    Pag03: TTabSheet;
    Pag07: TTabSheet;
    BtnCodigoBarras: TSpeedButton;
    GBDECIMALES: TGroupBox;
    ID_DECIMALES: TOvcDbPictureField;
    Label12: TLabel;
    ID_DECIMALES_TRM: TOvcDbPictureField;
    Label14: TLabel;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    ID_MONEDA: TOvcDbPictureField;
    ID_ORDEN_Z: TDBRadioGroup;
    LOGOTIPO: TDBImage;
    BtnCargarLogotipo: TBitBtn;
    OpenDialog1: TOpenDialog;
    FontDialog1: TFontDialog;
    ID_F_VENCIMIENTO: TDBCheckBox;
    ID_FORMATO_TIRILLA: TDBCheckBox;
    ID_CODIGO_PRODUCTO: TDBCheckBox;
    ID_CODIGO_BARRAS: TDBCheckBox;
    Label18: TLabel;
    MARGEN_UTILIDAD: TOvcDbPictureField;
    ID_COMANDA_FACTURA: TDBCheckBox;
    TIPO_CODIGO_BARRAS: TDBComboBox;
    Label19: TLabel;
    Pag06: TTabSheet;
    ID_IMAGEN_COMPRAS: TDBRadioGroup;
    ID_IMAGEN_VENTAS: TDBRadioGroup;
    Pag04: TTabSheet;
    Panel1: TPanel;
    GBENCABEZADO: TGroupBox;
    ENCABEZADO: TDBMemo;
    GBPIEPAGINA: TGroupBox;
    PIE_PAGINA: TDBMemo;
    TIPO_IMPRESORA: TDBComboBox;
    Label28: TLabel;
    ID_CAMPO_DETALLE: TDBCheckBox;
    BtnTestCajon: TSpeedButton;
    DIAS_PREAVISO: TOvcDbPictureField;
    Label22: TLabel;
    GBTIRILLA: TGroupBox;
    Label15: TLabel;
    BtnFuente: TSpeedButton;
    Label16: TLabel;
    Label17: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    NOMBRE_FUENTE: TOvcDbPictureField;
    TAMANO_FUENTE: TOvcDbPictureField;
    TAMANO_LINEA: TOvcDbPictureField;
    DOCUMENTO_FACTURA: TOvcDbPictureField;
    DOCUMENTO_COMPRA: TOvcDbPictureField;
    PUERTO_IMPRESORA: TOvcDbPictureField;
    ID_CAPTURA_RAPIDA: TDBCheckBox;
    ID_CALCULAR_COMPRA_RC: TDBCheckBox;
    ID_BUSQUEDA_C_N: TDBCheckBox;
    NOMBRE_IMPRESORA: TOvcDbPictureField;
    Label20: TLabel;
    BtnImpresora: TSpeedButton;
    PrintDialog1: TPrintDialog;
    GBTAMANOIMAGENES: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    IMAGEN_WIDTH: TOvcDbPictureField;
    IMAGEN_HEIGHT: TOvcDbPictureField;
    GBTAMANOFUENTES: TGroupBox;
    Label21: TLabel;
    Label29: TLabel;
    FONT_SIZE_A: TOvcDbPictureField;
    FONT_SIZE_B: TOvcDbPictureField;
    Label30: TLabel;
    NUMEROS_COMANDAS: TOvcDbPictureField;
    Label31: TLabel;
    VALOR_DOMICILIO: TOvcDbPictureField;
    ID_PEDIR_VENDEDOR: TDBCheckBox;
    ID_SINCRONIZAR_VISTAS: TDBCheckBox;
    ID_CONTROL_KARDEX: TDBCheckBox;
    ID_ELEGIR_IMPRESORA: TDBCheckBox;
    ID_ORDEN_TOTALES: TDBComboBox;
    Label32: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CODIGO_PERIODOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_PERIODOExit(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure BtnCodigoBarrasClick(Sender: TObject);
    procedure BtnCargarLogotipoClick(Sender: TObject);
    procedure BtnFuenteClick(Sender: TObject);
    procedure BtnTestCajonClick(Sender: TObject);
    procedure FRANQUICIAUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnImpresoraClick(Sender: TObject);
  private
    { Private declarations }
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    Procedure Procesar_After_Post; Override;
    procedure StateChange(Sender: TObject); Override;
  Protected
  public
    { Public declarations }
  end;

Var
  FrParametro: TFrParametro;
  Procedure Show_Form_Parametro;

implementation
{$R *.dfm}

Uses
  UtExcel,
  Printers,
  UtConexion,
  UtFunciones,
  UtImpresion,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  Form_Busqueda,
  Form_MenuPpal,
  Form_Seleccion,
  UtVariablesGlobales,
  Form_Vendor_Product_Id;

procedure TFrParametro.StateChange(Sender: TObject);
begin
  Inherited;
  If Not tbMaestro.Active Then
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

procedure TFrParametro.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Parametro).Caption;
    Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Parametro, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 1);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Self.Tag := gVariableGlobal.VALOR_TAG;
end;

procedure TFrParametro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrParametro.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrParametro.FRANQUICIAUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcBaseEntryField(Sender).EditString) Then
       ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrParametro.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
  End;
end;

Function TFrParametro.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Parametro).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_PERIODO']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_PERIODO', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrParametro.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_PERIODO'], [CODIGO_PERIODO.Field.FullName], Retornar_Info_Tabla(Id_Parametro).Name, '', Retornar_Info_Tabla(Id_Parametro).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_PERIODO.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrParametro.BtnCargarLogotipoClick(Sender: TObject);
begin
  If OpenDialog1.Execute Then
    LOGOTIPO.Picture.LoadFromFile(OpenDialog1.FileName);
end;

procedure TFrParametro.BtnCodigoBarrasClick(Sender: TObject);
Var
  lVendor_Id : Integer;
  lProduct_Id : Integer;
begin
  If Show_Form_Vendor_Product_Id(lVendor_Id, lProduct_Id) Then
  Begin
    TbMaestro.Edit;
    ID_VENDEDOR.Field.AsInteger := lVendor_Id;
    ID_PRODUCTO.Field.AsInteger := lProduct_Id;
  End;
end;

procedure TFrParametro.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Parametro).Caption);
end;

procedure TFrParametro.BtnFuenteClick(Sender: TObject);
begin
  If FontDialog1.Execute Then
    NOMBRE_FUENTE.Field.AsString := FontDialog1.Font.Name;
end;

procedure TFrParametro.BtnImpresoraClick(Sender: TObject);
begin
  If Modo_Edicion Then
    If PrintDialog1.Execute Then
      If (Printer.PrinterIndex > -1) Then
        NOMBRE_IMPRESORA.Field.AsString := Printer.Printers[Printer.PrinterIndex];
end;

procedure TFrParametro.BtnTestCajonClick(Sender: TObject);
begin
  If Not Vacio(NOMBRE_IMPRESORA.EditString) Then
    UtImpresion_SetPrinter(NOMBRE_IMPRESORA.EditString);
  If (AnsiUpperCase(Trim(TIPO_IMPRESORA.Text)) = AnsiUpperCase(Trim('Estandard 1'))) Or Vacio(TIPO_IMPRESORA.Text) Then
    Abrir_Cajon_Monedero
  Else
    UtImpresionAbrir_Cajon(PUERTO_IMPRESORA.Text, TIPO_IMPRESORA.Text);
end;

Procedure TFrParametro.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrParametro.CODIGO_PERIODOExit(Sender: TObject);
begin
  if Modo_Edicion then
    if Not Vacio(CODIGO_PERIODO.EditString)  then
      CODIGO_PERIODO.Field.AsString := Justificar(CODIGO_PERIODO.EditString, '0', CODIGO_PERIODO.MaxLength);
end;

procedure TFrParametro.CODIGO_PERIODOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(CODIGO_PERIODO.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Parametro).Name, [CODIGO_PERIODO.Field.FullName], [CODIGO_PERIODO.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrParametro.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrParametro.Procesar_After_Post;
begin
  inherited;
  gVariableGlobal.Cargar_Informacion_Global;
  If Assigned(FrMenuPpal) Then
    FrMenuPpal.Cargar_Configuraciones;
end;

Procedure Show_Form_Parametro;
Begin
  FrParametro := TFrParametro.Create(Application);
  If FrParametro.Abrir_Archivos Then
    FrParametro.ShowModal;
  FrParametro.Free;
End;

end.
