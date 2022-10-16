unit UtObjetoTransaccional;

interface

Uses
  DB,
  Forms,
  ovcef,
  ovcpf,
  ovcdbpf,
  Classes,
  Buttons,
  SysUtils,
  Controls,
  ExtCtrls,
  StdCtrls;

Type
  TObjeto_Transaccional = Class(TObject)
    Private
      FForm : TCustomForm;
      FModo_Edicion : Boolean;
      Function Retornar_Label(pTag : Integer) : TLabel;
      Function Retornar_SpeedButton(pTag : Integer) : TSpeedButton;
      Function Retornar_OvcDPictureField(pTag : Integer) : TOvcDbPictureField;
      Function OnDataExits(pPf : TOvcDbPictureField) : Boolean;
    Public
      Constructor Create(pForm : TCustomForm);
      Property Modo_Edicion : Boolean Read FModo_Edicion Write FModo_Edicion;
      Procedure Actualizar_Label(pPf : TOvcDbPictureField; pLabel : TLabel; pField : TField; pForceShow : Boolean);
      Procedure Buscar_Dato(pPf : TOvcDbPictureField);
      Procedure OnExit(Sender: TObject);
      procedure OnClick(Sender: TObject);
      procedure OnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure OnUserValidationsRequerided(Sender: TObject; var ErrorCode: Word);
      procedure OnUserValidationsOptional(Sender: TObject; var ErrorCode: Word);
      Procedure Eventos_OvcDbPictureField(pTag : Integer; pPf : TOvcDbPictureField);
      Procedure Eventos_SpeedButton(pBtn : TSpeedButton);
  End;

implementation

Uses
  Windows,
  UtFunciones,
  UtInfoTablas,
  UtManejoError,
  Form_Busqueda,
  UtVariablesGlobales;

constructor TObjeto_Transaccional.Create(pForm: TCustomForm);
begin
  Self.FForm := pForm;
end;

Function TObjeto_Transaccional.Retornar_Label(pTag : Integer) : TLabel;
Var
  lI : Integer;
Begin
  lI := 0;
  Result := Nil;
  While (lI < FForm.ComponentCount) And (Result = Nil) Do
  Begin
    If FForm.Components[lI] Is TLabel Then
      If (FForm.Components[lI] As TLabel).Tag = pTag Then
        Result := (FForm.Components[lI] As TLabel);
    Inc(lI);
  End;
End;

Function TObjeto_Transaccional.Retornar_SpeedButton(pTag : Integer) : TSpeedButton;
Var
  lI : Integer;
Begin
  lI := 0;
  Result := Nil;
  While (lI < FForm.ComponentCount) And (Result = Nil) Do
  Begin
    If FForm.Components[lI] Is TSpeedButton Then
      If (FForm.Components[lI] As TSpeedButton).Tag = pTag Then
        Result := (FForm.Components[lI] As TSpeedButton);
    Inc(lI);
  End;
End;

Function TObjeto_Transaccional.Retornar_OvcDPictureField(pTag : Integer) : TOvcDbPictureField;
Var
  lI : Integer;
Begin
  lI := 0;
  Result := Nil;
  While (lI < FForm.ComponentCount) And (Result = Nil) Do
  Begin
    If FForm.Components[lI] Is TOvcDbPictureField Then
      If (FForm.Components[lI] As TOvcDbPictureField).Tag = pTag Then
        Result := (FForm.Components[lI] As TOvcDbPictureField);
    Inc(lI);
  End;
End;

Procedure TObjeto_Transaccional.Actualizar_Label(pPf : TOvcDbPictureField; pLabel : TLabel; pField : TField; pForceShow : Boolean);
Begin
  If Assigned(pPf) And Assigned(pLabel) Then
  Begin
    If pForceShow Or (Assigned(pField) And (pField.FullName = pPf.Field.FullName)) Then
    Begin
      Case pPf.Tag Of
        Id_PUC           : pLabel.Caption := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_PUC          ).Name, ['CODIGO_PUC'          ], [pPf.EditString], ['NOMBRE'], 'TObjeto_Transaccional.Actualizar_Label');
        Id_Centro_Costos : pLabel.Caption := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Centro_Costos).Name, ['CODIGO_CENTRO_COSTOS'], [pPf.EditString], ['NOMBRE'], 'TObjeto_Transaccional.Actualizar_Label');
        Id_Comprobante   : pLabel.Caption := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Comprobante  ).Name, ['CODIGO_COMPROBANTE'  ], [pPf.EditString], ['NOMBRE'], 'TObjeto_Transaccional.Actualizar_Label');
        Id_Producto      : pLabel.Caption := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Producto     ).Name, ['CODIGO_PRODUCTO'     ], [pPf.EditString], ['NOMBRE'], 'TObjeto_Transaccional.Actualizar_Label');
      End;
    End;
  End;
End;

Procedure TObjeto_Transaccional.Buscar_Dato(pPf : TOvcDbPictureField);
Var
  lOk : Boolean;
  lName : String;
  lResult1 : String;
  lResult2 : String;
  lResult3 : String;
Begin
  lOk := False;
  Case pPf.Tag Of
    Id_PUC           : lOk := Show_FrBusqueda(['CODIGO_PUC'          , 'NOMBRE'], ['CODIGO_PUC'          ], Retornar_Info_Tabla(Id_PUC          ).Name, '',  Retornar_Info_Tabla(Id_PUC          ).Caption, lResult1, lResult2, lResult3, False, gVariableGlobal.CNX);
    Id_Centro_Costos : lOk := Show_FrBusqueda(['CODIGO_CENTRO_COSTOS', 'NOMBRE'], ['CODIGO_CENTRO_COSTOS'], Retornar_Info_Tabla(Id_Centro_Costos).Name, '',  Retornar_Info_Tabla(Id_Centro_Costos).Caption, lResult1, lResult2, lResult3, False, gVariableGlobal.CNX);
    Id_Comprobante   : lOk := Show_FrBusqueda(['CODIGO_COMPROBANTE'  , 'NOMBRE'], ['CODIGO_COMPROBANTE'  ], Retornar_Info_Tabla(Id_Comprobante  ).Name, '',  Retornar_Info_Tabla(Id_Comprobante  ).Caption, lResult1, lResult2, lResult3, False, gVariableGlobal.CNX);
    Id_Producto      : lOk := Show_FrBusqueda(['CODIGO_PRODUCTO'     , 'NOMBRE'], ['CODIGO_PRODUCTO'     ], Retornar_Info_Tabla(Id_Producto     ).Name, '',  Retornar_Info_Tabla(Id_Producto     ).Caption, lResult1, lResult2, lResult3, False, gVariableGlobal.CNX);
  End;
  If lOk And Assigned(pPf) Then
    pPf.Field.AsString := lResult1;
End;

Procedure TObjeto_Transaccional.OnExit(Sender: TObject);
Begin
  If FModo_Edicion Then
    If Sender Is TOvcDbPictureField Then
      If Not Vacio((Sender As TOvcDbPictureField).EditString) Then
      Case (Sender As TOvcDbPictureField).Tag Of
        Id_PUC           : TOvcDbPictureField(Sender).Field.AsString := Trim(TOvcDbPictureField(Sender).EditString);
        Id_Centro_Costos : TOvcDbPictureField(Sender).Field.AsString := Trim(TOvcDbPictureField(Sender).EditString);
        Id_Comprobante   : TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
        Id_Producto      : TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
      End;
End;

procedure TObjeto_Transaccional.OnClick(Sender: TObject);
Var
  ltmp : String;
  lCmp : TComponent;
begin
  If Modo_Edicion then
  Begin
    If Sender Is TSpeedButton Then
    Begin
      ltmp := StringReplace(AnsiUpperCase((Sender As TSpeedButton).Name), 'BTN', '', [rfReplaceAll]);
      lCmp := FForm.FindComponent(ltmp);
      If Assigned(lCmp) Then
        Buscar_Dato(lCmp As TOvcDbPictureField);
    End;
  End;
end;

procedure TObjeto_Transaccional.OnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    If Sender Is TOvcDbPictureField Then
      Buscar_Dato((Sender As TOvcDbPictureField));
end;

Function TObjeto_Transaccional.OnDataExits(pPf : TOvcDbPictureField) : Boolean;
Begin
  Result := False;
  Case pPf.Tag Of
    Id_PUC           : Result := gVariableGlobal.CNX.Record_Exist(Retornar_Info_Tabla(Id_PUC          ).Name, ['CODIGO_PUC'          ], [pPf.EditString]);
    Id_Centro_Costos : Result := gVariableGlobal.CNX.Record_Exist(Retornar_Info_Tabla(Id_Centro_Costos).Name, ['CODIGO_CENTRO_COSTOS'], [pPf.EditString]);
    Id_Comprobante   : Result := gVariableGlobal.CNX.Record_Exist(Retornar_Info_Tabla(Id_Comprobante  ).Name, ['CODIGO_COMPROBANTE'  ], [pPf.EditString]);
    Id_Producto      : Result := gVariableGlobal.CNX.Record_Exist(Retornar_Info_Tabla(Id_Producto     ).Name, ['CODIGO_PRODUCTO'     ], [pPf.EditString]);
  End;
End;

procedure TObjeto_Transaccional.OnUserValidationsRequerided(Sender: TObject; var ErrorCode: Word);
Var
  lPf : TOvcDbPictureField;
Begin
  If (Sender Is TOvcDbPictureField) Then
  Begin
    If Modo_Edicion Then
    Begin
      lPf := Retornar_OvcDPictureField((Sender As TOvcDbPictureField).Tag);
      If Assigned(lPf) Then
      Begin
        If Vacio(TOvcDbPictureField(Sender).EditString) Then
          ErrorCode := IE_CODE_NOEXISTS
        Else
        Begin
          If OnDataExits(lPf) Then
            ErrorCode := IE_CODE_NOEXISTS;
        End;
      End;
    End;
  End;
end;

procedure TObjeto_Transaccional.OnUserValidationsOptional(Sender: TObject; var ErrorCode: Word);
Var
  lPf : TOvcDbPictureField;
Begin
  ErrorCode := 0;
  If (Sender Is TOvcDbPictureField) Then
  Begin
    If Modo_Edicion Then
    Begin
      lPf := (Sender As TOvcDbPictureField);
      If Assigned(lPf) Then
      Begin
        If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
          If Not OnDataExits(lPf) Then
            ErrorCode := IE_CODE_NOEXISTS;
      End;
    End;
  End;
end;

Procedure TObjeto_Transaccional.Eventos_OvcDbPictureField(pTag : Integer; pPf : TOvcDbPictureField);
Begin
  pPf.Tag := pTag;
  pPf.OnExit := Self.OnExit;
  pPf.OnKeyDown := Self.OnKeyDown;
  pPf.OnUserValidation := Self.OnUserValidationsOptional;
End;

Procedure TObjeto_Transaccional.Eventos_SpeedButton(pBtn : TSpeedButton);
Begin
  pBtn.OnClick := Self.OnClick;
End;

end.
