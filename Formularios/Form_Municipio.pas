unit Form_Municipio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrMunicipio = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    NOMBRE_PAIS: TOvcDbPictureField;
    Label2: TLabel;
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
    Label1: TLabel;
    NOMBRE_MUNICIPIO: TOvcDbPictureField;
    Label3: TLabel;
    CODIGO_PAIS: TOvcDbPictureField;
    Label5: TLabel;
    CODIGO_MUNICIPIO: TOvcDbPictureField;
    Label6: TLabel;
    NOMBRE_ESTADO: TOvcDbPictureField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
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
  FrMunicipio: TFrMunicipio;
  Procedure Show_Form_Municipio;

implementation
{$R *.dfm}

Uses
  UtExcel,
  UtConexion,
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  Form_Busqueda,
  UtManejoError,
  UtVariablesGlobales;


procedure TFrMunicipio.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_MUNICIPIO.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled      := (Not Modo_Edicion) And  (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled     := (Not Modo_Edicion) And  (TbMaestro.RecordCount >= 1);
  Registros.Enabled     := (Not Modo_Edicion);
  BtnFiltrado.Enabled   := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CODIGO_MUNICIPIO.Enabled Then
                   CODIGO_MUNICIPIO.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE_PAIS.Enabled Then
                   NOMBRE_PAIS.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrMunicipio.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Municipio).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Municipio, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.Tag := gVariableGlobal.VALOR_TAG;
end;

procedure TFrMunicipio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrMunicipio.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

Function TFrMunicipio.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Clear;
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Municipio).Name);
  TbMaestro.SQL.Add(' ORDER BY CODIGO_MUNICIPIO ');
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_MUNICIPIO']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_MUNICIPIO', 'NOMBRE_MUNICIPIO', 'NOMBRE_ESTADO', 'NOMBRE_PAIS'], ['Código', 'Municipio', 'Estado', 'País']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrMunicipio.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE_MUNICIPIO', 'NOMBRE_ESTADO', 'NOMBRE_PAIS', 'CODIGO_MUNICIPIO'], [CODIGO_MUNICIPIO.Field.FullName], Retornar_Info_Tabla(Id_Municipio).Name, '', Retornar_Info_Tabla(Id_Municipio).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_MUNICIPIO.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrMunicipio.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Municipio).Caption);
end;

Procedure TFrMunicipio.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

Procedure Show_Form_Municipio;
Begin
  FrMunicipio := TFrMunicipio.Create(Application);
  If FrMunicipio.Abrir_Archivos Then
    FrMunicipio.Show
  Else
  Begin
    FrMunicipio.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
