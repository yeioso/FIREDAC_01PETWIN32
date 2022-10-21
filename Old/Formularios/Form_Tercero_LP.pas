unit Form_Tercero_LP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrTercero_LP = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    CODIGO_TERCERO_LP: TOvcDbPictureField;
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
    PORCENTAJE: TOvcDbPictureField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CODIGO_TERCERO_LPUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_TERCERO_LPExit(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure BtnBodegaClick(Sender: TObject);
  private
    { Private declarations }
    FCODIGO_TERCERO : String;
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    procedure StateChange(Sender: TObject); Override;
  Protected
  public
    { Public declarations }
  end;

Var
  FrTercero_LP: TFrTercero_LP;
  Procedure Show_Form_Tercero_LP(pCodigo_Tercero : String);

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

procedure TFrTercero_LP.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_TERCERO_LP.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled          := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled         := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled         := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CODIGO_TERCERO_LP.Enabled Then
                   CODIGO_TERCERO_LP.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrTercero_LP.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Tercero_LP).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Tercero_LP, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrTercero_LP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrTercero_LP.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrTercero_LP.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
    tbMaestro.FieldByName('CODIGO_TERCERO').AsString := FCODIGO_TERCERO;
    tbMaestro.FieldByName('CODIGO_TERCERO_LP').AsString := CNX.Next(Retornar_Info_Tabla(Id_Tercero_LP).Name, ' ', ['CODIGO_TERCERO_LP'],  ['CODIGO_TERCERO'], [FCODIGO_TERCERO], tbMaestro.FieldByName('CODIGO_TERCERO_LP').Size);
  End;
end;

Function TFrTercero_LP.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Tercero_LP).Name);
  TbMaestro.SQL.Add(' WHERE ' + CNX.Trim_Sentence('CODIGO_TERCERO') + ' = ' + #39 + Trim(FCODIGO_TERCERO) + #39);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_TERCERO', 'CODIGO_TERCERO_LP']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_TERCERO_LP', 'NOMBRE', 'PORCENTAJE'], ['Código', 'Nombre', 'Porcentaje']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrTercero_LP.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO_LP'], [CODIGO_TERCERO_LP.Field.FullName], Retornar_Info_Tabla(Id_Tercero_LP).Name, '', Retornar_Info_Tabla(Id_Tercero_LP).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_TERCERO_LP.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrTercero_LP.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Tercero_LP).Caption);
end;

procedure TFrTercero_LP.BtnBodegaClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO_LP'], [CODIGO_TERCERO_LP.Field.FullName], Retornar_Info_Tabla(Id_Tercero_LP).Name, '', Retornar_Info_Tabla(Id_Tercero_LP).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_TERCERO_LP.Field.AsString := lResult01;
end;

Procedure TFrTercero_LP.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrTercero_LP.CODIGO_TERCERO_LPExit(Sender: TObject);
begin
  If Modo_Edicion Then
    if Not Vacio(CODIGO_TERCERO_LP.EditString)  then
      CODIGO_TERCERO_LP.Field.AsString := Justificar(CODIGO_TERCERO_LP.EditString, '0', CODIGO_TERCERO_LP.MaxLength);
end;

procedure TFrTercero_LP.CODIGO_TERCERO_LPUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(CODIGO_TERCERO_LP.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero_LP).Name, ['CODIGO_TERCERO', CODIGO_TERCERO_LP.Field.FullName], [FCODIGO_TERCERO, CODIGO_TERCERO_LP.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrTercero_LP.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

Procedure Show_Form_Tercero_LP(pCodigo_Tercero : String);
Begin
  FrTercero_LP := TFrTercero_LP.Create(Application);
  FrTercero_LP.FCODIGO_TERCERO := pCodigo_Tercero;
  If FrTercero_LP.Abrir_Archivos Then
    FrTercero_LP.ShowModal;
  FrTercero_LP.Free;
End;

end.
