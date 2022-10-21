unit Form_Permiso_Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat, Menus;

type
  TFrPermiso_Menu = class(TObjForm)
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
    OPCION: TOvcDbPictureField;
    lbNombrePerfil: TLabel;
    BtnExcel: TSpeedButton;
    BtnBuscar: TSpeedButton;
    BtnFiltrado: TSpeedButton;
    HABILITA_OPCION: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
  private
    { Private declarations }
    gCodigo_Perfil : String;
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    Procedure Procesar_Menu_Items(pMenuItem : TMenuItem);
    Procedure Procesar_Menu_Principal;
    procedure StateChange(Sender: TObject); Override;
    procedure DataChange(Sender: TObject; Field: TField); Override;
  Protected
  public
    { Public declarations }
  end;

Var
  FrPermiso_Menu: TFrPermiso_Menu;
  Procedure Show_Form_Permiso_Menu(pCodigo_Perfil : String);

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

procedure TFrPermiso_Menu.NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrPermiso_Menu.DataChange(Sender: TObject; Field: TField);
begin
  Inherited;
  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_PERFIL.Field.FullName)) Then
    lbNombrePerfil.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Perfil).Name, ['CODIGO_PERFIL'], [CODIGO_PERFIL.Field.AsString], ['NOMBRE'], 'TFrPermiso.DsMaestroDataChange');
end;

procedure TFrPermiso_Menu.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_PERFIL.Enabled   := DsMaestro.State In [dsInsert];
  OPCION.Enabled          := DsMaestro.State In [dsInsert];
  NOMBRE.Enabled          := DsMaestro.State In [dsInsert];
  HABILITA_OPCION.Enabled := Modo_Edicion;
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

procedure TFrPermiso_Menu.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Permiso_Menu).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Permiso_Menu, TbMaestro, DsMaestro, Nil, Nil, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, False, 0);
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrPermiso_Menu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrPermiso_Menu.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

Function TFrPermiso_Menu.Abrir_Archivos : Boolean;
Begin
  Result := False;
  Try
    TbMaestro.SQL.Clear;
    TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Permiso_Menu).Name + ' ');
    TbMaestro.SQL.Add(' WHERE CODIGO_PERFIL = ' + #39 + gCodigo_Perfil + #39 + ' ');
    Self.Abrir_Archivo(tbMaestro, ['CODIGO_PERFIL']);
    If TbMaestro.Active Then
    Begin
      Self.Establecer_Columnas_Grid(Registros, ['CODIGO_PERFIL', 'OPCION', 'NOMBRE'], ['Código', 'Opción', 'Nombre']);
      Self.Establecer_Permisos_Perfil;
    End;
    Result := TbMaestro.Active;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(['Origen', 'TFrPerfil.Abrir_Archivos', 'Error', E.Message]);
  End;
End;

procedure TFrPermiso_Menu.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_PERFIL'], [CODIGO_PERFIL.Field.FullName], Retornar_Info_Tabla(Id_Perfil).Name, '', Retornar_Info_Tabla(Id_Perfil).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_PERFIL.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrPermiso_Menu.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TQUERY(TbMaestro), Retornar_Info_Tabla(Id_Perfil).Caption);
end;

Procedure TFrPermiso_Menu.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

Procedure TFrPermiso_Menu.Procesar_Menu_Items(pMenuItem : TMenuItem);
Var
  lI : Integer;
Begin
  Try
    If pMenuItem.Tag = 402 Then
      pMenuItem.Tag := 402;
    If pMenuItem.Count <= 0 Then
    Begin
      Try
        CNX.TMP.Active := False;
        CNX.TMP.SQL.Clear;
        CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Permiso_Menu).Name + ' ');
        CNX.TMP.SQL.Add(' WHERE OPCION = ' + IntToStr(pMenuItem.Tag) + ' ');
        CNX.TMP.SQL.Add(' AND ' + CNX.Trim_Sentence('CODIGO_PERFIL') + ' = ' + #13 + Trim(gCodigo_Perfil)  + #13 + ' ');
        CNX.TMP.Active := True;
        If CNX.TMP.Active And (CNX.TMP.RecordCount <= 0) Then
        Begin
          CNX.TMP.Append;
          CNX.TMP.FieldByName('OPCION').AsInteger := pMenuItem.Tag;
          CNX.TMP.FieldByName('CODIGO_PERFIL').AsString := gCodigo_Perfil;
          CNX.TMP.FieldByName('NOMBRE').AsString := StringReplace(pMenuItem.Caption, '&', '', [rfReplaceAll]);;
          CNX.TMP.FieldByName('HABILITA_OPCION').AsString := 'S';
          CNX.TMP.Post;
        End
        Else
        Begin
          CNX.TMP.Edit;
          CNX.TMP.FieldByName('NOMBRE').AsString := StringReplace(pMenuItem.Caption, '&', '', [rfReplaceAll]);;
          CNX.TMP.Post;
        End;
        CNX.TMP.Active := False;
        CNX.TMP.SQL.Clear;
      Except
        On E : Exception Do
          gVariableGlobal.Add_Log(['Origen', 'TFrPermiso.Procesar_Menu_Items', 'Error', E.Message]);
      End;
    End
    Else
    Begin
      For lI := 0 To pMenuItem.Count-1 Do
        Procesar_Menu_Items(pMenuItem[lI]);
    End;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(['Origen', 'TFrPerfil.Abrir_Archivos', 'Error', E.Message]);
  End;
End;

Procedure TFrPermiso_Menu.Procesar_Menu_Principal;
Begin
  Procesar_Menu_Items(Application.MainForm.Menu.Items);
End;

Procedure Show_Form_Permiso_Menu(pCodigo_Perfil : String);
Begin
  FrPermiso_Menu := TFrPermiso_Menu.Create(Application);
  FrPermiso_Menu.gCodigo_Perfil := pCodigo_Perfil;
  FrPermiso_Menu.Procesar_Menu_Principal;
  If FrPermiso_Menu.Abrir_Archivos Then
    FrPermiso_Menu.Show
  Else
  Begin
    FrPermiso_Menu.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
