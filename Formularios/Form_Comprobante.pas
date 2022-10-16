unit Form_Comprobante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrComprobante = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    CODIGO_COMPROBANTE: TOvcDbPictureField;
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
    procedure CODIGO_COMPROBANTEUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_COMPROBANTEExit(Sender: TObject);
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
  FrComprobante: TFrComprobante;
  Procedure Show_Form_Comprobante;

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

Function TFrComprobante.Modo_Edicion : Boolean;
Begin
  Result := DsMaestro.State In [dsInsert, dsEdit];
End;

procedure TFrComprobante.DsMaestroStateChange(Sender: TObject);
begin
  If Not tbMaestro.Active Then
    Exit;
  CODIGO_COMPROBANTE.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled           := (Not Modo_Edicion) And  (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled          := (Not Modo_Edicion) And  (TbMaestro.RecordCount >= 1);
  Registros.Enabled          := (Not Modo_Edicion);
  NOMBRE.Enabled             := Modo_Edicion;
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CODIGO_COMPROBANTE.Enabled Then
                   CODIGO_COMPROBANTE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrComprobante.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Comprobante).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Comprobante, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.Tag := gVariableGlobal.VALOR_TAG;
end;

procedure TFrComprobante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrComprobante.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrComprobante.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
  End;
end;

Function TFrComprobante.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Comprobante).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_COMPROBANTE']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_COMPROBANTE', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrComprobante.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_COMPROBANTE'], [CODIGO_COMPROBANTE.Field.FullName], Retornar_Info_Tabla(Id_Comprobante).Name, '', Retornar_Info_Tabla(Id_Comprobante).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_COMPROBANTE.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrComprobante.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TQUERY(TbMaestro), Retornar_Info_Tabla(Id_Comprobante).Caption);
end;

Procedure TFrComprobante.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrComprobante.CODIGO_COMPROBANTEExit(Sender: TObject);
begin
  if Modo_Edicion then
    if Not Vacio(CODIGO_COMPROBANTE.EditString)  then
      CODIGO_COMPROBANTE.Field.AsString := Justificar(CODIGO_COMPROBANTE.EditString, '0', CODIGO_COMPROBANTE.MaxLength);
end;

procedure TFrComprobante.CODIGO_COMPROBANTEUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(CODIGO_COMPROBANTE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Comprobante).Name, [CODIGO_COMPROBANTE.Field.FullName], [CODIGO_COMPROBANTE.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrComprobante.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

Procedure Show_Form_Comprobante;
Begin
  FrComprobante := TFrComprobante.Create(Application);
  If FrComprobante.Abrir_Archivos Then
    FrComprobante.Show
  Else
  Begin
    FrComprobante.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
