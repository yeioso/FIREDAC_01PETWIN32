unit Form_Centro_Costos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx, ComCtrls, ovcdbfcb,
  ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrCentro_Costos = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    CODIGO_CENTRO_COSTOS: TOvcDbPictureField;
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DsMaestroStateChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CODIGO_CENTRO_COSTOSUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure CODIGO_CENTRO_COSTOSExit(Sender: TObject);
  private
    { Private declarations }
    function Modo_Edicion: Boolean;
    function Abrir_Archivos: Boolean;
    procedure Cerrar_Archivos;
  protected
  public
    { Public declarations }
  end;

var
  FrCentro_Costos: TFrCentro_Costos;

procedure Show_Form_Centro_Costos;

implementation
{$R *.dfm}

uses
  UtExcel, Printers, UtConexion, UtFunciones, UtConstantes, UtInfoTablas,
  UtManejoError, Form_Busqueda, Form_Seleccion, UtVariablesGlobales;

function TFrCentro_Costos.Modo_Edicion: Boolean;
begin
  Result := DsMaestro.State in [dsInsert, dsEdit];
end;

procedure TFrCentro_Costos.DsMaestroStateChange(Sender: TObject);
begin
  if not tbMaestro.Active then
    Exit;
  CODIGO_CENTRO_COSTOS.Enabled := DsMaestro.State in [dsInsert];
  BtnExcel.Enabled := (not Modo_Edicion) and (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled := (not Modo_Edicion) and (TbMaestro.RecordCount >= 1);
  Registros.Enabled := (not Modo_Edicion);
  NOMBRE.Enabled := Modo_Edicion;
  case DsMaestro.State of
    dsInsert:
      begin
        if CODIGO_CENTRO_COSTOS.Enabled then
          CODIGO_CENTRO_COSTOS.SetFocus;
        Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
      end;
    dsEdit:
      begin
        if NOMBRE.Enabled then
          NOMBRE.SetFocus;
        Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
      end;
  end;
end;

procedure TFrCentro_Costos.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Centro_Costos).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Centro_Costos, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, False, -1);
  Self.Tag := gVariableGlobal.VALOR_TAG;
end;

procedure TFrCentro_Costos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrCentro_Costos.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrCentro_Costos.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  if Modo_Edicion then
  begin
  end;
end;

function TFrCentro_Costos.Abrir_Archivos: Boolean;
begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Centro_Costos).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_CENTRO_COSTOS']);
  if TbMaestro.Active then
  begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_CENTRO_COSTOS', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  end;
  Result := TbMaestro.Active;
end;

procedure TFrCentro_Costos.BtnBuscarClick(Sender: TObject);
var
  lResult01: string;
  lResult02: string;
  lResult03: string;
begin
  if not Modo_Edicion then
    if Show_FrBusqueda(['NOMBRE', 'CODIGO_CENTRO_COSTOS'], [CODIGO_CENTRO_COSTOS.Field.FullName], Retornar_Info_Tabla(Id_Centro_Costos).Name, '', Retornar_Info_Tabla(Id_Centro_Costos).Caption, lResult01, lResult02, lResult03, False, CNX) then
      TbMaestro.Locate(CODIGO_CENTRO_COSTOS.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrCentro_Costos.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TQUERY(TbMaestro), Retornar_Info_Tabla(Id_Centro_Costos).Caption);
end;

procedure TFrCentro_Costos.Cerrar_Archivos;
begin
  if TbMaestro.Active then
    TbMaestro.Active := False;
end;

procedure TFrCentro_Costos.CODIGO_CENTRO_COSTOSExit(Sender: TObject);
begin
  if Modo_Edicion then
    if not Vacio(TOvcDbPictureField(Sender).EditString) then
      TOvcDbPictureField(Sender).Field.AsString := Trim(TOvcDbPictureField(Sender).EditString);
end;

procedure TFrCentro_Costos.CODIGO_CENTRO_COSTOSUserValidation(Sender: TObject; var ErrorCode: Word);
begin
  if Modo_Edicion then
    if Vacio(CODIGO_CENTRO_COSTOS.EditString) then
      ErrorCode := IE_FIELD_EMPTY
    else
    if CNX.Record_Exist(Retornar_Info_Tabla(Id_Centro_Costos).Name, [CODIGO_CENTRO_COSTOS.Field.FullName], [CODIGO_CENTRO_COSTOS.EditString]) then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrCentro_Costos.NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
begin
  if Modo_Edicion then
    if Vacio(NOMBRE.EditString) then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure Show_Form_Centro_Costos;
begin
  FrCentro_Costos := TFrCentro_Costos.Create(Application);
  if FrCentro_Costos.Abrir_Archivos then
    FrCentro_Costos.Show
  else
  begin
    FrCentro_Costos.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  end;
end;

end.


