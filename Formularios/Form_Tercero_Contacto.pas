unit Form_Tercero_Contacto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrTercero_Contacto = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
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
    Label13: TLabel;
    BtnMunicipio: TSpeedButton;
    lbNombreMunicipio: TLabel;
    CODIGO_MUNICIPIO: TOvcDbPictureField;
    Label1: TLabel;
    CODIGO_CONTACTO: TOvcDbPictureField;
    Label2: TLabel;
    NOMBRE: TOvcDbPictureField;
    Label6: TLabel;
    TELEFONO: TOvcDbPictureField;
    ID_ACTIVO: TDBCheckBox;
    Label3: TLabel;
    CODIGO_CARGO: TOvcDbPictureField;
    BtnCargo: TSpeedButton;
    lbNombreCargo: TLabel;
    Label4: TLabel;
    CODIGO_AREA: TOvcDbPictureField;
    BtnArea: TSpeedButton;
    lbNombreArea: TLabel;
    Label5: TLabel;
    EMAIL: TOvcDbPictureField;
    Label7: TLabel;
    WEBSITE: TOvcDbPictureField;
    ID_TRATAMIENTO: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure CODIGO_MUNICIPIOExit(Sender: TObject);
    procedure CODIGO_MUNICIPIOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_MUNICIPIOUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure CODIGO_CONTACTOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnMunicipioClick(Sender: TObject);
    procedure tbMaestroAfterInsert(DataSet: TDataSet);
    procedure CODIGO_CARGOExit(Sender: TObject);
    procedure CODIGO_AREAExit(Sender: TObject);
    procedure CODIGO_AREAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_CARGOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_CARGOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_AREAUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnAreaClick(Sender: TObject);
    procedure BtnCargoClick(Sender: TObject);
    procedure CODIGO_CONTACTOExit(Sender: TObject);
  private
    { Private declarations }
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    procedure StateChange(Sender: TObject); Override;
    procedure DataChange(Sender: TObject; Field: TField); Override;
  Protected
    FCODIGO_TERCERO : String;
  public
    { Public declarations }
  end;

Var
  FrTercero_Contacto: TFrTercero_Contacto;
  Procedure Show_Form_Tercero_Contacto(pCodigo_Tercero : String);

implementation
{$R *.dfm}

Uses
  UtExcel,
  UtFecha,
  UtConexion,
  
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  Form_Busqueda,
  UtVariablesGlobales;

procedure TFrTercero_Contacto.DataChange(Sender: TObject;
  Field: TField);
begin
  Inherited;
  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_CARGO.Field.FullName)) Then
    lbNombreCargo.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Cargo).Name, ['CODIGO_CARGO'], [CODIGO_CARGO.Field.AsString], ['NOMBRE'], 'TFrTercero_Contacto.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_AREA.Field.FullName)) Then
    lbNombreArea.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Area).Name, ['CODIGO_AREA'], [CODIGO_AREA.Field.AsString], ['NOMBRE'], 'TFrTercero_Contacto.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_MUNICIPIO.Field.FullName)) Then
    lbNombreMunicipio.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Municipio).Name, ['CODIGO_MUNICIPIO'], [CODIGO_MUNICIPIO.Field.AsString], ['NOMBRE_MUNICIPIO', 'NOMBRE_ESTADO', 'NOMBRE_PAIS'], 'TFrTercero_Contacto.DsMaestroDataChange');
end;

procedure TFrTercero_Contacto.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  ID_TRATAMIENTO.Enabled  := False;
  CODIGO_CONTACTO.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled        := (Not Modo_Edicion) And  (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled       := (Not Modo_Edicion) And  (TbMaestro.RecordCount >= 1);
  Registros.Enabled       := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 Inicializar_Labels_Formulario(Self, ['lbnombre'], '');
                 If CODIGO_CONTACTO.Enabled Then
                   CODIGO_CONTACTO.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrTercero_Contacto.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Tercero_Contacto).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Tercero_Contacto, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrTercero_Contacto.CODIGO_CONTACTOExit(Sender: TObject);
begin
If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrTercero_Contacto.CODIGO_CONTACTOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero_Contacto).Name, ['CODIGO_TERCERO', 'CODIGO_CONTACTO'], [FCODIGO_TERCERO, TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrTercero_Contacto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrTercero_Contacto.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

Function TFrTercero_Contacto.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Tercero_Contacto).Name);
  TbMaestro.SQL.Add(' WHERE ' + CNX.Trim_Sentence('CODIGO_TERCERO') + ' = ' + #39 + Trim(FCODIGO_TERCERO) + #39);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_TERCERO', 'CODIGO_CONTACTO']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_CONTACTO', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrTercero_Contacto.BtnAreaClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion then
    If Show_FrBusqueda(['CODIGO_AREA', 'NOMBRE'], [CODIGO_AREA.Field.FullName], Retornar_Info_Tabla(Id_Area).Name, '', Retornar_Info_Tabla(Id_Area).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_AREA.Field.AsString := lResult01;
end;

procedure TFrTercero_Contacto.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['CODIGO_CONTACTO', 'NOMBRE'], [CODIGO_CONTACTO.Field.FullName], Retornar_Info_Tabla(Id_Tercero_Contacto).Name, '', Retornar_Info_Tabla(Id_Tercero_Contacto).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_CONTACTO.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrTercero_Contacto.BtnCargoClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion then
    If Show_FrBusqueda(['CODIGO_CARGO', 'NOMBRE'], [CODIGO_CARGO.Field.FullName], Retornar_Info_Tabla(Id_Cargo).Name, '', Retornar_Info_Tabla(Id_Cargo).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_CARGO.Field.AsString := lResult01;
end;

procedure TFrTercero_Contacto.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Tercero_Contacto).Caption);
end;

procedure TFrTercero_Contacto.BtnMunicipioClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE_MUNICIPIO', 'NOMBRE_ESTADO', 'NOMBRE_PAIS', 'CODIGO_MUNICIPIO'], [CODIGO_MUNICIPIO.Field.FullName], Retornar_Info_Tabla(Id_Municipio).Name, '', Retornar_Info_Tabla(Id_Municipio).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_MUNICIPIO.Field.AsString := lResult01;
end;

Procedure TFrTercero_Contacto.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrTercero_Contacto.CODIGO_AREAExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrTercero_Contacto.CODIGO_AREAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnArea.Click;
end;

procedure TFrTercero_Contacto.CODIGO_AREAUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Area).Name, [TOvcDbPictureField(Sender).Field.FullName], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrTercero_Contacto.CODIGO_CARGOExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrTercero_Contacto.CODIGO_CARGOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnCargo.Click;
end;

procedure TFrTercero_Contacto.CODIGO_CARGOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Cargo).Name, [TOvcDbPictureField(Sender).Field.FullName], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrTercero_Contacto.CODIGO_MUNICIPIOExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrTercero_Contacto.CODIGO_MUNICIPIOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnMunicipio.Click;
end;

procedure TFrTercero_Contacto.CODIGO_MUNICIPIOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Municipio).Name, [TOvcDbPictureField(Sender).Field.FullName], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrTercero_Contacto.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrTercero_Contacto.tbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
    tbMaestro.FieldByName('CODIGO_TERCERO').AsString := FCODIGO_TERCERO;
  End;
end;

Procedure Show_Form_Tercero_Contacto(pCodigo_Tercero : String);
Begin
  FrTercero_Contacto := TFrTercero_Contacto.Create(Application);
  FrTercero_Contacto.FCODIGO_TERCERO := pCodigo_Tercero;
  If FrTercero_Contacto.Abrir_Archivos Then
    FrTercero_Contacto.ShowModal;
  FrTercero_Contacto.Free;
End;

end.
