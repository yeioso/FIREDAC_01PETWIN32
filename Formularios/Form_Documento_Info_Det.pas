unit Form_Documento_Info_Det;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, ComCtrls, DB,
  DBCtrls, Buttons, ExtCtrls, UtFormularios;

type
  TFrDocumento_Info_Det = class(TObjForm)
    gnInfo_Detalle: TGroupBox;
    Paginas: TPageControl;
    Pag00: TTabSheet;
    Pag01: TTabSheet;
    pnlBotones: TPanel;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    Label1: TLabel;
    DATAKEY: TOvcDbPictureField;
    CODIGO_PRODUCTO: TOvcDbPictureField;
    NOMBRE: TOvcDbPictureField;
    CONSECUTIVO: TOvcDbPictureField;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    OBSERVACION: TDBMemo;
    gbResultados: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    CANTIDAD: TOvcDbPictureField;
    VALOR_ORIGINAL: TOvcDbPictureField;
    VALOR_UNITARIO: TOvcDbPictureField;
    VALOR_SUBTOTAL: TOvcDbPictureField;
    VALOR_TOTAL: TOvcDbPictureField;
    gbImpuestos: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    PORC_DESCUENTO: TOvcDbPictureField;
    VALOR_DESCUENTO: TOvcDbPictureField;
    PORC_SERVICIO: TOvcDbPictureField;
    VALOR_SERVICIO: TOvcDbPictureField;
    PORC_IVA: TOvcDbPictureField;
    VALOR_IVA: TOvcDbPictureField;
    PORC_RETEIVA: TOvcDbPictureField;
    VALOR_RETEIVA: TOvcDbPictureField;
    PORC_RETEFUENTE: TOvcDbPictureField;
    VALOR_RETEFUENTE: TOvcDbPictureField;
    PORC_ICA: TOvcDbPictureField;
    VALOR_ICA: TOvcDbPictureField;
    PORC_CREE: TOvcDbPictureField;
    VALOR_CREE: TOvcDbPictureField;
    Label20: TLabel;
    PORC_IMPCONSUMO: TOvcDbPictureField;
    VALOR_IMPCONSUMO: TOvcDbPictureField;
    Label21: TLabel;
    VALOR_LP_ENC: TOvcDbPictureField;
    Label22: TLabel;
    VALOR_LP_DET: TOvcDbPictureField;
    Label23: TLabel;
    VALOR_CALCULADO: TOvcDbPictureField;
    Label24: TLabel;
    VALOR_NETO: TOvcDbPictureField;
    Label25: TLabel;
    PORC_INTERES: TOvcDbPictureField;
    VALOR_INTERES: TOvcDbPictureField;
    Label26: TLabel;
    PORC_BASE: TOvcDbPictureField;
    VALOR_BASE: TOvcDbPictureField;
    APLICAR_TODOS: TCheckBox;
    lbFecha_Documento: TLabel;
    BtnFechaVencimiento: TSpeedButton;
    FECHA_VENCIMIENTO: TOvcDbPictureField;
    Label28: TLabel;
    CODIGO_VENDEDOR: TOvcDbPictureField;
    BtnVendedor: TSpeedButton;
    lbNombre_Vendedor: TLabel;
    BtnImpuesto: TSpeedButton;
    lbNombre_Impuesto: TLabel;
    Label29: TLabel;
    CODIGO_IMPUESTO: TOvcDbPictureField;
    BTNSERVICIO_VALOR: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    Procedure Calcular_Campos(pSender : TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnFechaVencimientoClick(Sender: TObject);
    procedure FECHA_VENCIMIENTOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FECHA_VENCIMIENTOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnVendedorClick(Sender: TObject);
    procedure DsDetalleDataChange(Sender: TObject; Field: TField);
    procedure BtnImpuestoClick(Sender: TObject);
    procedure CODIGO_IMPUESTOExit(Sender: TObject);
    procedure CODIGO_IMPUESTOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CODIGO_IMPUESTOUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BTNSERVICIO_VALORClick(Sender: TObject);
  private
    { Private declarations }
    FDATAKEY : String;
    FVALIDATE_DATE : Boolean;
    Function Abrir_Tabla(pDataKey, pConsecutivo : String) : Boolean;
    Function Cerrar_Tabla : Boolean;
    Procedure Acarrear_Porcentaje;
    Procedure Calcular_Detalles;
  public
    { Public declarations }
  end;

var
  FrDocumento_Info_Det: TFrDocumento_Info_Det;
Function Show_Form_Documento_Info_Det(pDataKey, pConsecutivo : String) : Boolean;

implementation
{$R *.dfm}
Uses
  UtFecha,
  UtConexion,
  Form_Fecha,
  UtFunciones,
  UtInfoTablas,
  Form_Busqueda,
  UtManejoError,
  UtCentral_Ventas,
  UtVariablesGlobales,
  UtCalculo_Impuestos,
  Form_GetNewValueDouble;

Procedure TFrDocumento_Info_Det.Acarrear_Porcentaje;
Var
  lI : Integer;
Begin
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name);
    CNX.TMP.SQL.Add(' WHERE ' + CNX.Trim_Sentence('DATAKEY') + ' = '  + QuotedStr(Trim(FDATAKEY )));
    CNX.TMP.Active := True ;
    If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
    Begin
      CNX.TMP.First;
      While Not CNX.TMP.Eof Do
      Begin
        CNX.TMP.Edit;
        For lI := 0 To tbMaestro.Fields.Count-1 Do
          If Pos('PORC_', AnsiUpperCase(Trim(tbMaestro.Fields[lI].FullName))) > 0 Then
            CNX.TMP.FieldByName(tbMaestro.Fields[lI].FullName).Value := tbMaestro.Fields[lI].Value;
        CNX.TMP.Post;
        CNX.TMP.Next;
      End;
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Info_Det.Acarrear_Porcentaje']);
  End;
End;

procedure TFrDocumento_Info_Det.BtnFechaVencimientoClick(Sender: TObject);
Var
  lFecha : String;
begin
  lFecha := FECHA_VENCIMIENTO.EditString;
  If Retornar_Fecha(lFecha) Then
    FECHA_VENCIMIENTO.Field.AsString := lFecha;
end;

procedure TFrDocumento_Info_Det.BtnImpuestoClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_IMPUESTO'], ['CODIGO_IMPUESTO'], Retornar_Info_Tabla(Id_Impuesto).Name, '', Retornar_Info_Tabla(Id_Impuesto).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      CODIGO_IMPUESTO.Field.AsString := lResult01;
end;

procedure TFrDocumento_Info_Det.BTNSERVICIO_VALORClick(Sender: TObject);
Var
  lAux : String;
  lNeto : Double;
  lPorc : Double;
  lServicio : Double;
begin
  lAux := 'Servicio';
  lNeto := CNX.Retornar_Double(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, ['DATAKEY'], [FDATAKEY], ['VALOR_NETO'], 'TFrDocumento_Info_Det.BTNSERVICIO_VALORClick');
  lServicio := CNX.Retornar_Double(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, ['DATAKEY'], [FDATAKEY], ['VALOR_SERVICIO'], 'TFrDocumento_Info_Det.BTNSERVICIO_VALORClick');
  If lNeto > 0 Then
  Begin
    If Show_GetNewValueDouble(lServicio, lServicio, lAux) And (lNeto > 0)Then
    Begin
      lPorc := (lServicio * 100) / lNeto;
      tbMaestro.FieldByName('PORC_SERVICIO').AsFloat := lPorc;
    End;
  End;
end;

procedure TFrDocumento_Info_Det.BtnVendedorClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO'], ['CODIGO_TERCERO'], Retornar_Info_Tabla(Id_Tercero).Name, '', Retornar_Info_Tabla(Id_Tercero).Caption, lResult01, lResult02, lResult03, False, CNX) Then
    CODIGO_VENDEDOR.Field.AsString := lResult01;
end;

Procedure TFrDocumento_Info_Det.Calcular_Campos(pSender : TObject);
Begin
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name);
    CNX.TMP.SQL.Add(' WHERE ' +  CNX.Trim_Sentence('DATAKEY'    ) + ' = '  + QuotedStr(Trim(FDATAKEY )));
    CNX.TMP.Active := True ;
    If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
      Calcular_Impuestos_Detalle(CNX.TMP, TQUERY(tbMaestro));
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Info_Det.Calcular_Campos']);
  End;
End;

Procedure TFrDocumento_Info_Det.Calcular_Detalles;
Begin
  Try
    CNX.TMP00.Active := True ;
    CNX.TMP01.Active := True ;
    CNX.TMP00.SQL.Clear;
    CNX.TMP01.SQL.Clear;

    CNX.TMP00.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name);
    CNX.TMP00.SQL.Add(' WHERE ' + CNX.Trim_Sentence('DATAKEY'    ) + ' = '  + QuotedStr(Trim(FDATAKEY )));
    CNX.TMP00.Active := True ;

    CNX.TMP01.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name);
    CNX.TMP01.SQL.Add(' WHERE ' + CNX.Trim_Sentence('DATAKEY'    ) + ' = '  + QuotedStr(Trim(FDATAKEY )));
    CNX.TMP01.Active := True ;

    If CNX.TMP00.Active And (CNX.TMP00.RecordCount > 0) Then
    Begin
      CNX.TMP01.First;
      While Not CNX.TMP01.Eof Do
      Begin
        Calcular_Impuestos_Detalle(CNX.TMP00, CNX.TMP01);
        CNX.TMP01.Post;
        CNX.TMP01.Next;
      End;
    End;
    CNX.TMP00.Active := True ;
    CNX.TMP01.Active := True ;
    CNX.TMP00.SQL.Clear;
    CNX.TMP01.SQL.Clear;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Info_Det.Calcular_Detalles']);
  End;
End;

Function TFrDocumento_Info_Det.Abrir_Tabla(pDataKey, pConsecutivo : String) : Boolean;
Begin
  Try
    tbMaestro.Active := False;
    tbMaestro.SQL.Clear;
    tbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
    tbMaestro.SQL.Add(' WHERE ' + CNX.Trim_Sentence('DATAKEY'    ) + ' = ' + QuotedStr(FDATAKEY    ));
    tbMaestro.SQL.Add(' AND '   + CNX.Trim_Sentence('CONSECUTIVO') + ' = ' + QuotedStr(pConsecutivo));
    tbMaestro.Active := True;
    Result := tbMaestro.Active And (tbMaestro.RecordCount > 0);
    If Result Then
    Begin
      FVALIDATE_DATE := CNX.Retornar_String(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [tbMaestro.FieldByName('CODIGO_PRODUCTO').AsString], ['ID_FECHA_VENCIMIENTO'], 'TFrDocumento_Info_Det.Abrir_Tabla') = 'S';
      FECHA_VENCIMIENTO.Visible := FVALIDATE_DATE;
      lbFecha_Documento.Visible := FVALIDATE_DATE;
      BtnFechaVencimiento.Visible := FVALIDATE_DATE;
      tbMaestro.Edit;
    End;
  Except
     On E: Exception Do
     Begin
       Result := False;
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Info_Det.Abrir_Tabla']);
     End;
  End;
End;

Function TFrDocumento_Info_Det.Cerrar_Tabla : Boolean;
Begin
  Result := False;
  Try
    If tbMaestro.Active Then
      tbMaestro.Active := False;
    Result := Not tbMaestro.Active;
  Except
     On E: Exception Do
     Begin
       Result := False;
       gVariableGlobal.Add_Log(E, ['Origen', 'FrDocumento_Info_Det.Cerrar_Tabla']);
     End;
  End;
End;

procedure TFrDocumento_Info_Det.CODIGO_IMPUESTOExit(Sender: TObject);
begin
  If Not Modo_Edicion Then
    Exit;
  If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
  Begin
    TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
    UtCentral_Ventas_Cargar_Porcentajes(tbMaestro, tbMaestro.FieldByName('TIPO_DOCUMENTO').AsString, TOvcDbPictureField(Sender).EditString);
  End;
end;

procedure TFrDocumento_Info_Det.CODIGO_IMPUESTOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtNImpuesto.Click;
end;

procedure TFrDocumento_Info_Det.CODIGO_IMPUESTOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Not Modo_Edicion Then
    Exit;
  If Vacio(TOvcDbPictureField(Sender).EditString) Then
    ErrorCode := IE_FIELD_EMPTY
  Else
    If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Impuesto).Name, ['CODIGO_IMPUESTO'], [TOvcDbPictureField(Sender).EditString]) Then
      ErrorCode := IE_CODE_NOEXISTS;
end;

procedure TFrDocumento_Info_Det.DsDetalleDataChange(Sender: TObject;
  Field: TField);
begin
  If Not tbMaestro.Active Then
    Exit;

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_VENDEDOR.Field.FullName)) Then
    lbNombre_Vendedor.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [CODIGO_VENDEDOR.Field.AsString], ['NOMBRE'], 'TFrDocumento_Info_Det.DsMaestroDataChange');

  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = CODIGO_IMPUESTO.Field.FullName)) Then
    lbNombre_Impuesto.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Impuesto).Name, ['CODIGO_IMPUESTO'], [CODIGO_IMPUESTO.Field.AsString], ['NOMBRE'], 'TFrDocumento_Info_Det.DsMaestroDataChange');
end;

procedure TFrDocumento_Info_Det.FECHA_VENCIMIENTOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnFechaVencimiento.Click;
end;

procedure TFrDocumento_Info_Det.FECHA_VENCIMIENTOUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Not Modo_Edicion Then
    Exit;
  If FVALIDATE_DATE Then
    If Not Fecha_Valida(TOvcDbPictureField(Sender).EditString) Then
      ErrorCode := IE_DATE_INVALID;
end;

procedure TFrDocumento_Info_Det.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If ModalResult = mrOk Then
  Begin
    CanClose := Self.Validate_Form(Self);
    If CanClose Then
    Begin
      If DsMaestro.State In [dsInsert, dsEdit] Then
      Begin
        If Sino('Desea Guardar') Then
        Begin
          tbMaestro.Post;
          If APLICAR_TODOS.Checked Then
          Begin
            Acarrear_Porcentaje;
            Calcular_Detalles;
          End;
        End;
      End;
    End;
  End;
end;

procedure TFrDocumento_Info_Det.FormCreate(Sender: TObject);
begin
  Self.Caption := Retornar_Info_Tabla(Id_Documento_Det_Aux).Caption;
  Self.Setting_Form(Self, Id_Documento_Det_Aux, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
end;

Function Show_Form_Documento_Info_Det(pDataKey, pConsecutivo : String) : Boolean;
Begin
  FrDocumento_Info_Det := TFrDocumento_Info_Det.Create(Nil);
  FrDocumento_Info_Det.FDATAKEY := pDataKey;
  If FrDocumento_Info_Det.Abrir_Tabla(pDataKey, pConsecutivo) Then
    Result := FrDocumento_Info_Det.ShowModal = mrOk;
  FrDocumento_Info_Det.Cerrar_Tabla;
  FrDocumento_Info_Det.Free;
End;

end.
