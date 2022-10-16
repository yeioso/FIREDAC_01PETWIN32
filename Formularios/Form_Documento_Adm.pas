unit Form_Documento_Adm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrDocumento_Adm = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    CODIGO_DOCUMENTO_ADM: TOvcDbPictureField;
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
    gbDocumento: TGroupBox;
    DOCUMENTO_INICIAL: TOvcDbPictureField;
    Label3: TLabel;
    Label4: TLabel;
    DOCUMENTO_ACTUAL: TOvcDbPictureField;
    Label5: TLabel;
    DOCUMENTO_FINAL: TOvcDbPictureField;
    TIPO_DOCUMENTO: TDBRadioGroup;
    Label6: TLabel;
    BtnFormato: TSpeedButton;
    FORMATO: TOvcDbPictureField;
    dlgOpen1: TOpenDialog;
    ID_SALIDA: TDBRadioGroup;
    Label7: TLabel;
    PrintDialog1: TPrintDialog;
    Label21: TLabel;
    NRO_COPIAS: TOvcDbPictureField;
    IMPRESORA: TOvcDbPictureField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CODIGO_DOCUMENTO_ADMUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_DOCUMENTO_ADMExit(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure DOCUMENTO_INICIALExit(Sender: TObject);
    procedure DOCUMENTO_ACTUALExit(Sender: TObject);
    procedure DOCUMENTO_FINALExit(Sender: TObject);
    procedure BtnFormatoClick(Sender: TObject);
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
  FrDocumento_Adm: TFrDocumento_Adm;
  Procedure Show_Form_Documento_Adm;

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

procedure TFrDocumento_Adm.DOCUMENTO_ACTUALExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrDocumento_Adm.DOCUMENTO_FINALExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrDocumento_Adm.DOCUMENTO_INICIALExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrDocumento_Adm.DataChange(Sender: TObject; Field: TField);
Begin
  Inherited;
End;

procedure TFrDocumento_Adm.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_DOCUMENTO_ADM.Enabled := DsMaestro.State In [dsInsert];
  BtnFiltrado.Enabled  := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnExcel.Enabled     := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled    := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled    := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CODIGO_DOCUMENTO_ADM.Enabled Then
                   CODIGO_DOCUMENTO_ADM.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrDocumento_Adm.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Documento_Adm).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Documento_Adm, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.Tag := gVariableGlobal.VALOR_TAG;
end;

procedure TFrDocumento_Adm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrDocumento_Adm.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrDocumento_Adm.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
  End;
end;

Function TFrDocumento_Adm.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Adm).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_DOCUMENTO_ADM']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_DOCUMENTO_ADM', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrDocumento_Adm.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_DOCUMENTO_ADM'], [CODIGO_DOCUMENTO_ADM.Field.FullName], Retornar_Info_Tabla(Id_Documento_Adm).Name, '', Retornar_Info_Tabla(Id_Documento_Adm).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_DOCUMENTO_ADM.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrDocumento_Adm.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Documento_Adm).Caption);
end;

procedure TFrDocumento_Adm.BtnFormatoClick(Sender: TObject);
begin
  If dlgOpen1.Execute Then
    FORMATO.Field.AsString := dlgOpen1.FileName;
end;

Procedure TFrDocumento_Adm.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrDocumento_Adm.CODIGO_DOCUMENTO_ADMExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrDocumento_Adm.CODIGO_DOCUMENTO_ADMUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Documento_Adm).Name, [TOvcDbPictureField(Sender).Field.FullName], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrDocumento_Adm.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

Procedure Show_Form_Documento_Adm;
Begin
  FrDocumento_Adm := TFrDocumento_Adm.Create(Application);
  If FrDocumento_Adm.Abrir_Archivos Then
    FrDocumento_Adm.Show
  Else
  Begin
    FrDocumento_Adm.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
