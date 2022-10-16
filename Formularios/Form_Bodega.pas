unit Form_Bodega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrBodega = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    CODIGO_BODEGA: TOvcDbPictureField;
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
    procedure CODIGO_BODEGAUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_BODEGAExit(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
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
  FrBodega: TFrBodega;
  Procedure Show_Form_Bodega;

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

Function TFrBodega.Modo_Edicion : Boolean;
Begin
  Result := DsMaestro.State In [dsInsert, dsEdit];
End;

procedure TFrBodega.DsMaestroStateChange(Sender: TObject);
begin
  If Not TbMaestro.Active Then
    Exit;
  CODIGO_BODEGA.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled        := (Not Modo_Edicion) And  (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled       := (Not Modo_Edicion) And  (TbMaestro.RecordCount >= 1);
  Registros.Enabled       := (Not Modo_Edicion);
  NOMBRE.Enabled          := Modo_Edicion;
  Case DsMaestro.State Of
    dsInsert : Begin
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

procedure TFrBodega.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Bodega).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Bodega, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrBodega.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrBodega.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrBodega.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
  End;
end;

Function TFrBodega.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Bodega).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_BODEGA']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_BODEGA', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrBodega.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_BODEGA'], [CODIGO_BODEGA.Field.FullName], Retornar_Info_Tabla(Id_Bodega).Name, '', Retornar_Info_Tabla(Id_Bodega).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_BODEGA.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrBodega.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Bodega).Caption);
end;

Procedure TFrBodega.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrBodega.CODIGO_BODEGAExit(Sender: TObject);
begin
  if Modo_Edicion then
    if Not Vacio(CODIGO_BODEGA.EditString)  then
      CODIGO_BODEGA.Field.AsString := Justificar(CODIGO_BODEGA.EditString, '0', CODIGO_BODEGA.MaxLength);
end;

procedure TFrBodega.CODIGO_BODEGAUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(CODIGO_BODEGA.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Bodega).Name, [CODIGO_BODEGA.Field.FullName], [CODIGO_BODEGA.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrBodega.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

Procedure Show_Form_Bodega;
Begin
  FrBodega := TFrBodega.Create(Application);
  If FrBodega.Abrir_Archivos Then
    FrBodega.Show
  Else
  Begin
    FrBodega.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
