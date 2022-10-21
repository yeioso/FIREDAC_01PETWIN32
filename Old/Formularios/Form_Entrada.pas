unit Form_Entrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, UtFormularios, ovcbase, ovcef, ovcpb, ovcpf,
  ovceditf, ovcedpop, ovcedcal, UtVariablesGlobales, UtFecha;

type
  TFrEntrada = class(TObjForm)
    pnlMain: TPanel;
    pnlBotones: TPanel;
    CODIGO_USUARIO: TOvcPictureField;
    CONTRASENA: TOvcPictureField;
    Label1: TLabel;
    Label2: TLabel;
    OvcController1: TOvcController;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BtnUsuario: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure CODIGO_USUARIOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CODIGO_USUARIOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CONTRASENAUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnUsuarioClick(Sender: TObject);
    procedure CODIGO_USUARIOExit(Sender: TObject);
  private
    { Private declarations }
    Function FnLoginOK : Boolean;
    Function FnPasswordOK : Boolean;
  public
    { Public declarations }
  Protected
  end;

Var
  FrEntrada: TFrEntrada;
  Function Ingreso_Correcto : Boolean;
  Function Return_Info_Log(Var pUser : String; Var pFecha : TFecha_Info) : Boolean;

implementation
{$R *.dfm}

Uses
  DB,
  Form_Fecha,
  UtConexion,
  UtFunciones,
  UtInfoTablas,
  UtConstantes,
  Form_Busqueda,
  UtManejoError;

Function TFrEntrada.FnLoginOK : Boolean;
Begin
  Result := False;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Usuario).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + CNX.Trim_Sentence('CODIGO_USUARIO') + ' = ' + #39 + Trim(CODIGO_USUARIO.EditString ) + #39 + ' ');
    CNX.TMP.Active := True;
    Result := CNX.TMP.Active And (CNX.TMP.RecordCount > 0);
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(['Origen', 'FnLoginOK', 'Error', E.Message]);
  End;
End;

Function TFrEntrada.FnPasswordOK : Boolean;
Begin
  Result := False;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Usuario).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + CNX.Trim_Sentence('CODIGO_USUARIO') + ' = ' + #39 + Trim(CODIGO_USUARIO.EditString) + #39 + ' ');
    CNX.TMP.SQL.Add(' AND '   + CNX.Trim_Sentence('ID_SISTEMA'    ) + ' = ' + #39 + Trim('S'                      ) + #39 + ' ');
    CNX.TMP.Active := True;
    Result := CNX.TMP.Active And (CNX.TMP.RecordCount > 0);
    If Result Then
      Result := Trim(AnsiUpperCase(CNX.TMP.FieldByName('CONTRASENA').AsString)) = Trim(AnsiUpperCase(CONTRASENA.EditString));
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(['Origen', 'FnPasswordOK', 'Error', E.Message]);
  End;
End;

procedure TFrEntrada.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If ModalResult = mrOk Then
    CanClose := Self.Validate_Form(Self);
end;

procedure TFrEntrada.FormCreate(Sender: TObject);
begin
  Self.Setting_Form(Self, -1, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  CODIGO_USUARIO.AsString := Retornar_Usuario;
  gVariableGlobal.SetSetting(Self);
end;

procedure TFrEntrada.BtnUsuarioClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Show_FrBusqueda(['CODIGO_USUARIO', 'NOMBRE'], ['CODIGO_USUARIO'], Retornar_Info_Tabla(Id_Usuario).Name, 'ID_SISTEMA = ' + #39 + 'S' + #39, Retornar_Info_Tabla(Id_Usuario).Caption, lResult01, lResult02, lResult03, False, CNX) Then
    CODIGO_USUARIO.AsString := lResult01;
end;

procedure TFrEntrada.CODIGO_USUARIOExit(Sender: TObject);
begin
  If Not Vacio(TOvcBaseEntryField(Sender).EditString) Then
     TOvcBaseEntryField(Sender).AsString := Justificar(TOvcBaseEntryField(Sender).EditString, ' ', TOvcBaseEntryField(Sender).MaxLength);
end;

procedure TFrEntrada.CODIGO_USUARIOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnUsuario.Click;
end;

procedure TFrEntrada.CODIGO_USUARIOUserValidation(Sender: TObject; var ErrorCode: Word);
begin
  If Sender Is TOvcBaseEntryField Then
    If Not FnLoginOK Then
      ErrorCode := IE_NOT_EXISTS_USER;
end;

procedure TFrEntrada.CONTRASENAUserValidation(Sender: TObject; var ErrorCode: Word);
begin
  If Sender Is TOvcBaseEntryField Then
    If Not FnPasswordOK Then
      ErrorCode := IE_PASSWORD_INVALID;
end;

Function Ingreso_Correcto : Boolean;
Var
  lCodigo_Perfil : String;
Begin
  FrEntrada := TFrEntrada.Create(Nil);
  Result := FrEntrada.ShowModal = mrOk;
  If Result Then
  Begin
    lCodigo_Perfil := FrEntrada.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [FrEntrada.CODIGO_USUARIO.EditString], ['CODIGO_PERFIL'], 'Form_Entrada');
    gVariableGlobal.USUARIO_NOMBRE := FrEntrada.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [FrEntrada.CODIGO_USUARIO.EditString], ['NOMBRE'], 'Form_Entrada');
    gVariableGlobal.Cargar_Variables(FrEntrada.CODIGO_USUARIO.EditString, lCodigo_Perfil);
  End;
  FrEntrada.Free;
End;

Function Return_Info_Log(Var pUser : String; Var pFecha : TFecha_Info) : Boolean;
Begin
  pUser := gVariableGlobal.Usuario_Actual;
  FrEntrada := TFrEntrada.Create(Nil);
  Result := FrEntrada.ShowModal = mrOk;
  If Result Then
  Begin
    gVariableGlobal.Usuario_Actual := FrEntrada.CODIGO_USUARIO.EditString;
    gVariableGlobal.USUARIO_NOMBRE := FrEntrada.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [gVariableGlobal.Usuario_Actual], ['NOMBRE'], 'Return_Info_Log');
    pFecha := Return_Type_Date(Now);
  End;
  FrEntrada.Free;
End;

end.
