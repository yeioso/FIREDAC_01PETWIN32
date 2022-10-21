unit Form_Cargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrCargo = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    NOMBRE: TOvcDbPictureField;
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
    CODIGO_CARGO: TOvcDbPictureField;
    Label5: TLabel;
    Label4: TLabel;
    ORDEN: TOvcDbPictureField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure CODIGO_CARGOExit(Sender: TObject);
    procedure ORDENExit(Sender: TObject);
    procedure CODIGO_CARGOUserValidation(Sender: TObject; var ErrorCode: Word);
  private
    { Private declarations }
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    Procedure Procesar_Before_Post; Override;
    procedure StateChange(Sender: TObject); Override;
  Protected
  public
    { Public declarations }
  end;

Var
  FrCargo: TFrCargo;
Procedure Show_Form_Cargo;

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
  UtVariablesGlobales;

Procedure TFrCargo.Procesar_Before_Post;
Begin
  If Modo_Edicion Then
  Begin
    If Not Vacio(ORDEN.EditString) Then
      ORDEN.Field.AsString := Justificar(ORDEN.EditString, '0', ORDEN.MaxLength);
  End;
End;

procedure TFrCargo.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_CARGO.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled     := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled    := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled    := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CODIGO_CARGO.Enabled Then
                   CODIGO_CARGO.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrCargo.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Cargo).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Cargo, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrCargo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrCargo.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrCargo.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
    CODIGO_CARGO.Field.AsString := CNX.Next(Retornar_Info_Tabla(Id_Cargo).Name,  'CODIGO_CARGO', '0', TbMaestro.FieldByName('CODIGO_CARGO').Size);
    ORDEN.Field.AsString        := CNX.Next(Retornar_Info_Tabla(Id_Cargo).Name,  'ORDEN'       , '0', TbMaestro.FieldByName('ORDEN'       ).Size);
  End;
end;

Function TFrCargo.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Cargo).Name);
  TbMaestro.SQL.Add(' ORDER BY ORDEN ');
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_CARGO']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['ORDEN', 'CODIGO_CARGO', 'NOMBRE'], ['Orden', 'Cargo', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrCargo.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['CODIGO_ORDEN', 'CODIGO_CARGO', 'NOMBRE'], ['CODIGO_CARGO'], Retornar_Info_Tabla(Id_Cargo).Name, '', Retornar_Info_Tabla(Id_Cargo).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate('CODIGO_CARGO', lResult01, [loCaseInsensitive]);
end;

procedure TFrCargo.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Cargo).Caption);
end;

Procedure TFrCargo.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrCargo.CODIGO_CARGOExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrCargo.CODIGO_CARGOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Cargo).Name, [TOvcDbPictureField(Sender).Field.FullName], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrCargo.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrCargo.ORDENExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

Procedure Show_Form_Cargo;
Begin
  FrCargo := TFrCargo.Create(Application);
  If FrCargo.Abrir_Archivos Then
    FrCargo.Show
  Else
    FrCargo.Free;
End;

end.
