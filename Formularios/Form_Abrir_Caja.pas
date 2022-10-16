unit Form_Abrir_Caja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ovcbase, ovcef, ovcpb, ovcpf, ovccal, ComCtrls, StdCtrls,
  UtFormularios, Buttons;

type
  TFrAbrir_Caja = class(TObjForm)
    pnlDatos: TPanel;
    pnlBotones: TPanel;
    VALOR_BASE: TOvcPictureField;
    VALOR_TRM: TOvcPictureField;
    FECHA: TMonthCalendar;
    Label1: TLabel;
    Label2: TLabel;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    gbDescripcion: TGroupBox;
    NOMBRE: TOvcPictureField;
    Label3: TLabel;
    VALOR_BASE_TRM: TOvcPictureField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure VALOR_BASEUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure VALOR_TRMUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure FECHAClick(Sender: TObject);
    procedure BtnAceptarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure OnChangeValue(pSender : TObject);
    Function Guardar_Usuario_Fecha : Boolean;
    Function Usuario_Fecha_Existente : Boolean;
    Function Usuario_Fecha_Valido : Boolean;
    Function Hay_Detalle(Const pTipo_Documento, pDatakey : String) : Boolean;
    Function Preparar_Auxiliares : Boolean;
  public
    { Public declarations }
  end;

Var
  FrAbrir_Caja: TFrAbrir_Caja;
  Function Show_Form_Abrir_Caja : Boolean;

implementation
{$R *.dfm}
Uses
  UtFecha,
  UtConexion,
  UtFunciones,
  UtInfoTablas,
  UtManejoError,
  Form_MenuPpal,
  UtCerrar_Documento,
  UtVariablesGlobales;

Procedure TFrAbrir_Caja.OnChangeValue(pSender : TObject);
Begin
  VALOR_BASE_TRM.AsFloat := 0;
  If VALOR_TRM.AsFloat <> 0 Then
    VALOR_BASE_TRM.AsFloat := VALOR_BASE.AsFloat / VALOR_TRM.AsFloat;
End;

Function TFrAbrir_Caja.Guardar_Usuario_Fecha : Boolean;
Begin
  Result := False;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Caja).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_USUARIO') + '=' + QuotedStr(Trim(gVariableGlobal.Usuario_Actual                        )) + ' ');
    CNX.TMP.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('FECHA'         ) + '=' + QuotedStr(Trim(Return_Type_Date(FECHA.Date).yyyy_mm_dd)) + ' ');
    CNX.TMP.Active := True;
    If CNX.TMP.Active Then
    Begin
      CNX.TMP.Append;
      CNX.TMP.FieldByName('CODIGO_USUARIO'   ).AsString := gVariableGlobal.Usuario_Actual;
      CNX.TMP.FieldByName('FECHA'            ).AsString := Return_Type_Date(FECHA.Date).yyyy_mm_dd;
      CNX.TMP.FieldByName('ESTACION_APERTURA').AsString := Retornar_Maquina;
      CNX.TMP.FieldByName('FECHA_APERTURA'   ).AsString := FormatDateTime('YYYY-MM-DD', Now);
      CNX.TMP.FieldByName('HORA_APERTURA'    ).AsString := FormatDateTime('HH:NN:SS'  , Now);
      CNX.TMP.FieldByName('VALOR_BASE'       ).AsFloat  := VALOR_BASE.AsFloat     ;
      CNX.TMP.FieldByName('VALOR_TRM'        ).AsFloat  := VALOR_TRM.AsFloat      ;
      CNX.TMP.FieldByName('VALOR_BASE_TRM'   ).AsFloat  := VALOR_BASE_TRM.AsFloat ;
      CNX.TMP.FieldByName('NOMBRE'           ).AsString := Trim(NOMBRE.EditString);
      CNX.TMP.FieldByName('ID_ABIERTA'       ).AsString := 'S';
      CNX.TMP.FieldByName('ID_CERRADA'       ).AsString := 'N';
      CNX.TMP.Post;
      Result := True;
      gVariableGlobal.Add_Log(['Origen', 'TFrAbrir_Caja.Guardar_Usuario_Fecha', 'Operacion', 'Apertura de la caja', 'Usuario', gVariableGlobal.USUARIO_NOMBRE, 'Fecha', FormatDateTime('YYYY-MM-DD, HH:NN:SS', Now)]);
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrAbrir_Caja.Guardar_Usuario_Fecha', 'E', 'Error', E.Message]);
  End;
End;

Function TFrAbrir_Caja.Usuario_Fecha_Existente : Boolean;
Begin
  Result := False;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Caja).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_USUARIO') + '=' + QuotedStr(Trim(gVariableGlobal.Usuario_Actual                 )) + ' ');
    CNX.TMP.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('FECHA'         ) + '=' + QuotedStr(Trim(Return_Type_Date(FECHA.Date).yyyy_mm_dd)) + ' ');
    CNX.TMP.Active := True;
    Result := CNX.TMP.Active And (CNX.TMP.RecordCount > 0);
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrAbrir_Caja.Usuario_Fecha_Existente', 'Error', E.Message]);
  End;
End;

Function TFrAbrir_Caja.Hay_Detalle(Const pTipo_Documento, pDatakey : String) : Boolean;
Begin
  Result := False;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('TIPO_DOCUMENTO') + '=' + QuotedStr(Trim(pTipo_Documento)) + ' ');
    CNX.TMP.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('DATAKEY'       ) + '=' + QuotedStr(pDatakey            )  + ' ');
    CNX.TMP.Active := True;
    Result := CNX.TMP.Active And (CNX.TMP.RecordCount > 0);
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrAbrir_Caja.Hay_Detalle', 'Error', E.Message]);
  End;
End;

Function TFrAbrir_Caja.Preparar_Auxiliares : Boolean;
Begin
  Result := False;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE FECHA_DOCUMENTO <= ' + QuotedStr(Return_Type_Date(FECHA.Date).yyyy_mm_dd));
    CNX.TMP.Active := True;
    If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
    Begin
      CNX.TMP.First;
      While Not CNX.TMP.Eof Do
      Begin
        If Not Hay_Detalle(CNX.TMP.FieldByName('TIPO_DOCUMENTO').AsString, CNX.TMP.FieldByName('DATAKEY').AsString) Then
          Inicializar_Documento(Id_Documento_Enc_Aux, Id_Documento_Det_Aux, Id_Documento_Rec_Aux, Id_Documento_Obs_Aux, CNX.TMP.FieldByName('DATAKEY').AsString);
        CNX.TMP.Next;
      End;
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    Result := True;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrAbrir_Caja.Preparar_Auxiliares', 'Error', E.Message]);
  End;
End;

Function TFrAbrir_Caja.Usuario_Fecha_Valido : Boolean;
Var
  lFecha : TFecha_Info;
Begin
  Result := Not gVariableGlobal.CNX.Record_Exist(Retornar_Info_Tabla(Id_Caja).Name, ['CODIGO_USUARIO', 'FECHA'], [gVariableGlobal.Usuario_Actual, Return_Type_Date(FECHA.Date).yyyy_mm_dd]);
End;

procedure TFrAbrir_Caja.VALOR_TRMUserValidation(Sender: TObject;  var ErrorCode: Word);
begin
  If TOvcBaseEntryField(Sender).AsFloat < 0 Then
    ErrorCode := IE_VALUE_INVALID;
end;

procedure TFrAbrir_Caja.VALOR_BASEUserValidation(Sender: TObject;   var ErrorCode: Word);
begin
  If TOvcBaseEntryField(Sender).AsFloat < 0 Then
    ErrorCode := IE_VALUE_INVALID;
end;

procedure TFrAbrir_Caja.BtnAceptarClick(Sender: TObject);
begin
  FrAbrir_Caja.FECHAClick(Nil);
end;

procedure TFrAbrir_Caja.FECHAClick(Sender: TObject);
begin
  NOMBRE.AsString := FormatDateTime('YYYY-MM-DD', FECHA.Date) + ', ' + Trim(gVariableGlobal.USUARIO_ACTUAL) + ' - ' + Trim(gVariableGlobal.USUARIO_NOMBRE);
end;

procedure TFrAbrir_Caja.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If ModalResult = mrOk Then
  Begin
    CanClose := Self.Validate_Form(Self);
    If CanClose Then
    Begin
      CanClose := (Not Usuario_Fecha_Existente);
      If Not CanClose Then
        Mensajes('Ya existe este usuario en esta fecha');
    End;
  End;
end;

procedure TFrAbrir_Caja.FormCreate(Sender: TObject);
begin
  Self.Caption := Retornar_Info_Tabla(Id_Caja).Caption;
  Self.Setting_Form(Self, -1, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  FECHA.Date := Now;
  VALOR_BASE.OnChange := OnChangeValue;
  VALOR_TRM.OnChange  := OnChangeValue;
  NOMBRE.AsString := FormatDateTime('YYYY-MM-DD', Now) + ', ' + Trim(gVariableGlobal.USUARIO_ACTUAL) + ' - ' + Trim(gVariableGlobal.USUARIO_NOMBRE);
end;

procedure TFrAbrir_Caja.NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
begin
  If Vacio(TOvcBaseEntryField(Sender).EditString) Then
    ErrorCode := IE_FIELD_EMPTY;
end;

Function Show_Form_Abrir_Caja : Boolean;
Begin
  FrAbrir_Caja := TFrAbrir_Caja.Create(Nil);
  Result := FrAbrir_Caja.ShowModal = mrOk;
  If Result Then
  Begin
    Result := FrAbrir_Caja.Guardar_Usuario_Fecha;
    If Result Then
      Result := FrAbrir_Caja.Preparar_Auxiliares;
    gVariableGlobal.Add_Log(['Origen', 'Show_Form_Abrir_Caja', 'Operacion', 'Apertura de la caja', 'Fecha', Return_Type_Date(FrAbrir_Caja.FECHA.Date).yyyy_mm_dd]);
  End;
  FrAbrir_Caja.Free;
  If Result Then
  Begin
    gVariableGlobal.Cargar_Variables(gVariableGlobal.Usuario_Actual, gVariableGlobal.Perfil_Actual);
    If Assigned(FrMenuPpal) Then
      FrMenuPpal.Cargar_Configuraciones;
    Mensajes('Proceso Exitoso');
  End;
End;

end.
