unit Form_Documento_Captura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, Grids, DBGrids, StdCtrls, LCD_Lab,  Vcl.DBCtrls,
  UtScrollBoxVCL, UtBotonVCL, ComCtrls, Data.DB, UtConexion;

Type
  TFrDocumento_Captura = class(TForm)
    Paginas: TPageControl;
    Pag01: TTabSheet;
    pnlBarcode: TPanel;
    BARCODE: TEdit;
    pnlHead: TPanel;
    pnlBotones: TPanel;
    pnlResume: TPanel;
    Label12: TLabel;
    pnlTotales: TPanel;
    pnlDocumento: TPanel;
    lbTOTAL: TLCDLabel;
    pnlItems: TPanel;
    pnlGrid: TPanel;
    GridDetalle: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    pnlDetalles: TPanel;
    Label6: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Pag02: TTabSheet;
    PnlVendedor: TPanel;
    BtnElegirVendedor: TSpeedButton;
    lbNombre_Vendedor: TLabel;
    lbVuelto: TLabel;
    DISCRIMINADOS: TDBMemo;
    VALOR_SUBTOTAL: TDBText;
    VALOR_DESCUENTO: TDBText;
    VALOR_SERVICIO: TDBText;
    VALOR_IVA: TDBText;
    VALOR_IMPCONSUMO: TDBText;
    VALOR_RETEIVA: TDBText;
    VALOR_ICA: TDBText;
    VALOR_CREE: TDBText;
    VALOR_TOTAL: TDBText;
    EFE: TDBText;
    TDD: TDBText;
    TDC: TDBText;
    CHE: TDBText;
    SDX: TDBText;
    COR: TDBText;
    CAR: TDBText;
    BtnComanda: TPanel;
    LbComanda: TLabel;
    BtnAddDet: TPanel;
    lbAddDet: TLabel;
    BtnEditEnc: TPanel;
    lbEditEnc: TLabel;
    BtnEditDet: TPanel;
    lbEditDet: TLabel;
    BtnDelDet: TPanel;
    BtnPreviewDoc: TPanel;
    lbPreviewDoc: TLabel;
    BtnEditarDetalle: TPanel;
    lbEditarDetalle: TLabel;
    BtnInsertarTercero: TPanel;
    lbInsertarTercero: TLabel;
    BtnAcarreo: TPanel;
    lbAcarreo: TLabel;
    BtnAjustarReceta: TPanel;
    lbAjustarReceta: TLabel;
    BtnCancelDoc: TPanel;
    lbCancelDoc: TLabel;
    BtnCerrarDoc: TPanel;
    lbCerrarDoc: TLabel;
    BtnFormaPago: TPanel;
    lbFormaPago: TLabel;
    BtnAbrirCajon: TPanel;
    lbAbrirCajon: TLabel;
    BtnSalir: TPanel;
    lbSalir: TLabel;
    LbDelDet: TLabel;
    Pag00: TTabSheet;
    BACK: TImage;
    HOME: TImage;
    DOCUMENTO_COMANDA: TDBComboBox;
    INFO_COMANDA: TDBMemo;
    BtnDomicilio: TPanel;
    lbDomicilio: TLabel;
    Label11: TLabel;
    VALOR_DOMICILIO: TDBText;
    Label19: TLabel;
    TOTAL_CON_DOMICILIO: TDBText;
    lbDocumento: TLabel;
    Label20: TLabel;
    VALOR_BRUTO: TDBText;
    BtnAdmin: TSpeedButton;
    BTNPROPINA: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure QrDetalleBeforePost(DataSet: TDataSet);
    procedure QrDetalleAfterPost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnEditEncClick(Sender: TObject);
    procedure BtnEditDetClick(Sender: TObject);
    procedure BtnDelDetClick(Sender: TObject);
    procedure BtnCancelDocClick(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure BtnCerrarDocClick(Sender: TObject);
    procedure BtnPreviewDocClick(Sender: TObject);
    procedure BtnAddDetClick(Sender: TObject);
    procedure BtnAcarreoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnEditarDetalleClick(Sender: TObject);
    procedure BtnInsertarTerceroClick(Sender: TObject);
    procedure DsDetalleDataChange(Sender: TObject; Field: TField);
    procedure QrDetalleBeforeDelete(DataSet: TDataSet);
    procedure QrDetalleAfterDelete(DataSet: TDataSet);
    procedure BtnComandaClick(Sender: TObject);
    procedure DsMaestroDataChange(Sender: TObject; Field: TField);
    procedure BARCODEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridDetalleColExit(Sender: TObject);
    procedure GridDetalleExit(Sender: TObject);
    procedure GridDetalleKeyPress(Sender: TObject; var Key: Char);
    procedure QrDetalleCalcFields(DataSet: TDataSet);
    procedure BtnFormaPagoClick(Sender: TObject);
    procedure BtnElegirVendedorClick(Sender: TObject);
    procedure BtnAbrirCajonClick(Sender: TObject);
    procedure BtnAjustarRecetaClick(Sender: TObject);
    procedure DOCUMENTO_COMANDAChange(Sender: TObject);
    procedure DOCUMENTO_COMANDAClick(Sender: TObject);
    procedure BtnDomicilioClick(Sender: TObject);
    procedure BtnSettingComandaClick(Sender: TObject);
    procedure BtnAdminClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BTNPROPINAClick(Sender: TObject);
  private
    { Private declarations }
    CNX : TConexion;
    FSB : TUtScrollBox;
    FMASTER : TMANAGER_DATA;
    FDETAIL : TMANAGER_DATA;
    FUSUARIO_ACTUAL : String;
    FDETAIL_UPDATING : Boolean;
    FMASTER_UPDATING : Boolean;
    FDATAKEY : String;
    FTIPO_DOCUMENTO : String;
    FCODIGO_ESPACIO : String;
    FCODIGO_PRODUCTO : String;
    FTEXTO_DOCUMENTO : String;
    Procedure Acarrear_Porcentaje(Const pCero : Boolean);
    Procedure Control_Log(pDataSet : TDataSet; Const pSource : String; Const pMessageError : String = '');
    Procedure BeforeEdit(DataSet : TDataSet);
    Procedure BeforePost(DataSet: TDataSet);
    procedure BeforeDelete(DataSet: TDataSet);
    procedure AfterDelete(DataSet: TDataSet);
    Procedure AfterPost(DataSet: TDataSet);
//  Function GetPedidos : String;
    Procedure Cargar_Ambiente;
    Procedure Complementar_Informacion_Documento;
    Procedure Insertar_Detalle(pCodigo_Producto : String);
    procedure Execute_Read_Barcode(pBarcode: String);
    Function Retornar_Siguiente : String;
    Procedure Activar_Grupos(pSender : TObject);
//    Procedure Insertar_Solicitud_Pedido(Const pCodigo_Tercero, pCodigo_Sinonimo : String);
    Procedure Imprimir_Comanda_Detalle(pTodo, pLocal : Boolean);
    Function Adicionar_Registro_Detalle(Const pCodigo_Producto, pNombre, pId_Fecha_Vencimiento : String; pValor, pCantidad : Double) : Boolean;
    Procedure Adicionar_Detalle(pSender: TObject);
    Function Abrir_Archivo_Detalle : Boolean;
    Procedure Cerrar_Archivo_Detalle;
    Function Abrir_Archivo_Maestro : Boolean;
    Procedure Cerrar_Archivo_Maestro;
    Procedure Establecer_Info_Tercero;
    Procedure Precalcular;
  public
    { Public declarations }
  end;


Function Show_Form_Documento_Captura(pTipo_Documento : String; pCodigo_Espacio : String = '') : Boolean;

implementation
{$R *.dfm}
Uses
  Math,
  StrUtils,
  UtAcarreo,
  UtComanda,
  Form_Fecha,
  VCL.cyTypes,
  Form_Opcion,
  UtImpresion,
  UtFunciones,
  UtInfoTablas,
  UtConstantes,
  Form_Grid_SQL,
  Form_MenuPpal,
  Form_Busqueda,
  UtEspacioBoton,
  Form_Contrasena,
  UtCentral_Ventas,
  Form_Comentarios,
  UtCerrar_Documento,
  UtCalculo_Impuestos,
  Form_GetValueDouble,
  UtVariablesGlobales,
  Form_Captura_Tercero,
  Tablename_Precargada,
  UtFiltro_Transaccional,
  Form_Documento_Comanda,
  UtCalculo_Discriminados,
  Tablename_Documento_Adm,
  Form_Documento_Info_Enc,
  Form_Documento_Info_Det,
  Form_Print_Documento_Adm,
  Form_Documento_Forma_Pago,
  Form_Documento_Observacion;

Procedure TFrDocumento_Captura.Control_Log(pDataSet : TDataSet; Const pSource : String; Const pMessageError : String = '');
Const
  LINE_START = '<-----!';
  LINE_FINISH = '!----->';
Var
  lI: Integer;
  lLog : String;
  lTexto : String;
Begin
  lTexto := '';
  If Assigned(pDataSet) Then
  Begin
    lTexto := lTexto + IfThen(Not Vacio(lTexto), #13 + StringOfChar(' ', 22)) + Trim(pDataSet.Name);
    For lI := 0 To pDataSet.Fields.Count - 1 Do
      If pDataSet.Fields[lI].DataType In  [ftSmallint, ftString, ftWideString, ftMemo, ftWideMemo, ftFloat, ftInteger, ftCurrency] Then
        If Not Vacio(pDataSet.Fields[lI].AsString) Then
          lTexto := lTexto + IfThen(Not Vacio(lTexto), #13 + StringOfChar(' ', 22)) + Trim(pDataSet.Fields[lI].FullName) + ' = ' + Trim(pDataSet.Fields[lI].AsString) ;
  End
  Else
  Begin
    lTexto := pMessageError;
  End;
  If Not Vacio(lTexto) Then
  Begin
    gVariableGlobal.Add_Log(['Origen', pSource, 'Dato', lTexto]);
//    lLog := LINE_START + #13 +
//            StringOfChar(' ', 20) + pSource                  + #13 +
//            StringOfChar(' ', 20) + 'USUARIO: ' + gVariableGlobal.Usuario_Actual + #13 +
//            StringOfChar(' ', 20) + 'ESTACION: ' + Retornar_Maquina + #13 +
//            StringOfChar(' ', 20) + 'CAPTION: ' + Self.Caption + #13 +
//            StringOfChar(' ', 20) + 'NAME: ' + Self.Name + #13 +
//            StringOfChar(' ', 20) + 'ACCION: ' + pMessageError+ #13 +
//            StringOfChar(' ', 22) + lTexto                   + #13 +
//            StringOfChar(' ', 20) + LINE_FINISH;
//    UtLog_Execute(lLog);
  End;
End;

Procedure TFrDocumento_Captura.Acarrear_Porcentaje;
Var
  lImpuesto : String;
  lPorcentaje : Double;
Begin
  Try
    If (FDETAIL.QR.RecordCount > 0) And (gVariableGlobal.SERVICIO_MANUAL = 'S') And
       (FMASTER.QR.FieldByName('TIPO_DOCUMENTO').AsString = Const_Documento_Cotizacion) Or (FMASTER.QR.FieldByName('TIPO_DOCUMENTO').AsString = Const_Documento_Factura) Then
    Begin
      FMASTER.QR.Edit;
      FMASTER.QR.FieldByName('ID_PROPINA').AsString := IfThen(FMASTER.QR.FieldByName('ID_PROPINA').AsString = 'S', 'N', 'S');
      FMASTER.QR.Post;
      CNX.TMP.Active := False;
      CNX.TMP.SQL.Clear;
      CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name);
      CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(FDATAKEY )));
      CNX.TMP.Active := True ;
      If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
      Begin
        CNX.TMP.First;
        While Not CNX.TMP.Eof Do
        Begin
          lImpuesto := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [CNX.TMP.FieldByName('CODIGO_PRODUCTO').AsString], ['IMPUESTO_VENTA'], 'TFrDocumento_Captura.Acarrear_Porcentaje');
          lPorcentaje := gVariableGlobal.CNX.Retornar_Double(Retornar_Info_Tabla(Id_Impuesto).Name, ['CODIGO_IMPUESTO'], [lImpuesto], ['PORC_SERVICIO'], 'TFrDocumento_Captura.Acarrear_Porcentaje');
          CNX.TMP.Edit;
          CNX.TMP.FieldByName('PORC_SERVICIO').Value := IfThen(FMASTER.QR.FieldByName('ID_PROPINA').AsString <> 'S', 0, lPorcentaje);
          Calcular_Impuestos_Detalle(FMASTER.QR, CNX.TMP);
          CNX.TMP.Post;
          CNX.TMP.Next;
        End;
      End;
      CNX.TMP.Active := False;
      CNX.TMP.SQL.Clear;
      Calcular_Impuesto_Encabezado(FMASTER.QR, FMASTER.DS);
      Abrir_Archivo_Maestro;
      Abrir_Archivo_Detalle;
    End;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.Acarrear_Porcentaje']);
  End;
End;


Procedure TFrDocumento_Captura.BeforeEdit(DataSet : TDataSet);
Begin
  If Assigned(DataSet) Then
    Control_Log(DataSet, 'TFrDocumento_Captura.BeforeEdit', IfThen(DataSet.State In [dsInsert], 'Inserción', 'Edición'));
End;

Procedure TFrDocumento_Captura.BeforePost(DataSet : TDataSet);
Begin
  If Assigned(DataSet) Then
    Control_Log(DataSet, 'TFrDocumento_Captura.BeforePost', IfThen(DataSet.State In [dsInsert], 'Inserción', 'Edición'));
End;

procedure TFrDocumento_Captura.BeforeDelete(DataSet: TDataSet);
Begin
  If Assigned(DataSet) Then
    Control_Log(DataSet, 'TFrDocumento_Captura.BeforeDelete');
End;

procedure TFrDocumento_Captura.AfterDelete(DataSet: TDataSet);
begin
  Control_Log(Nil, 'TFrDocumento_Captura.AfterDelete', 'ELIMINADO!!!!');
end;

Procedure TFrDocumento_Captura.AfterPost(DataSet: TDataSet);
Begin
  If Assigned(DataSet) Then
    Control_Log(DataSet, 'TFrDocumento_Captura.AfterPost');
End;

procedure TFrDocumento_Captura.BtnAbrirCajonClick(Sender: TObject);
begin
  If (gVariableGlobal.TIPO_IMPRESORA = 'Estandard 1') Or Vacio(gVariableGlobal.TIPO_IMPRESORA) Then
    Abrir_Cajon_Monedero
  Else
    UtImpresionAbrir_Cajon(gVariableGlobal.PUERTO_IMPRESORA, gVariableGlobal.TIPO_IMPRESORA);
end;

procedure TFrDocumento_Captura.DOCUMENTO_COMANDAChange(Sender: TObject);
begin
  Try
    If Not (FMASTER.DS.State In [dsInsert, dsEdit]) Then
      FMASTER.QR.Edit;
    FMASTER.QR.Post;
    FMASTER.QR.Edit;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.DOCUMENTO_COMANDAChange']);
  End;
end;

procedure TFrDocumento_Captura.DOCUMENTO_COMANDAClick(Sender: TObject);
begin
  Try
    If Not (FMASTER.DS.State In [dsInsert, dsEdit]) Then
      FMASTER.QR.Edit;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.DOCUMENTO_COMANDAClick']);
  End;
end;

procedure TFrDocumento_Captura.DsDetalleDataChange(Sender: TObject;
  Field: TField);
begin
  If FDETAIL.QR.Active And (Not FDETAIL_UPDATING) Then
  Begin
  End;
end;

procedure TFrDocumento_Captura.DsMaestroDataChange(Sender: TObject;  Field: TField);
begin
  lbDomicilio.Caption := '< ALT+D> DOMICILIO ' + FormatFloat('$ ###,###,##00.#0', FMASTER.QR.FieldByName('VALOR_DOMICILIO').AsFloat);
  lbTOTAL.Caption := FormatFloat('$ ###,###,##00.#0', FMASTER.QR.FieldByName('VALOR_TOTAL').AsFloat + FMASTER.QR.FieldByName('VALOR_DOMICILIO').AsFloat);
  pnlDocumento.Caption := Trim(FTEXTO_DOCUMENTO) + ' - ' + Trim(gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [FMASTER.QR.FieldByName('CODIGO_TERCERO').AsString], ['NOMBRE'], 'TFrDocumento_Captura.DsMaestroDataChange')) + ', ' +
                          'Dirección: ' + Trim(gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [FMASTER.QR.FieldByName('CODIGO_TERCERO').AsString, FMASTER.QR.FieldByName('CODIGO_SINONIMO').AsString], ['DIRECCION'], 'TFrDocumento_Captura.DsMaestroDataChange')) + ', ' +
                          'Telefono: ' + Trim(gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [FMASTER.QR.FieldByName('CODIGO_TERCERO').AsString, FMASTER.QR.FieldByName('CODIGO_SINONIMO').AsString], ['TELEFONO' ], 'TFrDocumento_Captura.DsMaestroDataChange')) ;
  lbDocumento.Caption := pnlDocumento.Caption;
  pnlDocumento.Caption := '';
  BTNPROPINA.Visible := gVariableGlobal.SERVICIO_MANUAL = 'S';
  If (Not FMASTER.QR.Active) Or FMASTER_UPDATING Then
    Exit;
  If (FMASTER.DS.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = FMASTER.QR.FieldByName('CODIGO_VENDEDOR').FullName)) Then
    lbNombre_Vendedor.Caption := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [FMASTER.QR.FieldByName('CODIGO_VENDEDOR').AsString], ['NOMBRE'], 'TFrDocumento_Captura.DsMaestroDataChange');
end;

procedure TFrDocumento_Captura.GridDetalleColExit(Sender: TObject);
begin
  If FDETAIL_UPDATING Or FMASTER_UPDATING Then
    Exit;
  FDETAIL_UPDATING := True;
  FMASTER_UPDATING := True;
  Try
    If FDETAIL.DS.State In [dsInsert, dsEdit] Then
      FDETAIL.QR.Post;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.GridDetalleColExit']);
  End;
  FMASTER_UPDATING := False;
  FDETAIL_UPDATING := False;
end;

procedure TFrDocumento_Captura.GridDetalleExit(Sender: TObject);
begin
  GridDetalleColExit(Sender);
end;

procedure TFrDocumento_Captura.GridDetalleKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Ord(Key) In [VK_LEFT, VK_RIGHT, VK_RETURN] Then
  Begin
    If GridDetalle.SelectedIndex < (GridDetalle.FieldCount - 1) Then
      GridDetalle.SelectedIndex := GridDetalle.SelectedIndex + 1
    Else
      GridDetalle.SelectedIndex := 0;
    Key := #0;
  End;
end;

procedure TFrDocumento_Captura.Execute_Read_Barcode(pBarcode: String);
Begin
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_BARRAS'   ) + ' LIKE ' + QuotedStr('%' + Trim(pBarcode) + '%'));
    CNX.TMP.SQL.Add(' OR '    + gVariableGlobal.CNX.Trim_Sentence('CODIGO_PROVEEDOR') + ' LIKE ' + QuotedStr('%' + Trim(pBarcode) + '%'));
    CNX.TMP.SQL.Add(' OR '    + gVariableGlobal.CNX.Trim_Sentence('CODIGO_PRODUCTO' ) + ' LIKE ' + QuotedStr('%' + Trim(pBarcode) + '%'));
    CNX.TMP.Active := True;
    If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
      Insertar_Detalle(CNX.TMP.FieldByName('CODIGO_PRODUCTO').AsString);
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.Execute_Read_Barcode']);
  End;
End;

Procedure TFrDocumento_Captura.Activar_Grupos(pSender : TObject);
Begin
  Pag00.TabVisible := True;
  Paginas.ActivePage := Pag00;
End;

Procedure TFrDocumento_Captura.Complementar_Informacion_Documento;
Begin
  Try
    If Not (FMASTER.DS.State In [dsInsert, dsEdit]) Then
      FMASTER.QR.Edit;
    If Not Vacio(FMASTER.QR.FieldByName('CODIGO_TERCERO').AsString) Then
      If Not Vacio(FMASTER.QR.FieldByName('CODIGO_SINONIMO').AsString) Then
        If Vacio(FMASTER.QR.FieldByName('DIRECCION').AsString) Then
          FMASTER.QR.FieldByName('DIRECCION').AsString := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [FMASTER.QR.FieldByName('CODIGO_TERCERO').AsString, FMASTER.QR.FieldByName('CODIGO_SINONIMO').AsString], ['DIRECCION'], 'TFrDocumento_Captura.Complementar_Informacion_Documento');
    FMASTER.QR.Post;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.Complementar_Informacion_Documento']);
  End;
End;

Function TFrDocumento_Captura.Retornar_Siguiente : String;
Var
  lVlr : Integer;
  lErr : Integer;
Begin
  Result := '00000';
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT MAX(CONSECUTIVO) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(FDATAKEY)));
    CNX.TMP.Active := True;
    If CNX.TMP.Active Then
      Result := CNX.TMP.FieldByName('RESULTADO').AsString;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    Result := Justificar(Result, '0', 3);
    Val(Result, lVlr, lErr);
    Result := Justificar(IntToStr(lVlr + 1), '0', 3);
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.Retornar_Siguiente']);
  End;
End;

procedure TFrDocumento_Captura.BtnElegirVendedorClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  Try
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO'], ['CODIGO_TERCERO'], Retornar_Info_Tabla(Id_Tercero).Name, 'ID_EMPLEADO = ' + QuotedStr('S'), Retornar_Info_Tabla(Id_Tercero).Caption, lResult01, lResult02, lResult03, False, CNX) Then
    Begin
      If Not (FMASTER.DS.State In [dsInsert, dsEdit]) Then
        FMASTER.QR.Edit;
      FMASTER.QR.FieldByName('CODIGO_VENDEDOR').AsString := Justificar(lResult01, ' ', FMASTER.QR.FieldByName('CODIGO_VENDEDOR').Size);
      FMASTER.QR.Post;
    End;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.SpeedButton1Click']);
  End;
end;

Function TFrDocumento_Captura.Adicionar_Registro_Detalle(Const pCodigo_Producto, pNombre, pId_Fecha_Vencimiento : String; pValor, pCantidad : Double) : Boolean;
Begin
  Result := True;
  If Vacio(FMASTER.QR.FieldByName('CODIGO_VENDEDOR').AsString) Then
  Begin
    Mensajes('Debe elegir un vendedor');
    Exit;
  End;
  Try
    UtCentral_Ventas_Adicionar_Registro_Detalle(FDETAIL.QR, FDATAKEY, FTIPO_DOCUMENTO, pCodigo_Producto, pNombre, pId_Fecha_Vencimiento, pValor, pCantidad);
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.Adicionar_Registro_Detalle']);
  End;
End;

Procedure TFrDocumento_Captura.Adicionar_Detalle(pSender: TObject);
Var
  lBtn : TUtBotonVCL;
Begin
  If Vacio(FMASTER.QR.FieldByName('CODIGO_VENDEDOR').AsString) Then
  Begin
    Mensajes('Debe elegir un vendedor');
    Exit;
  End;

  lBtn := Nil;
  If pSender Is TUtBotonVCL Then
    lBtn := pSender As TUtBotonVCL
  Else If (pSender Is TImage) And ((pSender As TImage).Parent Is TUtBotonVCL) Then
    lBtn := (pSender As TImage).Parent As TUtBotonVCL
  Else If (pSender Is TLabel) And ((pSender As TLabel).Parent Is TUtBotonVCL) Then
    lBtn := (pSender As TLabel).Parent As TUtBotonVCL;

  If (Not Assigned(lBtn)) Or FDETAIL_UPDATING  Then
    Exit;
  FDETAIL_UPDATING := True;
  Try
    Adicionar_Registro_Detalle(lBtn.CODIGO_PRODUCTO,
                               lBtn.NOMBRE         ,
                               lBtn.ID_FECHA_VENCIMIENTO,
                               lBtn.VALOR_UNITARIO,
                               lBtn.CANTIDAD_PROPUESTA);
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.Adicionar_Registro_Detalle']);
  End;
  FDETAIL_UPDATING := False;
End;

procedure TFrDocumento_Captura.BtnDelDetClick(Sender: TObject);
begin
  If gVariableGlobal.NO_ELIMINAR_DETALLE = 'S' Then
  Begin
    Mensajes('No es posible realizar sta operación, por favor solicite autorización del administrador del sistema');
    Exit;
  End;


  If FMASTER_UPDATING Or FDETAIL_UPDATING  Then
    Exit;
  FDETAIL_UPDATING := True;
  FMASTER_UPDATING := True;
  Try
    If FDETAIL.QR.RecordCount > 0 Then
    Begin
      Try
        FDETAIL.QR.Delete;
      Except
        On E: Exception Do
          gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.BtnDelDetClick']);
      End;
    End;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.Cerrar_Archivo_Maestro']);
  End;
  FMASTER_UPDATING := False;
  FDETAIL_UPDATING := False;
  UtComanda_Execute(FDATAKEY, True);
  Abrir_Archivo_Maestro;
end;

Procedure TFrDocumento_Captura.BtnDomicilioClick(Sender: TObject);
Var
  lValue : Double;
begin
  lValue := FMASTER.QR.FieldByName('VALOR_DOMICILIO').AsFloat;
  If Get_Value_Double('Actual', 'Nuevo', lValue, 'Valor Domicilio') Then
  Begin
    If Not (FMASTER.DS.State In [dsInsert, dsEdit]) Then
      FMASTER.QR.Edit;
    FMASTER.QR.FieldByName('VALOR_DOMICILIO').AsFloat := lValue;
    FMASTER.QR.Post;
    UtCalculo_Discriminados_Execute(Id_Documento_Enc_Aux, Id_Documento_Det_Aux, FDATAKEY);
    Abrir_Archivo_Maestro;
  End;
end;

Procedure TFrDocumento_Captura.BtnEditarDetalleClick(Sender: TObject);
begin
  Show_Form_Comentarios(FDETAIL.DS, FDETAIL.QR.FieldByName('OBSERVACION'));
end;

procedure TFrDocumento_Captura.BtnEditDetClick(Sender: TObject);
begin
  If FDETAIL.QR.Active And (FDETAIL.QR.RecordCount > 0) Then
    If Show_Form_Documento_Info_Det(FDATAKEY, FDETAIL.QR.FieldByName('CONSECUTIVO').AsString) Then
    Begin
      Abrir_Archivo_Maestro;
      Abrir_Archivo_Detalle;
      FDETAIL.QR.AfterPost(Nil);
    End;
end;

Function TFrDocumento_Captura.Abrir_Archivo_Maestro : Boolean;
Begin
  Result := UtCentral_Ventas_Abrir_Archivo_Maestro(FMASTER.QR, FTIPO_DOCUMENTO, FCODIGO_ESPACIO, FDATAKEY, BtnDomicilio.Visible);
End;

Function TFrDocumento_Captura.Abrir_Archivo_Detalle : Boolean;
Var
  lI : Integer;
Begin
  Result := UtCentral_Ventas_Abrir_Archivo_Detalle(FDETAIL.QR, FDATAKEY);
  If Result Then
  Begin
    For lI := 0 To GridDetalle.Columns.Count-1 Do
    Begin
      If Pos('_TRM', GridDetalle.Columns[lI].FieldName) > 0 Then
        GridDetalle.Columns[lI].Visible := gVariableGlobal.Valor_TRM > 0;
      If Pos('CODIGO_PRODUCTO', GridDetalle.Columns[lI].FieldName) > 0 Then
        GridDetalle.Columns[lI].Visible := gVariableGlobal.ID_CODIGO_PRODUCTO = 'S';

      If (Pos('VALOR_ORIGINAL' , GridDetalle.Columns[lI].FieldName) > 0) Then
        GridDetalle.Columns[lI].ReadOnly := gVariableGlobal.ID_EDITAR_VALORES <> 'S';
    End;
  End;
End;

Procedure TFrDocumento_Captura.Cerrar_Archivo_Maestro;
Begin
  Try
    If FMASTER.QR.Active Then
      FMASTER.QR.Active := False;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.Cerrar_Archivo_Maestro']);
  End;
End;

Procedure TFrDocumento_Captura.Cerrar_Archivo_Detalle;
Begin
  Try
    If FDETAIL.QR.Active Then
      FDETAIL.QR.Active := False;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.Cerrar_Archivo_Detalle']);
  End;
End;

procedure TFrDocumento_Captura.BtnEditEncClick(Sender: TObject);
begin
  Complementar_Informacion_Documento;
  Show_Form_Documento_Info_Enc(FDATAKEY, FTIPO_DOCUMENTO);
  If FMASTER.QR.Active And FDETAIL.QR.Active Then
    Calcular_Detalles_Documento(Id_Documento_Enc_Aux, Id_Documento_Det_Aux, FDATAKEY);
  Abrir_Archivo_Maestro;
  Abrir_Archivo_Detalle;
end;

procedure TFrDocumento_Captura.BtnFormaPagoClick(Sender: TObject);
Var
  lValue : Double;
begin
  lValue := FMASTER.QR.FieldByName('VALOR_TOTAL').AsFloat + FMASTER.QR.FieldByName('VALOR_DOMICILIO').AsFloat;
  Show_Form_Documento_Forma_Pago_Preview(FMASTER.QR.FieldByName('DATAKEY').AsString, lValue, gVariableGlobal.Valor_TRM, Id_Documento_Enc_Aux);
  UtCalculo_Discriminados_Execute(Id_Documento_Enc_Aux, Id_Documento_Det_Aux, FDATAKEY);
  Abrir_Archivo_Maestro;
  Abrir_Archivo_Detalle;
end;

procedure TFrDocumento_Captura.BtnInsertarTerceroClick(Sender: TObject);
begin
  Establecer_Info_Tercero;
end;

procedure TFrDocumento_Captura.BtnPreviewDocClick(Sender: TObject);
Var
  lCopias : Integer;
  lOption : Integer;
  lFormato : String;
  lId_Salida : String;
begin
  If Tablename_Documento_Adm_Formato(FTIPO_DOCUMENTO, lFormato, lId_Salida, lCopias) Then
  Begin
    If Not Show_FrOpcion(['Vista Preliminar', 'Imprimir'], lOption) Then
      Exit;
    Complementar_Informacion_Documento;
    UtCalculo_Discriminados_Execute(Id_Documento_Enc_Aux, Id_Documento_Det_Aux, FDATAKEY);
    Abrir_Archivo_Maestro;
    Execute_Print_Documento_Adm(Id_Documento_Enc_Aux, Id_Documento_Det_Aux, Id_Documento_Rec_Aux, FTIPO_DOCUMENTO, FTIPO_DOCUMENTO, FDATAKEY, lFormato, lId_Salida, '', lOption, 1);
    If gVariableGlobal.ID_CORTAR_TIRILLA = 'S' Then
    Begin
      If (gVariableGlobal.TIPO_IMPRESORA = '1') Or Vacio(gVariableGlobal.TIPO_IMPRESORA) Then
        Cortar_Papel_Impresora
      Else
        Cortar_Papel_II(gVariableGlobal.PUERTO_IMPRESORA, '');
    End;
  End;
end;

procedure TFrDocumento_Captura.BTNPROPINAClick(Sender: TObject);
begin
  Acarrear_Porcentaje(FMASTER.QR.FieldByName('ID_PROPINA').AsString <> 'S');
end;

procedure TFrDocumento_Captura.BtnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFrDocumento_Captura.BtnSettingComandaClick(Sender: TObject);
begin
  Form_Documento_Comanda_Put;
end;

procedure TFrDocumento_Captura.BARCODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_RETURN Then
    If Not Vacio(BARCODE.Text) Then
    Begin
      Execute_Read_Barcode(BARCODE.Text);
      BARCODE.Text := '';
      ActiveControl := BARCODE;
    End;
end;

Procedure TFrDocumento_Captura.Imprimir_Comanda_Detalle(pTodo, pLocal : Boolean);
Var
  lCopias : Integer;
  lFormato : String;
  lId_Salida : String;
Begin
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(FDATAKEY)));
    CNX.TMP.SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence('ID_COMANDA') + ' = ' + QuotedStr(Trim('S')));
    If Not pTodo Then
      CNX.TMP.SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence('ID_IMPRESO') + ' = ' + QuotedStr(Trim('N')));
    CNX.TMP.Active := True;
    If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
    Begin
      CNX.TMP.First;
      While Not CNX.TMP.Eof Do
      Begin
        If Not pLocal Then
        Begin
//        UtEnviar_TCP_Comanda('COMANDA_DETALLADA', FTIPO_DOCUMENTO, FDATAKEY, CNX.TMP.FieldByName('CONSECUTIVO').AsString, IfThen(pTodo, 'TODO', 'ULTIMO INGRESADO'));
          Sleep(100);
        End
        Else
          Execute_Print_Documento_Adm(Id_Documento_Enc_Aux, Id_Documento_Det_Aux, Id_Documento_Rec_Aux, Const_Documento_Comanda_Detallada, FTIPO_DOCUMENTO, FDATAKEY, lFormato, 'COMANDA', CNX.TMP.FieldByName('CONSECUTIVO').AsString, 2{lOption}, 1);
        CNX.TMP.Edit;
        CNX.TMP.FieldByName('ID_IMPRESO').AsString := 'S';
        CNX.TMP.Post;
        CNX.TMP.Next;
      End;
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.Imprimir_Comanda_Detalle']);
  End;
End;

procedure TFrDocumento_Captura.BtnAcarreoClick(Sender: TObject);
Var
  lOption : Integer;
  lResult : TStringList;
begin
  lResult := TStringList.Create;
  If FTIPO_DOCUMENTO = Const_Documento_Pedido Then
  Begin
//    If Show_Form_Grid_SQL(GetPedidos, 'Solicitud de pedido ', [], ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], lResult) Then
//      Insertar_Solicitud_Pedido(lResult[0], lResult[1]);
  End
  Else
    If (FTIPO_DOCUMENTO = Const_Documento_Compra) And  Show_FrOpcion(['Solicitud', 'Pedido'], lOption) Then
    Begin
      Case lOption Of
        1 : Begin
//              If Show_Form_Grid_SQL(GetPedidos, 'Solicitud de pedido ', [], ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], lResult) Then
//                Insertar_Solicitud_Pedido(lResult[0], lResult[1]);
            End;
        2 : Begin
              If Acarrear_Documento(FTIPO_DOCUMENTO) Then
              Begin
                Abrir_Archivo_Maestro;
                Abrir_Archivo_Detalle;
              End;
            End;
      End;
    End
    Else
      If (FTIPO_DOCUMENTO = Const_Documento_Factura) Then
      Begin
        If Acarrear_Documento(FTIPO_DOCUMENTO) Then
        Begin
          Abrir_Archivo_Maestro;
          Abrir_Archivo_Detalle;
        End;
      End;
  lResult.Clear;
  FreeAndNil(lResult);
end;

Procedure TFrDocumento_Captura.Insertar_Detalle(pCodigo_Producto : String);
Var
  lOk : Boolean;
  lValor  : Double;
  lCodigo : String;
  lNombre : String;
  lResult : String;
  lFieldName : String;
  lCantidad_Propuesta : Double;
  lId_Fecha_Vencimiento : String;
Begin
  lOk := True;
  If FDETAIL_UPDATING Then
    Exit;
  If Vacio(FMASTER.QR.FieldByName('CODIGO_VENDEDOR').AsString) Then
  Begin
    Mensajes('Debe elegir un vendedor');
    Exit;
  End;
  FDETAIL_UPDATING := True;
  Try
    lFieldName := IfThen((FTIPO_DOCUMENTO = Const_Documento_Pedido) Or (FTIPO_DOCUMENTO = Const_Documento_Compra), 'VALOR_COMPRA', 'VALOR_VENTA');
    lCodigo := pCodigo_Producto;
    If Vacio(lCodigo) Then
    Begin
      If gVariableGlobal.ID_BUSQUEDA_C_N <> 'S' Then
        lOk := Show_FrBusqueda(['NOMBRE', 'CODIGO_PRODUCTO', lFieldName], ['CODIGO_PRODUCTO', 'NOMBRE'], Retornar_Info_Tabla(Id_Producto).Name, '', Retornar_Info_Tabla(Id_Producto).Caption, lCodigo, lNombre, lResult, False, CNX)
      Else
        lOk := Show_FrBusqueda(['CODIGO_PRODUCTO', 'NOMBRE', lFieldName], ['CODIGO_PRODUCTO', 'NOMBRE'], Retornar_Info_Tabla(Id_Producto).Name, '', Retornar_Info_Tabla(Id_Producto).Caption, lCodigo, lNombre, lResult, False, CNX);
    End
    Else
      lNombre := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [lCodigo], ['NOMBRE'], 'TFrDocumento_Captura.BtnAddDetClick');
    If lOk Then
    Begin
      lValor := gVariableGlobal.CNX.Retornar_Double(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [lCodigo], [lFieldName], 'TFrDocumento_Captura.BtnAddDetClick');
      lCantidad_Propuesta := gVariableGlobal.CNX.Retornar_Double(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [lCodigo], ['CANTIDAD_PROPUESTA'], 'TFrDocumento_Captura.BtnAddDetClick');
      lId_Fecha_Vencimiento := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [lCodigo], ['ID_FECHA_VENCIMIENTO'], 'TFrDocumento_Captura.BtnAddDetClick');
      Adicionar_Registro_Detalle(lCodigo, lNombre, lId_Fecha_Vencimiento, lValor, lCantidad_Propuesta);
    End;
  Except
    On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrCaptura_Resumida.Insertar_Detalle']);
  End;
  FDETAIL_UPDATING := False;
End;

procedure TFrDocumento_Captura.BtnAddDetClick(Sender: TObject);
begin
  Insertar_Detalle('');
end;

procedure TFrDocumento_Captura.BtnAdminClick(Sender: TObject);
Var
  ltmp : String;
  lPerfil : String;
  lPassword : String;
begin
  If Not SiNo('Esta seguro hacer el cambio de usuario') Then
    Exit;
  If Vacio(gVariableGlobal.USUARIO_ADMIN) Then
  Begin
    ltmp := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['ID_ADMIN'], ['S'], ['CODIGO_USUARIO'], 'TFrProducto.DsMaestroDataChange', False);
    If Not Vacio(ltmp) Then
    Begin
      lPerfil := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [ltmp], ['CODIGO_PERFIL'], 'Form_Entrada');
      lPassword := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [ltmp], ['CONTRASENA'], 'Form_Entrada');
      If Show_Form_Contrasena(lPassword) Then
      Begin
        FUSUARIO_ACTUAL := gVariableGlobal.USUARIO_ACTUAL;
        gVariableGlobal.USUARIO_NOMBRE := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [ltmp], ['NOMBRE'], 'Form_Entrada');
        gVariableGlobal.Cargar_Variables(ltmp, lPerfil);
        FrMenuPpal.Cargar_Configuraciones;
        gVariableGlobal.USUARIO_ADMIN := ltmp;
        Mensajes('Proceso terminado');
        BtnAdmin.Caption := 'Admin';
        BtnAdmin.Hint := 'Ambiente en modo admin';
      End;
    End
    Else
    Begin
      Mensajes('No ha definido el admin del sistema');
    End;
  End
  Else
  Begin
    lPerfil := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [FUSUARIO_ACTUAL], ['CODIGO_PERFIL'], 'Form_Entrada');
    gVariableGlobal.USUARIO_NOMBRE := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [FUSUARIO_ACTUAL], ['NOMBRE'], 'Form_Entrada');
    gVariableGlobal.Cargar_Variables(FUSUARIO_ACTUAL, lPerfil);
    FrMenuPpal.Cargar_Configuraciones;
    gVariableGlobal.USUARIO_ADMIN := '';
    BtnAdmin.Caption := 'No admin';
    BtnAdmin.Hint := 'Ambiente no en modo admin';
    Mensajes('Proceso terminado');
  End;
end;

procedure TFrDocumento_Captura.BtnAjustarRecetaClick(Sender: TObject);
begin
  Form_Documento_Observacion_Show(FDETAIL.QR.FieldByName('CODIGO_PRODUCTO').AsString, FDETAIL.QR.FieldByName('DATAKEY').AsString, FDETAIL.QR.FieldByName('CONSECUTIVO').AsString);
  UtComanda_Execute(FDATAKEY, True);
  Abrir_Archivo_Maestro;
end;

procedure TFrDocumento_Captura.BtnCancelDocClick(Sender: TObject);
Var
  lOk : Boolean;
begin
  If gVariableGlobal.NO_CANCELAR_DOCUMENTO = 'S' Then
  Begin
    Mensajes('No es posible realizar sta operación, por favor solicite autorización del administrador del sistema');
    Exit;
  End;

  If Sino('Esta seguro(a) de cancelar el documento?') Then
  Begin
    If FDETAIL.QR.Active Then
    Begin
      FDETAIL.QR.First;
      While Not FDETAIL.QR.Eof Do
      Begin
//        UtEnviar_TCP_Kardex(FTIPO_DOCUMENTO, FDETAIL.QR.FieldByName('CODIGO_PRODUCTO').AsString);
        FDETAIL.QR.Next;
      End;
    End;
    Cerrar_Archivo_Detalle;
    Cerrar_Archivo_Maestro;
    gVariableGlobal.CNX.BeginTrans;
    lOk := Inicializar_Documento(Id_Documento_Enc_Aux, Id_Documento_Det_Aux, Id_Documento_Rec_Aux, Id_Documento_Obs_Aux, FDATAKEY);
    If lOk And (Not Vacio(FCODIGO_ESPACIO)) Then
      lOk := Actualizar_Estado_Espacio(FCODIGO_ESPACIO, Const_Abrev_Disponible);
    If lOk Then
    Begin
      gVariableGlobal.CNX.CommitTrans;
      Control_Log(Nil, 'TFrDocumento_Captura.BtnCancelDocClick', 'CANCELACION DE DOCUMENTO: ' + FDATAKEY);
      Mensajes('Proceso Terminado!!!');
    End
    Else
    Begin
      gVariableGlobal.CNX.RollbackTrans;
      Mensajes('No se puede cancelar el documento!!!');
    End;
    If (Not Vacio(FCODIGO_ESPACIO)) Or ((FTIPO_DOCUMENTO = Const_Documento_Nota_Credito) Or (FTIPO_DOCUMENTO = Const_Documento_Nota_Debito)) Then
    Begin
      Close;
    End
    Else
    Begin
      Abrir_Archivo_Maestro;
      Abrir_Archivo_Detalle;
    End;
  End;
end;

procedure TFrDocumento_Captura.BtnCerrarDocClick(Sender: TObject);
Var
  lOk : Boolean;
  lValue : Double;
  lCopias : Integer;
  lOption : Integer;
  lKeyData : String;
  lId_Salida : String;
  lCodigo_Formato : String;
  lNombre_Formato : String;
  lCodigo_Tercero : String;
  lNumero_Documento : String;
begin
  Calcular_Impuesto_Encabezado(FMASTER.QR, FMASTER.DS);

  If FDETAIL.QR.Active And (FDETAIL.QR.RecordCount <= 0) Then
  Begin
    Mensajes('Debe tener al menos un detalle para cerrar este documento');
    Exit;
  End;

  If FMASTER.QR.Active And (FMASTER.QR.FieldByName('VALOR_TOTAL').AsFloat <= 0) Then
  Begin
    Mensajes('Este documento se cerrará con el total en cero');
  End;

  If (Not Tablename_Documento_Adm_Codigo_Numero_Documento(FTIPO_DOCUMENTO, lCodigo_Formato, lNumero_Documento, lId_Salida)) Or (Not Tablename_Documento_Adm_Info(lCodigo_Formato, lNombre_Formato, lId_Salida, lCopias)) Then
    Exit;

  If Not Tablename_Documento_Adm_Limit(lCodigo_Formato, lNumero_Documento) Then
  Begin
    Mensajes('Ya llegó al final del rango de documentos');
    Exit;
  End;
  Complementar_Informacion_Documento;

  If Sino('Esta seguro(a) de cerrar el documento?') Then
  Begin
    If Not Show_FrOpcion(['Cerrar', 'Vista Preliminar', 'Imprimir'], lOption) Then
      Exit;

    lValue := FMASTER.QR.FieldByName('VALOR_TOTAL').AsFloat + FMASTER.QR.FieldByName('VALOR_DOMICILIO').AsFloat;
    lCodigo_Tercero := FMASTER.QR.FieldByName('CODIGO_TERCERO').AsString;
    If FMASTER.QR.Active Then
    Begin
      If Not (FMASTER.DS.State In [dsInsert, dsEdit]) Then
        FMASTER.QR.Edit;
      FMASTER.QR.FieldByName('CODIGO_DOCUMENTO_ADM').AsString := lCodigo_Formato;
      FMASTER.QR.Post;
    End;
    Cerrar_Archivo_Detalle;
    Cerrar_Archivo_Maestro;
    gVariableGlobal.CNX.BeginTrans;
    lOk := Cerrar_Documento(lKeyData, FDATAKEY, lCodigo_Tercero, FTIPO_DOCUMENTO, lCodigo_Formato);
    If lOk And ((FTIPO_DOCUMENTO = Const_Documento_Compra) Or (FTIPO_DOCUMENTO = Const_Documento_Factura)) Then
      lOk := Show_Form_Documento_Forma_Pago(lKeyData, lValue, gVariableGlobal.Valor_TRM, Id_Documento_Enc);
    If lOk Then
      UtCalculo_Discriminados_Execute(Id_Documento_Enc, Id_Documento_Det, lKeyData);
    If lOk Then
       Inicializar_Documento(Id_Documento_Enc_Aux, Id_Documento_Det_Aux, Id_Documento_Rec_Aux, Id_Documento_Obs_Aux, FDATAKEY);
    If lOk And (Not Vacio(FCODIGO_ESPACIO)) Then
      lOk := Actualizar_Estado_Espacio(FCODIGO_ESPACIO, Const_Abrev_Disponible);
    If lOk Then
    Begin
      gVariableGlobal.CNX.CommitTrans;
      If gVariableGlobal.ID_ABRIR_CAJA = 'S' Then
      Begin
        If (gVariableGlobal.TIPO_IMPRESORA = 'Estandard 1') Or Vacio(gVariableGlobal.TIPO_IMPRESORA) Then
          Abrir_Cajon_Monedero
        Else
          UtImpresionAbrir_Cajon(gVariableGlobal.PUERTO_IMPRESORA, gVariableGlobal.TIPO_IMPRESORA);
      End;
      If lOption In [2, 3] Then
      Begin
        If gVariableGlobal.ID_CORTAR_TIRILLA = 'S' Then
        Begin
          If (gVariableGlobal.TIPO_IMPRESORA = '1') Or Vacio(gVariableGlobal.TIPO_IMPRESORA) Then
            Cortar_Papel_Impresora
          Else
            Cortar_Papel_II(gVariableGlobal.PUERTO_IMPRESORA, '');
        End;
        Dec(lOption);
        Execute_Print_Documento_Adm(Id_Documento_Enc, Id_Documento_Det, Id_Documento_Rec, FTIPO_DOCUMENTO, FTIPO_DOCUMENTO, lKeyData, lNombre_Formato, lId_Salida, '', lOption, lCopias);
      End;
      Mensajes('Proceso Terminado!!!');
      lValue := gVariableGlobal.CNX.Retornar_Double(Retornar_Info_Tabla(Id_Documento_Enc).Name, ['DATAKEY', 'TIPO_DOCUMENTO'], [lKeyData, FTIPO_DOCUMENTO], ['VALOR_VUELTO'], 'TFrDocumento_Captura.BtnCerrarDocClick');
      lbVuelto.Caption := 'Vuelto : $ ' + FormatFloat('###,###,##0.#0', lValue) + '     ';
    End
    Else
    Begin
      gVariableGlobal.CNX.RollbackTrans;
      Mensajes('No se puede cerrar el documento!!!');
    End;
    If (Not Vacio(FCODIGO_ESPACIO)) Then
    Begin
      Close;
    End
    Else
    Begin
      Abrir_Archivo_Maestro;
      Abrir_Archivo_Detalle;
    End;
  End;
end;

procedure TFrDocumento_Captura.BtnComandaClick(Sender: TObject);
Var
  lAux : String;

  lOpcion : Integer;
  lCopias : Integer;
  lId_Salida : String;
  lFormato_Resumido : String;
  lFormato_Detallado : String;

  lTodo : Boolean;
  lLocal : Boolean;
  lImprimir : Boolean;
  lTipo_Comanda : TTipo_Comanda;
begin
  lOpcion := 1;
  If (Not Tablename_Documento_Adm_Formato(Const_Documento_Comanda_Resumida , lFormato_Resumido , lId_Salida, lCopias)) Or
     (Not Tablename_Documento_Adm_Formato(Const_Documento_Comanda_Detallada, lFormato_Detallado, lId_Salida, lCopias)) Then
    Exit;

  If Form_Documento_Comanda_Get(lLocal, lTodo, lImprimir, lTipo_Comanda) Then
  Begin
    If gVariableGlobal.ID_ELEGIR_IMPRESORA = 'S' Then
      lLocal := True;
    lAux := 'Tipo de envío: '      + IfThen(lLocal   , 'Local'        , 'Remoto'                      ) + ', ' +
            'Tipo de impresión: '  + IfThen(lTodo    , 'Imprimir todo', 'Imprimir lo ultimo ingresado') + ', ' +
            'Tipo de generación: ' + IfThen(lImprimir, 'Imprimir'     , 'Visualizar'                  ) + ', ' ;
    Case lTipo_Comanda Of
      TC_None      : lAux := lAux  + 'Tipo de comanda: Ninguna';
      TC_Detallada : lAux := lAux  + 'Tipo de comanda: Detallada';
      TC_Resumida  : lAux := lAux  + 'Tipo de comanda: Resumida';
      TC_Ambas     : lAux := lAux  + 'Tipo de comanda: Detallada y resumida';
    End;
    UtComanda_Execute(FDATAKEY, lTodo);
    Abrir_Archivo_Maestro;
    If lLocal Then
    Begin
      lOpcion := IfThen(lImprimir, 2, 1);
      Case lTipo_Comanda Of
        TC_Ambas     ,
        TC_Resumida  : Execute_Print_Documento_Adm(Id_Documento_Enc_Aux, Id_Documento_Det_Aux, Id_Documento_Rec_Aux, Const_Documento_Comanda_Resumida, FTIPO_DOCUMENTO, FDATAKEY , lFormato_Resumido , 'FOR', '', lOpcion, 1);
        TC_Detallada : Execute_Print_Documento_Adm(Id_Documento_Enc_Aux, Id_Documento_Det_Aux, Id_Documento_Rec_Aux, Const_Documento_Comanda_Detallada, FTIPO_DOCUMENTO, FDATAKEY, lFormato_Detallado, 'FOR', '', lOpcion, 1);
      End;
    End
    Else
    Begin
//      If lTipo_Comanda In [TC_Resumida, TC_Ambas] Then
//        UtEnviar_TCP_Comanda('COMANDA_RESUMIDA', FTIPO_DOCUMENTO, FDATAKEY, '', IfThen(lTodo, 'TODO', 'ULTIMO INGRESADO'));
      If lTipo_Comanda In [TC_Detallada, TC_Ambas] Then
         Imprimir_Comanda_Detalle(lTodo, lLocal);
      UtComanda_Set_Impresion(FDATAKEY);
    End;
  End;
end;

procedure TFrDocumento_Captura.FormActivate(Sender: TObject);
begin
  pnlBarcode.Visible := gVariableGlobal.ID_CODIGO_BARRAS = 'S';
  If pnlBarcode.Visible Then
    ActiveControl := BARCODE;
end;

Procedure TFrDocumento_Captura.Cargar_Ambiente;
Var
  lImagen : String;
Begin
  Try
    BtnEditEnc.Visible         := Application.Title <> gVariableGlobal.APLICACION_POS;
    BtnEditDet.Visible         := Application.Title <> gVariableGlobal.APLICACION_POS;
    BtnPreviewDoc.Visible      := Application.Title <> gVariableGlobal.APLICACION_POS;
    BtnInsertarTercero.Visible := Application.Title <> gVariableGlobal.APLICACION_POS;
    BtnAcarreo.Visible         := Application.Title <> gVariableGlobal.APLICACION_POS;
    BtnCancelDoc.Visible       := Application.Title <> gVariableGlobal.APLICACION_POS;
    BtnCerrarDoc.Visible       := Application.Title <> gVariableGlobal.APLICACION_POS;
    BtnFormaPago.Visible       := Application.Title <> gVariableGlobal.APLICACION_POS;
    BtnAbrirCajon.Visible      := Application.Title <> gVariableGlobal.APLICACION_POS;

    FSB.Tipo_Documento := FTIPO_DOCUMENTO;
    If ((FTIPO_DOCUMENTO = Const_Documento_Pedido) Or (FTIPO_DOCUMENTO = Const_Documento_Compra)) Then
      lImagen := gVariableGlobal.ID_IMAGEN_COMPRAS + ' '
    Else
      lImagen := gVariableGlobal.ID_IMAGEN_VENTAS + ' ';
    Case lImagen[1] Of
      'L' : FSB.Nivel_Maximo := TNivel.TN_Linea   ;
      ' ' ,
      'G' : FSB.Nivel_Maximo := TNivel.TN_Grupo   ;
      'S' : FSB.Nivel_Maximo := TNivel.TN_Subgrupo;
    End;
    FSB.Evento := Adicionar_Detalle;
    FSB.OnClickBoton(Nil);
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'TUtScrollBox.Cargar_Subgrupo']);
    End;
  End;
End;

procedure TFrDocumento_Captura.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
  If Not Vacio(gVariableGlobal.USUARIO_ADMIN) Then
  Begin
    Mensajes('Debe estar con el usuario original para poder continuar con el proceso, esta modo admin');
    CanClose := False;
  End;
end;

procedure TFrDocumento_Captura.FormCreate(Sender: TObject);
Var
  lI : Integer;
begin
  CNX := gVariableGlobal.CNX;
  If Vacio(gVariableGlobal.USUARIO_ADMIN) Then
  Begin
    BtnAdmin.Caption := 'No admin';
    BtnAdmin.Hint := 'Ambiente no en modo admin';
  End
  Else
  Begin
    BtnAdmin.Caption := 'Admin';
    BtnAdmin.Hint := 'Ambiente en modo admin';
  End;
  FSB := TUtScrollBox.Create(Pag00);
  FSB.Parent  := Pag00;
  FSB.Align   := TAlign.alClient;
  FSB.IMAGE_BACK.Assign(BACK.Picture.Bitmap);
  FSB.IMAGE_HOME.Assign(HOME.Picture.Bitmap);

  Self.Top    := 1;
  Self.Left   := 1;
  Self.Width  := Screen.Width - 1;
  Self.Height := Screen.Height - 1;
  Self.Height := Screen.Height;
  FSB.Width   := Self.Width - 30;

  FDETAIL_UPDATING := False;
  lbVuelto.Caption := '';
  FMASTER_UPDATING := False;
  Self.Caption := '';
  pnlItems.Height := Round(pnlDetalles.Height * 0.6);
  DOCUMENTO_COMANDA.Visible := gVariableGlobal.NUMEROS_COMANDAS > 0;
  If DOCUMENTO_COMANDA.Visible Then
  Begin
    For lI := 1 To gVariableGlobal.NUMEROS_COMANDAS Do
      DOCUMENTO_COMANDA.Items.Add(Justificar(IntToStr(lI), '0', 3));
  End;
//  FMASTER.QR.OnNewRecord  := BeforeEdit;
//  FMASTER.QR.BeforePost   := BeforePost;
  FMASTER.QR.BeforeDelete := BeforeDelete;
  FMASTER.QR.AfterDelete  := AfterDelete;
//  FMASTER.QR.AfterPost    := AfterPost;

  FDETAIL.QR.OnNewRecord  := BeforeEdit;
  FDETAIL.QR.BeforeEdit   := BeforeEdit;
end;

procedure TFrDocumento_Captura.FormDestroy(Sender: TObject);
begin
  If Assigned(FSB) Then
    FreeAndNil(FSB);
end;

Procedure TFrDocumento_Captura.Establecer_Info_Tercero;
Var
  lCodigo_Tercero : String;
Begin
  Try
    If Form_Captura_Tercero_Show(lCodigo_Tercero) Then
    Begin
      If Not (FMASTER.DS.State In [dsInsert, dsEdit]) Then
        FMASTER.QR.Edit;
      FMASTER.QR.FieldByName('CODIGO_TERCERO'   ).AsString := lCodigo_Tercero;
      FMASTER.QR.FieldByName('CODIGO_SINONIMO'  ).AsString := lCodigo_Tercero;
      FMASTER.QR.FieldByName('CODIGO_TERCERO_LP').AsString := '01';
      FMASTER.QR.Post;
    End;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.Establecer_Info_Tercero']);
  End;
End;

procedure TFrDocumento_Captura.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Case Key Of
    VK_F2     : BtnAddDet.OnClick(Sender);
    VK_F3     : If Application.Title <> gVariableGlobal.APLICACION_POS Then BtnEditEnc.OnClick(Sender);
    VK_F4     : If Application.Title <> gVariableGlobal.APLICACION_POS Then BtnEditDet.OnClick(Sender);
    VK_F5     : BtnDelDet.OnClick(Sender);
    VK_F6     : If Application.Title <> gVariableGlobal.APLICACION_POS Then BtnPreviewDoc.OnClick(Sender);
    VK_F7     : BtnEditarDetalle.OnClick(Sender);
    VK_F8     : BtnInsertarTercero.OnClick(Sender);
    VK_F9     : If Application.Title <> gVariableGlobal.APLICACION_POS Then BtnAcarreo.OnClick(Sender);
    VK_F10    : Begin
                  If Application.Title <> gVariableGlobal.APLICACION_POS Then
                    If (FTIPO_DOCUMENTO <> Const_Documento_Nota_Credito) And (FTIPO_DOCUMENTO <> Const_Documento_Nota_Debito) Then
                      If Not ((FTipo_Documento = Const_Documento_Pedido) Or (FTipo_Documento = Const_Documento_Compra)) Then
                         BtnAjustarReceta.OnClick(Sender);
                End;
    VK_F11    : If Application.Title <> gVariableGlobal.APLICACION_POS Then BtnCancelDoc.OnClick(Sender);
    VK_F12    : If Application.Title <> gVariableGlobal.APLICACION_POS Then BtnCerrarDoc.OnClick(Sender);
    VK_ESCAPE : Begin
                  If (FTIPO_DOCUMENTO <> Const_Documento_Nota_Credito) And (FTIPO_DOCUMENTO <> Const_Documento_Nota_Debito) Then
                    BtnSalir.OnClick(Sender);
                End;
    VK_RETURN : Begin
                  If FDETAIL_UPDATING Then
                    Exit;
                  FDETAIL_UPDATING := True;
                  Try
                    If FDETAIL.DS.State In [dsInsert, dsEdit] Then
                      FDETAIL.QR.Post;
                  Except
                    On E: Exception Do
                      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.FormKeyDown']);
                  End;
                  FDETAIL_UPDATING := False;
                End;
  End;
end;

procedure TFrDocumento_Captura.QrDetalleAfterDelete(DataSet: TDataSet);
begin
  Try
    FMASTER_UPDATING := False;
    AfterDelete(DataSet);
    Abrir_Archivo_Maestro;
    Abrir_Archivo_Detalle;
    QrDetalleAfterPost(DataSet);
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.QrDetalleBeforePost']);
  End;
  FMASTER_UPDATING := False;
end;

procedure TFrDocumento_Captura.QrDetalleAfterPost(DataSet: TDataSet);
begin
  If FMASTER_UPDATING Then
    Exit;
  FMASTER_UPDATING := True;
  Try
    UtComanda_Execute(FDATAKEY, True);
    Calcular_Impuesto_Encabezado(FMASTER.QR, FMASTER.DS);
    If FDETAIL.DS.State In [dsInsert, dsEdit] Then
      FDETAIL.QR.Post;
    UtCalculo_Discriminados_Execute(Id_Documento_Enc_Aux, Id_Documento_Det_Aux, FDATAKEY);
    Abrir_Archivo_Maestro;
//  UtEnviar_TCP_Kardex(FTIPO_DOCUMENTO, FDETAIL.QR.FieldByName('CODIGO_PRODUCTO').AsString);
    AfterPost(DataSet);
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.FDETAIL.QRBeforePost']);
  End;
  FMASTER_UPDATING := False;
end;

procedure TFrDocumento_Captura.QrDetalleBeforeDelete(DataSet: TDataSet);
begin
  Try
    FCODIGO_PRODUCTO := FDETAIL.QR.FieldByName('CODIGO_PRODUCTO').AsString;
    BeforeDelete(DataSet);
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.QrDetalleBeforePost']);
  End;
end;

procedure TFrDocumento_Captura.QrDetalleBeforePost(DataSet: TDataSet);
begin
  Try
    If FDETAIL.DS.State In [dsInsert, dsEdit] Then
    Begin
      If Vacio(FDETAIL.QR.FieldByName('CODIGO_VENDEDOR').AsString) Then
        If Not  Vacio(FMASTER.QR.FieldByName('CODIGO_VENDEDOR').AsString) Then
            FDETAIL.QR.FieldByName('CODIGO_VENDEDOR').AsString := FMASTER.QR.FieldByName('CODIGO_VENDEDOR').AsString;
      Calcular_Impuestos_Detalle(FMASTER.QR, FDETAIL.QR);
    End;
    BeforePost(DataSet);
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.QrDetalleBeforePost']);
  End;
end;

procedure TFrDocumento_Captura.QrDetalleCalcFields(DataSet: TDataSet);
begin
  If FDETAIL.QR.Active And (Not FDETAIL_UPDATING) Then
    FDETAIL.QR.FieldByName('DETALLEOBSERVACION').AsString := FDETAIL.QR.FieldByName('OBSERVACION').AsString;
end;

Procedure TFrDocumento_Captura.Precalcular;
Begin
  Try
    FDETAIL.QR.First;
    While Not FDETAIL.QR.Eof Do
    Begin
      FDETAIL.QR.Edit;
      FDETAIL.QR.Post;
      FDETAIL.QR.Next;
    End;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.Precalcular']);
  End;
End;

Function Show_Form_Documento_Captura(pTipo_Documento : String; pCodigo_Espacio : String = '') : Boolean;
Var
  lFrCaptura : TFrDocumento_Captura;
  lTexto : String;
  lDatakey : String;
  lTipo_Documento : String;
  lNumero_Documento : String;
Begin
  Result := UtFiltro_Transaccional_Base(pTipo_Documento);
//  If (Not Result) And ((pTipo_Documento = Const_Documento_Nota_Credito) Or (pTipo_Documento = Const_Documento_Nota_Debito)) Then
//    Result := Form_Busqueda_Documento_Show(pTipo_Documento, lDatakey, lTipo_Documento, lNumero_Documento);
  If Result Then
  Begin
    lFrCaptura := TFrDocumento_Captura.Create(Nil);
    lFrCaptura.Name := 'FR' + pTipo_Documento + FormatDateTime('YYYYMMDDHHNNSSZZZ', Now);
    lFrCaptura.FTIPO_DOCUMENTO          := pTipo_Documento;
    lFrCaptura.FCODIGO_ESPACIO          := pCodigo_Espacio;
    lFrCaptura.Cargar_Ambiente;
    lFrCaptura.Caption                  := Retornar_Tipo_Documento(pTipo_Documento);
    lTexto := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Espacio).Name, ['CODIGO_ESPACIO'], [pCodigo_Espacio], ['NOMBRE'], 'Show_Form_Documento_Captura');
    lFrCaptura.BtnDomicilio.Visible     := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Espacio).Name, ['CODIGO_ESPACIO'], [pCodigo_Espacio], ['TIPO_ESPACIO'], 'Show_Form_Documento_Captura') = 'D';
    lFrCaptura.FTEXTO_DOCUMENTO         := lFrCaptura.Caption + IfThen(Not Vacio(pCodigo_Espacio), ', ESPACIO = ' + lTexto);
    Result := lFrCaptura.Abrir_Archivo_Maestro And
              lFrCaptura.Abrir_Archivo_Detalle;
    If Result Then
    Begin
      If (pTipo_Documento = Const_Documento_Nota_Credito) Or (pTipo_Documento = Const_Documento_Nota_Debito) Then
      Begin
        lFrCaptura.Precalcular;
      End;
      lFrCaptura.ShowModal;
    End;
    lFrCaptura.Cerrar_Archivo_Detalle;
    lFrCaptura.Cerrar_Archivo_Maestro;
      FreeAndNil(lFrCaptura);
  End;
End;

end.
