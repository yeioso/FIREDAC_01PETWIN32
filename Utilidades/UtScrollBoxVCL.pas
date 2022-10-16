unit UtScrollBoxVCL;

interface

Uses
  Vcl.Forms,
  UtBotonVCL,
  UtConexion,
  Vcl.Graphics,
  System.Classes;

Type
  TUtScrollBox = Class(TScrollBox)
  Private
    CNX : TConexion;
    FEvento: TNotifyEvent;
    FIMAGE_BACK : TBitmap;
    FIMAGE_HOME : TBitmap;
    FNivel_Maximo: TNivel;
    FTipo_Documento: String;
    Function CrearBoton(Var pTop, pLeft : Integer) : TUtBotonVCL;
    Procedure Mover_Info(pOrigen, pDestino : TUtBotonVCL);
    Function Clonar(pBoton : TUtBotonVCL; Var pTop, pLeft : Integer) : TUtBotonVCL;
    Procedure Establecer_Botones_Adicionales(pBoton : TUtBotonVCL; pNivel : TNivel; Var pTop, pLeft : Integer);
    Procedure Cargar_Linea(pSender: TUtBotonVCL);
    Procedure Cargar_Grupo(pSender: TUtBotonVCL);
    Procedure Cargar_Subgrupo(pSender: TUtBotonVCL);
    Procedure Cargar_Producto(pSender: TUtBotonVCL);
  Public
    Property Evento: TNotifyEvent Read FEvento Write FEvento;
    Property IMAGE_BACK : TBitmap Read FIMAGE_BACK write FIMAGE_BACK;
    Property IMAGE_HOME : TBitmap Read FIMAGE_HOME write FIMAGE_HOME;
    Property Nivel_Maximo: TNivel Read FNivel_Maximo write FNivel_Maximo;
    Property Tipo_Documento: String Read FTipo_Documento Write FTipo_Documento;
    Procedure Restart;
    Procedure OnClickBoton(pSender: TObject);
    Constructor Create(AOwner: TComponent); Override;
    Destructor Destroy; Override;
  End;

implementation

Uses
  DB,
  Math,
  SysUtils,
  StrUtils,
  ExtCtrls,
  StdCtrls,
  Controls,
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtVariablesGlobales;

constructor TUtScrollBox.Create(AOwner: TComponent);
begin
  inherited;
  FIMAGE_BACK := TBitmap.Create;
  FIMAGE_HOME := TBitmap.Create;
  FNivel_Maximo := TNivel.TN_None;
end;

Procedure TUtScrollBox.Restart;
Begin
  Try
    While Self.ComponentCount > 0 Do
      Self.Components[0].Free;
  Except

  End;
End;

Function TUtScrollBox.CrearBoton(Var pTop, pLeft : Integer) : TUtBotonVCL;
Begin
  Result := TUtBotonVCL.Create(Self);
  Result.Parent := Self;
  Result.OnClick := OnClickBoton;
  Result.IMAGEN.OnClick := OnClickBoton;
  Result.ETIQUETA.OnClick := OnClickBoton;
  Result.Top := pTop;
  Result.Left := pLeft;
  Result.Width := IfThen(gVariableGlobal.IMAGEN_WIDTH <= 0, 100, gVariableGlobal.IMAGEN_WIDTH);
  Result.Height := IfThen(gVariableGlobal.IMAGEN_HEIGHT <= 0, 120, gVariableGlobal.IMAGEN_HEIGHT);
  pLeft := pLeft + Result.Width + 5;
  If (pLeft + Result.Width) > Self.Width Then
  Begin
    pTop := pTop + Result.Height + 5;
    pLeft := 5;
  End;
End;

Procedure TUtScrollBox.Mover_Info(pOrigen, pDestino : TUtBotonVCL);
begin
  pDestino.NIVEL                := pOrigen.NIVEL               ;
  pDestino.CODIGO_LINEA         := pOrigen.CODIGO_LINEA        ;
  pDestino.CODIGO_GRUPO         := pOrigen.CODIGO_GRUPO        ;
  pDestino.CODIGO_SUBGRUPO      := pOrigen.CODIGO_SUBGRUPO     ;
  pDestino.CODIGO_PRODUCTO      := pOrigen.CODIGO_PRODUCTO     ;
  pDestino.VALOR_UNITARIO       := pOrigen.VALOR_UNITARIO      ;
  pDestino.CANTIDAD_PROPUESTA   := pOrigen.CANTIDAD_PROPUESTA  ;
  pDestino.ID_FECHA_VENCIMIENTO := pOrigen.ID_FECHA_VENCIMIENTO;
end;

Function TUtScrollBox.Clonar(pBoton : TUtBotonVCL; Var pTop, pLeft : Integer) : TUtBotonVCL;
Begin
  Result := CrearBoton(pTop, pLeft);
  If Assigned(pBoton) Then
    Mover_Info(pBoton, Result);
End;


Procedure TUtScrollBox.Establecer_Botones_Adicionales(pBoton : TUtBotonVCL; pNivel : TNivel; Var pTop, pLeft : Integer);
Var
  lBtn : TUtBotonVCL;
Begin
  Try
    lBtn := Clonar(pBoton, pTop, pLeft);
    lBtn.DIRECCION := TDireccion.TD_Anterior;
    lBtn.NIVEL     := pNivel;
    lBtn.ETIQUETA.Caption := 'Regresar';
    lBtn.IMAGEN.Picture.Assign(FIMAGE_BACK);

    lBtn := Clonar(pBoton, pTop, pLeft);
    lBtn.DIRECCION := TDireccion.TD_Inicio;
    lBtn.NIVEL     := pNivel;
    lBtn.ETIQUETA.Caption := 'Inicio';
    lBtn.IMAGEN.Picture.Assign(FIMAGE_HOME);
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'TUtScrollBox.OnClickBoton']);
    End;
  End;
End;

Procedure TUtScrollBox.OnClickBoton(pSender: TObject);
Var
  lNivel : TNivel;
  lBtn: TUtBotonVCL;
Begin
  Try
    If Not Assigned(pSender) Then
    Begin
      Cargar_Linea(Nil);
      Exit;
    End;

    If Assigned(pSender) Then
    Begin
      Try
        Self.Visible := False;
        lBtn := Nil;
        If pSender Is TUtBotonVCL Then
          lBtn := pSender As TUtBotonVCL
        Else If (pSender Is TImage) And ((pSender As TImage).Parent Is TUtBotonVCL) Then
          lBtn := (pSender As TImage).Parent As TUtBotonVCL
        Else If (pSender Is TLabel) And ((pSender As TLabel).Parent Is TUtBotonVCL) Then
          lBtn := (pSender As TLabel).Parent As TUtBotonVCL;
        If Assigned(lBtn) Then
        Begin
          Case lBtn.DIRECCION Of
            TDireccion.TD_Inicio    : Begin
                                        Cargar_Linea(Nil);
                                      End;
            TDireccion.TD_Avanzar   : Begin
                                        If Nivel_Maximo = lBtn.NIVEL Then
                                          Cargar_Producto(lBtn)
                                        Else
                                        Begin
                                          Case lBtn.NIVEL Of
                                            TNivel.TN_Linea    : Cargar_Grupo   (lBtn);
                                            TNivel.TN_Grupo    : Cargar_Subgrupo(lBtn);
                                            TNivel.TN_Subgrupo : Cargar_Producto(lBtn);
                                          End;
                                        End;
                                      End;
            TDireccion.TD_Anterior  : Begin
                                        lNivel := lBtn.NIVEL;
                                        If Nivel_Maximo < lBtn.NIVEL Then
                                        Begin
                                          Case Nivel_Maximo Of
                                            TNivel.TN_Subgrupo : lNivel := TNivel.TN_Producto;
                                            TNivel.TN_Grupo    : lNivel := TNivel.TN_Subgrupo;
                                          End;
                                        End;
                                        Case lNivel Of
                                          TNivel.TN_Producto : Cargar_Subgrupo(lBtn);
                                          TNivel.TN_Subgrupo : Cargar_Grupo   (lBtn);
                                          TNivel.TN_Grupo    : Cargar_Linea   (lBtn);
                                        End;
                                      End;
          End;
        End;
      Finally
        Self.Visible := True;
      End;
    End;
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'TUtScrollBox.OnClickBoton']);
    End;
  End;
End;

Procedure TUtScrollBox.Cargar_Linea(pSender: TUtBotonVCL);
Var
  lI: Integer;
  lTop: Integer;
  lBtn: TUtBotonVCL;
  lLeft: Integer;
Begin
  Try
    lTop := 5;
    lLeft := 5;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT  * FROM ' + Retornar_Info_Tabla(Id_Linea).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ID_MOSTRAR = ' + QuotedStr('S') + ' ');
    CNX.TMP.SQL.Add(' ORDER BY ORDEN, NOMBRE ');
    CNX.TMP.Active := True;
    If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
    Begin
      Restart;
      CNX.TMP.First;
      While Not CNX.TMP.Eof Do
      Begin
        lBtn := CrearBoton(lTop, lLeft);
        lBtn.IMAGEN.Visible := Not CNX.TMP.FieldByName('GRAFICO').IsNull;
        If Not CNX.TMP.FieldByName('GRAFICO').IsNull Then
        Begin
          lBtn.IMAGEN.Picture.Assign(TBlobField(CNX.TMP.FieldByName('GRAFICO')));
          lBtn.ETIQUETA.Font.Size := IfThen(gVariableGlobal.FONT_SIZE_A <= 0, 7, gVariableGlobal.FONT_SIZE_A);
        End
        Else
        Begin
          lBtn.ETIQUETA.Align := TAlign.alClient;
          lBtn.ETIQUETA.Font.Size := IfThen(gVariableGlobal.FONT_SIZE_B <= 0, 10, gVariableGlobal.FONT_SIZE_B);
        End;
        lBtn.NIVEL := TNivel.TN_Linea;
        lBtn.DIRECCION := TDireccion.TD_Avanzar;
        lBtn.CODIGO_LINEA := CNX.TMP.FieldByName('CODIGO_LINEA').AsString;
        lBtn.ETIQUETA.Caption := CNX.TMP.FieldByName('NOMBRE').AsString;
        CNX.TMP.Next;
      End;
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'TUtScrollBox.Cargar_Linea']);
    End;
  End;
End;

Procedure TUtScrollBox.Cargar_Grupo(pSender: TUtBotonVCL);
Var
  lI: Integer;
  lTop: Integer;
  lBtn: TUtBotonVCL;
  lLeft: Integer;
  lClone : TUtBotonVCL;
Begin
  lClone := TUtBotonVCL.Create(Nil);
  lClone.Visible := False;
  Mover_Info(pSender, lClone);
  Try
    lTop := 5;
    lLeft := 5;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT CODIGO_GRUPO, ');
    CNX.TMP.SQL.Add('        NOMBRE, ');
    CNX.TMP.SQL.Add('        ORDEN, ');
    CNX.TMP.SQL.Add('        GRAFICO ');
    CNX.TMP.SQL.Add('        FROM ' + Retornar_Info_Tabla(Id_Grupo).Name + ' A ');
    CNX.TMP.SQL.Add(' WHERE ID_MOSTRAR = ' + QuotedStr('S') + ' ');
    CNX.TMP.SQL.Add(' AND EXISTS (  ');
    CNX.TMP.SQL.Add('              SELECT CODIGO_PRODUCTO FROM ' + Retornar_Info_Tabla(Id_Producto).Name + ' B ');
    CNX.TMP.SQL.Add('              WHERE A.CODIGO_GRUPO = B.CODIGO_GRUPO ');
    If Assigned(lClone) And (Not Vacio(lClone.CODIGO_LINEA)) Then
      CNX.TMP.SQL.Add(            ' AND B.CODIGO_LINEA = ' + QuotedStr(lClone.CODIGO_LINEA) + ' ');
    CNX.TMP.SQL.Add(           ' ) ');
    CNX.TMP.SQL.Add(' ORDER BY ORDEN, NOMBRE ');
    CNX.TMP.Active := True;
    If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
    Begin
      Restart;
      Establecer_Botones_Adicionales(lClone, TNivel.TN_Grupo, lTop, lLeft);
      CNX.TMP.First;
      While Not CNX.TMP.Eof Do
      Begin
        lBtn := CrearBoton(lTop, lLeft);
        Mover_Info(lClone, lBtn);
        lBtn.IMAGEN.Visible := Not CNX.TMP.FieldByName('GRAFICO').IsNull;
        If Not CNX.TMP.FieldByName('GRAFICO').IsNull Then
        Begin
          lBtn.IMAGEN.Picture.Assign(TBlobField(CNX.TMP.FieldByName('GRAFICO')));
          lBtn.ETIQUETA.Font.Size := IfThen(gVariableGlobal.FONT_SIZE_A <= 0, 7, gVariableGlobal.FONT_SIZE_A);
        End
        Else
        Begin
          lBtn.ETIQUETA.Align := TAlign.alClient;
          lBtn.ETIQUETA.Font.Size := IfThen(gVariableGlobal.FONT_SIZE_B <= 0, 10, gVariableGlobal.FONT_SIZE_B);
        End;
        lBtn.NIVEL := TNivel.TN_Grupo;
        lBtn.DIRECCION := TDireccion.TD_Avanzar;
        If Assigned(lClone) And (Not Vacio(lClone.CODIGO_LINEA)) Then
          lBtn.CODIGO_LINEA := lClone.CODIGO_LINEA;
        lBtn.CODIGO_GRUPO := CNX.TMP.FieldByName('CODIGO_GRUPO').AsString;
        lBtn.ETIQUETA.Caption := CNX.TMP.FieldByName('NOMBRE').AsString;
        CNX.TMP.Next;
      End;
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'TUtScrollBox.Cargar_Grupo']);
    End;
  End;
  If Assigned(lClone) Then
    FreeAndNil(lClone);
End;

Procedure TUtScrollBox.Cargar_Subgrupo(pSender: TUtBotonVCL);
Var
  lI: Integer;
  lTop: Integer;
  lBtn: TUtBotonVCL;
  lLeft: Integer;
  lClone : TUtBotonVCL;
Begin
  lClone := TUtBotonVCL.Create(Nil);
  lClone.Visible := False;
  Mover_Info(pSender, lClone);
  Try
    lTop := 5;
    lLeft := 5;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT CODIGO_SUBGRUPO, ');
    CNX.TMP.SQL.Add('        NOMBRE, ');
    CNX.TMP.SQL.Add('        ORDEN, ');
    CNX.TMP.SQL.Add('        GRAFICO ');
    CNX.TMP.SQL.Add('        FROM ' + Retornar_Info_Tabla(Id_Subgrupo).Name + ' A ');
    CNX.TMP.SQL.Add(' WHERE ID_MOSTRAR = ' + QuotedStr('S') + ' ');
    CNX.TMP.SQL.Add(' AND EXISTS (  ');
    CNX.TMP.SQL.Add('              SELECT CODIGO_PRODUCTO FROM ' + Retornar_Info_Tabla(Id_Producto).Name + ' B ');
    CNX.TMP.SQL.Add('              WHERE A.CODIGO_SUBGRUPO = B.CODIGO_SUBGRUPO ');
    If Assigned(lClone) And (Not Vacio(lClone.CODIGO_LINEA)) Then
      CNX.TMP.SQL.Add(            ' AND B.CODIGO_LINEA = ' + QuotedStr(lClone.CODIGO_LINEA) + ' ');
    If Assigned(lClone) And (Not Vacio(lClone.CODIGO_GRUPO)) Then
      CNX.TMP.SQL.Add(            ' AND B.CODIGO_GRUPO = ' + QuotedStr(lClone.CODIGO_GRUPO) + ' ');
    CNX.TMP.SQL.Add(           ' ) ');
    CNX.TMP.SQL.Add(' ORDER BY ORDEN, NOMBRE ');
    CNX.TMP.Active := True;
    If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
    Begin
      Restart;
      Establecer_Botones_Adicionales(lClone, TNivel.TN_Subgrupo, lTop, lLeft);
      CNX.TMP.First;
      While Not CNX.TMP.Eof Do
      Begin
        lBtn := CrearBoton(lTop, lLeft);
        Mover_Info(lClone, lBtn);
        lBtn.IMAGEN.Visible := Not CNX.TMP.FieldByName('GRAFICO').IsNull;
        If Not CNX.TMP.FieldByName('GRAFICO').IsNull Then
        Begin
          lBtn.IMAGEN.Picture.Assign(TBlobField(CNX.TMP.FieldByName('GRAFICO')));
          lBtn.ETIQUETA.Font.Size := IfThen(gVariableGlobal.FONT_SIZE_A <= 0, 7, gVariableGlobal.FONT_SIZE_A);
        End
        Else
        Begin
          lBtn.ETIQUETA.Align := TAlign.alClient;
          lBtn.ETIQUETA.Font.Size := IfThen(gVariableGlobal.FONT_SIZE_B <= 0, 10, gVariableGlobal.FONT_SIZE_B);
        End;
        lBtn.NIVEL := TNivel.TN_Subgrupo;
        lBtn.DIRECCION := TDireccion.TD_Avanzar;
        If Assigned(lClone) And (Not Vacio(lClone.CODIGO_LINEA)) Then
          lBtn.CODIGO_LINEA := lClone.CODIGO_LINEA;
        If Assigned(lClone) And (Not Vacio(lClone.CODIGO_GRUPO)) Then
          lBtn.CODIGO_GRUPO := lClone.CODIGO_GRUPO;
        lBtn.CODIGO_SUBGRUPO := CNX.TMP.FieldByName('CODIGO_SUBGRUPO').AsString;
        lBtn.ETIQUETA.Caption := CNX.TMP.FieldByName('NOMBRE').AsString;
        CNX.TMP.Next;
      End;
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'TUtScrollBox.Cargar_Subgrupo']);
    End;
  End;
  If Assigned(lClone) Then
    FreeAndNil(lClone);
End;

Procedure TUtScrollBox.Cargar_Producto(pSender: TUtBotonVCL);
Var
  lI: Integer;
  lTop: Integer;
  lBtn: TUtBotonVCL;
  lLeft: Integer;
  lClone : TUtBotonVCL;
Begin
  Try
    lClone := TUtBotonVCL.Create(Nil);
    lClone.Visible := False;
    Mover_Info(pSender, lClone);
    lTop := 5;
    lLeft := 5;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto).Name);
    If (FTipo_Documento = Const_Documento_Pedido) Or
      (FTipo_Documento = Const_Documento_Compra) Then
    Begin
      CNX.TMP.SQL.Add(' WHERE ID_INSUMO = ' + QuotedStr('S'));
      CNX.TMP.SQL.Add(' AND ID_COMPRA = ' + QuotedStr('S'));
    End
    Else
    Begin
      CNX.TMP.SQL.Add(' WHERE ID_FACTURABLE = ' + QuotedStr('S'));
      CNX.TMP.SQL.Add(' AND ID_VENTA = ' + QuotedStr('S'));
    End;
    If Assigned(lClone) And (Not Vacio(lClone.CODIGO_LINEA)) Then
      CNX.TMP.SQL.Add(' AND  CODIGO_LINEA = ' + QuotedStr(lClone.CODIGO_LINEA) + ' ');
    If Assigned(lClone) And (Not Vacio(lClone.CODIGO_GRUPO)) Then
      CNX.TMP.SQL.Add(' AND CODIGO_GRUPO = ' + QuotedStr(lClone.CODIGO_GRUPO) + ' ');
    If Assigned(lClone) And (Not Vacio(lClone.CODIGO_SUBGRUPO)) Then
      CNX.TMP.SQL.Add(' AND CODIGO_SUBGRUPO = ' + QuotedStr(lClone.CODIGO_SUBGRUPO) + ' ');
    CNX.TMP.SQL.Add(' ORDER BY ORDEN, NOMBRE ');
    CNX.TMP.Active := True;
    If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
    Begin
      Restart;
      Establecer_Botones_Adicionales(lClone, TNivel.TN_Producto, lTop, lLeft);
      CNX.TMP.First;
      While Not CNX.TMP.Eof Do
      Begin
        lBtn := CrearBoton(lTop, lLeft);
        Mover_Info(lClone, lBtn);
        lBtn.OnClick := FEvento;
        lBtn.IMAGEN.OnClick := FEvento;
        lBtn.ETIQUETA.OnClick := FEvento;
        lBtn.IMAGEN.Visible := Not CNX.TMP.FieldByName('GRAFICO').IsNull;
        If Not CNX.TMP.FieldByName('GRAFICO').IsNull Then
        Begin
          lBtn.IMAGEN.Picture.Assign(TBlobField(CNX.TMP.FieldByName('GRAFICO')));
          lBtn.ETIQUETA.Font.Size := IfThen(gVariableGlobal.FONT_SIZE_A <= 0, 7, gVariableGlobal.FONT_SIZE_A);
        End
        Else
        Begin
          lBtn.ETIQUETA.Align := TAlign.alClient;
          lBtn.ETIQUETA.Font.Size := IfThen(gVariableGlobal.FONT_SIZE_B <= 0, 10, gVariableGlobal.FONT_SIZE_B);
        End;
        lBtn.NIVEL := TNivel.TN_Producto;
        lBtn.DIRECCION := TDireccion.TD_Avanzar;
        If Assigned(lClone) And (Not Vacio(lClone.CODIGO_LINEA)) Then
          lBtn.CODIGO_LINEA := lClone.CODIGO_LINEA;
        If Assigned(lClone) And (Not Vacio(lClone.CODIGO_GRUPO)) Then
          lBtn.CODIGO_GRUPO := lClone.CODIGO_GRUPO;
        If Assigned(lClone) And (Not Vacio(lClone.CODIGO_SUBGRUPO)) Then
          lBtn.CODIGO_SUBGRUPO := lClone.CODIGO_SUBGRUPO;
        lBtn.CODIGO_PRODUCTO := CNX.TMP.FieldByName('CODIGO_PRODUCTO').AsString;
        lBtn.NOMBRE := CNX.TMP.FieldByName('NOMBRE').AsString;
        lBtn.ETIQUETA.Caption := CNX.TMP.FieldByName('NOMBRE').AsString;
        If (FTipo_Documento = Const_Documento_Pedido) Or
          (FTipo_Documento = Const_Documento_Compra) Then
          lBtn.VALOR_UNITARIO := CNX.TMP.FieldByName('VALOR_COMPRA').AsFloat
        Else
          lBtn.VALOR_UNITARIO := CNX.TMP.FieldByName('VALOR_VENTA').AsFloat;
        lBtn.CANTIDAD_PROPUESTA :=
          CNX.TMP.FieldByName('CANTIDAD_PROPUESTA').AsFloat;
        lBtn.ID_FECHA_VENCIMIENTO :=
          Trim(CNX.TMP.FieldByName('ID_FECHA_VENCIMIENTO').AsString);
        Sleep(50);
        CNX.TMP.Next;
      End;
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    If Assigned(lClone) Then
      FreeAndNil(lClone);
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'TUtScrollBox.Cargar_Producto']);
    End;
  End;
End;

destructor TUtScrollBox.Destroy;
begin
  If Assigned(FIMAGE_HOME) Then
    FreeAndNil(FIMAGE_HOME);
  If Assigned(FIMAGE_BACK) Then
    FreeAndNil(FIMAGE_BACK);
  inherited;
end;

end.
