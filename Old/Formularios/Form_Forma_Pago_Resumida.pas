unit Form_Forma_Pago_Resumida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, UtConexion, ExtCtrls, StdCtrls, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf,
  Buttons, ComCtrls, UtFormularios;

type
  TFrForma_Pago_Resumida = class(TObjForm)
    Paginas: TPageControl;
    Pag00: TTabSheet;
    lb1: TLabel;
    lb3: TLabel;
    lb5: TLabel;
    lb6: TLabel;
    lb2: TLabel;
    EFE: TOvcDbPictureField;
    TDC: TOvcDbPictureField;
    CHE: TOvcDbPictureField;
    SDX: TOvcDbPictureField;
    CAR: TOvcDbPictureField;
    TDD: TOvcDbPictureField;
    Pag01: TTabSheet;
    TOTAL: TOvcPictureField;
    Label1: TLabel;
    PAGADO: TOvcPictureField;
    PENDIENTE: TOvcPictureField;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EFE_TRM: TOvcDbPictureField;
    TDC_TRM: TOvcDbPictureField;
    CHE_TRM: TOvcDbPictureField;
    SDX_TRM: TOvcDbPictureField;
    CAR_TRM: TOvcDbPictureField;
    TDD_TRM: TOvcDbPictureField;
    TOTAL_TRM: TOvcPictureField;
    Label10: TLabel;
    PAGADO_TRM: TOvcPictureField;
    PENDIENTE_TRM: TOvcPictureField;
    Label11: TLabel;
    Label12: TLabel;
    pnlBotones: TPanel;
    Pag03: TTabSheet;
    Label16: TLabel;
    CAR_PLAZO: TOvcDbPictureField;
    CAR_FECHAINI: TOvcDbPictureField;
    Label17: TLabel;
    Label18: TLabel;
    CAR_FECHAFIN: TOvcDbPictureField;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    Label13: TLabel;
    COR: TOvcDbPictureField;
    Label14: TLabel;
    COR_TRM: TOvcDbPictureField;
    TDD_ENTIDAD: TOvcDbPictureField;
    BtnTDD: TSpeedButton;
    TDD_VAUCHE: TOvcDbPictureField;
    TDC_ENTIDAD: TOvcDbPictureField;
    BtnTDC: TSpeedButton;
    TDC_VAUCHE: TOvcDbPictureField;
    lbCHE: TLabel;
    CHE_ENTIDAD: TOvcDbPictureField;
    BtnCHE: TSpeedButton;
    Label15: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    BtnTrans: TSpeedButton;
    TRANSF: TOvcDbPictureField;
    TRANSF_ENTIDAD: TOvcDbPictureField;
    TRANSF_VAUCHE: TOvcDbPictureField;
    Label21: TLabel;
    TRANSF_TRM: TOvcDbPictureField;
    Label22: TLabel;
    SISTEMA_CREDITO: TOvcDbPictureField;
    Label23: TLabel;
    SISTEMA_CREDITO_TRM: TOvcDbPictureField;
    ENTIDADES: TMemo;
    VALOR_PAGADO: TOvcDbPictureField;
    VALOR_VUELTO: TOvcDbPictureField;
    procedure FormCreate(Sender: TObject);
    procedure BtnTDDClick(Sender: TObject);
    procedure BtnTDCClick(Sender: TObject);
    procedure BtnCHEClick(Sender: TObject);
    procedure TDD_ENTIDADExit(Sender: TObject);
    procedure TDC_ENTIDADExit(Sender: TObject);
    procedure CHE_ENTIDADExit(Sender: TObject);
    procedure TDD_ENTIDADUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure TDC_ENTIDADUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure CHE_ENTIDADUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure TDD_ENTIDADKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TDC_ENTIDADKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CHE_ENTIDADKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CAR_FECHAINIUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CAR_FECHAINIChange(Sender: TObject);
    procedure CAR_PLAZOChange(Sender: TObject);
    procedure DsMaestroDataChange(Sender: TObject; Field: TField);
    Procedure OnChangeValue(pSender : TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PENDIENTEUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure TRANSF_ENTIDADExit(Sender: TObject);
    procedure BtnTransClick(Sender: TObject);
    procedure TRANSF_ENTIDADKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TRANSF_ENTIDADUserValidation(Sender: TObject;
      var ErrorCode: Word);
  private
    { Private declarations }
    FTRM        : Double ;
    FDATAKEY    : String ;
    FCALCULANDO : Boolean;
    Function Abrir_Archivo(Const pTable : Integer) : Boolean;
    Procedure Cerrar_Archivo;
    Function Modo_Edicion : Boolean;
  public
    { Public declarations }
  end;

var
  FrForma_Pago_Resumida: TFrForma_Pago_Resumida;
Function Show_Form_Forma_Pago_Resumida(pKey_Data : String; pValue, pTrm : Double) : Boolean;
Function Show_Form_Forma_Pago_Resumida_Preview(pKey_Data : String; pValue, pTrm : Double) : Boolean;

implementation
{$R *.dfm}
Uses
  Math,
  
  UtFecha,
  
  UtConexion,
  UtFunciones,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  Form_Busqueda,
  UtHomologacion,
  UtVariablesGlobales,
  Form_Detalle_Comentario;

{ TFrDocumento_Forma_Pago }

Function TFrForma_Pago_Resumida.Modo_Edicion : Boolean;
Begin
  Result := DsMaestro.State In [dsInsert, dsEdit];
End;

procedure TFrForma_Pago_Resumida.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If ModalResult = mrOk Then
  Begin
    CanClose := Self.Validate_Form(Self);
    If CanClose Then
    Begin
      PENDIENTE.ValidateSelf;
      CanClose := PENDIENTE.LastError = 0;
      If Not CanClose Then
        Mensajes('Hay pago pendiente por favor defnir los valores de pago');
    End;
  End;
end;

procedure TFrForma_Pago_Resumida.FormCreate(Sender: TObject);
begin
  Paginas.ActivePageIndex    := 0;
  FCALCULANDO                := False;
  Self.Caption               := 'FORMA DE PAGO';
  EFE.OnExit                 := OnChangeValue  ;
  TDD.OnExit                 := OnChangeValue  ;
  TDC.OnExit                 := OnChangeValue  ;
  CHE.OnExit                 := OnChangeValue  ;
  SDX.OnExit                 := OnChangeValue  ;
  COR.OnExit                 := OnChangeValue  ;
  CAR.OnExit                 := OnChangeValue  ;
  TRANSF.OnExit              := OnChangeValue  ;
  EFE_TRM.OnExit             := OnChangeValue  ;
  TDD_TRM.OnExit             := OnChangeValue  ;
  TDC_TRM.OnExit             := OnChangeValue  ;
  CHE_TRM.OnExit             := OnChangeValue  ;
  SDX_TRM.OnExit             := OnChangeValue  ;
  COR_TRM.OnExit             := OnChangeValue  ;
  CAR_TRM.OnExit             := OnChangeValue  ;
  TRANSF_TRM.OnExit          := OnChangeValue  ;
  SISTEMA_CREDITO.OnExit     := OnChangeValue  ;
  SISTEMA_CREDITO_TRM.OnExit := OnChangeValue  ;
  VALOR_PAGADO.OnExit        := OnChangeValue  ;
  Self.Setting_Form(Self, -1, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Self.ActiveControl := EFE;
end;

procedure TFrForma_Pago_Resumida.OnChangeValue(pSender: TObject);
begin
  If FCALCULANDO Then
    Exit;
  FCALCULANDO := True;
  ENTIDADES.Lines.Clear;
  PAGADO.AsFloat := EFE.Field.AsFloat +
                    TDD.Field.AsFloat +
                    TDC.Field.AsFloat +
                    CHE.Field.AsFloat +
                    SDX.Field.AsFloat +
                    COR.Field.AsFloat +
                    CAR.Field.AsFloat +
                    TRANSF.Field.AsFloat +
                    SISTEMA_CREDITO.Field.AsFloat ;

  EFE_TRM.Field.AsFloat := 0;
  TDD_TRM.Field.AsFloat := 0;
  TDC_TRM.Field.AsFloat := 0;
  CHE_TRM.Field.AsFloat := 0;
  SDX_TRM.Field.AsFloat := 0;
  COR_TRM.Field.AsFloat := 0;
  CAR_TRM.Field.AsFloat := 0;
  TRANSF_TRM.Field.AsFloat := 0;

  If FTRM > 0 Then
  Begin
    EFE_TRM.Field.AsFloat := EFE.Field.AsFloat / FTRM;
    TDD_TRM.Field.AsFloat := TDD.Field.AsFloat / FTRM;
    TDC_TRM.Field.AsFloat := TDC.Field.AsFloat / FTRM;
    CHE_TRM.Field.AsFloat := CHE.Field.AsFloat / FTRM;
    SDX_TRM.Field.AsFloat := SDX.Field.AsFloat / FTRM;
    COR_TRM.Field.AsFloat := COR.Field.AsFloat / FTRM;
    CAR_TRM.Field.AsFloat := CAR.Field.AsFloat / FTRM;
    CAR_TRM.Field.AsFloat := CAR.Field.AsFloat / FTRM;
    TRANSF_TRM.Field.AsFloat := TRANSF.Field.AsFloat / FTRM;
  End;

  PAGADO_TRM.AsFloat := EFE_TRM.Field.AsFloat +
                        TDD_TRM.Field.AsFloat +
                        TDC_TRM.Field.AsFloat +
                        CHE_TRM.Field.AsFloat +
                        SDX_TRM.Field.AsFloat +
                        COR_TRM.Field.AsFloat +
                        CAR_TRM.Field.AsFloat +
                        TRANSF_TRM.Field.AsFloat;

  TDD_ENTIDAD.Visible    := (TDD.Field.AsFloat    > 0) OR (TDD_TRM.Field.AsFloat    > 0);
  TDC_ENTIDAD.Visible    := (TDC.Field.AsFloat    > 0) OR (TDC_TRM.Field.AsFloat    > 0);
  CHE_ENTIDAD.Visible    := (CHE.Field.AsFloat    > 0) OR (CHE_TRM.Field.AsFloat    > 0);
  TRANSF_ENTIDAD.Visible := (TRANSF.Field.AsFloat > 0) OR (TRANSF_TRM.Field.AsFloat > 0);

  CAR_FECHAINI.Visible  := (CAR.Field.AsFloat > 0) OR (CAR_TRM.Field.AsFloat > 0);
  CAR_FECHAFIN.Visible  := (CAR.Field.AsFloat > 0) OR (CAR_TRM.Field.AsFloat > 0);
  CAR_PLAZO.Visible     := (CAR.Field.AsFloat > 0) OR (CAR_TRM.Field.AsFloat > 0);

  TDD_ENTIDAD.Enabled    := TDD_ENTIDAD.Visible;
  TDC_ENTIDAD.Enabled    := TDC_ENTIDAD.Visible;
  CHE_ENTIDAD.Enabled    := CHE_ENTIDAD.Visible;
  TRANSF_ENTIDAD.Enabled := TRANSF_ENTIDAD.Visible;

  CAR_FECHAINI.Visible  := CAR_FECHAINI.Enabled;
  CAR_FECHAFIN.Visible  := CAR_FECHAFIN.Enabled;
  CAR_PLAZO.Visible     := CAR_PLAZO.Enabled   ;

  BtnTDD.Visible        := (TDD.Field.AsFloat > 0) OR (TDD_TRM.Field.AsFloat > 0);
  BtnTDC.Visible        := (TDC.Field.AsFloat > 0) OR (TDC_TRM.Field.AsFloat > 0);
  BtnCHE.Visible        := (CHE.Field.AsFloat > 0) OR (CHE_TRM.Field.AsFloat > 0);
  BtnTrans.Visible      := (TRANSF.Field.AsFloat > 0) OR (TRANSF_TRM.Field.AsFloat > 0);
  TDD_VAUCHE.Visible    := BtnTDD.Visible;
  TDC_VAUCHE.Visible    := BtnTDC.Visible;
  TRANSF_VAUCHE.Visible := BtnTrans.Visible;

  ENTIDADES.Visible := (TDD.Field.AsFloat > 0) OR (TDD_TRM.Field.AsFloat > 0) OR
                       (TDC.Field.AsFloat > 0) OR (TDC_TRM.Field.AsFloat > 0) OR
                       (CHE.Field.AsFloat > 0) OR (CHE_TRM.Field.AsFloat > 0) OR
                       (TRANSF.Field.AsFloat > 0) OR (TRANSF_TRM.Field.AsFloat > 0);


  If Not TDD_ENTIDAD.Visible Then
  Begin
    TDD_ENTIDAD.Field.Clear;
    TDD_VAUCHE.Field.Clear;
  End;

  If Not TDC.Visible Then
  Begin
    TDC_ENTIDAD.Field.Clear;
    TDC_VAUCHE.Field.Clear;
  End;

  If Not CHE_ENTIDAD.Visible Then
  Begin
    CHE_ENTIDAD.Field.Clear;
  End;

  If Not TRANSF_ENTIDAD.Visible Then
  Begin
    TRANSF_ENTIDAD.Field.Clear;
    TRANSF_VAUCHE.Field.Clear;
  End;

  Pag03.TabVisible      := CAR_FECHAINI.Visible Or CAR_FECHAFIN.Visible Or CAR_PLAZO.Visible;
  PENDIENTE.AsFloat     := TOTAL.AsFloat - PAGADO.AsFloat;
  PENDIENTE_TRM.AsFloat := TOTAL_TRM.AsFloat - PAGADO_TRM.AsFloat;
  VALOR_VUELTO.Field.AsFloat  := VALOR_PAGADO.AsFloat - EFE.AsFloat;
  FCALCULANDO := False;
end;

procedure TFrForma_Pago_Resumida.PENDIENTEUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If PENDIENTE.AsFloat <> 0 Then
    ErrorCode := IE_VALUE_INVALID;
end;

Function TFrForma_Pago_Resumida.Abrir_Archivo(Const pTable : Integer) : Boolean;
Begin
  Try
    QrMaestro.Active := False;
    Configurar_Conexion_Segura(QrMaestro);
    QrMaestro.SQL.Clear;
    QrMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(pTable).Name + ' ');
    QrMaestro.SQL.Add(' WHERE '  + Trim_Sentence('DATAKEY') +  ' = ' + QuotedStr(Trim(FDATAKEY)));
    QrMaestro.Active := True;
    Result := QrMaestro.Active And (QrMaestro.RecordCount > 0);
    If Result Then
    Begin
      COR.Enabled := (QrMaestro.FieldByName('TIPO_DOCUMENTO').AsString <> Const_Documento_CXC) And
                     (QrMaestro.FieldByName('TIPO_DOCUMENTO').AsString <> Const_Documento_CXP);
      CAR.Enabled := COR.Enabled;
      Pag03.TabVisible := COR.Enabled;
      QrMaestro.Edit;
    End;
  Except
    On E: Exception Do
    Begin
      Result := False;
      UtLog_Execute('TFrDocumento_Forma_Pago.Abrir_Archivo, ' + E.Message);
    End;
  End;
End;

procedure TFrForma_Pago_Resumida.BtnCHEClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO'], ['CODIGO_TERCERO'], Retornar_Info_Tabla(Id_Tercero).Name, 'ID_BANCO =' + QuotedStr('S'), Retornar_Info_Tabla(Id_Tercero).Caption, lResult01, lResult02, lResult03) Then
      CHE_ENTIDAD.Field.AsString := lResult01;
end;

procedure TFrForma_Pago_Resumida.BtnTDCClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO'], ['CODIGO_TERCERO'], Retornar_Info_Tabla(Id_Tercero).Name, 'ID_BANCO =' + QuotedStr('S'), Retornar_Info_Tabla(Id_Tercero).Caption, lResult01, lResult02, lResult03) Then
      TDC_ENTIDAD.Field.AsString := lResult01;
end;

procedure TFrForma_Pago_Resumida.BtnTDDClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO'], ['CODIGO_TERCERO'], Retornar_Info_Tabla(Id_Tercero).Name, 'ID_BANCO =' + QuotedStr('S'), Retornar_Info_Tabla(Id_Tercero).Caption, lResult01, lResult02, lResult03) Then
      TDD_ENTIDAD.Field.AsString := lResult01;
end;

procedure TFrForma_Pago_Resumida.BtnTransClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO'], ['CODIGO_TERCERO'], Retornar_Info_Tabla(Id_Tercero).Name, 'ID_BANCO =' + QuotedStr('S'), Retornar_Info_Tabla(Id_Tercero).Caption, lResult01, lResult02, lResult03) Then
      TRANSF_ENTIDAD.Field.AsString := lResult01;
end;

procedure TFrForma_Pago_Resumida.CAR_FECHAINIChange(Sender: TObject);
Var
  lFecha : TFecha_Info;
begin
  If Modo_Edicion Then
    If Fecha_Valida(TOvcDbPictureField(Sender).EditString) Then
    Begin
      lFecha := Return_Type_Year_Month_Day(TOvcDbPictureField(Sender).EditString);
      lFecha := Return_Type_Date(lFecha.DateTime + CAR_PLAZO.AsFloat);
      CAR_FECHAFIN.Field.AsString := lFecha.yyyy_mm_dd;
    End;
end;

procedure TFrForma_Pago_Resumida.CAR_FECHAINIUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Not Fecha_Valida(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_DATE_INVALID;
end;

procedure TFrForma_Pago_Resumida.CAR_PLAZOChange(Sender: TObject);
Var
  lFecha : TFecha_Info;
begin
  If Modo_Edicion Then
    If Fecha_Valida(CAR_FECHAINI.EditString) Then
    Begin
      lFecha := Return_Type_Year_Month_Day(CAR_FECHAINI.EditString);
      lFecha := Return_Type_Date(lFecha.DateTime + CAR_PLAZO.AsFloat);
      CAR_FECHAFIN.Field.AsString := lFecha.yyyy_mm_dd;
    End;
end;

Procedure TFrForma_Pago_Resumida.Cerrar_Archivo;
Begin
  If QrMaestro.Active Then
    QrMaestro.Active := False;
End;


procedure TFrForma_Pago_Resumida.CHE_ENTIDADExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrForma_Pago_Resumida.CHE_ENTIDADKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnCHE.Click;
end;

procedure TFrForma_Pago_Resumida.CHE_ENTIDADUserValidation(Sender: TObject; var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not Existe_Registro(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TOvcDbPictureField(Sender).EditString], 'TFrDocumento_Forma_Pago.CODIGO_TERCERO_CHEUserValidation') Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrForma_Pago_Resumida.DsMaestroDataChange(Sender: TObject;
  Field: TField);
begin
  If Not QrMaestro.Active Then
    Exit;

  CAR_FECHAINI.Enabled := CAR.AsFloat > 0;
  CAR_PLAZO.Enabled    := CAR.AsFloat > 0;
  CAR_FECHAFIN.Enabled := CAR.AsFloat > 0;

  If (Assigned(Field) And (Field.FullName = CAR.Field.FullName)) And (CAR.AsFloat > 0) Then
  Begin
    CAR_FECHAINI.Field.AsString := QrMaestro.FieldByName('FECHA_DOCUMENTO'  ).AsString;
    CAR_PLAZO.Field.AsFloat     := QrMaestro.FieldByName('PLAZO'            ).AsFloat ;
    CAR_FECHAFIN.Field.AsString := QrMaestro.FieldByName('FECHA_VENCIMIENTO').AsString;
  End;

  If Assigned(Field) Then
    If (Field.FullName = CAR_FECHAINI.Field.FullName) Then
    Begin
      QrMaestro.FieldByName('FECHA_DOCUMENTO'  ).AsString := CAR_FECHAINI.Field.AsString;
      QrMaestro.FieldByName('PLAZO'            ).AsFloat  := CAR_PLAZO.Field.AsFloat    ;
      QrMaestro.FieldByName('FECHA_VENCIMIENTO').AsString := CAR_FECHAFIN.Field.AsString;
    End;

  ENTIDADES.Lines.Clear;
  ENTIDADES.Lines.Add('TDB: ' + Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TDD_ENTIDAD.Field.AsString   ], ['NOMBRE'], 'TFrDocumento_Forma_Pago.DsMaestroDataChange'));
  ENTIDADES.Lines.Add('TDC: ' + Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TDC_ENTIDAD.Field.AsString   ], ['NOMBRE'], 'TFrDocumento_Forma_Pago.DsMaestroDataChange'));
  ENTIDADES.Lines.Add('CHEQUE: ' + Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [CHE_ENTIDAD.Field.AsString   ], ['NOMBRE'], 'TFrDocumento_Forma_Pago.DsMaestroDataChange'));
  ENTIDADES.Lines.Add('TRANSFERENCIA: ' + Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TRANSF_ENTIDAD.Field.AsString], ['NOMBRE'], 'TFrDocumento_Forma_Pago.DsMaestroDataChange'));
end;

procedure TFrForma_Pago_Resumida.TDC_ENTIDADExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrForma_Pago_Resumida.TDC_ENTIDADKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnTDC.Click;
end;

procedure TFrForma_Pago_Resumida.TDC_ENTIDADUserValidation(
  Sender: TObject; var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not Existe_Registro(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TOvcDbPictureField(Sender).EditString], 'TFrDocumento_Forma_Pago.CODIGO_TERCERO_TDCUserValidation') Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

Procedure TFrForma_Pago_Resumida.TDD_ENTIDADExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrForma_Pago_Resumida.TDD_ENTIDADKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnTDD.Click;
end;

procedure TFrForma_Pago_Resumida.TDD_ENTIDADUserValidation(
  Sender: TObject; var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not Existe_Registro(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TOvcDbPictureField(Sender).EditString], 'TFrDocumento_Forma_Pago.CODIGO_TERCERO_TDDUserValidation') Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrForma_Pago_Resumida.TRANSF_ENTIDADExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrForma_Pago_Resumida.TRANSF_ENTIDADKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnTrans.Click;
end;

procedure TFrForma_Pago_Resumida.TRANSF_ENTIDADUserValidation(Sender: TObject;  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not Existe_Registro(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TOvcDbPictureField(Sender).EditString], 'TFrForma_Pago_Resumida.TRANSF_ENTIDADUserValidation') Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

Function Actualizar_Valores_Pago(Const pDataKey : String; pValor_Pago, pValor_Vuelto : Double) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT * FROM  ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + Trim_Sentence('DATAKEY'    ) + ' = ' + QuotedStr(Trim(pDataKey)));
    lSQL.Active := True ;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.Edit;
      lSQL.FieldByName('VALOR_PAGADO').AsFloat :=pValor_Pago;
      lSQL.FieldByName('VALOR_VUELTO').AsFloat :=pValor_Vuelto;
      lSQL.Post;
      Result := True;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       UtLog_Execute('Form_Documento_Forma_Pago, Actualizar_Valores_Pago, ' + E.Message);
  End;
End;

Function Show_Form_Forma_Pago_Resumida(pKey_Data : String; pValue, pTrm : Double) : Boolean;
Var
  lDif : Double;
  lValue : Double;
  lVueltos : Double;
  lValor_Pago : Double;
Begin
  lValue := 0;
  lVueltos := 0;
  lValor_Pago := 0;
  Result := False;
  FrForma_Pago_Resumida := TFrForma_Pago_Resumida.Create(Nil);
  FrForma_Pago_Resumida.Paginas.ActivePageIndex := 0;
  FrForma_Pago_Resumida.FTRM              := pTrm             ;
  FrForma_Pago_Resumida.TOTAL.AsFloat     := pValue           ;
  FrForma_Pago_Resumida.TOTAL_TRM.AsFloat := IfThen(pTrm > 0, pValue / pTrm);
  FrForma_Pago_Resumida.FDATAKEY          := pKey_Data        ;
  If FrForma_Pago_Resumida.Abrir_Archivo(Id_Documento_Enc) Then
  Begin
    If FrForma_Pago_Resumida.EFE.Field.AsFloat <= 0 Then
      FrForma_Pago_Resumida.EFE.Field.AsFloat := pValue
    Else
    Begin
      lDif := pValue - (FrForma_Pago_Resumida.EFE.Field.AsFloat +
                        FrForma_Pago_Resumida.TDD.Field.AsFloat +
                        FrForma_Pago_Resumida.TDC.Field.AsFloat +
                        FrForma_Pago_Resumida.CHE.Field.AsFloat +
                        FrForma_Pago_Resumida.TRANSF.Field.AsFloat +
                        FrForma_Pago_Resumida.SDX.Field.AsFloat +
                        FrForma_Pago_Resumida.COR.Field.AsFloat +
                        FrForma_Pago_Resumida.CAR.Field.AsFloat +
                        FrForma_Pago_Resumida.SISTEMA_CREDITO.Field.AsFloat);
      If lDif <> 0 Then
        FrForma_Pago_Resumida.EFE.Field.AsFloat := FrForma_Pago_Resumida.EFE.Field.AsFloat + lDif;
    End;


    FrForma_Pago_Resumida.CAR_PLAZOChange(Nil);
    FrForma_Pago_Resumida.OnChangeValue(Nil);
    Result := (gID_CAPTURA_RAPIDA = 'S');
    If Not Result Then
      Result := FrForma_Pago_Resumida.ShowModal = mrOk;
  End;
  If Result Then
  Begin
    If Not FrForma_Pago_Resumida.Modo_Edicion Then
      FrForma_Pago_Resumida.QrMaestro.Edit;

    If (FrForma_Pago_Resumida.COR.Field.AsFloat > 0) Or
       (FrForma_Pago_Resumida.CAR.Field.AsFloat > 0) Then
    Begin
      Result := Show_Form_Detalle_Comentario(FrForma_Pago_Resumida.FDATAKEY);
    End;
    If Result Then
      lValue := FrForma_Pago_Resumida.EFE.Field.AsFloat;
    If FrForma_Pago_Resumida.Modo_Edicion Then
    Begin
      Try
        lValor_Pago := FrForma_Pago_Resumida.VALOR_PAGADO.AsFloat;
        lVueltos    := FrForma_Pago_Resumida.VALOR_VUELTO.AsFloat  ;
        FrForma_Pago_Resumida.QrMaestro.Post;
      Except
        On E: Exception Do
        Begin
          Result := False;
          UtLog_Execute('Form_Documento_Forma_Pago, Show_Form_Forma_Pago_Resumida, ' + E.Message);
        End;
      End;
    End;
  End;
  FrForma_Pago_Resumida.Cerrar_Archivo;
  FrForma_Pago_Resumida.Free;
  If Result And (lValue > 0) Then
  Begin
    Result := Actualizar_Valores_Pago(pKey_Data, lValor_Pago, lVueltos);
//    Mensajes('Vueltos: ' + gID_MONEDA + ' ' + FormatFloat('###,###,###,##0.#0', lVueltos));
  End;
End;

Function Show_Form_Forma_Pago_Resumida_Preview(pKey_Data : String; pValue, pTrm : Double) : Boolean;
Var
  lDif : Double;
Begin
  lDif := 0;
  Result := False;
  FrForma_Pago_Resumida := TFrForma_Pago_Resumida.Create(Nil);
  FrForma_Pago_Resumida.Paginas.ActivePageIndex := 0;
  FrForma_Pago_Resumida.FTRM              := pTrm             ;
  FrForma_Pago_Resumida.TOTAL.AsFloat     := pValue           ;
  FrForma_Pago_Resumida.TOTAL_TRM.AsFloat := IfThen(pTrm > 0, pValue / pTrm);
  FrForma_Pago_Resumida.FDATAKEY          := pKey_Data        ;
  If FrForma_Pago_Resumida.Abrir_Archivo((Id_Documento_Enc_Aux)) Then
  Begin
    If Not FrForma_Pago_Resumida.Modo_Edicion Then
      FrForma_Pago_Resumida.QrMaestro.Edit;
    If (FrForma_Pago_Resumida.EFE.Field.AsFloat +
        FrForma_Pago_Resumida.TDD.Field.AsFloat +
        FrForma_Pago_Resumida.TDC.Field.AsFloat +
        FrForma_Pago_Resumida.CHE.Field.AsFloat +
        FrForma_Pago_Resumida.TRANSF.Field.AsFloat +
        FrForma_Pago_Resumida.SDX.Field.AsFloat +
        FrForma_Pago_Resumida.COR.Field.AsFloat +
        FrForma_Pago_Resumida.CAR.Field.AsFloat +
        FrForma_Pago_Resumida.SISTEMA_CREDITO.Field.AsFloat) <= 0 Then
    Begin
      FrForma_Pago_Resumida.EFE.Field.AsFloat := pValue;
    End
    Else
    Begin
      lDif := pValue - (FrForma_Pago_Resumida.EFE.Field.AsFloat +
                        FrForma_Pago_Resumida.TDD.Field.AsFloat +
                        FrForma_Pago_Resumida.TDC.Field.AsFloat +
                        FrForma_Pago_Resumida.CHE.Field.AsFloat +
                        FrForma_Pago_Resumida.TRANSF.Field.AsFloat +
                        FrForma_Pago_Resumida.SDX.Field.AsFloat +
                        FrForma_Pago_Resumida.COR.Field.AsFloat +
                        FrForma_Pago_Resumida.CAR.Field.AsFloat +
                        FrForma_Pago_Resumida.SISTEMA_CREDITO.Field.AsFloat);
      If lDif <> 0 Then
        FrForma_Pago_Resumida.EFE.Field.AsFloat := FrForma_Pago_Resumida.EFE.Field.AsFloat + lDif;
    End;
    FrForma_Pago_Resumida.CAR_PLAZOChange(Nil);
    FrForma_Pago_Resumida.OnChangeValue(Nil);
    Result := FrForma_Pago_Resumida.ShowModal = mrOk;
    If Result And FrForma_Pago_Resumida.Modo_Edicion Then
      FrForma_Pago_Resumida.QrMaestro.Post;
  End;
  FrForma_Pago_Resumida.Cerrar_Archivo;
  FrForma_Pago_Resumida.Free;
End;

end.
