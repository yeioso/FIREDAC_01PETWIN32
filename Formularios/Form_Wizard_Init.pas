unit Form_Wizard_Init;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, UtFormularios, ovcbase, ovcef, ovcpb,
  ovcpf;

type
  TFrForm_Wizard_Init = class(TObjForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    Usuario: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    CONTRASENA: TOvcPictureField;
    CODIGO_USUARIO: TOvcPictureField;
    NOMBRE: TOvcPictureField;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure NIT_COMPANIAUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure NOMBRE_COMPANIAUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure NOMBRE_PERIODOUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure CODIGO_USUARIOUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure NOMBREUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure LOGIN_USUARIOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CONTRASENAUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_USUARIOExit(Sender: TObject);
  private
    { Private declarations }
    Function Almacenar_Creacion : Boolean;
  public
    { Public declarations }
  end;

Function Show_Form_Wizard_Init : Boolean;  

implementation
{$R *.dfm}

Uses
  UtConexion,
  UtFunciones,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Crear_Usuario_Master(pCodigo_Usuario, pNombre, pContrasena : String) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.Active := False;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Usuario).Name + ' ');
    lSQL.Active := True;
    If lSQL.Active Then
    Begin
      lSQL.Append;
      lSQL.FieldByName('CODIGO_USUARIO').AsString := pCodigo_Usuario;
      lSQL.FieldByName('NOMBRE'        ).AsString := pNombre        ;
      lSQL.FieldByName('CONTRASENA'    ).AsString := pContrasena    ;
      lSQL.FieldByName('ID_SISTEMA'    ).AsString := 'S'            ;
      lSQL.Post;
    End;
    lSQL.Active := False;
    lSQL.Free;
    Result := True;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'Crear_Usuario_Master']);
  End;
End;

Function TFrForm_Wizard_Init.Almacenar_Creacion : Boolean;
Begin
  Result := Crear_Usuario_Master(CODIGO_USUARIO.EditString, NOMBRE.EditString, CONTRASENA.EditString);
End;

procedure TFrForm_Wizard_Init.CODIGO_USUARIOExit(Sender: TObject);
begin
  If Not Vacio(TOvcBaseEntryField(Sender).EditString) Then
     TOvcBaseEntryField(Sender).AsString := Justificar(TOvcBaseEntryField(Sender).EditString, ' ', TOvcBaseEntryField(Sender).MaxLength);
end;

procedure TFrForm_Wizard_Init.CODIGO_USUARIOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Vacio(TOvcBaseEntryField(Sender).EditString) Then
    ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrForm_Wizard_Init.CONTRASENAUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Vacio(TOvcBaseEntryField(Sender).EditString) Then
    ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrForm_Wizard_Init.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If ModalResult = mrOk Then
  Begin
    CanClose := Self.Validate_Form(Self);
    If CanClose Then
      CanClose := Almacenar_Creacion;
  End;
end;

procedure TFrForm_Wizard_Init.FormCreate(Sender: TObject);
begin
  ModalResult := mrCancel;
  Caption := 'Creación de Usuario';
  Self.Setting_Form(Self, -1, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
end;

procedure TFrForm_Wizard_Init.LOGIN_USUARIOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Vacio(TOvcBaseEntryField(Sender).EditString) Then
    ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrForm_Wizard_Init.NIT_COMPANIAUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Vacio(TOvcBaseEntryField(Sender).EditString) Then
    ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrForm_Wizard_Init.NOMBRE_COMPANIAUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Vacio(TOvcBaseEntryField(Sender).EditString) Then
    ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrForm_Wizard_Init.NOMBRE_PERIODOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Vacio(TOvcBaseEntryField(Sender).EditString) Then
    ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrForm_Wizard_Init.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Vacio(TOvcBaseEntryField(Sender).EditString) Then
    ErrorCode := IE_FIELD_EMPTY;
end;

Function Show_Form_Wizard_Init : Boolean;
var
  FrForm_Wizard_Init: TFrForm_Wizard_Init;
Begin
  FrForm_Wizard_Init := TFrForm_Wizard_Init.Create(Nil);
  Result := FrForm_Wizard_Init.ShowModal = mrOk;
  FrForm_Wizard_Init.Free; 
End;

end.
