unit UtEspacioBoton;

interface

Uses
  Classes,
  Buttons,
  Windows,
  ExtCtrls,
  StdCtrls,
  SyncObjs;

Const
  Const_Abrev_Disponible = 'D';
  Const_Abrev_Ocupado    = 'O';
  Const_Abrev_Reservado  = 'R';

  Const_Texto_Disponible = 'Disponible';
  Const_Texto_Ocupado    = 'Ocupado';
  Const_Texto_Reservado  = 'Reservado';

Type
  TEspacioButton = Class(TBitBtn)
    Private
      FCS : TCriticalSection;
      FTOP : Integer;
      FTOTAL : Double;
      FNOMBRE : String;
      FESTADO : AnsiChar;
      FLABELTOP :  TLabel;
      FLABELBOTTOM :  TLabel;
      FCODIGO_ZONA : String;
      FCODIGO_ESPACIO : String;
      Procedure Cargar_Imagen;
      Function GetInfoTercero : String;
      Function Retornar_Totales : String;
    Public
      Property TOTAL : Double Read FTOTAL;
      Property NOMBRE : String Read FNOMBRE;
      Property ESTADO : AnsiChar Read FESTADO;
      Property CODIGO_ZONA : String Read FCODIGO_ZONA;
      Property CODIGO_ESPACIO : String Read FCODIGO_ESPACIO;
      Constructor Create(pOwner: TComponent); override;
      Procedure Set_Codigo_Zona(pValue : String);
      Procedure Set_Codigo_Espacio(pValue : String);
      Procedure Actualizar_Ambiente_Espacio;
      Procedure Actualizar_Informacion_Espacio;
      Procedure Refrescar_Informacion_Espacio;
      Procedure Set_Estado(pValue : String);
      Destructor Destroy; override;
  End;

Function Actualizar_Estado_Espacio(pCodigo_Espacio, pEstado : String) : Boolean;

implementation
Uses
  DB,
  Forms,
  SysUtils,
  UtConexion,
  UtFunciones,
  Vcl.Graphics,
  Vcl.Controls,
  UtInfoTablas,
  UtManagerImages,
  UtVariablesGlobales;

Const
  gID_MONEDA = '$';
  gValor_TRM = 0;

Constructor TEspacioButton.Create(pOwner : TComponent);
Begin
  Inherited;
  Self.FCS          := TCriticalSection.Create;
  Self.Layout       := blGlyphTop;
  Self.Cancel       := False;
  Self.Default      := False;
  Self.ModalResult  := mrNone;
  Self.Width        := 080;
  Self.Height       := 070;
  Self.Font.Style   := Font.Style + [fsBold];
  Self.Cursor       := crHandPoint;
  Self.Color        := clGray;
  Self.TabStop      := False;
  Self.Caption      := '';
  Self.ShowHint     := True;
  Self.PopupMenu    := Nil;

  FLABELTOP := TLabel.Create(Self);
  FLABELTOP.Parent := Self;

  FLABELTOP.Align := alTop;
  FLABELTOP.Transparent := False;
  FLABELTOP.Color := clBlack;
  FLABELTOP.Font.Size := 8;
  FLABELTOP.Font.Color := clWhite;
  FLABELTOP.Alignment := taRightJustify;

  FLABELBOTTOM := TLabel.Create(Self);
  FLABELBOTTOM.Parent := Self;
  FLABELBOTTOM.Align := alBottom;
  FLABELBOTTOM.Transparent := False;
  FLABELBOTTOM.WordWrap := True;
  FLABELBOTTOM.Color := clBlack;
  FLABELBOTTOM.Font.Size := 8;
  FLABELBOTTOM.Font.Color := clWhite;
  FLABELBOTTOM.Alignment := taCenter;
End;

Procedure TEspacioButton.Set_Codigo_Zona(pValue : String);
Begin
  FCODIGO_ZONA := pValue;
End;

Procedure TEspacioButton.Set_Codigo_Espacio(pValue : String);
Begin
  FCODIGO_ESPACIO := pValue;
  FLABELTOP.Name := 'LT' + pValue;
  FLABELBOTTOM.Name := 'LB' + pValue;
End;

Procedure TEspacioButton.Cargar_Imagen;
Var
  lSQL : TQuery;
Begin
  Try
    FCS.Enter;
    Try
      If Assigned(Self) Then
        Self.Glyph := Nil;
      lSQL := TQuery.Create(Nil);
      lSQL.Active := False;
      lSQL.Connection := gVariableGlobal.CNX;
      lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Zona).Name + ' ');
      lSQL.SQL.Add(' WHERE CODIGO_ZONA = ' + #39 + Self.FCODIGO_ZONA + #39);
      lSQL.Active := True;
      If lSQL.Active And (lSQL.RecordCount > 0) Then
      Begin
        Case FESTADO Of
          Const_Abrev_Ocupado    : Begin
                                     UtManagerImages_Set(TBlobField(lSQL.FieldByName('ESPACIO_OCUPADA')), Self.Glyph);
                                   End;
          Const_Abrev_Disponible : Begin
                                     UtManagerImages_Set(TBlobField(lSQL.FieldByName('ESPACIO_DISPONIBLE')), Self.Glyph);
                                   End;
          Const_Abrev_Reservado  : Begin
                                     UtManagerImages_Set(TBlobField(lSQL.FieldByName('ESPACIO_RESERVADA')), Self.Glyph);
                                   End;
        End;
      End;
      lSQL.Active := False;
      lSQL.Free;
    Except
      On E : Exception Do
        gVariableGlobal.Add_Log(E, ['Origen', 'TEspacioButton.Cargar_Imagen']);
    End;
  Finally
    FCS.Leave;
  End;
End;

Function TEspacioButton.Retornar_Totales : String;
Var
  lSQL : TQuery;
Begin
  Result := '$0';
  FTOTAL := 0;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + ' ');
    lSQL.SQL.Add(' WHERE CODIGO_ESPACIO = ' + QuotedStr(Trim(Self.FCODIGO_ESPACIO)));
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      FTOTAL := lSQL.FieldByName('VALOR_TOTAL').AsFloat;
      Result := gID_MONEDA + Trim(FormatFloat('###,###,###,###.#0', FTOTAL)) ;
      If gValor_TRM <> 0 Then
        Result := gID_MONEDA + Trim(FormatFloat('###,###,###,###.#0', lSQL.FieldByName('TOTAL_TRM').AsFloat));
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TEspacioButton.Retornar_Totales']);
  End;
End;

Function TEspacioButton.GetInfoTercero : String;
Var
  lSQL : TQuery;
  lDatakey : String;
  lTercero : String;
  lSinonimo : String;
Begin
  Result := '';
  Try
    lDatakey := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, ['CODIGO_ESPACIO'], [Self.CODIGO_ESPACIO], ['DATAKEY'], 'TEspacioButton.GetInfoTercero');
    lTercero := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, ['CODIGO_ESPACIO'], [Self.CODIGO_ESPACIO], ['CODIGO_TERCERO'], 'TEspacioButton.GetInfoTercero');
    lSinonimo := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, ['CODIGO_ESPACIO'], [Self.CODIGO_ESPACIO], ['CODIGO_SINONIMO'], 'TEspacioButton.GetInfoTercero');
    Result := Trim(gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [lTercero], ['NOMBRE'], 'TEspacioButton.GetInfoTercero')) + ', ' +
              'Dirección: ' + Trim(gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [lTercero, lSinonimo], ['DIRECCION'], 'TEspacioButton.GetInfoTercero')) + ', ' +
              'Telefono: ' + Trim(gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [lTercero, lSinonimo], ['TELEFONO' ], 'TEspacioButton.GetInfoTercero')) ;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TEspacioButton.GetInfoTercero']);
  End;
End;

Procedure TEspacioButton.Actualizar_Ambiente_Espacio;
Var
  lSQL : TQuery;
  lIsNew : Boolean;
Begin
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Espacio).Name + ' ');
    lSQL.SQL.Add(' WHERE CODIGO_ESPACIO = ' + #39 + Self.CODIGO_ESPACIO + #39 + ' ');
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      Self.Set_Estado(lSQL.FieldByName('ESTADO').AsString);
      Self.FLABELTOP.Caption := Retornar_Totales;
      Self.FLABELBOTTOM.Caption := Trim(lSQL.FieldByName('NOMBRE').AsString);
      Self.Hint := Self.FLABELBOTTOM.Caption + ', ' + Self.FLABELTOP.Caption;
      Self.Hint := GetInfoTercero;
      lSQL.Edit;
      lSQL.FieldByName('TOTAL').AsFloat := Self.TOTAL;
      lSQL.Post;
    End;
    lSQL.Active := True;
    lSQL.Free;
    Cargar_Imagen;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TEspacioButton.Actualizar_Ambiente_Espacio']);
  End;
End;

Procedure TEspacioButton.Actualizar_Informacion_Espacio;
Var
  lSQL : TQuery;
  lIsNew : Boolean;
Begin
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Espacio).Name + ' ');
    lSQL.SQL.Add(' WHERE CODIGO_ESPACIO = ' + #39 + Self.CODIGO_ESPACIO + #39 + ' ');
    lSQL.Active := True;
    If lSQL.Active Then
    Begin
      lIsNew := lSQL.RecordCount <= 0;
      If lIsNew Then
        lSQL.Append
      Else
        lSQL.Edit;
      If lIsNew Then
      Begin
        lSQL.FieldByName('CODIGO_ZONA'   ).AsString  := Self.CODIGO_ZONA   ;
        lSQL.FieldByName('CODIGO_ESPACIO').AsString  := Self.CODIGO_ESPACIO;
        lSQL.FieldByName('NOMBRE'        ).AsString  := '#' + Trim(Self.CODIGO_ESPACIO);
      End;
      lSQL.FieldByName('ESTADO'    ).AsString  := Self.ESTADO;
      lSQL.FieldByName('POSICION_X').AsInteger := Self.Left  ;
      lSQL.FieldByName('POSICION_Y').AsInteger := Self.Top   ;
      lSQL.Post;
    End;
    lSQL.Active := True;
    lSQL.Free;
    Cargar_Imagen;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TEspacioButton.Actualizar_Informacion_Espacio']);
  End;
End;


Procedure TEspacioButton.Refrescar_Informacion_Espacio;
Var
  lSQL : TQuery;
  lIsNew : Boolean;
Begin
  Try
    FCS.Enter;
    Try
      lSQL := TQuery.Create(Nil);
      lSQL.Connection := gVariableGlobal.CNX;
      lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Espacio).Name + ' ');
      lSQL.SQL.Add(' WHERE CODIGO_ESPACIO = ' + #39 + Self.CODIGO_ESPACIO + #39 + ' ');
      lSQL.Active := True;
      If lSQL.Active And (lSQL.RecordCount > 0) Then
      Begin
        Self.FLABELTOP.Caption := Retornar_Totales;
        Self.FLABELBOTTOM.Caption := Trim(lSQL.FieldByName('NOMBRE').AsString);
        Self.Hint   := Self.FLABELBOTTOM.Caption + ', ' + Self.FLABELTOP.Caption;
        Self.Left   := lSQL.FieldByName('POSICION_X').AsInteger;
        Self.Top    := lSQL.FieldByName('POSICION_Y').AsInteger;
        Self.Set_Estado(lSQL.FieldByName('ESTADO').AsString);
      End;
      lSQL.Active := True;
      lSQL.Free;
    Except
      On E : Exception Do
        gVariableGlobal.Add_Log(E, ['Origen', 'TEspacioButton.Actualizar_Informacion_Espacio']);
    End;
  Finally
    FCS.Leave;
  End;
End;

Procedure TEspacioButton.Set_Estado(pValue : String);
Begin
  FESTADO := AnsiChar((pValue + ' ')[01]);
  Cargar_Imagen;
End;

Destructor TEspacioButton.Destroy;
Begin
  If Assigned(FLABELBOTTOM) Then
    FLABELBOTTOM.Free;

  If Assigned(FLABELTOP) Then
    FLABELTOP.Free;

  If Assigned(Self.FCS) Then
    Self.FCS.Free;
  Inherited Destroy;
End;

Function Actualizar_Estado_Espacio(pCodigo_Espacio, pEstado : String) : Boolean;
Var
  lSQL : TQuery;
  lIsNew : Boolean;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Espacio).Name + ' ');
    lSQL.SQL.Add(' WHERE CODIGO_ESPACIO = ' + #39 + pCodigo_Espacio + #39 + ' ');
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.Edit;
      lSQL.FieldByName('ESTADO').AsString  := pEstado;
      lSQL.Post;
    End;
    lSQL.Active := True;
    lSQL.Free;
    Result := True;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'UtEspacioBoton, Actualizar_Estado_Espacio']);
  End;
End;

end.
