unit Form_Linea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrLinea = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    CODIGO_LINEA: TOvcDbPictureField;
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
    ID_MOSTRAR: TDBCheckBox;
    GRAFICO: TDBImage;
    BtnSubirGrafico: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Label3: TLabel;
    ORDEN: TOvcDbPictureField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CODIGO_LINEAUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_LINEAExit(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure BtnSubirGraficoClick(Sender: TObject);
    procedure ORDENExit(Sender: TObject);
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
  FrLinea: TFrLinea;
  Procedure Show_Form_Linea;

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


procedure TFrLinea.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_LINEA.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled        := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled       := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled       := (Not Modo_Edicion);
  NOMBRE.Enabled          := Modo_Edicion;
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CODIGO_LINEA.Enabled Then
                   CODIGO_LINEA.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrLinea.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Linea).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Linea, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrLinea.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrLinea.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrLinea.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
  End;
end;

Function TFrLinea.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Linea).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_LINEA']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_LINEA', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrLinea.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_LINEA'], [CODIGO_LINEA.Field.FullName], Retornar_Info_Tabla(Id_Linea).Name, '', Retornar_Info_Tabla(Id_Linea).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_LINEA.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrLinea.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Linea).Caption);
end;

procedure TFrLinea.BtnSubirGraficoClick(Sender: TObject);
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

Procedure TFrLinea.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrLinea.CODIGO_LINEAExit(Sender: TObject);
begin
  if Modo_Edicion then
    if Not Vacio(CODIGO_LINEA.EditString)  then
      CODIGO_LINEA.Field.AsString := Justificar(CODIGO_LINEA.EditString, '0', CODIGO_LINEA.MaxLength);
end;

procedure TFrLinea.CODIGO_LINEAUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(CODIGO_LINEA.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Linea).Name, [CODIGO_LINEA.Field.FullName], [CODIGO_LINEA.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrLinea.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrLinea.ORDENExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString)  then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

Procedure Show_Form_Linea;
Begin
  FrLinea := TFrLinea.Create(Application);
  If FrLinea.Abrir_Archivos Then
    FrLinea.Show
  Else
  Begin
    FrLinea.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
