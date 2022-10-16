unit Form_Documento_Forma_Pago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, StdCtrls, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf,
  Buttons, ComCtrls, UtFormularios;

type
  TFrDocumento_Forma_Pago = class(TObjForm)
    Paginas: TPageControl;
    Pag00: TTabSheet;
    lb1: TLabel;
    lb3: TLabel;
    lb4: TLabel;
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
    Pag02: TTabSheet;
    BtnTDC: TSpeedButton;
    BtnCHE: TSpeedButton;
    BtnTDD: TSpeedButton;
    TDC_ENTIDAD: TOvcDbPictureField;
    CHE_ENTIDAD: TOvcDbPictureField;
    TDD_ENTIDAD: TOvcDbPictureField;
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
    lbTDD: TLabel;
    lbTDC: TLabel;
    lbCHE: TLabel;
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
    TDD_VAUCHE: TOvcDbPictureField;
    TDC_VAUCHE: TOvcDbPictureField;
    Label20: TLabel;
    TRANSF: TOvcDbPictureField;
    Label22: TLabel;
    SISTEMA_CREDITO: TOvcDbPictureField;
    BtnTrans: TSpeedButton;
    TRANSF_ENTIDAD: TOvcDbPictureField;
    TRANSF_VAUCHE: TOvcDbPictureField;
    LBTRANSF: TLabel;
    Label21: TLabel;
    TRANSF_TRM: TOvcDbPictureField;
    Label23: TLabel;
    SISTEMA_CREDITO_TRM: TOvcDbPictureField;
    ENTIDADES: TMemo;
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
    procedure TRANSF_ENTIDADKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TRANSF_ENTIDADUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure BtnTransClick(Sender: TObject);
  private
    { Private declarations }
    FTRM        : Double ;
    FID_TABLA   : Integer;
    FDATAKEY    : String ;
    FCALCULANDO : Boolean;
    Function Abrir_Archivo(Const pTable : Integer) : Boolean;
    Procedure Cerrar_Archivo;
    Function Modo_Edicion : Boolean;
  public
    { Public declarations }
  end;

var
  FrDocumento_Forma_Pago: TFrDocumento_Forma_Pago;
Function Show_Form_Documento_Forma_Pago(Const pKey_Data : String; Const pValue, pTrm : Double; Const pId : Integer) : Boolean;
Function Show_Form_Documento_Forma_Pago_Preview(Const pKey_Data : String; Const pValue, pTrm : Double; Const pId : Integer) : Boolean;

implementation
{$R *.dfm}
Uses
  Math,
  UtFecha,
  UtConexion,
  UtFunciones,
  Form_Opcion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  Form_Busqueda,
  Form_Calcular,
  UtVariablesGlobales,
  Form_Detalle_Comentario;

{ TFrDocumento_Forma_Pago }

Function TFrDocumento_Forma_Pago.Modo_Edicion : Boolean;
Begin
  Result := DsMaestro.State In [dsInsert, dsEdit];
End;

procedure TFrDocumento_Forma_Pago.FormCloseQuery(Sender: TObject;
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

procedure TFrDocumento_Forma_Pago.FormCreate(Sender: TObject);
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
  Self.Setting_Form(Self, -1, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Self.ActiveControl := EFE;
end;

procedure TFrDocumento_Forma_Pago.OnChangeValue(pSender: TObject);
begin
  If FCALCULANDO Then
    Exit;
  FCALCULANDO := True;
  PAGADO.AsFloat := EFE.Field.AsFloat +
                    TDD.Field.AsFloat +
                    TDC.Field.AsFloat +
                    CHE.Field.AsFloat +
                    SDX.Field.AsFloat +
                    COR.Field.AsFloat +
                    CAR.Field.AsFloat +
                    TRANSF.Field.AsFloat +
                    SISTEMA_CREDITO.Field.AsFloat;

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
    TRANSF_TRM.Field.AsFloat := TRANSF.Field.AsFloat / FTRM;
  End;

  PAGADO_TRM.AsFloat := EFE_TRM.Field.AsFloat +
                        TDD_TRM.Field.AsFloat +
                        TDC_TRM.Field.AsFloat +
                        CHE_TRM.Field.AsFloat +
                        SDX_TRM.Field.AsFloat +
                        COR_TRM.Field.AsFloat +
                        CAR_TRM.Field.AsFloat +
                        TRANSF_TRM.Field.AsFloat ;

  TDD_ENTIDAD.Visible    := (TDD.Field.AsFloat > 0) OR (TDD_TRM.Field.AsFloat > 0);
  TDC_ENTIDAD.Visible    := (TDC.Field.AsFloat > 0) OR (TDC_TRM.Field.AsFloat > 0);
  TRANSF_ENTIDAD.Visible := (TRANSF.Field.AsFloat > 0) OR (TRANSF_TRM.Field.AsFloat > 0);
  TDD_VAUCHE.Visible     := (TDD.Field.AsFloat > 0) OR (TDD_TRM.Field.AsFloat > 0);
  TDC_VAUCHE.Visible     := (TDC.Field.AsFloat > 0) OR (TDC_TRM.Field.AsFloat > 0);
  TRANSF_VAUCHE.Visible  := (TRANSF.Field.AsFloat > 0) OR (TRANSF_TRM.Field.AsFloat > 0);
  CHE_ENTIDAD.Visible    := (CHE.Field.AsFloat > 0) OR (CHE_TRM.Field.AsFloat > 0);
  CAR_FECHAINI.Visible   := (CAR.Field.AsFloat > 0) OR (CAR_TRM.Field.AsFloat > 0);
  CAR_FECHAFIN.Visible   := (CAR.Field.AsFloat > 0) OR (CAR_TRM.Field.AsFloat > 0);
  CAR_PLAZO.Visible      := (CAR.Field.AsFloat > 0) OR (CAR_TRM.Field.AsFloat > 0);

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

  ENTIDADES.Visible     := (TDD.Field.AsFloat > 0) OR (TDD_TRM.Field.AsFloat > 0) OR
                           (TDC.Field.AsFloat > 0) OR (TDC_TRM.Field.AsFloat > 0) OR
                           (CHE.Field.AsFloat > 0) OR (CHE_TRM.Field.AsFloat > 0) OR
                           (TRANSF.Field.AsFloat > 0) OR (TRANSF_TRM.Field.AsFloat > 0);


  lbTDD.Visible := (TDD.Field.AsFloat > 0) OR (TDD_TRM.Field.AsFloat > 0);
  lbTDC.Visible := (TDC.Field.AsFloat > 0) OR (TDC_TRM.Field.AsFloat > 0);
  lbCHE.Visible := (CHE.Field.AsFloat > 0) OR (CHE_TRM.Field.AsFloat > 0);
  LBTRANSF.Visible := (TRANSF.Field.AsFloat > 0) OR (TRANSF_TRM.Field.AsFloat > 0);

  If Not TDD_ENTIDAD.Visible Then
  Begin
    TDD_ENTIDAD.Field.Clear;
    TDD_VAUCHE.Field.Clear;
  End;

  If Not TDC.Visible Then
  Begin
    TDC.Field.Clear;
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

  Pag02.TabVisible := TDD_ENTIDAD.Visible Or TDC_ENTIDAD.Visible Or CHE_ENTIDAD.Visible;
  Pag03.TabVisible := CAR_FECHAINI.Visible Or CAR_FECHAFIN.Visible Or CAR_PLAZO.Visible;
  PENDIENTE.AsFloat := TOTAL.AsFloat - PAGADO.AsFloat;
  PENDIENTE_TRM.AsFloat := TOTAL_TRM.AsFloat - PAGADO_TRM.AsFloat;
  FCALCULANDO := False;
end;

procedure TFrDocumento_Forma_Pago.PENDIENTEUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If PENDIENTE.AsFloat <> 0 Then
    ErrorCode := IE_VALUE_INVALID;
end;

Function TFrDocumento_Forma_Pago.Abrir_Archivo(Const pTable : Integer) : Boolean;
Begin
  Try
    TbMaestro.Active := False;
    TbMaestro.SQL.Clear;
    TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(pTable).Name + ' ');
    TbMaestro.SQL.Add(' WHERE '  + CNX.Trim_Sentence('DATAKEY') +  ' = ' + QuotedStr(Trim(FDATAKEY)));
    TbMaestro.Active := True;
    Result := TbMaestro.Active And (TbMaestro.RecordCount > 0);
    If Result Then
    Begin
      COR.Enabled := (TbMaestro.FieldByName('TIPO_DOCUMENTO').AsString <> Const_Documento_CXC) And
                     (TbMaestro.FieldByName('TIPO_DOCUMENTO').AsString <> Const_Documento_CXP);
      CAR.Enabled := COR.Enabled;
      Pag03.TabVisible := COR.Enabled;
      TbMaestro.Edit;
//      EFE.Field.AsFloat := 0;
//      TDD.Field.AsFloat := 0;
//      TDC.Field.AsFloat := 0;
//      CHE.Field.AsFloat := 0;
//      SDX.Field.AsFloat := 0;
//      COR.Field.AsFloat := 0;
//      CAR.Field.AsFloat := 0;
    End;
  Except
    On E: Exception Do
    Begin
      Result := False;
      gVariableGlobal.Add_Log(e, ['Origen', 'TFrDocumento_Forma_Pago.Abrir_Archivo']);
    End;
  End;
End;

procedure TFrDocumento_Forma_Pago.BtnCHEClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO'], ['CODIGO_TERCERO'], Retornar_Info_Tabla(Id_Tercero).Name, '', Retornar_Info_Tabla(Id_Tercero).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CHE_ENTIDAD.Field.AsString := lResult01;
end;

procedure TFrDocumento_Forma_Pago.BtnTDCClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO'], ['CODIGO_TERCERO'], Retornar_Info_Tabla(Id_Tercero).Name, '', Retornar_Info_Tabla(Id_Tercero).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TDC_ENTIDAD.Field.AsString := lResult01;
end;

procedure TFrDocumento_Forma_Pago.BtnTDDClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO'], ['CODIGO_TERCERO'], Retornar_Info_Tabla(Id_Tercero).Name, '', Retornar_Info_Tabla(Id_Tercero).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TDD_ENTIDAD.Field.AsString := lResult01;
end;

procedure TFrDocumento_Forma_Pago.BtnTransClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO'], ['CODIGO_TERCERO'], Retornar_Info_Tabla(Id_Tercero).Name, 'ID_BANCO =' + QuotedStr('S'), Retornar_Info_Tabla(Id_Tercero).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TRANSF_ENTIDAD.Field.AsString := lResult01;
end;

procedure TFrDocumento_Forma_Pago.CAR_FECHAINIChange(Sender: TObject);
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

procedure TFrDocumento_Forma_Pago.CAR_FECHAINIUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Not Fecha_Valida(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_DATE_INVALID;
end;

procedure TFrDocumento_Forma_Pago.CAR_PLAZOChange(Sender: TObject);
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

Procedure TFrDocumento_Forma_Pago.Cerrar_Archivo;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;


procedure TFrDocumento_Forma_Pago.CHE_ENTIDADExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrDocumento_Forma_Pago.CHE_ENTIDADKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnCHE.Click;
end;

procedure TFrDocumento_Forma_Pago.CHE_ENTIDADUserValidation(
  Sender: TObject; var ErrorCode: Word);
begin
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;
end;

procedure TFrDocumento_Forma_Pago.DsMaestroDataChange(Sender: TObject;
  Field: TField);
begin
  If Not TbMaestro.Active Then
    Exit;

  CAR_FECHAINI.Enabled := CAR.AsFloat > 0;
  CAR_PLAZO.Enabled    := CAR.AsFloat > 0;
  CAR_FECHAFIN.Enabled := CAR.AsFloat > 0;

  If (Assigned(Field) And (Field.FullName = CAR.Field.FullName)) And (CAR.AsFloat > 0) Then
  Begin
    CAR_FECHAINI.Field.AsString := TbMaestro.FieldByName('FECHA_DOCUMENTO'  ).AsString;
    CAR_PLAZO.Field.AsFloat     := TbMaestro.FieldByName('PLAZO'            ).AsFloat ;
    CAR_FECHAFIN.Field.AsString := TbMaestro.FieldByName('FECHA_VENCIMIENTO').AsString;
  End;

  If Assigned(Field) Then
    If (Field.FullName = CAR_FECHAINI.Field.FullName) Then
    Begin
      TbMaestro.FieldByName('FECHA_DOCUMENTO'  ).AsString := CAR_FECHAINI.Field.AsString;
      TbMaestro.FieldByName('PLAZO'            ).AsFloat  := CAR_PLAZO.Field.AsFloat    ;
      TbMaestro.FieldByName('FECHA_VENCIMIENTO').AsString := CAR_FECHAFIN.Field.AsString;
    End;

  ENTIDADES.Lines.Clear;
  ENTIDADES.Lines.Add('TDB: ' + CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TDD_ENTIDAD.Field.AsString   ], ['NOMBRE'], 'TFrDocumento_Forma_Pago.DsMaestroDataChange'));
  ENTIDADES.Lines.Add('TDC: ' + CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TDC_ENTIDAD.Field.AsString   ], ['NOMBRE'], 'TFrDocumento_Forma_Pago.DsMaestroDataChange'));
  ENTIDADES.Lines.Add('CHEQUE: ' + CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [CHE_ENTIDAD.Field.AsString   ], ['NOMBRE'], 'TFrDocumento_Forma_Pago.DsMaestroDataChange'));
  ENTIDADES.Lines.Add('TRANSFERENCIA: ' + CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TRANSF_ENTIDAD.Field.AsString], ['NOMBRE'], 'TFrDocumento_Forma_Pago.DsMaestroDataChange'));
end;

procedure TFrDocumento_Forma_Pago.TDC_ENTIDADExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrDocumento_Forma_Pago.TDC_ENTIDADKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnTDC.Click;
end;

procedure TFrDocumento_Forma_Pago.TDC_ENTIDADUserValidation(
  Sender: TObject; var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

Procedure TFrDocumento_Forma_Pago.TDD_ENTIDADExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrDocumento_Forma_Pago.TDD_ENTIDADKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnTDD.Click;
end;

procedure TFrDocumento_Forma_Pago.TDD_ENTIDADUserValidation(
  Sender: TObject; var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrDocumento_Forma_Pago.TRANSF_ENTIDADExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrDocumento_Forma_Pago.TRANSF_ENTIDADKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnTrans.Click;
end;

procedure TFrDocumento_Forma_Pago.TRANSF_ENTIDADUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

Function Actualizar_Valor_Pago_Efectivo(Const pDataKey : String; pEfe, pValor_Pago, pValor_Vuelto : Double; Const pId, pTipo : Integer) : Boolean;
Begin
  Result := False;
  Try
    gVariableGlobal.CNX.TMP.Active := False;
    gVariableGlobal.CNX.TMP.SQL.Clear;
    gVariableGlobal.CNX.TMP.SQL.Add(' SELECT * FROM  ' + Retornar_Info_Tabla(pId).Name + ' ');
    gVariableGlobal.CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY'    ) + ' = ' + QuotedStr(Trim(pDataKey)));
    gVariableGlobal.CNX.TMP.Active := True ;
    If gVariableGlobal.CNX.TMP.Active And (gVariableGlobal.CNX.TMP.RecordCount > 0) Then
    Begin
      gVariableGlobal.CNX.TMP.Edit;
      gVariableGlobal.CNX.TMP.FieldByName('EFE'         ).AsFloat := pEfe       ;
      gVariableGlobal.CNX.TMP.FieldByName('VALOR_PAGADO').AsFloat := pValor_Pago;
      gVariableGlobal.CNX.TMP.FieldByName('VALOR_VUELTO').AsFloat := pValor_Vuelto;
      If pTipo = 1 Then
      Begin
        gVariableGlobal.CNX.TMP.FieldByName('TDD'   ).AsFloat := 0;
        gVariableGlobal.CNX.TMP.FieldByName('TDC'   ).AsFloat := 0;
        gVariableGlobal.CNX.TMP.FieldByName('CHE'   ).AsFloat := 0;
        gVariableGlobal.CNX.TMP.FieldByName('SDX'   ).AsFloat := 0;
        gVariableGlobal.CNX.TMP.FieldByName('COR'   ).AsFloat := 0;
        gVariableGlobal.CNX.TMP.FieldByName('CAR'   ).AsFloat := 0;
        gVariableGlobal.CNX.TMP.FieldByName('TRANSF').AsFloat := 0;
      End;
      gVariableGlobal.CNX.TMP.Post;
      Result := True;
    End;
    gVariableGlobal.CNX.TMP.Active := False;
    gVariableGlobal.CNX.TMP.SQL.Clear;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'Form_Documento_Forma_Pago, Actualizar_Valor_Pago_Efectivo']);
  End;
End;

Function Actualizar_Valor_Pago_Transferencia(Const pDataKey : String; pTransf : Double; Const pId : Integer) : Boolean;

Begin
  Result := False;
  Try
    gVariableGlobal.CNX.TMP.Active := False;
    gVariableGlobal.CNX.TMP.SQL.Clear;
    gVariableGlobal.CNX.TMP.SQL.Add(' SELECT * FROM  ' + Retornar_Info_Tabla(pId).Name + ' ');
    gVariableGlobal.CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDataKey)));
    gVariableGlobal.CNX.TMP.Active := True ;
    If gVariableGlobal.CNX.TMP.Active And (gVariableGlobal.CNX.TMP.RecordCount > 0) Then
    Begin
      gVariableGlobal.CNX.TMP.Edit;
      gVariableGlobal.CNX.TMP.FieldByName('TRANSF').AsFloat := pTransf;
      gVariableGlobal.CNX.TMP.FieldByName('TDD'   ).AsFloat := 0;
      gVariableGlobal.CNX.TMP.FieldByName('TDC'   ).AsFloat := 0;
      gVariableGlobal.CNX.TMP.FieldByName('CHE'   ).AsFloat := 0;
      gVariableGlobal.CNX.TMP.FieldByName('SDX'   ).AsFloat := 0;
      gVariableGlobal.CNX.TMP.FieldByName('COR'   ).AsFloat := 0;
      gVariableGlobal.CNX.TMP.FieldByName('CAR'   ).AsFloat := 0;
      gVariableGlobal.CNX.TMP.FieldByName('EFE'   ).AsFloat := 0;
      gVariableGlobal.CNX.TMP.Post;
      Result := True;
    End;
    gVariableGlobal.CNX.TMP.Active := False;
    gVariableGlobal.CNX.TMP.SQL.Clear;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'Form_Documento_Forma_Pago, Actualizar_Valor_Pago_Transferencia']);
  End;
End;

Function Actualizar_Valores_Forma(Const pDataKey : String; Const pValor_Pago, pValor_Vuelto : Double; Const pId : Integer) : Boolean;
Begin
  Result := False;
  Try
    gVariableGlobal.CNX.TMP.Active := False;
    gVariableGlobal.CNX.TMP.SQL.Clear;
    gVariableGlobal.CNX.TMP.SQL.Add(' SELECT * FROM  ' + Retornar_Info_Tabla(pId).Name + ' ');
    gVariableGlobal.CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY'    ) + ' = ' + QuotedStr(Trim(pDataKey)));
    gVariableGlobal.CNX.TMP.Active := True ;
    If gVariableGlobal.CNX.TMP.Active And (gVariableGlobal.CNX.TMP.RecordCount > 0) Then
    Begin
      gVariableGlobal.CNX.TMP.Edit;
      gVariableGlobal.CNX.TMP.FieldByName('VALOR_PAGADO').AsFloat :=pValor_Pago;
      gVariableGlobal.CNX.TMP.FieldByName('VALOR_VUELTO').AsFloat :=pValor_Vuelto;
      gVariableGlobal.CNX.TMP.Post;
      Result := True;
    End;
    gVariableGlobal.CNX.TMP.Active := False;
    gVariableGlobal.CNX.TMP.SQL.Clear;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'Form_Documento_Forma_Pago, Actualizar_Valor_Pago_Efectivo']);
  End;
End;

Function Show_Form_Documento_Forma_Pago(Const pKey_Data : String; Const pValue, pTrm : Double; Const pId : Integer) : Boolean;
Var
  lDif : Double;
  lValue : Double;
  lOpcion : Integer;
  lVueltos : Double;
  lValor_Pago : Double;
Begin
  Result := False;
  If Not (gVariableGlobal.ID_CAPTURA_RAPIDA = 'S') Then
  Begin
    Result := Show_FrOpcion(['Efectivo', 'Transferencia', 'Otros'], lOpcion);
    If Not Result Then
      Exit;
  End
  Else
  Begin
    lOpcion := 1;
    Result := True;
  End;
  If lOpcion = 3 Then
  Begin
    lValue := 0;
    lVueltos := 0;
    lValor_Pago := 0;
    FrDocumento_Forma_Pago := TFrDocumento_Forma_Pago.Create(Nil);
    FrDocumento_Forma_Pago.FID_TABLA := pId;
    FrDocumento_Forma_Pago.Paginas.ActivePageIndex := 0;
    FrDocumento_Forma_Pago.FTRM              := pTrm             ;
    FrDocumento_Forma_Pago.TOTAL.AsFloat     := pValue           ;
    FrDocumento_Forma_Pago.TOTAL_TRM.AsFloat := IfThen(pTrm > 0, pValue / pTrm);
    FrDocumento_Forma_Pago.FDATAKEY          := pKey_Data        ;
    If FrDocumento_Forma_Pago.Abrir_Archivo(pId) Then
    Begin
      If FrDocumento_Forma_Pago.EFE.Field.AsFloat <= 0 Then
        FrDocumento_Forma_Pago.EFE.Field.AsFloat := pValue
      Else
      Begin
        lDif := pValue - (FrDocumento_Forma_Pago.EFE.Field.AsFloat +
                          FrDocumento_Forma_Pago.TDD.Field.AsFloat +
                          FrDocumento_Forma_Pago.TDC.Field.AsFloat +
                          FrDocumento_Forma_Pago.CHE.Field.AsFloat +
                          FrDocumento_Forma_Pago.SDX.Field.AsFloat +
                          FrDocumento_Forma_Pago.COR.Field.AsFloat +
                          FrDocumento_Forma_Pago.CAR.Field.AsFloat +
                          FrDocumento_Forma_Pago.TRANSF.Field.AsFloat+
                          FrDocumento_Forma_Pago.SISTEMA_CREDITO.Field.AsFloat);
        If lDif <> 0 Then
          FrDocumento_Forma_Pago.EFE.Field.AsFloat := FrDocumento_Forma_Pago.EFE.Field.AsFloat + lDif;
      End;
      FrDocumento_Forma_Pago.CAR_PLAZOChange(Nil);
      FrDocumento_Forma_Pago.OnChangeValue(Nil);
      Result := (gVariableGlobal.ID_CAPTURA_RAPIDA = 'S');
      If Not Result Then
        Result := FrDocumento_Forma_Pago.ShowModal = mrOk;
    End;
    If Result Then
    Begin
      If Not FrDocumento_Forma_Pago.Modo_Edicion Then
        FrDocumento_Forma_Pago.TbMaestro.Edit;

      If (FrDocumento_Forma_Pago.COR.Field.AsFloat > 0) Or
         (FrDocumento_Forma_Pago.CAR.Field.AsFloat > 0) Then
      Begin
        Result := Show_Form_Detalle_Comentario(FrDocumento_Forma_Pago.FDATAKEY);
      End;
      If Result Then
        lValue := FrDocumento_Forma_Pago.EFE.Field.AsFloat;
      If FrDocumento_Forma_Pago.Modo_Edicion Then
      Begin
        Try
          FrDocumento_Forma_Pago.TbMaestro.Post;
        Except
          On E: Exception Do
          Begin
            Result := False;
            gVariableGlobal.Add_Log(E, ['Origen', 'Form_Documento_Forma_Pago, Show_Form_Documento_Forma_Pago']);
          End;
        End;
      End;
    End;
    FrDocumento_Forma_Pago.Cerrar_Archivo;
    FrDocumento_Forma_Pago.Free;
  End;
  If (lOpcion = 1) Or (lOpcion = 3) Then
  Begin
    If (lOpcion = 1) Then
      lValue := pValue;
    If Result And (lValue > 0) Then
    Begin
      Result := Show_Calcular(pKey_Data, lValue, lValor_Pago, lVueltos);
      If Result Then
      Begin
        Result := Actualizar_Valor_Pago_Efectivo(pKey_Data, lValue, lValor_Pago, lVueltos, pId, lOpcion);
        Mensajes('Vueltos: ' + gVariableGlobal.ID_MONEDA + ' ' + FormatFloat('###,###,###,##0.#0', lVueltos));
      End;
    End;
  End;
  If (lOpcion = 2) Then
  Begin
    Result := Actualizar_Valor_Pago_Transferencia(pKey_Data, pValue, pId);
  End;

End;

Function Show_Form_Documento_Forma_Pago_Preview(Const pKey_Data : String; Const pValue, pTrm : Double; Const pId : Integer) : Boolean;
Var
  lDif : Double;
Begin
  lDif := 0;
  Result := False;
  FrDocumento_Forma_Pago := TFrDocumento_Forma_Pago.Create(Nil);
  FrDocumento_Forma_Pago.FID_TABLA := pId;
  FrDocumento_Forma_Pago.Paginas.ActivePageIndex := 0;
  FrDocumento_Forma_Pago.FTRM              := pTrm             ;
  FrDocumento_Forma_Pago.TOTAL.AsFloat     := pValue           ;
  FrDocumento_Forma_Pago.TOTAL_TRM.AsFloat := IfThen(pTrm > 0, pValue / pTrm);
  FrDocumento_Forma_Pago.FDATAKEY          := pKey_Data        ;
  If FrDocumento_Forma_Pago.Abrir_Archivo(pId) Then
  Begin
    If Not FrDocumento_Forma_Pago.Modo_Edicion Then
      FrDocumento_Forma_Pago.TbMaestro.Edit;
    If (FrDocumento_Forma_Pago.EFE.Field.AsFloat +
        FrDocumento_Forma_Pago.TDD.Field.AsFloat +
        FrDocumento_Forma_Pago.TDC.Field.AsFloat +
        FrDocumento_Forma_Pago.CHE.Field.AsFloat +
        FrDocumento_Forma_Pago.SDX.Field.AsFloat +
        FrDocumento_Forma_Pago.COR.Field.AsFloat +
        FrDocumento_Forma_Pago.CAR.Field.AsFloat +
        FrDocumento_Forma_Pago.TRANSF.Field.AsFloat+
        FrDocumento_Forma_Pago.SISTEMA_CREDITO.Field.AsFloat) <= 0 Then
    Begin
      FrDocumento_Forma_Pago.EFE.Field.AsFloat := pValue;
    End
    Else
    Begin
      lDif := pValue - (FrDocumento_Forma_Pago.EFE.Field.AsFloat +
                        FrDocumento_Forma_Pago.TDD.Field.AsFloat +
                        FrDocumento_Forma_Pago.TDC.Field.AsFloat +
                        FrDocumento_Forma_Pago.CHE.Field.AsFloat +
                        FrDocumento_Forma_Pago.SDX.Field.AsFloat +
                        FrDocumento_Forma_Pago.COR.Field.AsFloat +
                        FrDocumento_Forma_Pago.CAR.Field.AsFloat +
                        FrDocumento_Forma_Pago.TRANSF.Field.AsFloat+
                        FrDocumento_Forma_Pago.SISTEMA_CREDITO.Field.AsFloat);
      If lDif <> 0 Then
        FrDocumento_Forma_Pago.EFE.Field.AsFloat := FrDocumento_Forma_Pago.EFE.Field.AsFloat + lDif;
    End;
    FrDocumento_Forma_Pago.CAR_PLAZOChange(Nil);
    FrDocumento_Forma_Pago.OnChangeValue(Nil);
    Result := FrDocumento_Forma_Pago.ShowModal = mrOk;
    If Result And FrDocumento_Forma_Pago.Modo_Edicion Then
      FrDocumento_Forma_Pago.TbMaestro.Post;
  End;
  FrDocumento_Forma_Pago.Cerrar_Archivo;
  FrDocumento_Forma_Pago.Free;
End;

end.
