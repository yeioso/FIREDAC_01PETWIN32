unit Form_Caja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,  ComCtrls, ovcdbfcb,
  ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrCaja = class(TObjForm)
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
    Paginas: TPageControl;
    Pag00: TTabSheet;
    Pag01: TTabSheet;
    Label2: TLabel;
    NOMBRE: TOvcDbPictureField;
    Label3: TLabel;
    FECHA: TOvcDbPictureField;
    ID_ABIERTA: TDBCheckBox;
    ID_CERRADA: TDBCheckBox;
    CODIGO_USUARIO: TOvcDbPictureField;
    lbNombreUsuario: TLabel;
    DETALLE: TDBMemo;
    Label1: TLabel;
    Label12: TLabel;
    Label39: TLabel;
    Label58: TLabel;
    VALOR_BASE: TOvcDbPictureField;
    VALOR_TRM: TOvcDbPictureField;
    VALOR_BASE_TRM: TOvcDbPictureField;
    Pag02: TTabSheet;
    OBSERVACIONES: TDBMemo;
    BtnFormato: TSpeedButton;
    CheckBox_TI_Totales: TCheckBox;
    CheckBox_TI_Compras: TCheckBox;
    CheckBox_TI_Factura: TCheckBox;
    Pag03: TTabSheet;
    Label4: TLabel;
    ESTACION_APERTURA: TOvcDbPictureField;
    Label5: TLabel;
    FECHA_APERTURA: TOvcDbPictureField;
    Label6: TLabel;
    HORA_APERTURA: TOvcDbPictureField;
    Label7: TLabel;
    ESTACION_CIERRE: TOvcDbPictureField;
    Label8: TLabel;
    FECHA_CIERRE: TOvcDbPictureField;
    Label9: TLabel;
    HORA_CIERRE: TOvcDbPictureField;
    RGORDEN: TRadioGroup;
    CheckBox_TI_Usuario: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure BtnFormatoClick(Sender: TObject);
  private
    { Private declarations }
    FALL : Boolean;
    Function Abrir_Archivos(Const pAll : Boolean) : Boolean;
    Procedure Cerrar_Archivos;
    procedure StateChange(Sender: TObject); Override;
    procedure DataChange(Sender: TObject; Field: TField); Override;
  Protected
  public
    { Public declarations }
  end;

Var
  FrCaja: TFrCaja;
  Procedure Show_Form_Caja(Const pAll : Boolean);

implementation
{$R *.dfm}

Uses
  UtFecha,
  UtExcel,
  Printers,
  StrUtils,
  UtConexion,
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  Form_Busqueda,
  Form_MenuPpal,
  Form_Seleccion,
  UtResumen_Caja_New,
  UtVariablesGlobales,
  Tablename_Documento_Adm,
  Form_Print_Documento_Adm;

procedure TFrCaja.DataChange(Sender: TObject; Field: TField);
begin
  Inherited;
  ESTACION_APERTURA.Enabled := False;
  FECHA_APERTURA.Enabled    := False;
  HORA_APERTURA.Enabled     := False;
  ESTACION_CIERRE.Enabled   := False;
  FECHA_CIERRE.Enabled      := False;
  HORA_CIERRE.Enabled       := False;
  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_USUARIO.Field.FullName)) Then
    lbNombreUsuario.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [CODIGO_USUARIO.Field.AsString], ['NOMBRE'], 'TFrCaja.DsMaestroDataChange');
end;

procedure TFrCaja.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(False);
  NOMBRE.Enabled     := Modo_Edicion;
  BtnExcel.Enabled   := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled  := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnFormato.Enabled := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled  := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrCaja.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Caja).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Caja, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, False, -1);
  Self.Tag := gVariableGlobal.VALOR_TAG;
end;

procedure TFrCaja.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrCaja.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

Function TFrCaja.Abrir_Archivos(Const pAll : Boolean) : Boolean;
Begin
  TbMaestro.Active := False;
  TbMaestro.SQL.Clear;
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Caja).Name);
  If Not pAll Then
  Begin
    TbMaestro.SQL.Add(' WHERE ' + CNX.Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(gVariableGlobal.Usuario_Actual)));
    TbMaestro.SQL.Add(' AND ');
    TbMaestro.SQL.Add(' ( '  );
    TbMaestro.SQL.Add(' ' + CNX.Trim_Sentence('FECHA_APERTURA') + ' = ' + QuotedStr(Trim(gVariableGlobal.Fecha_Actual.yyyy_mm_dd)) + ' OR ');
    TbMaestro.SQL.Add(' ' + CNX.Trim_Sentence('FECHA_CIERRE'  ) + ' = ' + QuotedStr(Trim(gVariableGlobal.Fecha_Actual.yyyy_mm_dd)) + ' OR ');
    TbMaestro.SQL.Add(' ' + CNX.Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(gVariableGlobal.Fecha_Actual.yyyy_mm_dd)) + ' ');
    TbMaestro.SQL.Add(' ) '  );
  End;
  TbMaestro.SQL.Add(' ORDER BY FECHA, CODIGO_USUARIO  ');
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_USUARIO', 'FECHA']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_USUARIO', 'FECHA', 'ID_ABIERTA', 'ID_CERRADA', 'VALOR_BASE', 'VALOR_TRM'], ['Usuario', 'Fecha', 'Abierta', 'Cerrada', 'Base', 'Valor T.R.M.']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrCaja.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['CODIGO_USUARIO', 'FECHA'], ['FECHA'], Retornar_Info_Tabla(Id_Caja).Name, '', Retornar_Info_Tabla(Id_Caja).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate('FECHA', lResult01, [loCaseInsensitive]);
end;

procedure TFrCaja.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Caja).Caption);
end;

Function Update_Resumen(Const pCodigo_Usuario, pFecha : String; pLista : TStringList) : Boolean;
Begin
  Result := False;
  Try
    gVariableGlobal.CNX.TMP.Active := False;
    gVariableGlobal.CNX.TMP.SQL.Clear;
    gVariableGlobal.CNX.TMP.SQL.Add(' SELECT * ');
    gVariableGlobal.CNX.TMP.SQL.Add(' FROM ' + Retornar_Info_Tabla(Id_Caja).Name + ' ');
    gVariableGlobal.CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario)));
    gVariableGlobal.CNX.TMP.SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence('FECHA') + ' = ' + QuotedStr(Trim(pFecha)));
    gVariableGlobal.CNX.TMP.Active := True;
    If gVariableGlobal.CNX.TMP.Active And (gVariableGlobal.CNX.TMP.RecordCount > 0) Then
    Begin
      gVariableGlobal.CNX.TMP.Edit;
      gVariableGlobal.CNX.TMP.FieldByName('DETALLE').AsString := pLista.Text;
      gVariableGlobal.CNX.TMP.Post;
    End;
    gVariableGlobal.CNX.TMP.Active := False;
    gVariableGlobal.CNX.TMP.SQL.Clear;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'Update_Resumen']);
  End;
End;

Procedure Calcular_Resumen_Caja(Const pCodigo_Usuario, pFecha : String; pTI : TOpciones_Resumen);
Var
  lResumen : TStringList;
Begin
  Try
    lResumen := TStringList.Create;
    lResumen.Add('RESUMEN DE CAJA - ' + pFecha);
    lResumen.Add('USUARIO - ' + gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [pCodigo_Usuario], ['NOMBRE'], 'Calcular_Resumen_Caja'));
    UtResumen_Caja_New_Execute(pCodigo_Usuario, pFecha, pFecha, lResumen, pTI);
    Update_Resumen(pCodigo_Usuario, pFecha, lResumen);
    lResumen.Clear;
    FreeAndNil(lResumen);
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'Calcular_Resumen_Caja']);
  End;
End;

procedure TFrCaja.BtnFormatoClick(Sender: TObject);
Var
  lTI : TOpciones_Resumen;
  lCopias : Integer;
  lFormato : String;
  lId_Salida : String;
  lCodigo_Usuario : String;
begin
  lTI := [];
  If CheckBox_TI_Totales.Checked Then
    lTI := lTI + [TResumen_Caja.RC_Totales];

  If CheckBox_TI_Compras.Checked Then
    lTI := lTI + [TResumen_Caja.RC_Compras];

  If CheckBox_TI_Factura.Checked Then
    lTI := lTI + [TResumen_Caja.RC_Facturas];

  Case RGORDEN.ItemIndex Of
    0 : lTI := lTI + [TResumen_Caja.RC_Orden_Descripcion];
    1 : lTI := lTI + [TResumen_Caja.RC_Orden_Valor      ];
    2 : lTI := lTI + [TResumen_Caja.RC_Orden_Cantidad   ];
  End;
  lCodigo_Usuario := tbMaestro.FieldByName('CODIGO_USUARIO').AsString;
  If (Not CheckBox_TI_Usuario.Checked) Or (Not Vacio(gVariableGlobal.USUARIO_ADMIN)) Then
    lCodigo_Usuario := '';

  Calcular_Resumen_Caja(lCodigo_Usuario, tbMaestro.FieldByName('FECHA').AsString, lTI);
  If Tablename_Documento_Adm_Formato(Const_Documento_Resumen_Caja, lFormato, lId_Salida, lCopias) Then
  Begin
    Try
      DBNavigator1.BtnClick(nbRefresh);
    Except
      On E: Exception Do
        gVariableGlobal.Add_Log(E, ['Origen', 'TFrCaja.BtnFormatoClick']);
    End;
    Execute_Print_Resumen(lFormato, lId_Salida, CODIGO_USUARIO.EditString, FECHA.EditString);
  End;
end;

Procedure TFrCaja.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrCaja.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

Procedure Show_Form_Caja(Const pAll : Boolean);
Begin
  If Not pAll Then
    Calcular_Resumen_Caja(gVariableGlobal.USUARIO_ACTUAL, gVariableGlobal.FECHA_ACTUAL.yyyy_mm_dd, [TResumen_Caja.RC_All, TResumen_Caja.RC_Orden_Descripcion]);
  FrCaja := TFrCaja.Create(Application);
  FrCaja.FALL := pAll;
  FrCaja.No_Permitir_Insertar  := True;
  FrCaja.No_Permitir_Modificar := True;
  FrCaja.Cancelar_Eliminacion  := True;
  If FrCaja.Abrir_Archivos(pAll) Then
    FrCaja.Show
  Else
  Begin
    FrCaja.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
