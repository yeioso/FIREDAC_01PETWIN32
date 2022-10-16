unit Form_Contrato_Anexo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, UtConexion, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx, OleServer, ExcelXP,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrContrato_Anexo = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    DsMaestro: TDataSource;
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
    CODIGO_ANEXO: TOvcDbPictureField;
    BtnFiltrado: TSpeedButton;
    BtnBuscar: TSpeedButton;
    BtnExcel: TSpeedButton;
    TbMaestro: TQuery;
    BtnLoadFile: TSpeedButton;
    Label1: TLabel;
    NOMBRE: TOvcDbPictureField;
    Label3: TLabel;
    DESCRIPCION: TDBMemo;
    BtnSaveFile: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DsMaestroStateChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure CODIGO_ANEXOExit(Sender: TObject);
    procedure CODIGO_ANEXOUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnLoadFileClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure BtnSaveFileClick(Sender: TObject);
    //procedure DsMaestroDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    FCODIGO_CONTRATO : String;
    Function Modo_Edicion : Boolean;
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
  Protected
  public
    { Public declarations }
  end;

Var
  FrContrato_Anexo: TFrContrato_Anexo;
  Procedure Show_Form_Contrato_Anexo(pCODIGO_CONTRATO : String);

implementation
{$R *.dfm}

Uses
  UtExcel,
  ShellAPI,
  UtConexion,
  
  UtFunciones,
  UtException,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  Form_Busqueda,
  UtHomologacion,
  UtVariablesGlobales;

Function TFrContrato_Anexo.Modo_Edicion : Boolean;
Begin
  Result := DsMaestro.State In [dsInsert, dsEdit];
End;

procedure TFrContrato_Anexo.NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrContrato_Anexo.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
    TbMaestro.FieldByName('CODIGO_CONTRATO' ).AsString := FCODIGO_CONTRATO;
  End;
end;

procedure TFrContrato_Anexo.BtnLoadFileClick(Sender: TObject);
begin
  If Modo_Edicion then
    If OpenDialog1.Execute Then
    Begin
      TBlobField(TbMaestro.FieldByName('ARCHIVO_BIN')).LoadFromFile(OpenDialog1.FileName);
      NOMBRE.Field.AsString := Trim(ExtractFileName(OpenDialog1.FileName));
    End;
end;

procedure TFrContrato_Anexo.BtnSaveFileClick(Sender: TObject);
Var
  Archivo: string;
Begin
  If Not TbMaestro.FieldByName('ARCHIVO_BIN').IsNull Then
  Begin
    If SaveDialog1.Execute Then
    Begin
      If Vacio(NOMBRE.EditString) Then
        Archivo := SaveDialog1.FileName
      Else
        Archivo := IncludeTrailingBackslash(ExtractFilePath(Trim(SaveDialog1.FileName))) + Trim(NOMBRE.EditString);
      TBlobField(TbMaestro.FieldByName('ARCHIVO_BIN')).SaveToFile(Archivo);
      If SiNo('Quiere abrir el archivo?' + Archivo) Then
        ShellExecute(Handle, 'open',PWideChar(Archivo), nil, nil, SW_SHOWNORMAL);//Abre el archivo con la aplicación por defecto
      //PWideChar  podría ser remplazado por PCHar en veriones anteriores a Delphi 2009
    End;
  End
  Else
    Mensajes('No existe el archivo en este registro');
End;

procedure TFrContrato_Anexo.DsMaestroStateChange(Sender: TObject);
begin
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Self, Modo_Edicion);
  CODIGO_ANEXO.Enabled := DsMaestro.State In [dsInsert];
  BtnSaveFile.Enabled  := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled    := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnExcel.Enabled     := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnFiltrado.Enabled  := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled    := (Not Modo_Edicion);

  Case DsMaestro.State Of
    dsInsert : Begin
                 Inicializar_Labels_Formulario(Self, ['lbNombre'], '');
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrContrato_Anexo.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Contrato_Anexo).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Contrato_Anexo, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Self.Tag := gValor_Tag;
end;

procedure TFrContrato_Anexo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrContrato_Anexo.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

Function TFrContrato_Anexo.Abrir_Archivos : Boolean;
Begin
  Result := False;
  Try
    TbMaestro.SQL.Clear;
    TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Contrato_Anexo).Name);
    TbMaestro.SQL.Add(' WHERE CODIGO_CONTRATO = ' + #39 + FCODIGO_CONTRATO + #39);
    Self.Abrir_Archivo(TbMaestro, ['CODIGO_ANEXO']);
    If TbMaestro.Active Then
    Begin
      Self.Establecer_Columnas_Grid(Registros, ['CODIGO_ANEXO', 'NOMBRE'], ['Código', 'Nombre']);
      Self.Establecer_Permisos_Perfil;
    End;
    Result := TbMaestro.Active;
  Except
    On E : Exception Do
      Ingresar_Inconsistencias(E, 'TFrCargo.Abrir_Archivos', '');
  End;
End;

procedure TFrContrato_Anexo.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_ANEXO', 'CODIGO_CONTRATO'], ['CODIGO_ANEXO'], Retornar_Info_Tabla(Id_Contrato_Anexo).Name, 'CODIGO_CONTRATO = ' + #39 + Trim(FCODIGO_CONTRATO) + #39, Retornar_Info_Tabla(Id_Contrato_Anexo).Caption, lResult01, lResult02, lResult03) Then
      TbMaestro.Locate(CODIGO_ANEXO.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrContrato_Anexo.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Contrato_Anexo).Caption);
end;

Procedure TFrContrato_Anexo.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrContrato_Anexo.CODIGO_ANEXOExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrContrato_Anexo.CODIGO_ANEXOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Existe_Registro(Retornar_Info_Tabla(Id_Contrato_Anexo).Name, ['CODIGO_ANEXO'], [TOvcDbPictureField(Sender).EditString], 'TFrContrato_Anexo.CONSECUTIVOUserValidation') Then
        ErrorCode := IE_CODE_EXISTS;
end;


Procedure Show_Form_Contrato_Anexo(pCODIGO_CONTRATO : String);
Begin
  FrContrato_Anexo := TFrContrato_Anexo.Create(Application);
  FrContrato_Anexo.FCODIGO_CONTRATO := pCODIGO_CONTRATO;
  If FrContrato_Anexo.Abrir_Archivos Then
    FrContrato_Anexo.ShowModal;
  FrContrato_Anexo.Free;
End;

end.
