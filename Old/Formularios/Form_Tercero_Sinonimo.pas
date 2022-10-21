unit Form_Tercero_Sinonimo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrTercero_Sinonimo = class(TObjForm)
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
    Paginas: TPageControl;
    Pag00: TTabSheet;
    Pag01: TTabSheet;
    Label13: TLabel;
    BtnMunicipio: TSpeedButton;
    lbNombreMunicipio: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    CODIGO_MUNICIPIO: TOvcDbPictureField;
    CODIGO_SINONIMO: TOvcDbPictureField;
    NOMBRE: TOvcDbPictureField;
    ID_ACTIVO: TDBCheckBox;
    TELEFONO: TOvcDbPictureField;
    EMAIL: TOvcDbPictureField;
    WEBSITE: TOvcDbPictureField;
    DIRECCION: TDBMemo;
    DIGITO_VERIFICACION: TOvcDbPictureField;
    Label18: TLabel;
    TIPO_DOCUMENTO: TDBRadioGroup;
    TIPO_PERSONA: TDBRadioGroup;
    TIPO_REGIMEN: TDBRadioGroup;
    GRAN_CONTRIBUYENTE: TDBCheckBox;
    AUTORETENEDOR: TDBCheckBox;
    ACTIVIDAD_ECONOMICA: TOvcDbPictureField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DsMaestroStateChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure DsMaestroDataChange(Sender: TObject; Field: TField);
    procedure CODIGO_MUNICIPIOExit(Sender: TObject);
    procedure CODIGO_MUNICIPIOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_MUNICIPIOUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure CODIGO_SINONIMOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnMunicipioClick(Sender: TObject);
    procedure tbMaestroAfterInsert(DataSet: TDataSet);
    procedure CODIGO_SINONIMOExit(Sender: TObject);
  private
    { Private declarations }
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    Procedure Procesar_Before_Post; Override;
  Protected
    FCODIGO_TERCERO : String;
  public
    { Public declarations }
  end;

Var
  FrTercero_Sinonimo: TFrTercero_Sinonimo;
  Procedure Show_Form_Tercero_Sinonimo(pCodigo_Tercero : String);

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


Procedure TFrTercero_Sinonimo.Procesar_Before_Post;
Begin
  If Modo_Edicion Then
  Begin
    If Vacio(DIGITO_VERIFICACION.EditString) Then
      DIGITO_VERIFICACION.Field.AsString := UtFunciones.Digito_Verificacion(CODIGO_SINONIMO.EditString);
  End;
End;

procedure TFrTercero_Sinonimo.DsMaestroDataChange(Sender: TObject;
  Field: TField);
begin
  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_MUNICIPIO.Field.FullName)) Then
    lbNombreMunicipio.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Municipio).Name, ['CODIGO_MUNICIPIO'], [CODIGO_MUNICIPIO.Field.AsString], ['NOMBRE_MUNICIPIO', 'NOMBRE_ESTADO', 'NOMBRE_PAIS'], 'TFrTercero_Sinonimo.DsMaestroDataChange');
  If Modo_Edicion Then
    If (Assigned(Field) And (Field.FullName = CODIGO_SINONIMO.Field.FullName)) Then
      DIGITO_VERIFICACION.Field.AsString := UtFunciones.Digito_Verificacion(Trim(CODIGO_SINONIMO.Field.AsString));
end;

procedure TFrTercero_Sinonimo.DsMaestroStateChange(Sender: TObject);
begin
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_SINONIMO.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled        := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled       := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled       := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 Inicializar_Labels_Formulario(Self, ['lbnombre'], '');
                 If CODIGO_SINONIMO.Enabled Then
                   CODIGO_SINONIMO.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrTercero_Sinonimo.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Tercero_Sinonimo).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Tercero_Sinonimo, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrTercero_Sinonimo.CODIGO_SINONIMOExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrTercero_Sinonimo.CODIGO_SINONIMOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [FCODIGO_TERCERO, TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrTercero_Sinonimo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrTercero_Sinonimo.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

Function TFrTercero_Sinonimo.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name);
  TbMaestro.SQL.Add(' WHERE ' + CNX.Trim_Sentence('CODIGO_TERCERO') + ' = ' + #39 + Trim(FCODIGO_TERCERO) + #39);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_TERCERO', 'CODIGO_SINONIMO']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_SINONIMO', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrTercero_Sinonimo.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['CODIGO_SINONIMO', 'NOMBRE'], [CODIGO_SINONIMO.Field.FullName], Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, '', Retornar_Info_Tabla(Id_Tercero_Sinonimo).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_SINONIMO.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrTercero_Sinonimo.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Tercero_Sinonimo).Caption);
end;

procedure TFrTercero_Sinonimo.BtnMunicipioClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE_MUNICIPIO', 'NOMBRE_ESTADO', 'NOMBRE_PAIS', 'CODIGO_MUNICIPIO'], [CODIGO_MUNICIPIO.Field.FullName], Retornar_Info_Tabla(Id_Municipio).Name, '', Retornar_Info_Tabla(Id_Municipio).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_MUNICIPIO.Field.AsString := lResult01;
end;

Procedure TFrTercero_Sinonimo.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrTercero_Sinonimo.CODIGO_MUNICIPIOExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
    Begin
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
    End;
end;

procedure TFrTercero_Sinonimo.CODIGO_MUNICIPIOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnMunicipio.Click;
end;

procedure TFrTercero_Sinonimo.CODIGO_MUNICIPIOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Municipio).Name, [TOvcDbPictureField(Sender).Field.FullName], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrTercero_Sinonimo.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrTercero_Sinonimo.tbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
    tbMaestro.FieldByName('ID_ACTIVO').AsString := 'S';
    tbMaestro.FieldByName('CODIGO_TERCERO').AsString := FCODIGO_TERCERO;
    tbMaestro.FieldByName('CODIGO_SINONIMO').AsString := FCODIGO_TERCERO;
  End;
end;

Procedure Show_Form_Tercero_Sinonimo(pCodigo_Tercero : String);
Begin
  FrTercero_Sinonimo := TFrTercero_Sinonimo.Create(Application);
  FrTercero_Sinonimo.FCODIGO_TERCERO := pCodigo_Tercero;
  If FrTercero_Sinonimo.Abrir_Archivos Then
    FrTercero_Sinonimo.ShowModal;
  FrTercero_Sinonimo.Free;
End;

end.
