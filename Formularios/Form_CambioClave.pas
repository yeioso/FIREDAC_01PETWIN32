unit Form_CambioClave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  UtFormularios, Dialogs, ExtCtrls, StdCtrls, ovcbase, ovcef, ovcpb, ovcpf,
  Buttons, DB;

type
  TFrForm_CambioClave = class(TObjForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lbLogin: TLabel;
    LbNombre: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pfClave_Anterior: TOvcPictureField;
    pfClave_Nueva: TOvcPictureField;
    pfClave_Confirmacion: TOvcPictureField;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure pfClave_AnteriorUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure pfClave_NuevaUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure pfClave_ConfirmacionUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrForm_CambioClave: TFrForm_CambioClave;
  Function Show_Form_CambioClave : Boolean;

implementation
{$R *.dfm}
Uses
  UtConexion,
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

procedure TFrForm_CambioClave.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then
  Begin
    CanClose := Self.Validate_Form(Self);
    if CanClose then
      CanClose := SiNo('Está seguro de cambiar de contraseña?');
  End;
end;

procedure TFrForm_CambioClave.FormCreate(Sender: TObject);
begin
  Caption := 'Cambio de Contraseña';
  lbLogin.Caption := gVariableGlobal.Usuario_Actual;
  If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [gVariableGlobal.Usuario_Actual]) Then
    Close
  Else
  Begin
    LbNombre.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [gVariableGlobal.Usuario_Actual], ['NOMBRE'], 'TFrForm_CambioClave.FormCreate');
    Self.Setting_Form(Self, -1, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil);
    Self.WindowState := wsNormal;
  End;
end;

procedure TFrForm_CambioClave.pfClave_AnteriorUserValidation(Sender: TObject; var ErrorCode: Word);
Var
  lContrasena : String;
begin
  lContrasena := CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [gVariableGlobal.Usuario_Actual], ['CONTRASENA'], 'TFrForm_CambioClave.pfClave_AnteriorUserValidation');
  if AnsiUpperCase(Trim(TOvcBaseEntryField(Sender).EditString)) <> AnsiUpperCase(Trim(lContrasena)) then
    ErrorCode := IE_PASSWORD_INVALID;
end;

procedure TFrForm_CambioClave.pfClave_ConfirmacionUserValidation(
  Sender: TObject; var ErrorCode: Word);
begin
  if Not Vacio(Trim(TOvcBaseEntryField(Sender).EditString)) then
    if AnsiUpperCase(Trim(TOvcBaseEntryField(Sender).EditString)) <> AnsiUpperCase(Trim(pfClave_Nueva.EditString)) then
    ErrorCode := IE_PASSWORD_CONFIRM_INVALID;
end;

procedure TFrForm_CambioClave.pfClave_NuevaUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Not Vacio(Trim(TOvcBaseEntryField(Sender).EditString)) then
    if AnsiUpperCase(Trim(TOvcBaseEntryField(Sender).EditString)) <> AnsiUpperCase(Trim(pfClave_Confirmacion.EditString)) then
    ErrorCode := IE_PASSWORD_NEW_INVALID;
end;

Function Show_Form_CambioClave : Boolean;
Var
  lSQL : String;
Begin
  FrForm_CambioClave := TFrForm_CambioClave.Create(Application);
  Result := FrForm_CambioClave.ShowModal = mrOk;
  if Result then
  Begin
    lSQL := ' UPDATE ' + Retornar_Info_Tabla(Id_Usuario).Name + ' SET CONTRASENA = ' + #39 + Trim(FrForm_CambioClave.pfClave_Confirmacion.EditString) + #39 +
            ' WHERE  ' + FrForm_CambioClave.CNX.Trim_Sentence('CODIGO_USUARIO') + ' = ' + #39 + Trim(gVariableGlobal.Usuario_Actual) + #39;
    If FrForm_CambioClave.CNX.SQL_Boolean(lSQL, 'Show_Form_CambioClave') Then
      Mensajes('Cambio de Contraseña exitosa!!! ')
    Else
      Mensajes('Hubo problemas cambiando la contraseña ');
  End;
  FrForm_CambioClave.Free;

End;

end.

