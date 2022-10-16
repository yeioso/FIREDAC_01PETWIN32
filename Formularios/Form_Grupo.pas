unit Form_Grupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrGrupo = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    CODIGO_GRUPO: TOvcDbPictureField;
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
    GRAFICO: TDBImage;
    OpenDialog1: TOpenDialog;
    PnlOpcionales: TPanel;
    BtnExcel: TSpeedButton;
    BtnBuscar: TSpeedButton;
    BtnFiltrado: TSpeedButton;
    BtnSubirGrafico: TSpeedButton;
    ID_MOSTRAR: TDBCheckBox;
    ORDEN: TOvcDbPictureField;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CODIGO_GRUPOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_GRUPOExit(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure BtnSubirGraficoClick(Sender: TObject);
    procedure BtnImpresoraClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure ORDENExit(Sender: TObject);
  private
    { Private declarations }
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    procedure StateChange(Sender: TObject); Override;
  Protected
    Procedure Cargar_Info_Impresora;
  public
    { Public declarations }
  end;

Var
  FrGrupo: TFrGrupo;
  Procedure Show_Form_Grupo;

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


procedure TFrGrupo.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_GRUPO.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled        := (Not Modo_Edicion) And  (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled       := (Not Modo_Edicion) And  (TbMaestro.RecordCount >= 1);
  Registros.Enabled       := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CODIGO_GRUPO.Enabled Then
                   CODIGO_GRUPO.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrGrupo.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Grupo).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Grupo, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrGrupo.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrGrupo.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
  End;
end;

Function TFrGrupo.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Grupo).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_GRUPO']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_GRUPO', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrGrupo.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_GRUPO'], [CODIGO_GRUPO.Field.FullName], Retornar_Info_Tabla(Id_Grupo).Name, '', Retornar_Info_Tabla(Id_Grupo).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_GRUPO.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrGrupo.BtnSubirGraficoClick(Sender: TObject);
Var
  lBorrar : Boolean;
  lFileName : String;
begin
  If OpenDialog1.Execute Then
    if Pos(AnsiUpperCase('.jpg'), AnsiUpperCase(OpenDialog1.FileName)) <> 0 then
    Begin
      lFileName := Convert_JPG_BMP(OpenDialog1.FileName, lBorrar);
      GRAFICO.Picture.LoadFromFile(lFileName);
      if lBorrar then
        DeleteFile(lFileName);
    End
    Else
     GRAFICO.Picture.LoadFromFile(OpenDialog1.FileName);
end;

procedure TFrGrupo.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Grupo).Caption);
end;

Procedure TFrGrupo.Cargar_Info_Impresora;
Var
  lId : Integer;
  lName : String;
Begin
//  lName := Trim(IMPRESORA.EditString);
//  If Show_Form_Seleccion(TStringList(Printer.Printers),  lId, lName) Then
//    IMPRESORA.Field.AsString := lName;
End;

procedure TFrGrupo.BtnImpresoraClick(Sender: TObject);
begin
 Cargar_Info_Impresora;
end;

Procedure TFrGrupo.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrGrupo.CODIGO_GRUPOExit(Sender: TObject);
begin
  if Modo_Edicion then
    if Not Vacio(CODIGO_GRUPO.EditString)  then
      CODIGO_GRUPO.Field.AsString := Justificar(CODIGO_GRUPO.EditString, '0', CODIGO_GRUPO.MaxLength);
end;

procedure TFrGrupo.CODIGO_GRUPOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(CODIGO_GRUPO.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Grupo).Name, [CODIGO_GRUPO.Field.FullName], [CODIGO_GRUPO.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrGrupo.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrGrupo.ORDENExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString)  then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

Procedure Show_Form_Grupo;
Begin
  FrGrupo := TFrGrupo.Create(Application);
  If FrGrupo.Abrir_Archivos Then
    FrGrupo.Show
  Else
  Begin
    FrGrupo.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
