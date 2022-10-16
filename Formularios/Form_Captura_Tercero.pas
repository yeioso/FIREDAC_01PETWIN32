unit Form_Captura_Tercero;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ovcbase, ovcef, ovcpb, ovcpf,Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  UtFormularios;

type
  TFrCaptura_Tercero = class(TObjForm)
    pnlDatos: TPanel;
    Label1: TLabel;
    CODIGO_TERCERO: TOvcPictureField;
    DIGITO_VERIFICACION: TOvcPictureField;
    Label2: TLabel;
    NOMBRE: TOvcPictureField;
    Label3: TLabel;
    DIRECCION: TOvcPictureField;
    Label4: TLabel;
    TELEFONO: TOvcPictureField;
    Label5: TLabel;
    CODIGO_MUNICIPIO: TOvcPictureField;
    BtnMunicipio: TSpeedButton;
    lbNombreMunicipio: TLabel;
    pnlBotones: TPanel;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnSinonimo: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnMunicipioClick(Sender: TObject);
    procedure CODIGO_TERCEROExit(Sender: TObject);
    procedure CODIGO_TERCEROUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure CODIGO_MUNICIPIOExit(Sender: TObject);
    procedure CODIGO_MUNICIPIOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_MUNICIPIOUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CODIGO_TERCEROChange(Sender: TObject);
    procedure CODIGO_MUNICIPIOChange(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure DIRECCIONUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure TELEFONOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnSinonimoClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Cargar_Tercero;
    Procedure Insertar_Tercero(pCodigo, pNombre, pDireccion, pTelefono, pId_Cliente, pId_Provedor, pCodigo_Municipio : String);
    Procedure Insertar_Sinonimo(pCodigo_Tercero, pCodigo_Sinonimo, pNombre, pDireccion, pTelefono, pCodigo_Municipio : String);
    Procedure Insertar_Tercero_LP(pCodigo_Tercero, pNombre : String);
  public
    { Public declarations }
  end;

var
  FrCaptura_Tercero: TFrCaptura_Tercero;
  Function Form_Captura_Tercero_Show(Var pCodigo_Tercero : String) : Boolean;
  Function Form_Captura_Tercero_Get : Boolean;

implementation
{$R *.dfm}
Uses
  UtTercero,
  UtConexion,
  UtFunciones,
  UtInfoTablas,
  UtManejoError,
  Form_Busqueda,
  UtVariablesGlobales;

Procedure TFrCaptura_Tercero.Insertar_Sinonimo(pCodigo_Tercero, pCodigo_Sinonimo, pNombre, pDireccion, pTelefono, pCodigo_Municipio : String);
Begin
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_TERCERO' ) + ' = ' +  QuotedStr(Trim(pCodigo_Tercero)));
    CNX.TMP.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('CODIGO_SINONIMO') + ' = ' +  QuotedStr(Trim(pCodigo_Sinonimo)));
    CNX.TMP.Active := True;
    If CNX.TMP.Active And (CNX.TMP.RecordCount <= 0) Then
    Begin
      CNX.TMP.Append;
      CNX.TMP.FieldByName('CODIGO_TERCERO'     ).AsString := Justificar(pCodigo_Tercero , ' ', CNX.TMP.FieldByName('CODIGO_TERCERO' ).Size);
      CNX.TMP.FieldByName('CODIGO_SINONIMO'    ).AsString := Justificar(pCodigo_Sinonimo, ' ', CNX.TMP.FieldByName('CODIGO_SINONIMO').Size);
    End
    Else
      CNX.TMP.Edit;
    CNX.TMP.FieldByName('NOMBRE').AsString := AnsiUpperCase(Trim(pNombre));
    CNX.TMP.FieldByName('DIRECCION'          ).AsString := AnsiUpperCase(Trim(pDireccion  ));
    CNX.TMP.FieldByName('TELEFONO'           ).AsString := AnsiUpperCase(Trim(pTelefono   ));
    CNX.TMP.FieldByName('DIGITO_VERIFICACION').AsString := UtFunciones.Digito_Verificacion(Trim(pCodigo_Sinonimo));
    CNX.TMP.FieldByName('CODIGO_MUNICIPIO'   ).AsString := AnsiUpperCase(Trim(pCodigo_Municipio));
    CNX.TMP.Post;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E:Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrCaptura_Tercero.Insertar_Sinonimo']);
  End;
End;

Procedure TFrCaptura_Tercero.Insertar_Tercero_LP(pCodigo_Tercero, pNombre : String);
Begin
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Tercero_LP).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_TERCERO' ) + ' = ' +  QuotedStr(Trim(pCodigo_Tercero)));
    CNX.TMP.Active := True;
    If CNX.TMP.Active And (CNX.TMP.RecordCount <= 0) Then
    Begin
      CNX.TMP.Append;
      CNX.TMP.FieldByName('CODIGO_TERCERO'   ).AsString := Justificar(pCodigo_Tercero , ' ', CNX.TMP.FieldByName('CODIGO_TERCERO' ).Size);
      CNX.TMP.FieldByName('CODIGO_TERCERO_LP').AsString := '01';
    End
    Else
    CNX.TMP.Edit;
    CNX.TMP.FieldByName('NOMBRE').AsString := 'LP ' + AnsiUpperCase(Trim(pNombre));
    CNX.TMP.Post;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E:Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrCaptura_Tercero.Insertar_Tercero_LP']);
  End;
End;

procedure TFrCaptura_Tercero.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Vacio(TOvcBaseEntryField(Sender).EditString) Then
    ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrCaptura_Tercero.TELEFONOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Vacio(TOvcBaseEntryField(Sender).EditString) Then
    ErrorCode := IE_FIELD_EMPTY;
end;

Procedure TFrCaptura_Tercero.Insertar_Tercero(pCodigo, pNombre, pDireccion, pTelefono, pId_Cliente, pId_Provedor, pCodigo_Municipio : String);
Var
  lCodigo : String;
Begin
  lCodigo := StringReplace(pCodigo, '.', '', [rfReplaceAll]);
  If Pos('-', lCodigo) > 0 Then
    lCodigo := Copy(lCodigo, 1, Pos('-', lCodigo)-1);
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Tercero).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + CNX.Trim_Sentence('CODIGO_TERCERO') + ' = ' +  QuotedStr(Trim(lCodigo)));
    CNX.TMP.Active := True;
    If CNX.TMP.Active Then
    Begin
      If (CNX.TMP.RecordCount <= 0) Then
      Begin
        CNX.TMP.Append;
        CNX.TMP.FieldByName('CODIGO_TERCERO'     ).AsString := Justificar(lCodigo, ' ', CNX.TMP.FieldByName('CODIGO_TERCERO').Size);
        CNX.TMP.FieldByName('DIGITO_VERIFICACION').AsString := UtFunciones.Digito_Verificacion(lCodigo);
      End
      Else
        CNX.TMP.Edit;
      CNX.TMP.FieldByName('NOMBRE').AsString := AnsiUpperCase(Trim(pNombre));
      If Vacio(CNX.TMP.FieldByName('ID_CLIENTE').AsString) Then
        CNX.TMP.FieldByName('ID_CLIENTE').AsString := AnsiUpperCase(Trim(pId_Cliente ));
      If Vacio(CNX.TMP.FieldByName('ID_PROVEEDOR').AsString) Then
        CNX.TMP.FieldByName('ID_PROVEEDOR').AsString := AnsiUpperCase(Trim(pId_Provedor));
      CNX.TMP.FieldByName('DIGITO_VERIFICACION').AsString := UtFunciones.Digito_Verificacion(Trim(lCodigo));
      CNX.TMP.Post;
      Insertar_Sinonimo(lCodigo, lCodigo, pNombre, pDireccion, pTelefono, pCodigo_Municipio);
      Insertar_Tercero_LP(lCodigo, pNombre);
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E:Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrCaptura_Tercero.Insertar_Tercero']);
  End;
End;


procedure TFrCaptura_Tercero.BtnSinonimoClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO', 'TELEFONO', 'SUBSTRING(DIRECCION, 1, 100)'], ['CODIGO_TERCERO'], Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, '', Retornar_Info_Tabla(Id_Tercero_Sinonimo).Caption, lResult01, lResult02, lResult03, False, CNX) Then
  Begin
    CODIGO_TERCERO.AsString  := lResult01;
    Cargar_Tercero;
  End;
end;

Procedure TFrCaptura_Tercero.Cargar_Tercero;
Var
  lCodigo : String;
Begin
  lCodigo := StringReplace(CODIGO_TERCERO.EditString, '.', '', [rfReplaceAll]);
  If Pos('-', lCodigo) > 0 Then
    lCodigo := Copy(lCodigo, 1, Pos('-', lCodigo)-1);
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Tercero).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_TERCERO') + ' = ' +  QuotedStr(Trim(lCodigo)));
    CNX.TMP.Active := True;
    If CNX.TMP.Active Then
    Begin
      If (CNX.TMP.RecordCount >= 0) Then
      Begin
        CODIGO_TERCERO.AsString      := Justificar(lCodigo, ' ', CNX.TMP.FieldByName('CODIGO_TERCERO').Size);
        NOMBRE.AsString              := CNX.TMP.FieldByName('NOMBRE').AsString;
        DIGITO_VERIFICACION.AsString := CNX.TMP.FieldByName('DIGITO_VERIFICACION').AsString;
        DIRECCION.AsString           := CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [CODIGO_TERCERO.EditString, CODIGO_TERCERO.EditString], ['DIRECCION'       ], 'TFrCaptura_Tercero.Cargar_Tercero');
        TELEFONO.AsString            := CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [CODIGO_TERCERO.EditString, CODIGO_TERCERO.EditString], ['TELEFONO'        ], 'TFrCaptura_Tercero.Cargar_Tercero');
        CODIGO_MUNICIPIO.AsString    := CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [CODIGO_TERCERO.EditString, CODIGO_TERCERO.EditString], ['CODIGO_MUNICIPIO'], 'TFrCaptura_Tercero.Cargar_Tercero');
      End;
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E:Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrCaptura_Tercero.Cargar_Tercero']);
  End;
End;


procedure TFrCaptura_Tercero.BtnMunicipioClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Show_FrBusqueda(['NOMBRE_MUNICIPIO', 'NOMBRE_ESTADO', 'NOMBRE_PAIS', 'CODIGO_MUNICIPIO'], ['CODIGO_MUNICIPIO'], Retornar_Info_Tabla(Id_Municipio).Name, '', Retornar_Info_Tabla(Id_Municipio).Caption, lResult01, lResult02, lResult03, False, CNX) Then
  Begin
    CODIGO_MUNICIPIO.AsString := lResult01;
    CODIGO_MUNICIPIOChange(Sender);
  End;
end;

procedure TFrCaptura_Tercero.CODIGO_MUNICIPIOChange(Sender: TObject);
begin
  lbNombreMunicipio.Caption := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Municipio).Name, ['CODIGO_MUNICIPIO'], [CODIGO_MUNICIPIO.EditString], ['NOMBRE_MUNICIPIO', 'NOMBRE_ESTADO', 'NOMBRE_PAIS'], 'TFrCaptura_Tercero.CODIGO_MUNICIPIOChange');
end;

procedure TFrCaptura_Tercero.CODIGO_MUNICIPIOExit(Sender: TObject);
begin
  If Not Vacio(TOvcBaseEntryField(Sender).EditString) Then
     TOvcBaseEntryField(Sender).AsString := Justificar(TOvcBaseEntryField(Sender).EditString, '0', TOvcBaseEntryField(Sender).MaxLength);
end;

procedure TFrCaptura_Tercero.CODIGO_MUNICIPIOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnMunicipio.Click;
end;

procedure TFrCaptura_Tercero.CODIGO_MUNICIPIOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Vacio(TOvcBaseEntryField(Sender).EditString) Then
    ErrorCode := IE_FIELD_EMPTY
  Else
    If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Municipio).Name, ['CODIGO_MUNICIPIO'], [TOvcBaseEntryField(Sender).EditString]) Then
      ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrCaptura_Tercero.CODIGO_TERCEROChange(Sender: TObject);
begin
  DIGITO_VERIFICACION.AsString := UtFunciones.Digito_Verificacion(Trim(CODIGO_TERCERO.EditString));
end;

procedure TFrCaptura_Tercero.CODIGO_TERCEROExit(Sender: TObject);
begin
  If Not Vacio(TOvcBaseEntryField(Sender).EditString) Then
  Begin
    TOvcBaseEntryField(Sender).AsString := Justificar(TOvcBaseEntryField(Sender).EditString, ' ', TOvcBaseEntryField(Sender).MaxLength);
    Cargar_Tercero;
    CODIGO_MUNICIPIOChange(Sender);
  End;
end;

procedure TFrCaptura_Tercero.CODIGO_TERCEROUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Vacio(TOvcBaseEntryField(Sender).EditString) Then
    ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrCaptura_Tercero.DIRECCIONUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Vacio(TOvcBaseEntryField(Sender).EditString) Then
    ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrCaptura_Tercero.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If ModalResult = mrOk Then
    CanClose := Self.Validate_Form(Self);
end;

procedure TFrCaptura_Tercero.FormCreate(Sender: TObject);
begin
  Self.Caption := 'Captura de información de Terceros';
  Self.Setting_Form(Self, -1, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  gVariableGlobal.SetSetting(Self);
end;

Function Form_Captura_Tercero_Show(Var pCodigo_Tercero : String) : Boolean;
Begin
  FrCaptura_Tercero := TFrCaptura_Tercero.Create(Nil);
  Result := FrCaptura_Tercero.ShowModal = mrOk;
  If Result Then
  Begin
    FrCaptura_Tercero.Insertar_Tercero(FrCaptura_Tercero.CODIGO_TERCERO.EditString,
                                       FrCaptura_Tercero.NOMBRE.EditString,
                                       FrCaptura_Tercero.DIRECCION.EditString,
                                       FrCaptura_Tercero.TELEFONO.EditString,
                                       'S', 'S', FrCaptura_Tercero.CODIGO_MUNICIPIO.EditString);
    pCodigo_Tercero := FrCaptura_Tercero.CODIGO_TERCERO.EditString;
  End;
  FrCaptura_Tercero.DisposeOf;
End;

Function Form_Captura_Tercero_Get : Boolean;
Var
  lCodigo_Tercero : String;
Begin
  Repeat
    Form_Captura_Tercero_Show(lCodigo_Tercero);
  Until Not SiNo('Desea ingresar otro tercero?');
End;

end.
