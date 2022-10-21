unit Form_Subgrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrSubgrupo = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    CODIGO_SUBGRUPO: TOvcDbPictureField;
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
    BtnSubirGrafico: TSpeedButton;
    GRAFICO: TDBImage;
    OpenDialog1: TOpenDialog;
    Label3: TLabel;
    ORDEN: TOvcDbPictureField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CODIGO_SUBGRUPOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_SUBGRUPOExit(Sender: TObject);
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
  FrSubgrupo: TFrSubgrupo;
  Procedure Show_Form_Subgrupo;

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

procedure TFrSubgrupo.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_SUBGRUPO.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled        := (Not Modo_Edicion) And  (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled       := (Not Modo_Edicion) And  (TbMaestro.RecordCount >= 1);
  Registros.Enabled       := (Not Modo_Edicion);
  NOMBRE.Enabled          := Modo_Edicion;
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CODIGO_SUBGRUPO.Enabled Then
                   CODIGO_SUBGRUPO.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrSubgrupo.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Subgrupo).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Subgrupo, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.Tag := gVariableGlobal.VALOR_TAG;
end;

procedure TFrSubgrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrSubgrupo.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrSubgrupo.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
  End;
end;

Function TFrSubgrupo.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Subgrupo).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_SUBGRUPO']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_SUBGRUPO', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrSubgrupo.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_SUBGRUPO'], [CODIGO_SUBGRUPO.Field.FullName], Retornar_Info_Tabla(Id_Subgrupo).Name, '', Retornar_Info_Tabla(Id_Subgrupo).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_SUBGRUPO.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrSubgrupo.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Subgrupo).Caption);
end;

procedure TFrSubgrupo.BtnSubirGraficoClick(Sender: TObject);
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

Procedure TFrSubgrupo.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrSubgrupo.CODIGO_SUBGRUPOExit(Sender: TObject);
begin
  if Modo_Edicion then
    if Not Vacio(CODIGO_SUBGRUPO.EditString)  then
      CODIGO_SUBGRUPO.Field.AsString := Justificar(CODIGO_SUBGRUPO.EditString, '0', CODIGO_SUBGRUPO.MaxLength);
end;

procedure TFrSubgrupo.CODIGO_SUBGRUPOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(CODIGO_SUBGRUPO.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Subgrupo).Name, [CODIGO_SUBGRUPO.Field.FullName], [CODIGO_SUBGRUPO.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrSubgrupo.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrSubgrupo.ORDENExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString)  then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

Procedure Show_Form_Subgrupo;
Begin
  FrSubgrupo := TFrSubgrupo.Create(Application);
  If FrSubgrupo.Abrir_Archivos Then
    FrSubgrupo.Show
  Else
  Begin
    FrSubgrupo.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
