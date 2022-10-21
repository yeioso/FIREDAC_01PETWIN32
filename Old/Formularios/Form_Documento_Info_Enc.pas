unit Form_Documento_Info_Enc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls, DB, DBCtrls,
  ExtCtrls, Buttons, UtFormularios, ComCtrls;

type
  TFrDocumento_Info_Enc = class(TObjForm)
    gbInfo_Enc: TGroupBox;
    DATAKEY: TOvcDbPictureField;
    NUMERO_DOCUMENTO: TOvcDbPictureField;
    CODIGO_SINONIMO: TOvcDbPictureField;
    CODIGO_TERCERO: TOvcDbPictureField;
    FECHA_DOCUMENTO: TOvcDbPictureField;
    FECHA_VENCIMIENTO: TOvcDbPictureField;
    CODIGO_VENDEDOR: TOvcDbPictureField;
    FECHA: TOvcDbPictureField;
    CODIGO_USUARIO: TOvcDbPictureField;
    HORA: TOvcDbPictureField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lbNombre_Tercero: TLabel;
    lbNombre_Sinonimo: TLabel;
    lbNombre_Vendedor: TLabel;
    lbNombre_Usuario: TLabel;
    pnlBotones: TPanel;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnTercero: TSpeedButton;
    BtnSinonimo: TSpeedButton;
    BtnVendedor: TSpeedButton;
    Label14: TLabel;
    PLAZO: TOvcDbPictureField;
    BtnFechaDocumento: TSpeedButton;
    Paginas: TPageControl;
    Pag00: TTabSheet;
    Pag01: TTabSheet;
    NOMBRE: TOvcDbPictureField;
    Pag02: TTabSheet;
    DIRECCION: TDBMemo;
    OBSERVACION: TDBMemo;
    GARANTIA: TOvcDbPictureField;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    lbNombre_LP: TLabel;
    BtnLP: TSpeedButton;
    CODIGO_TERCERO_LP: TOvcDbPictureField;
    Label15: TLabel;
    lbNombre_Base: TLabel;
    BtnBase: TSpeedButton;
    CODIGO_BASE: TOvcDbPictureField;
    Label16: TLabel;
    NUMERO_PERSONAS: TOvcDbPictureField;
    TabSheet1: TTabSheet;
    DOCUMENTO_REFERENCIA: TOvcDbPictureField;
    Label17: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CODIGO_TERCEROExit(Sender: TObject);
    procedure CODIGO_SINONIMOExit(Sender: TObject);
    procedure CODIGO_TERCERO_LPExit(Sender: TObject);
    procedure CODIGO_VENDEDORExit(Sender: TObject);
    procedure CODIGO_TERCEROUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure CODIGO_SINONIMOUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure CODIGO_TERCERO_LPUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_VENDEDORUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure CODIGO_TERCEROKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_SINONIMOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_TERCERO_LPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_VENDEDORKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnTerceroClick(Sender: TObject);
    procedure BtnSinonimoClick(Sender: TObject);
    procedure BtnLPClick(Sender: TObject);
    procedure BtnVendedorClick(Sender: TObject);
    procedure BtnFechaDocumentoClick(Sender: TObject);
    procedure PLAZOChange(Sender: TObject);
    procedure DsMaestroDataChange(Sender: TObject; Field: TField);
    procedure CODIGO_TERCEROChange(Sender: TObject);
    procedure FECHA_DOCUMENTOChange(Sender: TObject);
    procedure CODIGO_BASEExit(Sender: TObject);
    procedure CODIGO_BASEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CODIGO_BASEUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBaseClick(Sender: TObject);
    procedure CODIGO_BASEChange(Sender: TObject);
    procedure CODIGO_TERCERO_LPChange(Sender: TObject);
    procedure FECHA_DOCUMENTOUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure FECHA_DOCUMENTOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FTIPO_DOCUMENTO : String;
    Procedure Establecer_LP;
    Procedure Establecer_Bases;
    Procedure Establecer_Plazo;
    Procedure Establecer_Datos_Cartera;
    Function Abrir_Tabla(pDataKey : String) : Boolean;
    Function Cerrar_Tabla : Boolean;
  public
    { Public declarations }
  end;

var
  FrDocumento_Info_Enc: TFrDocumento_Info_Enc;
  Function Show_Form_Documento_Info_Enc(pDataKey, pTipo_Documento : String) : Boolean;

implementation
{$R *.dfm}
Uses
  UtFecha,
  StrUtils,
  UtConexion,
  Form_Fecha,
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  Form_Busqueda,
  UtVariablesGlobales;

Procedure TFrDocumento_Info_Enc.Establecer_LP;
Begin
  If Not (DsMaestro.State In [dsInsert, dsEdit]) Then
    Exit;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Tercero_LP).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + CNX.Trim_Sentence('CODIGO_TERCERO') + ' = ' + QuotedStr(Trim(CODIGO_TERCERO.EditString)));
    CNX.TMP.SQL.Add(' AND ' + CNX.Trim_Sentence('CODIGO_TERCERO_LP') + ' = ' + QuotedStr(Trim(CODIGO_TERCERO_LP.EditString)));
    CNX.TMP.Active := True;
    If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
      tbMaestro.FieldByName('PORCENTAJE_LP'  ).AsFloat := CNX.TMP.FieldByName('PORCENTAJE').AsFloat;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Info_Enc.Establecer_LP']);
  End;
End;

Procedure TFrDocumento_Info_Enc.Establecer_Bases;
Begin
  If Not (DsMaestro.State In [dsInsert, dsEdit]) Then
    Exit;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Base).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + CNX.Trim_Sentence('CODIGO_BASE') + ' = ' + QuotedStr(Trim(CODIGO_BASE.EditString)));
    CNX.TMP.Active := True;
    If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
    Begin
      TbMaestro.FieldByName('BASE_IVA'       ).AsFloat := CNX.TMP.FieldByName('BASE_IVA'       ).AsFloat;
      TbMaestro.FieldByName('BASE_RETEIVA'   ).AsFloat := CNX.TMP.FieldByName('BASE_RETEIVA'   ).AsFloat;
      TbMaestro.FieldByName('BASE_RETEFUENTE').AsFloat := CNX.TMP.FieldByName('BASE_RETEFUENTE').AsFloat;
      TbMaestro.FieldByName('BASE_ICA'       ).AsFloat := CNX.TMP.FieldByName('BASE_ICA'       ).AsFloat;
      TbMaestro.FieldByName('BASE_IMPCONSUMO').AsFloat := CNX.TMP.FieldByName('BASE_IMPCONSUMO').AsFloat;
      TbMaestro.FieldByName('BASE_SERVICIO'  ).AsFloat := CNX.TMP.FieldByName('BASE_SERVICIO'  ).AsFloat;
      TbMaestro.FieldByName('BASE_CREE'      ).AsFloat := CNX.TMP.FieldByName('BASE_CREE'      ).AsFloat;
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Info_Enc.Establecer_Bases']);
  End;
End;

Procedure TFrDocumento_Info_Enc.Establecer_Plazo;
Begin
  If DsMaestro.State In [dsInsert, dsEdit] Then
  Begin
    If TbMaestro.FieldByName('PLAZO').AsFloat = 0 Then
      If (FTIPO_DOCUMENTO = Const_Documento_Pedido) Or (FTIPO_DOCUMENTO = Const_Documento_Compra) Then
        TbMaestro.FieldByName('PLAZO').AsFloat := CNX.Retornar_Double(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TbMaestro.FieldByName('CODIGO_TERCERO').AsString], ['PLAZO'], 'TFrDocumento_Info_Enc.Establecer_Plazo')
      Else
        TbMaestro.FieldByName('PLAZO').AsFloat := CNX.Retornar_Double(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TbMaestro.FieldByName('CODIGO_TERCERO').AsString], ['PLAZO'], 'TFrDocumento_Info_Enc.Establecer_Plazo');
  End;
End;

Procedure TFrDocumento_Info_Enc.Establecer_Datos_Cartera;
Begin
  If DsMaestro.State In [dsInsert, dsEdit] Then
  Begin
    TbMaestro.FieldByName('CAR_FECHAINI').AsString := TbMaestro.FieldByName('FECHA_DOCUMENTO').AsString;
    TbMaestro.FieldByName('CAR_PLAZO'   ).AsFloat  := TbMaestro.FieldByName('PLAZO').AsFloat;
    TbMaestro.FieldByName('CAR_FECHAFIN').AsString := TbMaestro.FieldByName('FECHA_VENCIMIENTO').AsString;
  End;
End;

Function TFrDocumento_Info_Enc.Abrir_Tabla(pDataKey : String) : Boolean;
Begin
  Try
    TbMaestro.Active := False;
    TbMaestro.Connection := CNX;
    TbMaestro.SQL.Clear;
    TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + ' ');
    TbMaestro.SQL.Add(' WHERE ' + CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(pDataKey));
    TbMaestro.Active := True;
    Result := TbMaestro.Active;
    If Result Then
    Begin
      TbMaestro.Edit;
      PLAZOChange(PLAZO);
      Establecer_Plazo;
      Establecer_Datos_Cartera;
    End;
  Except
     On E: Exception Do
     Begin
       Result := False;
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Info_Enc.Abrir_Tabla']);
     End;
  End;
End;

procedure TFrDocumento_Info_Enc.BtnBaseClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Show_FrBusqueda(['NOMBRE', 'CODIGO_BASE'], ['CODIGO_BASE'], Retornar_Info_Tabla(Id_Base).Name, '', Retornar_Info_Tabla(Id_Base).Caption, lResult01, lResult02, lResult03, False, CNX) Then
  Begin
    CODIGO_BASE.Field.AsString := lResult01;
    Establecer_Bases;
  End;
end;


procedure TFrDocumento_Info_Enc.BtnFechaDocumentoClick(Sender: TObject);
Var
  lFecha : String;
begin
  If Retornar_Fecha(lFecha) Then
  Begin
    FECHA_DOCUMENTO.Field.AsString := lFecha;
    Establecer_Datos_Cartera;
  End;
end;

procedure TFrDocumento_Info_Enc.BtnLPClick(Sender: TObject);
Var
  lFiltro : String;
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  lFiltro := CNX.Trim_Sentence('CODIGO_TERCERO') + ' = ' + QuotedStr(Trim(CODIGO_TERCERO.EditString));
  If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO_LP', 'CODIGO_TERCERO'], ['CODIGO_TERCERO_LP'], Retornar_Info_Tabla(Id_Tercero_LP).Name, lFiltro, Retornar_Info_Tabla(Id_Tercero_LP).Caption, lResult01, lResult02, lResult03, False, CNX) Then
  Begin
    CODIGO_TERCERO_LP.Field.AsString := lResult01;
    Establecer_LP;
  End;
end;

procedure TFrDocumento_Info_Enc.BtnSinonimoClick(Sender: TObject);
Var
  lFiltro : String;
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  lFiltro := CNX.Trim_Sentence('CODIGO_TERCERO') + ' = ' + QuotedStr(Trim(CODIGO_TERCERO.EditString));
  If Show_FrBusqueda(['NOMBRE', 'CODIGO_SINONIMO', 'CODIGO_TERCERO'], ['CODIGO_SINONIMO'], Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, lFiltro, Retornar_Info_Tabla(Id_Tercero_Sinonimo).Caption, lResult01, lResult02, lResult03, False, CNX) Then
    CODIGO_SINONIMO.Field.AsString := lResult01;
end;

procedure TFrDocumento_Info_Enc.BtnTerceroClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO', 'TELEFONO', 'SUBSTRING(DIRECCION, 1, 30)'], [CODIGO_TERCERO.Field.FullName], Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, '', Retornar_Info_Tabla(Id_Tercero_Sinonimo).Caption, lResult01, lResult02, lResult03, False, CNX) Then
  Begin
    CODIGO_TERCERO.Field.AsString  := lResult01;
    CODIGO_SINONIMO.Field.AsString := lResult01;
    Establecer_Plazo;
  End;
end;

procedure TFrDocumento_Info_Enc.BtnVendedorClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO'], ['CODIGO_TERCERO'], Retornar_Info_Tabla(Id_Tercero).Name, 'ID_EMPLEADO = ' + QuotedStr('S'), Retornar_Info_Tabla(Id_Tercero).Caption, lResult01, lResult02, lResult03, False, CNX) Then
    CODIGO_VENDEDOR.Field.AsString := lResult01;
end;

Function TFrDocumento_Info_Enc.Cerrar_Tabla : Boolean;
Begin
  Result := False;
  Try
    If TbMaestro.Active Then
      TbMaestro.Active := False;
    Result := Not TbMaestro.Active;
  Except
     On E: Exception Do
     Begin
       Result := False;
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Info_Enc.Cerrar_Tabla']);
     End;
  End;
End;

procedure TFrDocumento_Info_Enc.CODIGO_TERCERO_LPChange(Sender: TObject);
begin
  Establecer_LP;
end;

procedure TFrDocumento_Info_Enc.CODIGO_TERCERO_LPExit(Sender: TObject);
begin
  If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
  Begin
    TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
    Establecer_LP;
  End;
end;

procedure TFrDocumento_Info_Enc.CODIGO_TERCERO_LPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnLP.Click;
end;

procedure TFrDocumento_Info_Enc.CODIGO_TERCERO_LPUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
    If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero_LP).Name, ['CODIGO_TERCERO', 'CODIGO_TERCERO_LP'], [CODIGO_TERCERO.EditString, TOvcDbPictureField(Sender).EditString]) Then
      ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrDocumento_Info_Enc.CODIGO_BASEChange(Sender: TObject);
begin
  Establecer_Bases;
end;

procedure TFrDocumento_Info_Enc.CODIGO_BASEExit(Sender: TObject);
begin
  If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
  Begin
    TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
    Establecer_Bases;
  End;
end;

procedure TFrDocumento_Info_Enc.CODIGO_BASEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnBase.Click;
end;

procedure TFrDocumento_Info_Enc.CODIGO_BASEUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
    If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Base).Name, ['CODIGO_BASE'], [CODIGO_BASE.EditString]) Then
      ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrDocumento_Info_Enc.CODIGO_SINONIMOExit(Sender: TObject);
begin
  If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
    TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrDocumento_Info_Enc.CODIGO_SINONIMOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnSinonimo.Click;
end;

procedure TFrDocumento_Info_Enc.CODIGO_SINONIMOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
    If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [CODIGO_TERCERO.EditString, TOvcDbPictureField(Sender).EditString]) Then
      ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrDocumento_Info_Enc.CODIGO_TERCEROChange(Sender: TObject);
begin
  Establecer_Plazo;
end;

procedure TFrDocumento_Info_Enc.CODIGO_TERCEROExit(Sender: TObject);
begin
  If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
  Begin
    TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
    Establecer_Plazo;
  End;
end;

procedure TFrDocumento_Info_Enc.CODIGO_TERCEROKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnTercero.Click;
end;

procedure TFrDocumento_Info_Enc.CODIGO_TERCEROUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
    If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TOvcDbPictureField(Sender).EditString]) Then
      ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrDocumento_Info_Enc.CODIGO_VENDEDORExit(Sender: TObject);
begin
  If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
    TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrDocumento_Info_Enc.CODIGO_VENDEDORKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnVendedor.Click;
end;

procedure TFrDocumento_Info_Enc.CODIGO_VENDEDORUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
    If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TOvcDbPictureField(Sender).EditString]) Then
      ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrDocumento_Info_Enc.FECHA_DOCUMENTOChange(Sender: TObject);
begin
  Establecer_Datos_Cartera;
end;

procedure TFrDocumento_Info_Enc.FECHA_DOCUMENTOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnFechaDocumento.Click;
end;

procedure TFrDocumento_Info_Enc.FECHA_DOCUMENTOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Not Fecha_Valida(TOvcDbPictureField(Sender).EditString) Then
    ErrorCode := IE_DATE_INVALID;
end;

procedure TFrDocumento_Info_Enc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If ModalResult = mrOk Then
    If DsMaestro.State In [dsInsert, dsEdit] Then
      If Sino('Desea Guardar') Then
        TbMaestro.Post;
end;

procedure TFrDocumento_Info_Enc.FormCreate(Sender: TObject);
begin
  Self.Caption := Retornar_Info_Tabla(Id_Documento_Enc_Aux).Caption;
  Self.Setting_Form(Self, Id_Documento_Enc_Aux, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
end;

procedure TFrDocumento_Info_Enc.PLAZOChange(Sender: TObject);
Var
  lFecha : TFecha_Info;
begin
  If DsMaestro.State In [dsInsert, dsEdit] Then
  Begin
    lFecha := Return_Type_Year_Month_Day(FECHA_DOCUMENTO.EditString);
    FECHA_VENCIMIENTO.Field.AsString := Return_Type_Date(lFecha.DateTime + TOvcDbPictureField(Sender).AsFloat).yyyy_mm_dd;
    Establecer_Datos_Cartera;
  End;
end;

procedure TFrDocumento_Info_Enc.DsMaestroDataChange(Sender: TObject; Field: TField);
begin
  If Not TbMaestro.Active Then
    Exit;

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_TERCERO.Field.FullName)) Then
    lbNombre_Tercero.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [CODIGO_TERCERO.Field.AsString], ['NOMBRE'], 'TFrDocumento_Info_Enc.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_SINONIMO.Field.FullName)) Then
    lbNombre_Sinonimo.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [CODIGO_TERCERO.Field.AsString, CODIGO_SINONIMO.Field.AsString], ['NOMBRE'], 'TFrDocumento_Info_Enc.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_TERCERO_LP.Field.FullName)) Then
    lbNombre_LP.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero_LP).Name, ['CODIGO_TERCERO', 'CODIGO_TERCERO_LP'], [CODIGO_TERCERO.Field.AsString, CODIGO_SINONIMO.Field.AsString], ['NOMBRE'], 'TFrDocumento_Info_Enc.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_VENDEDOR.Field.FullName)) Then
    lbNombre_Vendedor.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [CODIGO_VENDEDOR.Field.AsString], ['NOMBRE'], 'TFrDocumento_Info_Enc.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_USUARIO.Field.FullName)) Then
    lbNombre_Usuario.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [CODIGO_USUARIO.Field.AsString], ['NOMBRE'], 'TFrDocumento_Info_Enc.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_BASE.Field.FullName)) Then
    lbNombre_Base.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Base).Name, ['CODIGO_BASE'], [CODIGO_BASE.Field.AsString], ['NOMBRE'], 'TFrDocumento_Info_Enc.DsMaestroDataChange');

  DOCUMENTO_REFERENCIA.Enabled := (FTIPO_DOCUMENTO = Const_Documento_Nota_Credito) And (FTIPO_DOCUMENTO = Const_Documento_Nota_Debito);
end;

Function Show_Form_Documento_Info_Enc(pDataKey, pTipo_Documento : String) : Boolean;
Var
  lS : String;
  lI : Integer;
Begin
  FrDocumento_Info_Enc := TFrDocumento_Info_Enc.Create(Nil);
  FrDocumento_Info_Enc.FTIPO_DOCUMENTO := pTipo_Documento;
  If FrDocumento_Info_Enc.Abrir_Tabla(pDataKey) Then
  Begin
    lS := '';
    For lI := 0 To FrDocumento_Info_Enc.TbMaestro.Fields.Count-1 Do
      If FrDocumento_Info_Enc.TbMaestro.Fields[lI].DataType In [ftInteger, ftFloat, ftString] Then
        lS := lS + IfThen(Trim(lS) <> '',  ', ') + FrDocumento_Info_Enc.TbMaestro.Fields[lI].FullName + '=' + Trim(FrDocumento_Info_Enc.TbMaestro.Fields[lI].AsString);
    Result := FrDocumento_Info_Enc.ShowModal = mrOk;
    lS := '';
    For lI := 0 To FrDocumento_Info_Enc.TbMaestro.Fields.Count-1 Do
      If FrDocumento_Info_Enc.TbMaestro.Fields[lI].DataType In [ftInteger, ftFloat, ftString] Then
        lS := lS + IfThen(Trim(lS) <> '',  ', ') + FrDocumento_Info_Enc.TbMaestro.Fields[lI].FullName + '=' + Trim(FrDocumento_Info_Enc.TbMaestro.Fields[lI].AsString);
  End;
  FrDocumento_Info_Enc.Cerrar_Tabla;
  FrDocumento_Info_Enc.Free;
End;

end.
