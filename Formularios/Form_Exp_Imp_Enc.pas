unit Form_Exp_Imp_Enc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrExp_Imp_Enc = class(TObjForm)
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
    OpenDialog1: TOpenDialog;
    Pages: TPageControl;
    Pag00: TTabSheet;
    Pag01: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    CODIGO_EXP_IMP: TOvcDbPictureField;
    NOMBRE: TOvcDbPictureField;
    ORIGEN_DATOS: TDBRadioGroup;
    Pag02: TTabSheet;
    Pag04: TTabSheet;
    ORIGEN: TDBMemo;
    DESTINO: TDBMemo;
    Label3: TLabel;
    DELIMITADOR: TOvcDbPictureField;
    BtnDetalle: TSpeedButton;
    ESTRUCTURA: TDBRadioGroup;
    BtnExportar: TSpeedButton;
    BtnImportar: TSpeedButton;
    Pag03: TTabSheet;
    GBORIGEN: TGroupBox;
    GBDESTINO: TGroupBox;
    DATASOURCE_ORIGEN: TDBMemo;
    DATASOURCE_DESTINO: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CODIGO_EXP_IMPUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_EXP_IMPExit(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure ORIGENDblClick(Sender: TObject);
    procedure BtnDetalleClick(Sender: TObject);
    procedure BtnExportarClick(Sender: TObject);
    procedure DELIMITADORUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure DATASOURCE_ORIGENDblClick(Sender: TObject);
    procedure DATASOURCE_DESTINODblClick(Sender: TObject);
    procedure BtnImportarClick(Sender: TObject);
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
  FrExp_Imp_Enc: TFrExp_Imp_Enc;
  Procedure Show_Form_Exp_Imp_Enc;

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
  Form_Exp_Imp_Det,
  UtExportar_Datos,
  UtImportar_Datos,
  UtVariablesGlobales;

procedure TFrExp_Imp_Enc.DataChange(Sender: TObject; Field: TField);
Begin
  Pag03.TabVisible := ORIGEN_DATOS.ItemIndex = (ORIGEN_DATOS.Items.Count-1);
End;

procedure TFrExp_Imp_Enc.DATASOURCE_DESTINODblClick(Sender: TObject);
begin
//  If Modo_Edicion Then
//    DATASOURCE_DESTINO.Field.AsString := PromptDataSource(Self.Handle, DATASOURCE_DESTINO.Field.AsString);
end;

procedure TFrExp_Imp_Enc.DATASOURCE_ORIGENDblClick(Sender: TObject);
begin
//  If Modo_Edicion Then
//    DATASOURCE_ORIGEN.Field.AsString := PromptDataSource(Self.Handle, DATASOURCE_ORIGEN.Field.AsString);
end;

procedure TFrExp_Imp_Enc.DELIMITADORUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If ESTRUCTURA.ItemIndex = 0 Then
      If Vacio(NOMBRE.EditString) Then
        ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrExp_Imp_Enc.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_EXP_IMP.Enabled := DsMaestro.State In [dsInsert];
  BtnDetalle.Enabled     := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnExcel.Enabled       := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled      := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnExportar.Enabled    := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnImportar.Enabled    := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled      := (Not Modo_Edicion);
  NOMBRE.Enabled         := Modo_Edicion;
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CODIGO_EXP_IMP.Enabled Then
                   CODIGO_EXP_IMP.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrExp_Imp_Enc.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Exp_Imp_Enc).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Exp_Imp_Enc, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.Tag := gVariableGlobal.VALOR_TAG;
end;

procedure TFrExp_Imp_Enc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrExp_Imp_Enc.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrExp_Imp_Enc.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
  End;
end;

Function TFrExp_Imp_Enc.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Exp_Imp_Enc).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_EXP_IMP']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_EXP_IMP', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrExp_Imp_Enc.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_EXP_IMP'], [CODIGO_EXP_IMP.Field.FullName], Retornar_Info_Tabla(Id_Exp_Imp_Enc).Name, '', Retornar_Info_Tabla(Id_Exp_Imp_Enc).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_EXP_IMP.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrExp_Imp_Enc.BtnDetalleClick(Sender: TObject);
begin
  Show_Form_Exp_Imp_Det(CODIGO_EXP_IMP.EditString);
end;

procedure TFrExp_Imp_Enc.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Exp_Imp_Enc).Caption);
end;

procedure TFrExp_Imp_Enc.BtnExportarClick(Sender: TObject);
begin
  If Not SiNo('Está seguro(a) de exportar') Then
    Exit;
  UtExportar_Datos_Execute(CODIGO_EXP_IMP.EditString);
  Mensajes('Proceso Terminado!!!');
end;

procedure TFrExp_Imp_Enc.BtnImportarClick(Sender: TObject);
begin
  If Not SiNo('Está seguro(a) de importar') Then
    Exit;
  UtImportar_Datos_Execute(CODIGO_EXP_IMP.EditString);
  Mensajes('Proceso Terminado!!!');
end;

Procedure TFrExp_Imp_Enc.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrExp_Imp_Enc.CODIGO_EXP_IMPExit(Sender: TObject);
begin
  if Modo_Edicion then
    if Not Vacio(CODIGO_EXP_IMP.EditString)  then
      CODIGO_EXP_IMP.Field.AsString := Justificar(CODIGO_EXP_IMP.EditString, '0', CODIGO_EXP_IMP.MaxLength);
end;

procedure TFrExp_Imp_Enc.CODIGO_EXP_IMPUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(CODIGO_EXP_IMP.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Exp_Imp_Enc).Name, [CODIGO_EXP_IMP.Field.FullName], [CODIGO_EXP_IMP.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrExp_Imp_Enc.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrExp_Imp_Enc.ORIGENDblClick(Sender: TObject);
begin
  If Modo_Edicion Then
  Begin
    Case ORIGEN_DATOS.ItemIndex Of
      0 : Begin
            If OpenDialog1.Execute Then
              ORIGEN.Field.AsString := OpenDialog1.FileName;
          End;
    End;
  End;
end;

Procedure Show_Form_Exp_Imp_Enc;
Begin
  FrExp_Imp_Enc := TFrExp_Imp_Enc.Create(Application);
  If FrExp_Imp_Enc.Abrir_Archivos Then
    FrExp_Imp_Enc.Show
  Else
  Begin
    FrExp_Imp_Enc.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
