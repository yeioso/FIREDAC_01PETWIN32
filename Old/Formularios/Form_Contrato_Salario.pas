unit Form_Contrato_Salario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, UtConexion, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx, OleServer, ExcelXP,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrContrato_Salario = class(TObjForm)
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
    CODIGO_SALARIO: TOvcDbPictureField;
    BtnFiltrado: TSpeedButton;
    BtnBuscar: TSpeedButton;
    BtnExcel: TSpeedButton;
    TbMaestro: TQuery;
    Label1: TLabel;
    NOMBRE: TOvcDbPictureField;
    Label3: TLabel;
    BtnFechaInicial: TSpeedButton;
    Label4: TLabel;
    BtnFechaFinal: TSpeedButton;
    FECHA_INICIAL: TOvcDbPictureField;
    FECHA_FINAL: TOvcDbPictureField;
    Label6: TLabel;
    Label7: TLabel;
    PORCENTAJE: TOvcDbPictureField;
    VALOR: TOvcDbPictureField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DsMaestroStateChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure CODIGO_SALARIOExit(Sender: TObject);
    procedure CODIGO_SALARIOUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure FECHA_INICIALKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FECHA_INICIALUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure FECHA_FINALKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FECHA_FINALUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnFechaInicialClick(Sender: TObject);
    procedure BtnFechaFinalClick(Sender: TObject);
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
  FrContrato_Salario: TFrContrato_Salario;
  Procedure Show_Form_Contrato_Salario(pCODIGO_CONTRATO : String);

implementation
{$R *.dfm}

Uses
  UtFecha,
  UtExcel,
  ShellAPI,
  UtConexion,
  
  Form_Fecha,
  UtFunciones,
  UtException,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  Form_Busqueda,
  UtHomologacion,
  UtVariablesGlobales;

Function TFrContrato_Salario.Modo_Edicion : Boolean;
Begin
  Result := DsMaestro.State In [dsInsert, dsEdit];
End;

procedure TFrContrato_Salario.NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrContrato_Salario.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
    TbMaestro.FieldByName('CODIGO_CONTRATO' ).AsString := FCODIGO_CONTRATO;
  End;
end;

procedure TFrContrato_Salario.DsMaestroStateChange(Sender: TObject);
begin
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Self, Modo_Edicion);
  CODIGO_SALARIO.Enabled := False;
  BtnBuscar.Enabled      := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnExcel.Enabled       := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnFiltrado.Enabled    := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled      := (Not Modo_Edicion);

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

procedure TFrContrato_Salario.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Contrato_Salario).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Contrato_Salario, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Self.Tag := gValor_Tag;
end;

procedure TFrContrato_Salario.FECHA_FINALKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnFechaFinal.Click;
end;

procedure TFrContrato_Salario.FECHA_FINALUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Trim(TOvcBaseEntryField(Sender).EditString) <> '-  -'Then
    If Not Fecha_Valida(TOvcBaseEntryField(Sender).EditString) Then
      ErrorCode := IE_DATE_INVALID;
end;

procedure TFrContrato_Salario.FECHA_INICIALKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnFechaInicial.Click;
end;

procedure TFrContrato_Salario.FECHA_INICIALUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Not Fecha_Valida(TOvcBaseEntryField(Sender).EditString) Then
      ErrorCode := IE_DATE_INVALID;
end;

procedure TFrContrato_Salario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrContrato_Salario.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

Function TFrContrato_Salario.Abrir_Archivos : Boolean;
Begin
  Result := False;
  Try
    TbMaestro.SQL.Clear;
    TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Contrato_Salario).Name);
    TbMaestro.SQL.Add(' WHERE CODIGO_CONTRATO = ' + #39 + FCODIGO_CONTRATO + #39);
    Self.Abrir_Archivo(TbMaestro, ['CODIGO_SALARIO']);
    If TbMaestro.Active Then
    Begin
      Self.Establecer_Columnas_Grid(Registros, ['CODIGO_SALARIO', 'NOMBRE'], ['Consecutivo', 'Nombre']);
      Self.Establecer_Permisos_Perfil;
    End;
    Result := TbMaestro.Active;
  Except
    On E : Exception Do
      Ingresar_Inconsistencias(E, 'TFrCargo.Abrir_Archivos', '');
  End;
End;

procedure TFrContrato_Salario.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_SALARIO', 'CODIGO_CONTRATO'], ['CODIGO_SALARIO'], Retornar_Info_Tabla(Id_Contrato_Salario).Name, 'CODIGO_CONTRATO = ' + #39 + Trim(FCODIGO_CONTRATO) + #39, Retornar_Info_Tabla(Id_Contrato_Salario).Caption, lResult01, lResult02, lResult03) Then
      TbMaestro.Locate(CODIGO_SALARIO.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrContrato_Salario.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Contrato_Salario).Caption);
end;

procedure TFrContrato_Salario.BtnFechaFinalClick(Sender: TObject);
Var
  lFecha : String;
begin
  If Retornar_Fecha(lFecha) Then
    FECHA_FINAL.Field.AsString := lFecha;
end;

procedure TFrContrato_Salario.BtnFechaInicialClick(Sender: TObject);
Var
  lFecha : String;
begin
  If Retornar_Fecha(lFecha) Then
    FECHA_INICIAL.Field.AsString := lFecha;
end;


Procedure TFrContrato_Salario.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrContrato_Salario.CODIGO_SALARIOExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrContrato_Salario.CODIGO_SALARIOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Existe_Registro(Retornar_Info_Tabla(Id_Contrato_Salario).Name, ['CODIGO_CONTRATO'], [FCODIGO_CONTRATO], 'TFrContrato_Salario.CODIGO_SALARIOUserValidation') Then
        ErrorCode := IE_CODE_EXISTS;
end;


Procedure Show_Form_Contrato_Salario(pCODIGO_CONTRATO : String);
Begin
  FrContrato_Salario := TFrContrato_Salario.Create(Application);
  FrContrato_Salario.FCODIGO_CONTRATO := pCODIGO_CONTRATO;
  If FrContrato_Salario.Abrir_Archivos Then
    FrContrato_Salario.ShowModal;
  FrContrato_Salario.Free;
End;

end.
