unit Form_Base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrBase = class(TObjForm)
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
    CODIGO_BASE: TOvcDbPictureField;
    NOMBRE: TOvcDbPictureField;
    gbTOPE: TGroupBox;
    Label12: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label36: TLabel;
    Label3: TLabel;
    BASE_IVA: TOvcDbPictureField;
    BASE_IMPCONSUMO: TOvcDbPictureField;
    BASE_SERVICIO: TOvcDbPictureField;
    BASE_RETEIVA: TOvcDbPictureField;
    BASE_RETEFUENTE: TOvcDbPictureField;
    BASE_ICA: TOvcDbPictureField;
    BASE_CREE: TOvcDbPictureField;
    BASE_DESCUENTO: TOvcDbPictureField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CODIGO_BASEUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_BASEExit(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure CUENTA_SERVICIO_CRUserValidation(Sender: TObject;
      var ErrorCode: Word);
  private
    { Private declarations }
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
      procedure StateChange(Sender: TObject); Override;
  Protected
  public
    { Public declarations }
  end;

Var
  FrBase: TFrBase;
  Procedure Show_Form_Base;

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

procedure TFrBase.StateChange(Sender: TObject);
begin
  Inherited;
  If Not tbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_Base.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled  := (Not Modo_Edicion) And  (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled := (Not Modo_Edicion) And  (TbMaestro.RecordCount >= 1);
  Registros.Enabled := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CODIGO_Base.Enabled Then
                   CODIGO_Base.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrBase.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Base).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Base, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrBase.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrBase.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
  End;
end;

Function TFrBase.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Base).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_Base']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_Base', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrBase.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_Base'], [CODIGO_Base.Field.FullName], Retornar_Info_Tabla(Id_Base).Name, '', Retornar_Info_Tabla(Id_Base).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_Base.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrBase.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Base).Caption);
end;

Procedure TFrBase.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrBase.CODIGO_BASEExit(Sender: TObject);
begin
  if Modo_Edicion then
    if Not Vacio(CODIGO_Base.EditString)  then
      CODIGO_Base.Field.AsString := Justificar(CODIGO_Base.EditString, '0', CODIGO_Base.MaxLength);
end;

procedure TFrBase.CODIGO_BASEUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(CODIGO_Base.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Base).Name, [CODIGO_Base.Field.FullName], [CODIGO_Base.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrBase.CUENTA_SERVICIO_CRUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
;
end;

procedure TFrBase.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

Procedure Show_Form_Base;
Begin
  FrBase := TFrBase.Create(Application);
  If FrBase.Abrir_Archivos Then
    FrBase.Show
  Else
  Begin
    FrBase.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
