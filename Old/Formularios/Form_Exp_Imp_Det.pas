unit Form_Exp_Imp_Det;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrExp_Imp_Det = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    CAMPO: TOvcDbPictureField;
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
    Label10: TLabel;
    LONGITUD: TOvcDbPictureField;
    ID_PRIMARY_KEY: TDBCheckBox;
    Label1: TLabel;
    EQUIVALENCIA: TOvcDbPictureField;
    Label5: TLabel;
    ORDEN: TOvcDbPictureField;
    ALINEACION: TDBRadioGroup;
    Label6: TLabel;
    CARACTER: TOvcDbPictureField;
    Label3: TLabel;
    CONSTANTE: TOvcDbPictureField;
    Label4: TLabel;
    SUSTITUTO_OLD: TOvcDbPictureField;
    SUSTITUTO_NEW: TOvcDbPictureField;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CAMPOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure PRODUCTO_PADREExit(Sender: TObject);
    procedure ORDENExit(Sender: TObject);
  private
    { Private declarations }
    FCODIGO_EXP_IMP : String;
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    procedure StateChange(Sender: TObject); Override;
  Protected
  public
    { Public declarations }
  end;

Procedure Show_Form_Exp_Imp_Det(pCODIGO_EXP_IMP : String);

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


procedure TFrExp_Imp_Det.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CAMPO.Enabled          := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled       := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled      := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled      := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CAMPO.Enabled Then
                   CAMPO.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If EQUIVALENCIA.Enabled Then
                   EQUIVALENCIA.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrExp_Imp_Det.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Exp_Imp_Det).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Exp_Imp_Det, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, False, -1);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Self.Tag := gVariableGlobal.VALOR_TAG;
end;

procedure TFrExp_Imp_Det.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrExp_Imp_Det.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrExp_Imp_Det.ORDENExit(Sender: TObject);
begin
  if Modo_Edicion then
    if Not Vacio(ORDEN.EditString)  then
      ORDEN.Field.AsString := Justificar(ORDEN.EditString, '0', ORDEN.MaxLength);
end;

procedure TFrExp_Imp_Det.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
    tbMaestro.FieldByName('CODIGO_EXP_IMP').AsString := FCODIGO_EXP_IMP;
  End;
end;

Function TFrExp_Imp_Det.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Exp_Imp_Det).Name);
  TbMaestro.SQL.Add(' WHERE ' + CNX.Trim_Sentence('CODIGO_EXP_IMP') + ' = ' + #39 + Trim(FCODIGO_EXP_IMP) + #39);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_EXP_IMP', 'CAMPO']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CAMPO', 'ORDEN'], ['Campo', 'Orden']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrExp_Imp_Det.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['CAMPO'], ['CAMPO'], Retornar_Info_Tabla(Id_Exp_Imp_Det).Name, 'CODIGO_EXP_IMP = ' + QuotedStr(Trim(FCODIGO_EXP_IMP)), Retornar_Info_Tabla(Id_Exp_Imp_Det).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate('CAMPO', lResult01, [loCaseInsensitive]);
end;

procedure TFrExp_Imp_Det.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Exp_Imp_Det).Caption);
end;

Procedure TFrExp_Imp_Det.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrExp_Imp_Det.CAMPOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(CAMPO.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Exp_Imp_Det).Name, ['CODIGO_EXP_IMP', 'CAMPO'], [FCODIGO_EXP_IMP, CAMPO.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrExp_Imp_Det.PRODUCTO_PADREExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

Procedure Show_Form_Exp_Imp_Det(pCODIGO_EXP_IMP : String);
Var
  ltmp : Double;
  FrExp_Imp_Det: TFrExp_Imp_Det;
Begin
  FrExp_Imp_Det := TFrExp_Imp_Det.Create(Application);
  FrExp_Imp_Det.FCODIGO_EXP_IMP := pCODIGO_EXP_IMP;
  If FrExp_Imp_Det.Abrir_Archivos Then
    FrExp_Imp_Det.ShowModal;
  FrExp_Imp_Det.Free;
End;

end.
