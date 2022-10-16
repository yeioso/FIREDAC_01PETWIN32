unit Form_Permiso_Tabla;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat, Menus;

type
  TFrPermiso_Tabla = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    OvcController1: TOvcController;
    PnlNavegador: TPanel;
    DBNavigator1: TDBNavigator;
    PnlOpcionales: TPanel;
    PnlGrid: TPanel;
    Registros: TDBGrid;
    Estado_Actual: TStatusBar;
    Barra_Ayuda01: TStatusBar;
    Barra_Ayuda02: TStatusBar;
    OpenDialog1: TOpenDialog;
    Label2: TLabel;
    CODIGO_PERFIL: TOvcDbPictureField;
    Label3: TLabel;
    NOMBRE: TOvcDbPictureField;
    Label1: TLabel;
    lbNombrePerfil: TLabel;
    BtnExcel: TSpeedButton;
    BtnBuscar: TSpeedButton;
    BtnFiltrado: TSpeedButton;
    HABILITA_INSERTAR: TDBCheckBox;
    TABLA: TOvcDbPictureField;
    BtnTabla: TSpeedButton;
    Label5: TLabel;
    CAMPOS_READONLY: TDBMemo;
    BtnReadOnly: TSpeedButton;
    HABILITA_MODIFICAR: TDBCheckBox;
    HABILITA_ELIMINAR: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure tbMaestroAfterInsert(DataSet: TDataSet);
    procedure CODIGO_PERFILExit(Sender: TObject);
    procedure TABLAExit(Sender: TObject);
    procedure TABLAUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnTablaClick(Sender: TObject);
    procedure BtnReadOnlyClick(Sender: TObject);
    //procedure DsMaestroDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    gCodigo_Perfil : String;
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    procedure StateChange(Sender: TObject); Override;
    procedure DataChange(Sender: TObject; Field: TField); Override;
  Protected
  public
    { Public declarations }
  end;

Var
  FrPermiso_Tabla: TFrPermiso_Tabla;
  Procedure Show_Form_Permiso_Tabla(pCodigo_Perfil : String);

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
  Form_Seleccion,
  UtVariablesGlobales;


procedure TFrPermiso_Tabla.NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrPermiso_Tabla.tbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
    CODIGO_PERFIL.Field.AsString := gCodigo_Perfil;
  End;
end;

procedure TFrPermiso_Tabla.DataChange(Sender: TObject; Field: TField);
begin
  Inherited;
  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_PERFIL.Field.FullName)) Then
    lbNombrePerfil.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Perfil).Name, ['CODIGO_PERFIL'], [CODIGO_PERFIL.Field.AsString], ['NOMBRE'], 'TFrPermiso.DsMaestroDataChange');
end;

procedure TFrPermiso_Tabla.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_PERFIL.Enabled   := DsMaestro.State In [dsInsert];
  TABLA.Enabled           := DsMaestro.State In [dsInsert];
  NOMBRE.Enabled          := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled        := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled       := (Not Modo_Edicion);
  BtnFiltrado.Enabled     := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 Inicializar_Labels_Formulario(Self, ['lbNombre'], '');
                 If CODIGO_PERFIL.Enabled Then
                   CODIGO_PERFIL.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrPermiso_Tabla.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Permiso_Tabla).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Permiso_Tabla, TbMaestro, DsMaestro, Nil, Nil, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 1);
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrPermiso_Tabla.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrPermiso_Tabla.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

Function TFrPermiso_Tabla.Abrir_Archivos : Boolean;
Begin
  Result := False;
  Try
    TbMaestro.SQL.Clear;
    TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Permiso_Tabla).Name + ' ');
    TbMaestro.SQL.Add(' WHERE CODIGO_PERFIL = ' + #39 + gCodigo_Perfil + #39 + ' ');
    Self.Abrir_Archivo(tbMaestro, ['CODIGO_PERFIL']);
    If TbMaestro.Active Then
    Begin
      Self.Establecer_Columnas_Grid(Registros, ['CODIGO_PERFIL', 'TABLA', 'NOMBRE'], ['Código', 'Tabla', 'Nombre']);
      Self.Establecer_Permisos_Perfil;
    End;
    Result := TbMaestro.Active;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(['Origen', 'TFrPerfil.Abrir_Archivos', 'Error', E.Message]);
  End;
End;

procedure TFrPermiso_Tabla.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_PERFIL'], [CODIGO_PERFIL.Field.FullName], Retornar_Info_Tabla(Id_Perfil).Name, '', Retornar_Info_Tabla(Id_Perfil).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_PERFIL.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrPermiso_Tabla.BtnReadOnlyClick(Sender: TObject);
Var
  lResult : String;
begin
  If Modo_Edicion then
    Show_Form_Seleccion(Trim(TABLA.EditString), CNX.LoadFieldsnames(Trim(TABLA.EditString)), TStringList(CAMPOS_READONLY.Lines)) ;
end;

procedure TFrPermiso_Tabla.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TQUERY(TbMaestro), Retornar_Info_Tabla(Id_Perfil).Caption);
end;

procedure TFrPermiso_Tabla.BtnTablaClick(Sender: TObject);
Var
  lResult : TStringList;
begin
  If Modo_Edicion then
  Begin
    lResult := TStringList.Create;
    If Show_Form_Seleccion('Tablas', CNX.LoadDatabase, lResult) Then
      TABLA.Field.AsString := lResult[0];
    lResult.Clear;
    FreeAndNil(lResult);
  End;
End;

Procedure TFrPermiso_Tabla.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;


procedure TFrPermiso_Tabla.CODIGO_PERFILExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrPermiso_Tabla.TABLAExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrPermiso_Tabla.TABLAUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

Procedure Show_Form_Permiso_Tabla(pCodigo_Perfil : String);
Begin
  FrPermiso_Tabla := TFrPermiso_Tabla.Create(Application);
  FrPermiso_Tabla.gCodigo_Perfil := pCodigo_Perfil;
  If FrPermiso_Tabla.Abrir_Archivos Then
    FrPermiso_Tabla.Show
  Else
  Begin
    FrPermiso_Tabla.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
