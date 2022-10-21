unit Form_Perfil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrPerfil = class(TObjForm)
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
    Label2: TLabel;
    CODIGO_PERFIL: TOvcDbPictureField;
    Label3: TLabel;
    NOMBRE: TOvcDbPictureField;
    BtnPermisosMenu: TSpeedButton;
    BtnExcel: TSpeedButton;
    BtnBuscar: TSpeedButton;
    BtnFiltrado: TSpeedButton;
    BtnPermisosApp: TSpeedButton;
    BtnPermisosTablas: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure CODIGO_PERFILExit(Sender: TObject);
    procedure CODIGO_PERFILUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnPermisosMenuClick(Sender: TObject);
    procedure BtnPermisosAppClick(Sender: TObject);
    procedure BtnPermisosTablasClick(Sender: TObject);
    //procedure DsMaestroDataChange(Sender: TObject; Field: TField);
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
  FrPerfil: TFrPerfil;
  Procedure Show_Form_Perfil;

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
  Form_Permiso_App,
  Form_Permiso_Menu,
  Form_Permiso_Tabla,
  UtVariablesGlobales;

procedure TFrPerfil.NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrPerfil.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_PERFIL.Enabled     := DsMaestro.State In [dsInsert];
  BtnPermisosMenu.Enabled   := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnPermisosApp.Enabled    := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnPermisosTablas.Enabled := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled         := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnExcel.Enabled          := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled         := (Not Modo_Edicion);
  BtnFiltrado.Enabled       := (Not Modo_Edicion);
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

procedure TFrPerfil.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Perfil).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Perfil, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrPerfil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrPerfil.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

Function TFrPerfil.Abrir_Archivos : Boolean;
Begin
  Result := False;
  Try
    TbMaestro.SQL.Clear;
    TbMaestro.SQL.Add('SELECT * FROM ' + Retornar_Info_Tabla(Id_Perfil).Name);
    Self.Abrir_Archivo(TbMaestro, ['CODIGO_PERFIL']);
    If TbMaestro.Active Then
    Begin
      Self.Establecer_Columnas_Grid(Registros, ['CODIGO_PERFIL', 'NOMBRE'], ['Código', 'Nombre']);
      Self.Establecer_Permisos_Perfil;
    End;
    Result := TbMaestro.Active;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(['Origen', 'TFrPerfil.Abrir_Archivos', 'Error', E.Message]);
  End;
End;

procedure TFrPerfil.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_PERFIL'], [CODIGO_PERFIL.Field.FullName], Retornar_Info_Tabla(Id_Perfil).Name, '', Retornar_Info_Tabla(Id_PERFIL).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_PERFIL.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrPerfil.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TQUERY(TbMaestro), Retornar_Info_Tabla(Id_Perfil).Caption);
end;

procedure TFrPerfil.BtnPermisosAppClick(Sender: TObject);
begin
  Show_Form_Permiso_App(CODIGO_PERFIL.EditString);
end;

procedure TFrPerfil.BtnPermisosMenuClick(Sender: TObject);
begin
  Show_Form_Permiso_Menu(CODIGO_PERFIL.EditString);
end;

procedure TFrPerfil.BtnPermisosTablasClick(Sender: TObject);
begin
  Show_Form_Permiso_Tabla(CODIGO_PERFIL.EditString);
end;

Procedure TFrPerfil.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrPerfil.CODIGO_PERFILExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrPerfil.CODIGO_PERFILUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
        If CNX.Record_Exist(Retornar_Info_Tabla(Id_PERFIL).Name, [CODIGO_PERFIL.Field.FullName], [CODIGO_PERFIL.EditString]) Then
          ErrorCode := IE_CODE_EXISTS;
end;


Procedure Show_Form_PERFIL;
Begin
  FrPERFIL := TFrPERFIL.Create(Application);
  If FrPERFIL.Abrir_Archivos Then
    FrPERFIL.Show
  Else
  Begin
    FrPERFIL.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
