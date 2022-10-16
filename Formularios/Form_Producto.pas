unit Form_Producto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat,
  UtObjetoTransaccional, Barcode;

type
  TFrProducto = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    OvcController1: TOvcController;
    PnlNavegador: TPanel;
    DBNavigator1: TDBNavigator;
    PnlOpcionales: TPanel;
    PnlGrid: TPanel;
    Registros: TDBGrid;
    Estado_Actual: TStatusBar;
    Barra_Ayuda01: TStatusBar;
    Barra_Ayuda02: TStatusBar;
    BtnExcel: TSpeedButton;
    BtnBuscar: TSpeedButton;
    BtnFiltrado: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Paginas: TPageControl;
    Pag00: TTabSheet;
    Label2: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    BtnLinea: TSpeedButton;
    lbNombre_Linea: TLabel;
    Label6: TLabel;
    BtnGrupo: TSpeedButton;
    lbNombre_Grupo: TLabel;
    Label7: TLabel;
    BtnSubgrupo: TSpeedButton;
    lbNombre_Subgrupo: TLabel;
    NOMBRE: TOvcDbPictureField;
    CODIGO_PRODUCTO: TOvcDbPictureField;
    CODIGO_LINEA: TOvcDbPictureField;
    CODIGO_GRUPO: TOvcDbPictureField;
    CODIGO_SUBGRUPO: TOvcDbPictureField;
    Pag01: TTabSheet;
    GRAFICO: TDBImage;
    gbDescripcion: TGroupBox;
    DESCRIPCION: TDBMemo;
    BtnSubirGrafico: TSpeedButton;
    BtnListaPrecio: TSpeedButton;
    Pag02: TTabSheet;
    gbStock: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    STOCK_MINIMO: TOvcDbPictureField;
    STOCK_MAXIMO: TOvcDbPictureField;
    gbCostos: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    VALOR_VENTA: TOvcDbPictureField;
    VALOR_COMPRA: TOvcDbPictureField;
    Label40: TLabel;
    BtnBodega: TSpeedButton;
    lbNombre_Bodega: TLabel;
    CODIGO_BODEGA: TOvcDbPictureField;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    COSTO_CALCULADO: TOvcDbPictureField;
    PORC_UTILIDAD: TOvcDbPictureField;
    BtnReceta: TSpeedButton;
    Label18: TLabel;
    VALOR_PROPUESTO: TOvcDbPictureField;
    ID_RECETA: TDBCheckBox;
    Label19: TLabel;
    CANTIDAD: TOvcDbPictureField;
    gbProducto_Padre: TGroupBox;
    Label17: TLabel;
    NUMERO_UNIDADES: TOvcDbPictureField;
    Label1: TLabel;
    BtnProductoPadre: TSpeedButton;
    lbProducto_Padre: TLabel;
    PRODUCTO_PADRE: TOvcDbPictureField;
    Pag04: TTabSheet;
    BtnBaseImpuestoCompra: TSpeedButton;
    lbNombre_Impuesto_Compra: TLabel;
    BtnBaseImpuestoVenta: TSpeedButton;
    lbNombre_Impuesto_Venta: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    IMPUESTO_COMPRA: TOvcDbPictureField;
    IMPUESTO_VENTA: TOvcDbPictureField;
    lbNombre_PUC_DEBITO: TLabel;
    BtnPUC_DEBITO: TSpeedButton;
    Label5: TLabel;
    lbNombre_PUC_CREDITO: TLabel;
    BtnPUC_CREDITO: TSpeedButton;
    Label37: TLabel;
    lbNombre_CCOSTO_DEBITO: TLabel;
    BtnCCOSTO_DEBITO: TSpeedButton;
    Label41: TLabel;
    lbNombre_CCOSTO_CREDITO: TLabel;
    BtnCCOSTO_CREDITO: TSpeedButton;
    Label45: TLabel;
    lbNombre_CPMTE_DEBITO: TLabel;
    BtnCPMTE_DEBITO: TSpeedButton;
    Label39: TLabel;
    lbNombre_CPMTE_CREDITO: TLabel;
    BtnCPMTE_CREDITO: TSpeedButton;
    Label49: TLabel;
    PUC_DEBITO: TOvcDbPictureField;
    PUC_CREDITO: TOvcDbPictureField;
    CCOSTO_DEBITO: TOvcDbPictureField;
    CCOSTO_CREDITO: TOvcDbPictureField;
    CPMTE_DEBITO: TOvcDbPictureField;
    CPMTE_CREDITO: TOvcDbPictureField;
    ID_PREPARACION: TDBCheckBox;
    ID_FACTURABLE: TDBCheckBox;
    ID_INSUMO: TDBCheckBox;
    BtnTercero: TSpeedButton;
    Label20: TLabel;
    MARGEN_UTILIDAD: TOvcDbPictureField;
    ID_FECHA_VENCIMIENTO: TDBCheckBox;
    Pag03: TTabSheet;
    Label16: TLabel;
    CODIGO_BARRAS: TOvcDbPictureField;
    ID_IMPRIMIR_BARCODE: TDBCheckBox;
    IMAGE_BARCODE: TDBImage;
    BtnImprimirBarcode: TSpeedButton;
    ID_VENTA: TDBCheckBox;
    ID_COMPRA: TDBCheckBox;
    Label21: TLabel;
    EXTENSION_GRAFICO: TOvcDbPictureField;
    Label22: TLabel;
    CODIGO_PROVEEDOR: TOvcDbPictureField;
    BtnBorrarProducto: TSpeedButton;
    Label23: TLabel;
    CANTIDAD_PROPUESTA: TOvcDbPictureField;
    ORDEN: TOvcDbPictureField;
    Label24: TLabel;
    BtnObservaciones: TSpeedButton;
    ID_OCULTAR_DOCTO: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure CODIGO_PRODUCTOUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure CODIGO_PRODUCTOExit(Sender: TObject);
    procedure BtnLineaClick(Sender: TObject);
    procedure BtnGrupoClick(Sender: TObject);
    procedure BtnSubgrupoClick(Sender: TObject);
    procedure CODIGO_LINEAExit(Sender: TObject);
    procedure CODIGO_GRUPOExit(Sender: TObject);
    procedure CODIGO_SUBGRUPOExit(Sender: TObject);
    procedure CODIGO_LINEAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_GRUPOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_SUBGRUPOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_LINEAUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_GRUPOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_SUBGRUPOUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure CODIGO_PRODUCTOEnter(Sender: TObject);
    procedure BtnSubirGraficoClick(Sender: TObject);
    procedure BtnListaPrecioClick(Sender: TObject);
    procedure BtnRecetaClick(Sender: TObject);
    procedure BtnBodegaClick(Sender: TObject);
    procedure CODIGO_BODEGAExit(Sender: TObject);
    procedure CODIGO_BODEGAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_BODEGAUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure IMPUESTO_COMPRAExit(Sender: TObject);
    procedure IMPUESTO_VENTAExit(Sender: TObject);
    procedure IMPUESTO_COMPRAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IMPUESTO_VENTAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IMPUESTO_COMPRAUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure IMPUESTO_VENTAUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure BtnBaseImpuestoCompraClick(Sender: TObject);
    procedure BtnBaseImpuestoVentaClick(Sender: TObject);
    procedure ID_RECETAClick(Sender: TObject);
    procedure BtnProductoPadreClick(Sender: TObject);
    procedure PRODUCTO_PADREExit(Sender: TObject);
    procedure PRODUCTO_PADREUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure PRODUCTO_PADREKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnTerceroClick(Sender: TObject);
    procedure CODIGO_BARRASChange(Sender: TObject);
    procedure BtnImprimirBarcodeClick(Sender: TObject);
    procedure VALOR_COMPRAAfterExit(Sender: TObject);
    procedure BtnBorrarProductoClick(Sender: TObject);
    procedure ORDENExit(Sender: TObject);
    procedure BtnObservacionesClick(Sender: TObject);
  private
    { Private declarations }
    FOT : TObjeto_Transaccional;
    Barcode1 : TAsBarcode;
    Function Modo_Edicion : Boolean; Override;
    Procedure Cargar_Eventos;
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    Function GetCodeSimple(Const pValue : String) : String;
    Procedure NewRecord(DataSet: TDataSet); Override;
    procedure StateChange(Sender: TObject); Override;
    procedure DataChange(Sender: TObject; Field: TField); Override;
  Protected
  public
    { Public declarations }
  end;

Var
  FrProducto: TFrProducto;
  Procedure Show_Form_Producto;

implementation
{$R *.dfm}

Uses
  Math,
  
  UtFecha,
  UtExcel,
  UtConexion,
  
  Form_Fecha,
  UtFunciones,
  Form_Splash,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  Form_Busqueda,
  Form_Producto_LP,
  UtVariablesGlobales,
  Form_Producto_Receta,
  Form_Producto_Tercero,
  Tablename_Documento_Adm,
  Form_Print_Documento_Adm,
  Form_Producto_Observacion;

Function TFrProducto.Modo_Edicion : Boolean;
Begin
  Result := Inherited;
  FOT.Modo_Edicion := Inherited;
End;

Procedure TFrProducto.Cargar_Eventos;
Begin
  FOT.Eventos_SpeedButton(BtnPUC_DEBITO    );
  FOT.Eventos_SpeedButton(BtnPUC_CREDITO   );
  FOT.Eventos_SpeedButton(BtnCCOSTO_DEBITO );
  FOT.Eventos_SpeedButton(BtnCCOSTO_CREDITO);
  FOT.Eventos_SpeedButton(BtnCPMTE_DEBITO  );
  FOT.Eventos_SpeedButton(BtnCPMTE_CREDITO );

  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_DEBITO    );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_CREDITO   );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_DEBITO );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_CREDITO);
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_DEBITO  );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_CREDITO );
End;

procedure TFrProducto.DataChange(Sender: TObject; Field: TField);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_BODEGA.Field.FullName)) Then
    lbNombre_Bodega.Caption := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Bodega).Name, ['CODIGO_BODEGA'], [CODIGO_BODEGA.Field.AsString], ['NOMBRE'], 'TFrProducto.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_LINEA.Field.FullName)) Then
    lbNombre_Linea.Caption := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Linea).Name, ['CODIGO_LINEA'], [CODIGO_LINEA.Field.AsString], ['NOMBRE'], 'TFrProducto.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_GRUPO.Field.FullName)) Then
    lbNombre_Grupo.Caption := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Grupo).Name, ['CODIGO_GRUPO'], [CODIGO_GRUPO.Field.AsString], ['NOMBRE'], 'TFrProducto.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = PRODUCTO_PADRE.Field.FullName)) Then
    lbProducto_Padre.Caption := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [PRODUCTO_PADRE.Field.AsString], ['NOMBRE'], 'TFrProducto.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_SUBGRUPO.Field.FullName)) Then
    lbNombre_Subgrupo.Caption := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Subgrupo).Name, ['CODIGO_SUBGRUPO'], [CODIGO_SUBGRUPO.Field.AsString], ['NOMBRE'], 'TFrProducto.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = IMPUESTO_COMPRA.Field.FullName)) Then
    lbNombre_Impuesto_Compra.Caption := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Impuesto).Name, ['CODIGO_IMPUESTO'], [IMPUESTO_COMPRA.Field.AsString], ['NOMBRE'], 'TFrProducto.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = IMPUESTO_VENTA.Field.FullName)) Then
    lbNombre_Impuesto_Venta.Caption := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Impuesto).Name, ['CODIGO_IMPUESTO'], [IMPUESTO_VENTA.Field.AsString], ['NOMBRE'], 'TFrProducto.DsMaestroDataChange');

  FOT.Actualizar_Label(PUC_DEBITO    , lbNombre_PUC_DEBITO    , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_CREDITO   , lbNombre_PUC_CREDITO   , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_DEBITO , lbNombre_CCOSTO_DEBITO , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_CREDITO, lbNombre_CCOSTO_CREDITO, Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_DEBITO  , lbNombre_CPMTE_DEBITO  , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_CREDITO , lbNombre_CPMTE_CREDITO , Field, (DsMaestro.State In [dsBrowse]));

  BtnReceta.Enabled := (Not Modo_Edicion) And (ID_RECETA.Field.AsString = 'S');

  If Modo_Edicion Then
  Begin
    If Assigned(Field) Then
    Begin
//      If (Field.FullName = PORC_UTILIDAD.Field.FullName) Then
//         VALOR_PROPUESTO.Field.AsFloat := COSTO_CALCULADO.Field.AsFloat * (PORC_UTILIDAD.Field.AsFloat / 100);
//      If (Field.FullName = VALOR_COMPRA.Field.FullName) Or (Field.FullName = MARGEN_UTILIDAD.Field.FullName) Then
//        If (VALOR_VENTA.Field.AsFloat <= 0) And (MARGEN_UTILIDAD.Field.AsFloat > 0)  Then
//        Begin
//          If MARGEN_UTILIDAD.Field.AsFloat > 0 Then
//            VALOR_VENTA.Field.AsFloat := VALOR_COMPRA.Field.AsFloat * (1 + (MARGEN_UTILIDAD.Field.AsFloat/100))
//          Else
//            VALOR_VENTA.Field.AsFloat := VALOR_COMPRA.Field.AsFloat * (1 + (gMARGEN_UTILIDAD/100));
//        End;
    End;
  End;
end;

procedure TFrProducto.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  VALOR_PROPUESTO.Enabled    := False;
  COSTO_CALCULADO.Enabled    := False;
  BtnBodega.Enabled          := (DsMaestro.State In [dsInsert]) Or ((gVariableGlobal.ID_USUARIO_ADMINISTRADOR = 'S') And (DsMaestro.State In [dsEdit]));
  CODIGO_BODEGA.Enabled      := (DsMaestro.State In [dsInsert]) Or ((gVariableGlobal.ID_USUARIO_ADMINISTRADOR = 'S') And (DsMaestro.State In [dsEdit]));
  BtnLinea.Enabled           := (DsMaestro.State In [dsInsert]) Or ((gVariableGlobal.ID_USUARIO_ADMINISTRADOR = 'S') And (DsMaestro.State In [dsEdit]));
  BtnGrupo.Enabled           := (DsMaestro.State In [dsInsert]) Or ((gVariableGlobal.ID_USUARIO_ADMINISTRADOR = 'S') And (DsMaestro.State In [dsEdit]));
  BtnSubgrupo.Enabled        := (DsMaestro.State In [dsInsert]) Or ((gVariableGlobal.ID_USUARIO_ADMINISTRADOR = 'S') And (DsMaestro.State In [dsEdit]));
  CODIGO_LINEA.Enabled       := (DsMaestro.State In [dsInsert]) Or ((gVariableGlobal.ID_USUARIO_ADMINISTRADOR = 'S') And (DsMaestro.State In [dsEdit]));
  CODIGO_GRUPO.Enabled       := (DsMaestro.State In [dsInsert]) Or ((gVariableGlobal.ID_USUARIO_ADMINISTRADOR = 'S') And (DsMaestro.State In [dsEdit]));
  CODIGO_SUBGRUPO.Enabled    := (DsMaestro.State In [dsInsert]) Or ((gVariableGlobal.ID_USUARIO_ADMINISTRADOR = 'S') And (DsMaestro.State In [dsEdit]));
  CODIGO_PRODUCTO.Enabled    := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled           := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled          := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnListaPrecio.Enabled     := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnTercero.Enabled         := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnObservaciones.Enabled   := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnImprimirBarcode.Enabled := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnReceta.Enabled          := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1) And (ID_RECETA.Field.AsString = 'S');
  Registros.Enabled          := (Not Modo_Edicion);
  BtnFiltrado.Enabled        := (Not Modo_Edicion);
  If DsMaestro.State In [dsInsert, dsEdit] Then
    Paginas.ActivePageIndex := 0;
  Case DsMaestro.State Of
    dsInsert : Begin
                 Inicializar_Labels_Formulario(Self, ['lbnombre'], '');
                 If CODIGO_BODEGA.Enabled Then
                   CODIGO_BODEGA.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrProducto.FormCreate(Sender: TObject);
begin
  Barcode1 := TAsBarcode.Create(self);
  Barcode1.Top := 01;
  Barcode1.Left := 01;
  Barcode1.Typ := Barcode_GetType(gVariableGlobal.TIPO_CODIGO_BARRAS);
  Barcode1.Modul := 2;
  Barcode1.Ratio := 2.0;
  Barcode1.ShowTextPosition := TShowTextPosition.stpBottomCenter;
  Barcode1.Width := IMAGE_BARCODE.Width;
  Barcode1.Height := IMAGE_BARCODE.Height;
  Barcode1.Checksum := True;

  FOT := TObjeto_Transaccional.Create(Self);
  Inicializar_Labels_Formulario(Self, ['lbnombre'], '');
  Caption := Retornar_Info_Tabla(Id_Producto).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Producto, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, False, -1);
  Self.Tag := gVariableGlobal.Valor_Tag;
  Cargar_Eventos;
end;

procedure TFrProducto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrProducto.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
  FOT.DisposeOf;
  If Assigned(Barcode1) Then
    Barcode1.DisposeOf;
end;

procedure TFrProducto.ID_RECETAClick(Sender: TObject);
begin
  COSTO_CALCULADO.Visible := ID_RECETA.Checked;
  PORC_UTILIDAD.Visible   := ID_RECETA.Checked;
  VALOR_PROPUESTO.Visible := ID_RECETA.Checked;
end;

Function TFrProducto.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Clear;
  TbMaestro.SQL.Add('SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_PRODUCTO']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_PRODUCTO', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrProducto.IMPUESTO_COMPRAExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrProducto.IMPUESTO_COMPRAKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnBaseImpuestoCompra.Click;
end;

procedure TFrProducto.IMPUESTO_COMPRAUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Impuesto).Name, ['CODIGO_IMPUESTO'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrProducto.IMPUESTO_VENTAExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrProducto.IMPUESTO_VENTAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnBaseImpuestoVenta.Click;
end;

procedure TFrProducto.IMPUESTO_VENTAUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not gVariableGlobal.CNX.Record_Exist(Retornar_Info_Tabla(Id_Impuesto).Name, ['CODIGO_IMPUESTO'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrProducto.BtnBaseImpuestoCompraClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_IMPUESTO'], ['CODIGO_IMPUESTO'], Retornar_Info_Tabla(Id_Impuesto).Name, '', Retornar_Info_Tabla(Id_Impuesto).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      IMPUESTO_COMPRA.Field.AsString := lResult01;
end;

procedure TFrProducto.BtnBaseImpuestoVentaClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_IMPUESTO'], ['CODIGO_IMPUESTO'], Retornar_Info_Tabla(Id_Impuesto).Name, '', Retornar_Info_Tabla(Id_Impuesto).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      IMPUESTO_VENTA.Field.AsString := lResult01;
end;

procedure TFrProducto.BtnBodegaClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_BODEGA'], [CODIGO_BODEGA.Field.FullName], Retornar_Info_Tabla(Id_Bodega).Name, '', Retornar_Info_Tabla(Id_Bodega).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_BODEGA.Field.AsString := lResult01;
end;

procedure TFrProducto.BtnBorrarProductoClick(Sender: TObject);
begin
  TbMaestro.FieldByName('GRAFICO').Clear;
end;

procedure TFrProducto.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Not Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_PRODUCTO'], [CODIGO_PRODUCTO.Field.FullName], Retornar_Info_Tabla(Id_Producto).Name, '', Retornar_Info_Tabla(Id_Producto).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_PRODUCTO.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrProducto.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Producto).Caption);
end;

procedure TFrProducto.BtnGrupoClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_GRUPO'], [CODIGO_GRUPO.Field.FullName], Retornar_Info_Tabla(Id_Grupo).Name, '', Retornar_Info_Tabla(Id_Grupo).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_GRUPO.Field.AsString := lResult01;
end;

procedure TFrProducto.BtnImprimirBarcodeClick(Sender: TObject);
Var
  lFormato : String;
begin
  lFormato := Retornar_Nombre_Formato(Const_Documento_Codigo_Barras);
  If Not Vacio(lFormato) Then
    Execute_Print_Barcode(lFormato);
end;

procedure TFrProducto.BtnLineaClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_LINEA'], [CODIGO_LINEA.Field.FullName], Retornar_Info_Tabla(Id_Linea).Name, '', Retornar_Info_Tabla(Id_Linea).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_LINEA.Field.AsString := lResult01;
end;

procedure TFrProducto.BtnListaPrecioClick(Sender: TObject);
begin
  Show_Form_Producto_LP(CODIGO_PRODUCTO.EditString, NOMBRE.EditString, VALOR_VENTA.AsFloat);
end;

procedure TFrProducto.BtnObservacionesClick(Sender: TObject);
begin
  Show_Form_Producto_Observacion(CODIGO_PRODUCTO.EditString);
end;

procedure TFrProducto.BtnProductoPadreClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_PRODUCTO'], [CODIGO_PRODUCTO.Field.FullName], Retornar_Info_Tabla(Id_Producto).Name, '', Retornar_Info_Tabla(Id_Producto).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      PRODUCTO_PADRE.Field.AsString := lResult01;
end;

procedure TFrProducto.BtnRecetaClick(Sender: TObject);
begin
  Show_Form_Producto_Receta(Id_Producto_Receta, CODIGO_PRODUCTO.EditString);
  Show_Splash;
  Actualiza__Splash('Actualizando costos, espere un momento por favor...');
  Try
    DBNavigator1.BtnClick(nbRefresh);
  Except
    On E: Exception Do
     gVariableGlobal.Add_Log(E, ['Origen', 'TFrProducto.BtnRecetaClick']);
  End;
  Free_Splash;
end;

Procedure TFrProducto.BtnSubgrupoClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_SUBGRUPO'], [CODIGO_SUBGRUPO.Field.FullName], Retornar_Info_Tabla(Id_Subgrupo).Name, '', Retornar_Info_Tabla(Id_Subgrupo).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_SUBGRUPO.Field.AsString := lResult01;
end;

procedure TFrProducto.BtnSubirGraficoClick(Sender: TObject);
Var
  lBorrar : Boolean;
  lFileName : String;
begin
  If OpenDialog1.Execute Then
  Begin
    GRAFICO.Picture.LoadFromFile(OpenDialog1.FileName);
    EXTENSION_GRAFICO.Field.AsString := StringReplace(ExtractFileExt(OpenDialog1.FileName), '.', '', [rfReplaceAll]);
  End;
end;

procedure TFrProducto.BtnTerceroClick(Sender: TObject);
begin
  Show_Form_Producto_Tercero(CODIGO_PRODUCTO.EditString);
end;

Procedure TFrProducto.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrProducto.CODIGO_BARRASChange(Sender: TObject);
Var
  lBitmap : TBitmap;
begin
  If Modo_Edicion Then
  Begin
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
    Begin
      IMAGE_BARCODE.Picture := nil;
      Try
        Barcode1.Typ := Barcode_GetType(gVariableGlobal.TIPO_CODIGO_BARRAS);
        Barcode1.Top := 01;
        Barcode1.Left := 01;
        Barcode1.Modul := 2;
        Barcode1.Ratio := 2.0;
        Barcode1.Width := IMAGE_BARCODE.Width;
        Barcode1.Height := IMAGE_BARCODE.Height;
        Barcode1.ShowText := TBarcodeOption.bcoBoth;
        Barcode1.ShowTextPosition := TShowTextPosition.stpBottomCenter;
        Barcode1.Checksum := True;
        lBitmap := TBitmap.Create;
        Barcode1.Text := Trim(TOvcDbPictureField(Sender).EditString);
        lBitmap.Width := IMAGE_BARCODE.Width;
        lBitmap.Height := IMAGE_BARCODE.Height;
        If Assigned(lBitmap) Then
          IMAGE_BARCODE.Picture.Bitmap.Assign(lBitmap);
        lBitmap.DisposeOf;
        Barcode1.DrawBarcode(lBitmap.Canvas);
      Except
        On E : Exception Do
          gVariableGlobal.Add_Log(E, ['Origen', 'TFrProducto.CODIGO_BARRASChange']);
      End;
    End;
  End;
end;

procedure TFrProducto.CODIGO_BODEGAExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrProducto.CODIGO_BODEGAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnBodega.Click;
end;

procedure TFrProducto.CODIGO_BODEGAUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not gVariableGlobal.CNX.Record_Exist(Retornar_Info_Tabla(Id_Bodega).Name, [TOvcDbPictureField(Sender).Field.FullName], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrProducto.CODIGO_GRUPOExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrProducto.CODIGO_GRUPOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnGrupo.Click;
end;

procedure TFrProducto.CODIGO_GRUPOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not gVariableGlobal.CNX.Record_Exist(Retornar_Info_Tabla(Id_Grupo).Name, [TOvcDbPictureField(Sender).Field.FullName], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrProducto.CODIGO_LINEAExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrProducto.CODIGO_LINEAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnLinea.Click;
end;

procedure TFrProducto.CODIGO_LINEAUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not gVariableGlobal.CNX.Record_Exist(Retornar_Info_Tabla(Id_Linea).Name, [TOvcDbPictureField(Sender).Field.FullName], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrProducto.CODIGO_PRODUCTOEnter(Sender: TObject);
Var
  lNext : String;
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
    Begin
      lNext := gVariableGlobal.CNX.Next(Retornar_Info_Tabla(Id_Producto).Name, '0', [TOvcDbPictureField(Sender).Field.FullName], ['CODIGO_LINEA', 'CODIGO_GRUPO', 'CODIGO_SUBGRUPO'], [CODIGO_LINEA.EditString, CODIGO_GRUPO.EditString, CODIGO_SUBGRUPO.EditString], TOvcDbPictureField(Sender).MaxLength);
      lNext := Justificar(lNext, '0', 12);
      TOvcDbPictureField(Sender).Field.AsString := CODIGO_BODEGA.EditString   +
                                                   CODIGO_LINEA.EditString    +
                                                   CODIGO_GRUPO.EditString    +
                                                   CODIGO_SUBGRUPO.EditString +
                                                   Copy(lNext, 9, Length(lNext));
    End;
end;

Function TFrProducto.GetCodeSimple(Const pValue : String) : String;
Var
  lI : Integer;
  lPos : Integer;
Begin
  lI := 1;
  lPos := -1;
  Result := pValue;
  While (lI < Length(pValue)) And (lPos = -1) Do
  Begin
    If pValue[lI] = '0' Then
      lPos := lI;
    Inc(lI);
  End;
  If lPos <> -1 Then
    Result := Copy(pValue, lPos, Length(pValue));
End;

procedure TFrProducto.CODIGO_PRODUCTOExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
    Begin
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
      TbMaestro.FieldByName('CODIGO_BARRAS').AsString := GetCodeSimple(TOvcDbPictureField(Sender).Field.AsString);
    End;
end;

procedure TFrProducto.CODIGO_PRODUCTOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(CODIGO_PRODUCTO.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If gVariableGlobal.CNX.Record_Exist(Retornar_Info_Tabla(Id_Producto).Name, [CODIGO_PRODUCTO.Field.FullName], [CODIGO_PRODUCTO.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrProducto.CODIGO_SUBGRUPOExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrProducto.CODIGO_SUBGRUPOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnSubgrupo.Click;
end;

procedure TFrProducto.CODIGO_SUBGRUPOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not gVariableGlobal.CNX.Record_Exist(Retornar_Info_Tabla(Id_Subgrupo).Name, [TOvcDbPictureField(Sender).Field.FullName], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrProducto.NewRecord(DataSet: TDataSet);
begin
  inherited;
  If Modo_Edicion Then
  Begin
    TbMaestro.FieldByName('ID_FACTURABLE').AsString := 'S';
    TbMaestro.FieldByName('ID_VENTA'     ).AsString := 'S';
    TbMaestro.FieldByName('ID_INSUMO'    ).AsString := 'S';
    TbMaestro.FieldByName('ID_COMPRA'    ).AsString := 'S';
  End;
end;

procedure TFrProducto.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrProducto.ORDENExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString)  then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;


procedure TFrProducto.PRODUCTO_PADREExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrProducto.PRODUCTO_PADREKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnProductoPadre.Click;
end;

procedure TFrProducto.PRODUCTO_PADREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Not Vacio(PRODUCTO_PADRE.EditString) Then
      If Not gVariableGlobal.CNX.Record_Exist(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [PRODUCTO_PADRE.EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS
      Else
        If Trim(PRODUCTO_PADRE.EditString) = Trim(CODIGO_PRODUCTO.EditString) Then
          ErrorCode := IE_VALUE_INVALID;
end;

procedure TFrProducto.VALOR_COMPRAAfterExit(Sender: TObject);
Var
  lP : Double;
begin
  If Modo_Edicion And (VALOR_VENTA.AsFloat <= 0) And (VALOR_COMPRA.AsFloat > 0) Then
  Begin
    lP := IfThen(TbMaestro.FieldByName('MARGEN_UTILIDAD').AsFloat > 0, TbMaestro.FieldByName('MARGEN_UTILIDAD').AsFloat, gVariableGlobal.MARGEN_UTILIDAD);
    If lP > 0 Then
      VALOR_VENTA.Field.AsFloat := VALOR_COMPRA.AsFloat / (1 - (lP/100));
  End;
end;

Procedure Show_Form_Producto;
Begin
  FrProducto := TFrProducto.Create(Application);
  If FrProducto.Abrir_Archivos Then
    FrProducto.Show
  Else
  Begin
    FrProducto.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.


