unit Form_Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrUsuario = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    CODIGO_USUARIO: TOvcDbPictureField;
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
    BtnSubirGrafico: TBitBtn;
    OpenDialog1: TOpenDialog;
    Label4: TLabel;
    DIRECCION: TOvcDbPictureField;
    Label5: TLabel;
    TELEFONO_1: TOvcDbPictureField;
    Label6: TLabel;
    TELEFONO_2: TOvcDbPictureField;
    Label3: TLabel;
    BtnPerfil: TBitBtn;
    lbNombrePerfil: TLabel;
    CODIGO_PERFIL: TOvcDbPictureField;
    PnlOpcionales: TPanel;
    BtnExcel: TSpeedButton;
    BtnBuscar: TSpeedButton;
    BtnFiltrado: TSpeedButton;
    ID_SISTEMA: TDBCheckBox;
    Label7: TLabel;
    EMAIL: TOvcDbPictureField;
    ID_USUARIO_PPAL: TDBCheckBox;
    ID_ADMIN: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CODIGO_USUARIOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_USUARIOExit(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure BtnSubirGraficoClick(Sender: TObject);
    procedure BtnPerfilClick(Sender: TObject);
    procedure CODIGO_PERFILUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_PERFILExit(Sender: TObject);
    procedure CODIGO_PERFILKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DIRECCIONUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure TELEFONO_1UserValidation(Sender: TObject; var ErrorCode: Word);
    procedure LOGIN_USUARIOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure tbMaestroAfterInsert(DataSet: TDataSet);
    procedure EMAILUserValidation(Sender: TObject; var ErrorCode: Word);
  private
    { Private declarations }
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    procedure StateChange(Sender: TObject); Override;
    procedure DataChange(Sender: TObject; Field: TField); Override;
  Protected
  public
    { Public declarations }
  end;

Var
  FrUsuario: TFrUsuario;
  Procedure Show_Form_Usuario;

implementation
{$R *.dfm}

Uses
  UtExcel,
  UtConexion,
  
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  Form_Busqueda,
  UtVariablesGlobales;

procedure TFrUsuario.DIRECCIONUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcBaseEntryField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrUsuario.DataChange(Sender: TObject;
  Field: TField);
begin
  Inherited;
  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_PERFIL.Field.FullName)) Then
    lbNombrePerfil.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Perfil).Name, ['CODIGO_PERFIL'], [CODIGO_PERFIL.Field.AsString], ['NOMBRE'], 'TFrUsuario.DsMaestroDataChange');
end;

procedure TFrUsuario.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_USUARIO.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled        := (Not Modo_Edicion) And  (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled       := (Not Modo_Edicion) And  (TbMaestro.RecordCount >= 1);
  Registros.Enabled       := (Not Modo_Edicion);
  NOMBRE.Enabled          := Modo_Edicion;
  DIRECCION.Enabled       := Modo_Edicion;
  TELEFONO_1.Enabled      := Modo_Edicion;
  TELEFONO_2.Enabled      := Modo_Edicion;
  GRAFICO.Enabled         := Modo_Edicion;
  CODIGO_PERFIL.Enabled   := Modo_Edicion;
  BtnPerfil.Enabled       := Modo_Edicion;
  BtnSubirGrafico.Enabled := Modo_Edicion;
  Case DsMaestro.State Of
    dsInsert : Begin
                 lbNombrePerfil.Caption := '';
                 If CODIGO_USUARIO.Enabled Then
                   CODIGO_USUARIO.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrUsuario.EMAILUserValidation(Sender: TObject; var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcBaseEntryField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrUsuario.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Usuario).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Usuario, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1);
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrUsuario.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrUsuario.LOGIN_USUARIOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcBaseEntryField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrUsuario.TELEFONO_1UserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcBaseEntryField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

Function TFrUsuario.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Usuario).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_USUARIO']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_USUARIO', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrUsuario.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_USUARIO'], [CODIGO_USUARIO.Field.FullName], Retornar_Info_Tabla(Id_Usuario).Name, '', Retornar_Info_Tabla(Id_Usuario).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_USUARIO.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrUsuario.BtnSubirGraficoClick(Sender: TObject);
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

procedure TFrUsuario.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Usuario).Caption);
end;

procedure TFrUsuario.BtnPerfilClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion then
    If Show_FrBusqueda(['CODIGO_PERFIL', 'NOMBRE'], ['CODIGO_PERFIL'], Retornar_Info_Tabla(Id_Perfil).Name, '', Retornar_Info_Tabla(Id_Perfil).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_PERFIL.Field.AsString := lResult01;
end;

Procedure TFrUsuario.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrUsuario.CODIGO_PERFILExit(Sender: TObject);
begin
  if Modo_Edicion then
    if Not Vacio(CODIGO_PERFIL.EditString)  then
      CODIGO_PERFIL.Field.AsString := Justificar(CODIGO_PERFIL.EditString, '0', CODIGO_PERFIL.MaxLength);
end;

procedure TFrUsuario.CODIGO_PERFILKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnPerfil.Click;
end;

procedure TFrUsuario.CODIGO_PERFILUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(CODIGO_PERFIL.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrUsuario.CODIGO_USUARIOExit(Sender: TObject);
begin
  if Modo_Edicion then
    if Not Vacio(CODIGO_USUARIO.EditString)  then
      CODIGO_USUARIO.Field.AsString := Justificar(CODIGO_USUARIO.EditString, ' ', CODIGO_USUARIO.MaxLength);
end;

procedure TFrUsuario.CODIGO_USUARIOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(CODIGO_USUARIO.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Usuario).Name, [CODIGO_USUARIO.Field.FullName], [CODIGO_USUARIO.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrUsuario.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrUsuario.tbMaestroAfterInsert(DataSet: TDataSet);
begin
  tbMaestro.FieldByName('ID_SISTEMA').AsString := 'S';
end;

Procedure Show_Form_Usuario;
Begin
  FrUsuario := TFrUsuario.Create(Application);
  If FrUsuario.Abrir_Archivos Then
    FrUsuario.Show
  Else
  Begin
    FrUsuario.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
