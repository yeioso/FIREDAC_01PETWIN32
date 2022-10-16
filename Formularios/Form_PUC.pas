unit Form_PUC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,  ComCtrls, ovcdbfcb,
  ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrPUC = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    CODIGO_PUC: TOvcDbPictureField;
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
    ID_PYG: TDBRadioGroup;
    TIPO_PUC: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DsMaestroStateChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CODIGO_PUCUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure CODIGO_PUCExit(Sender: TObject);
  private
    { Private declarations }
    Function Modo_Edicion : Boolean;
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
  Protected
  public
    { Public declarations }
  end;

Var
  FrPUC: TFrPUC;
  Procedure Show_Form_PUC;

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

Function TFrPUC.Modo_Edicion : Boolean;
Begin
  Result := DsMaestro.State In [dsInsert, dsEdit];
End;

procedure TFrPUC.DsMaestroStateChange(Sender: TObject);
begin
  If Not tbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_PUC.Enabled  := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled    := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled   := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled   := (Not Modo_Edicion);
  NOMBRE.Enabled      := Modo_Edicion;
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CODIGO_PUC.Enabled Then
                   CODIGO_PUC.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrPUC.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_PUC).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_PUC, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, False, -1);
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrPUC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrPUC.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrPUC.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
  End;
end;

Function TFrPUC.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_PUC).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_PUC']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_PUC', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrPUC.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_PUC'], [CODIGO_PUC.Field.FullName], Retornar_Info_Tabla(Id_PUC).Name, '', Retornar_Info_Tabla(Id_PUC).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_PUC.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrPUC.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TQUERY(TbMaestro), Retornar_Info_Tabla(Id_PUC).Caption);
end;

Procedure TFrPUC.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrPUC.CODIGO_PUCExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Trim(TOvcDbPictureField(Sender).EditString);
end;

procedure TFrPUC.CODIGO_PUCUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(CODIGO_PUC.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_PUC).Name, [CODIGO_PUC.Field.FullName], [CODIGO_PUC.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrPUC.NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

Procedure Show_Form_PUC;
Begin
  FrPUC := TFrPUC.Create(Application);
  If FrPUC.Abrir_Archivos Then
    FrPUC.Show
  Else
  Begin
    FrPUC.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
