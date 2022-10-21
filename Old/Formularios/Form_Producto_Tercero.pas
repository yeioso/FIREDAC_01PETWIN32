unit Form_Producto_Tercero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrProducto_Tercero = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    NOMBRE: TOvcDbPictureField;
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
    Label7: TLabel;
    CODIGO_TERCERO: TOvcDbPictureField;
    BtnTercero: TSpeedButton;
    lbNombreTercero: TLabel;
    DOCUMENTO_VENTA: TDBCheckBox;
    DOCUMENTO_COMPRA: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure CODIGO_TERCEROExit(Sender: TObject);
    procedure CODIGO_TERCEROUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure BtnTerceroClick(Sender: TObject);
    procedure CODIGO_TERCEROKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FCODIGO_PRODUCTO : String;
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    procedure StateChange(Sender: TObject); Override;
    procedure DataChange(Sender: TObject; Field: TField); Override;
  Protected
  public
    { Public declarations }
  end;

  Procedure Show_Form_Producto_Tercero(pCodigo_Producto : String);

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

procedure TFrProducto_Tercero.DataChange(Sender: TObject; Field: TField);
begin
  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_TERCERO.Field.FullName)) Then
  Begin
    lbNombreTercero.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [CODIGO_TERCERO.Field.AsString], ['NOMBRE'], 'TFrReceta.DsMaestroDataChange');
    If Modo_Edicion Then
    Begin
      If Vacio(NOMBRE.Field.AsString) Then
        NOMBRE.Field.AsString := lbNombreTercero.Caption;
    End;
  End;
end;

procedure TFrProducto_Tercero.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_TERCERO.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled       := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled      := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled      := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CODIGO_TERCERO.Enabled Then
                   CODIGO_TERCERO.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrProducto_Tercero.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Producto_Tercero).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Producto_Tercero, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, False, -1);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrProducto_Tercero.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrProducto_Tercero.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrProducto_Tercero.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
    tbMaestro.FieldByName('CODIGO_PRODUCTO').AsString := FCODIGO_PRODUCTO;
//    tbMaestro.FieldByName('PRODUCTO_PADRE' ).AsString := Retornar_Siguiente(Retornar_Info_Tabla(Id_Receta).Name, 'PRODUCTO_PADRE', tbMaestro.FieldByName('PRODUCTO_PADRE').Size, 'TFrReceta.TbMaestroAfterInsert');
  End;
end;

Function TFrProducto_Tercero.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto_Tercero).Name);
  TbMaestro.SQL.Add(' WHERE ' + CNX.Trim_Sentence('CODIGO_PRODUCTO') + ' = ' + #39 + Trim(FCODIGO_PRODUCTO) + #39);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_PRODUCTO', 'CODIGO_TERCERO']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_TERCERO', 'NOMBRE', 'DOCUMENTO_VENTA', 'DOCUMENTO_COMPRA'], ['Código', 'Nombre', 'Ventas', 'Compras']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrProducto_Tercero.BtnBuscarClick(Sender: TObject);
Var
  lFiltro : String;
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Not Modo_Edicion Then
  Begin
    lFiltro := CNX.Trim_Sentence('CODIGO_PRODUCTO') + ' = ' + QuotedStr(Trim(FCODIGO_PRODUCTO));
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO', 'CODIGO_PRODUCTO'], [CODIGO_TERCERO.Field.FullName], Retornar_Info_Tabla(Id_Producto_Tercero).Name, lFiltro, Retornar_Info_Tabla(Id_Producto_Tercero).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_TERCERO.Field.FullName, lResult01, [loCaseInsensitive]);
  End;
end;

procedure TFrProducto_Tercero.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Producto_Tercero).Caption);
end;

procedure TFrProducto_Tercero.BtnTerceroClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO'], ['CODIGO_TERCERO'], Retornar_Info_Tabla(Id_Tercero).Name, '', Retornar_Info_Tabla(Id_Tercero).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_TERCERO.Field.AsString := lResult01;
end;

Procedure TFrProducto_Tercero.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrProducto_Tercero.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrProducto_Tercero.CODIGO_TERCEROExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrProducto_Tercero.CODIGO_TERCEROKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnTercero.Click;
end;

procedure TFrProducto_Tercero.CODIGO_TERCEROUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS
      Else
        If CNX.Record_Exist(Retornar_Info_Tabla(Id_Producto_Tercero).Name, ['CODIGO_PRODUCTO', 'CODIGO_TERCERO'], [FCODIGO_PRODUCTO, TOvcDbPictureField(Sender).EditString]) Then
          ErrorCode := IE_CODE_EXISTS;
end;

Procedure Show_Form_Producto_Tercero(pCodigo_Producto : String);
Var
  FrProducto_Tercero: TFrProducto_Tercero;
Begin
  FrProducto_Tercero := TFrProducto_Tercero.Create(Application);
  FrProducto_Tercero.FCODIGO_PRODUCTO := pCodigo_Producto;
  If FrProducto_Tercero.Abrir_Archivos Then
    FrProducto_Tercero.ShowModal;
  FrProducto_Tercero.Free;
End;

end.

