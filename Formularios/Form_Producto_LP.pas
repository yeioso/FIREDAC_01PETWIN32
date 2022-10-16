unit Form_Producto_LP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrProducto_LP = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    CODIGO_PRODUCTO_LP: TOvcDbPictureField;
    NOMBRE: TOvcDbPictureField;
    Label1: TLabel;
    Label2: TLabel;
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
    Label10: TLabel;
    RANGO_INICIAL: TOvcDbPictureField;
    Label3: TLabel;
    RANGO_FINAL: TOvcDbPictureField;
    gbUtilidad: TGroupBox;
    Label4: TLabel;
    VALOR_ORIGINAL: TOvcDbPictureField;
    Label5: TLabel;
    PORCENTAJE_UTILIDAD: TOvcDbPictureField;
    Label6: TLabel;
    VALOR_VENTA: TOvcDbPictureField;
    TIPO_LP: TDBRadioGroup;
    BtnBaseImpuestoCompra: TSpeedButton;
    lbNombre_Impuesto_Compra: TLabel;
    BtnBaseImpuestoVenta: TSpeedButton;
    lbNombre_Impuesto_Venta: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    IMPUESTO_COMPRA: TOvcDbPictureField;
    IMPUESTO_VENTA: TOvcDbPictureField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CODIGO_PRODUCTO_LPUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_PRODUCTO_LPExit(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure BtnBodegaClick(Sender: TObject);
    procedure BtnBaseImpuestoCompraClick(Sender: TObject);
    procedure BtnBaseImpuestoVentaClick(Sender: TObject);
    procedure IMPUESTO_COMPRAKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure IMPUESTO_COMPRAUserValidation(Sender: TObject;  var ErrorCode: Word);
    procedure IMPUESTO_COMPRAExit(Sender: TObject);
    procedure IMPUESTO_VENTAExit(Sender: TObject);
    procedure IMPUESTO_VENTAUserValidation(Sender: TObject;
      var ErrorCode: Word);
  private
    { Private declarations }
    FNOMBRE : String;
    FVALOR_ORIGINAL : Double;
    FCODIGO_PRODUCTO : String;
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    procedure StateChange(Sender: TObject); Override;
    procedure DataChange(Sender: TObject; Field: TField); Override;
  Protected
  public
    { Public declarations }
  end;

Var
  FrProducto_LP: TFrProducto_LP;
  Procedure Show_Form_Producto_LP(pCodigo_Producto, pNombre : String; pValor_Original : Double);

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

procedure TFrProducto_LP.DataChange(Sender: TObject; Field: TField);
begin
  Inherited;
  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = IMPUESTO_COMPRA.Field.FullName)) Then
    lbNombre_Impuesto_Compra.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Impuesto).Name, ['CODIGO_IMPUESTO'], [IMPUESTO_COMPRA.Field.AsString], ['NOMBRE'], 'TFrProducto_LP.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = IMPUESTO_VENTA.Field.FullName)) Then
    lbNombre_Impuesto_Venta.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Impuesto).Name, ['CODIGO_IMPUESTO'], [IMPUESTO_VENTA.Field.AsString], ['NOMBRE'], 'TFrProducto_LP.DsMaestroDataChange');

  If Assigned(Field) And Modo_Edicion Then
   If (Field.FullName = VALOR_ORIGINAL.Field.FullName     ) Or
      (Field.FullName = PORCENTAJE_UTILIDAD.Field.FullName) Then
        VALOR_VENTA.Field.AsFloat := VALOR_ORIGINAL.Field.AsFloat * (1 + (PORCENTAJE_UTILIDAD.Field.AsFloat/100));
end;

procedure TFrProducto_LP.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  VALOR_VENTA.Enabled        := False;
  CODIGO_PRODUCTO_LP.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled           := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled          := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled          := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CODIGO_PRODUCTO_LP.Enabled Then
                   CODIGO_PRODUCTO_LP.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrProducto_LP.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Producto_LP).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Producto_LP, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrProducto_LP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrProducto_LP.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;


procedure TFrProducto_LP.IMPUESTO_COMPRAExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrProducto_LP.IMPUESTO_COMPRAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnBaseImpuestoCompra.Click;
end;

procedure TFrProducto_LP.IMPUESTO_COMPRAUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Impuesto).Name, ['CODIGO_IMPUESTO'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrProducto_LP.IMPUESTO_VENTAExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrProducto_LP.IMPUESTO_VENTAUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Impuesto).Name, ['CODIGO_IMPUESTO'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrProducto_LP.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
    tbMaestro.FieldByName('NOMBRE'            ).AsString := 'L.P. ' + Trim(FNOMBRE);
    tbMaestro.FieldByName('VALOR_ORIGINAL'    ).AsFloat  := FVALOR_ORIGINAL;
    tbMaestro.FieldByName('CODIGO_PRODUCTO'   ).AsString := FCODIGO_PRODUCTO;
    tbMaestro.FieldByName('CODIGO_PRODUCTO_LP').AsString := CNX.Next(Retornar_Info_Tabla(Id_Producto_LP).Name, '0', ['CODIGO_PRODUCTO_LP'], [], [], tbMaestro.FieldByName('CODIGO_PRODUCTO_LP').Size);
  End;
end;

Function TFrProducto_LP.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto_LP).Name);
  TbMaestro.SQL.Add(' WHERE ' + CNX.Trim_Sentence('CODIGO_PRODUCTO') + ' = ' + #39 + Trim(FCODIGO_PRODUCTO) + #39);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_PRODUCTO_LP']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_PRODUCTO_LP', 'NOMBRE', 'RANGO_INICIAL', 'RANGO_FINAL', 'VALOR_ORIGINAL', 'PORCENTAJE_UTILIDAD', 'VALOR_VENTA'], ['Código', 'Nombre', 'Rango Ini', 'Rango Fin', 'Valor', 'Utilidad', 'Venta']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrProducto_LP.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_PRODUCTO_LP'], [CODIGO_PRODUCTO_LP.Field.FullName], Retornar_Info_Tabla(Id_Producto_LP).Name, '', Retornar_Info_Tabla(Id_Producto_LP).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_PRODUCTO_LP.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrProducto_LP.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Producto_LP).Caption);
end;

procedure TFrProducto_LP.BtnBaseImpuestoCompraClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_IMPUESTO'], ['CODIGO_IMPUESTO'], Retornar_Info_Tabla(Id_Impuesto).Name, '', Retornar_Info_Tabla(Id_Impuesto).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      IMPUESTO_COMPRA.Field.AsString := lResult01;
end;


procedure TFrProducto_LP.BtnBaseImpuestoVentaClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_IMPUESTO'], ['CODIGO_IMPUESTO'], Retornar_Info_Tabla(Id_Impuesto).Name, '', Retornar_Info_Tabla(Id_Impuesto).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      IMPUESTO_VENTA.Field.AsString := lResult01;
end;

procedure TFrProducto_LP.BtnBodegaClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_PRODUCTO_LP'], [CODIGO_PRODUCTO_LP.Field.FullName], Retornar_Info_Tabla(Id_Producto_LP).Name, '', Retornar_Info_Tabla(Id_Producto_LP).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_PRODUCTO_LP.Field.AsString := lResult01;
end;

Procedure TFrProducto_LP.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrProducto_LP.CODIGO_PRODUCTO_LPExit(Sender: TObject);
begin
  If Modo_Edicion Then
    if Not Vacio(CODIGO_PRODUCTO_LP.EditString)  then
      CODIGO_PRODUCTO_LP.Field.AsString := Justificar(CODIGO_PRODUCTO_LP.EditString, '0', CODIGO_PRODUCTO_LP.MaxLength);
end;

procedure TFrProducto_LP.CODIGO_PRODUCTO_LPUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(CODIGO_PRODUCTO_LP.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Producto_LP).Name, [CODIGO_PRODUCTO_LP.Field.FullName], [CODIGO_PRODUCTO_LP.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrProducto_LP.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

Procedure Show_Form_Producto_LP(pCodigo_Producto, pNombre : String; pValor_Original : Double);
Begin
  FrProducto_LP := TFrProducto_LP.Create(Application);
  FrProducto_LP.FNOMBRE := pNombre;
  FrProducto_LP.FVALOR_ORIGINAL := pValor_Original;
  FrProducto_LP.FCODIGO_PRODUCTO := pCodigo_Producto;
  If FrProducto_LP.Abrir_Archivos Then
    FrProducto_LP.ShowModal;
  FrProducto_LP.Free;
End;

end.
