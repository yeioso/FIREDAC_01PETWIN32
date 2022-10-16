unit Form_Espacio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrEspacio = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    CODIGO_ESPACIO: TOvcDbPictureField;
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
    Label40: TLabel;
    BtnZona: TSpeedButton;
    lbNombre_Zona: TLabel;
    CODIGO_ZONA: TOvcDbPictureField;
    ESTADO: TDBRadioGroup;
    POSICION_X: TOvcDbPictureField;
    POSICION_Y: TOvcDbPictureField;
    Label3: TLabel;
    Label4: TLabel;
    TIPO_ESPACIO: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CODIGO_ESPACIOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_ESPACIOExit(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure BtnZonaClick(Sender: TObject);
    procedure CODIGO_ZONAUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_ZONAExit(Sender: TObject);
    procedure CODIGO_ZONAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    procedure DataChange(Sender: TObject; Field: TField); Override;
    procedure StateChange(Sender: TObject); Override;
  Protected
  public
    { Public declarations }
  end;

Var
  FrEspacio: TFrEspacio;
  Procedure Show_Form_Espacio;

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

procedure TFrEspacio.DataChange(Sender: TObject; Field: TField);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_ZONA.Field.FullName)) Then
    lbNombre_Zona.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Zona).Name, ['CODIGO_ZONA'], [CODIGO_ZONA.Field.AsString], ['NOMBRE'], 'TFrEspacio.DsMaestroDataChange');
end;

procedure TFrEspacio.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  BtnZona.Enabled        := DsMaestro.State In [dsInsert];
  CODIGO_ZONA.Enabled    := DsMaestro.State In [dsInsert];
  CODIGO_ESPACIO.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled       := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled      := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled      := (Not Modo_Edicion);
  NOMBRE.Enabled         := Modo_Edicion;
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CODIGO_ESPACIO.Enabled Then
                   CODIGO_ESPACIO.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrEspacio.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Espacio).Caption;
    Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Espacio, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 1);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Self.Tag := gVariableGlobal.VALOR_TAG;
end;

procedure TFrEspacio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrEspacio.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrEspacio.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
  End;
end;

Function TFrEspacio.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Espacio).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_ESPACIO']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_ESPACIO', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrEspacio.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_ESPACIO'], [CODIGO_ESPACIO.Field.FullName], Retornar_Info_Tabla(Id_Espacio).Name, '', Retornar_Info_Tabla(Id_Espacio).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_ESPACIO.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrEspacio.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Espacio).Caption);
end;

procedure TFrEspacio.BtnZonaClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_ZONA'], ['CODIGO_ZONA'], Retornar_Info_Tabla(Id_Zona).Name, '', Retornar_Info_Tabla(Id_Zona).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_ZONA.Field.AsString := lResult01;
end;

Procedure TFrEspacio.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrEspacio.CODIGO_ESPACIOExit(Sender: TObject);
begin
  if Modo_Edicion then
    if Not Vacio(CODIGO_ESPACIO.EditString)  then
      CODIGO_ESPACIO.Field.AsString := Justificar(CODIGO_ESPACIO.EditString, '0', CODIGO_ESPACIO.MaxLength);
end;

procedure TFrEspacio.CODIGO_ESPACIOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(CODIGO_ESPACIO.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Espacio).Name, [CODIGO_ESPACIO.Field.FullName], [CODIGO_ESPACIO.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrEspacio.CODIGO_ZONAExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrEspacio.CODIGO_ZONAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnZona.Click;
end;

procedure TFrEspacio.CODIGO_ZONAUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Zona).Name, [TOvcDbPictureField(Sender).Field.FullName], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrEspacio.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

Procedure Show_Form_Espacio;
Begin
  FrEspacio := TFrEspacio.Create(Application);
  If FrEspacio.Abrir_Archivos Then
    FrEspacio.ShowModal;
  FrEspacio.Free;
End;

end.
