unit UtCerrar_Documento;

interface

Function Generar_Nota_Credito(Const pDatakey, pTipo_Documento, pObservacion : String) : Boolean;
Function Retornar_Tipo_Documento(pTipo_Documento : String) : String;
Function Inicializar_Documento(pEnc, pDet, pReceta, pObservacion : Integer; pDatakey : String) : Boolean;
Function Cerrar_Documento(Var pDatakeyNew : String; pDatakeyOld, pCodigo_Tercero, pTipo_Documento, pCodigo_Documento_Adm : String) : Boolean;

implementation

Uses
  Math,
  SysUtils,
  UtConexion,
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtVariablesGlobales,
  Tablename_Documento_Adm;

Function UtCerrar_Documento_GetDataKey : String;
Begin
  Result := FormatDateTime('YYYYMMDDHHNNSSZZZZZZ', Now);
End;

Function Retornar_Tipo_Documento(pTipo_Documento : String) : String;
Begin
  Result := pTipo_Documento;
  If pTipo_Documento = Const_Documento_SIN_DOCTO  Then
    Result := 'Sin documento asociado'
  Else
    If pTipo_Documento = Const_Documento_AUX        Then
      Result := 'Documento Auxiliar'
    Else
      If pTipo_Documento = Const_Documento_Pedido     Then
        Result := 'Documento Pedido'
      Else
        If pTipo_Documento = Const_Documento_Compra     Then
          Result := 'Documento Compra'
        Else
          If pTipo_Documento = Const_Documento_Cotizacion Then
            Result := 'Documento Cotización'
          Else
            If pTipo_Documento = Const_Documento_Factura    Then
              Result := 'Documento Factura'
            Else
              If pTipo_Documento = Const_Documento_Mesa       Then
                Result := 'Documento en Mesas'
              Else
                If pTipo_Documento = Const_Documento_CXC   Then
                  Result := 'Documento Cuentas por Cobrar'
                Else
                  If pTipo_Documento = Const_Documento_CXP   Then
                    Result := 'Documento Cuentas por Pagar'
                  Else
                    If pTipo_Documento = Const_Documento_Contable   Then
                       Result := 'Documento Contable';
End;

Function Inicializar_Documento(pEnc, pDet, pReceta, pObservacion : Integer; pDatakey : String) : Boolean;
Var
  lSQL : String;
Begin
  lSQL := 'DELETE FROM ' + Retornar_Info_Tabla(pReceta).Name + ' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(pDatakey);
  Result := gVariableGlobal.CNX.SQL_Boolean(lSQL, 'UtCerrar_Documento, Inicializar_Documento');

  If Result Then
  Begin
    lSQL := 'DELETE FROM ' + Retornar_Info_Tabla(pObservacion).Name + ' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(pDatakey);
    Result := gVariableGlobal.CNX.SQL_Boolean(lSQL, 'UtCerrar_Documento, Inicializar_Documento');
  End;

  If Result Then
  Begin
    lSQL := 'DELETE FROM ' + Retornar_Info_Tabla(pDet).Name + ' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(pDatakey);
    Result := gVariableGlobal.CNX.SQL_Boolean(lSQL, 'UtCerrar_Documento, Inicializar_Documento');
  End;

  If Result Then
  Begin
    lSQL := 'DELETE FROM ' + Retornar_Info_Tabla(pEnc).Name + ' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(pDatakey);
    Result := gVariableGlobal.CNX.SQL_Boolean(lSQL, 'UtCerrar_Documento, Inicializar_Documento');
  End;
End;


Function UtCerrar_Documento_Aplicar_Valor_Compra(Const pCodigo_Producto : String; Const pValor_Compra : Double) : Boolean;
Var
  lP : Double;
  lD : TQuery;
Begin
  Result := False;
  Try
    lD := TQuery.Create(Nil);
    lD.SQL.Clear;
    lD.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto).Name + ' ');
    lD.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_PRODUCTO') + ' = ' + QuotedStr(Trim(pCodigo_Producto)));
    lD.Active := True;
    If lD.Active And (lD.RecordCount > 0) Then
    Begin
      If (lD.FieldByName('MARGEN_UTILIDAD').AsFloat > 0) Or (gVariableGlobal.MARGEN_UTILIDAD > 0) Then
      Begin
        lD.Edit;
        lD.FieldByName('VALOR_COMPRA').AsFloat := pValor_Compra;
        If (lD.FieldByName('PORC_UTILIDAD').AsFloat > 0) Or (gVariableGlobal.MARGEN_UTILIDAD > 0) Then
        Begin
          lP := IfThen(lD.FieldByName('PORC_UTILIDAD').AsFloat > 0, lD.FieldByName('PORC_UTILIDAD').AsFloat, gVariableGlobal.MARGEN_UTILIDAD);
          If lP > 0 Then
            lD.FieldByName('VALOR_VENTA').AsFloat := pValor_Compra / (1 - (lP/100));
        End;
        lD.Post;
      End;
    End;
    Result := True;
    lD.Active := False;
    lD.Free;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCerrar_Documento, UtCerrar_Documento_Aplicar_Valor_Compra', 'Error', E.Message]);
  End;
End;


Function Trasladar_Detalle(Const pDatakeyOld, pDatakeyNew, pNumero_Documento : String) : Boolean;
Var
  lI : Integer;
  lO : TQuery;
  lD : TQuery;
Begin
  Result := False;
  Try
    lO := TQuery.Create(Nil);
    lD := TQuery.Create(Nil);
    lO.SQL.Clear;
    lO.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
    lO.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakeyOld)));
    lD.SQL.Clear;
    lD.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det).Name + ' ');
    lD.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakeyNew)));
    lO.Active := True;
    lD.Active := True;
    If lO.Active And (lO.RecordCount > 0) And lD.Active Then
    Begin
      lO.First;
      While Not lO.Eof Do
      Begin
        lD.Append;
        For lI := 0 To lO.Fields.Count-1 Do
          lD.FieldByName(lO.Fields[lI].FullName).AsVariant := lO.FieldByName(lO.Fields[lI].FullName).AsVariant;
        lD.FieldByName('DATAKEY').AsString := pDatakeyNew;
        lD.FieldByName('NUMERO_DOCUMENTO').AsString := pNumero_Documento;
        If lD.FieldByName('TIPO_DOCUMENTO').AsString = Const_Documento_Compra Then
        Begin
          UtCerrar_Documento_Aplicar_Valor_Compra(lD.FieldByName('CODIGO_PRODUCTO').AsString, lD.FieldByName('VALOR_ORIGINAL').AsFloat);
        End;
        lD.Post;
        lO.Next;
      End;
    End;
    Result := True;
    lD.Active := False;
    lD.Free;
    lO.Active := False;
    lO.Free;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Orige', 'UtCerrar_Documento, Trasladar_Detalle', 'Error', E.Message]);
  End;
End;

Function Trasladar_Observacion(Const pDatakeyOld, pDatakeyNew, pNumero_Documento : String) : Boolean;
Var
  lI : Integer;
  lO : TQuery;
  lD : TQuery;
Begin
  Result := False;
  Try
    lO := TQuery.Create(Nil);
    lD := TQuery.Create(Nil);
    lO.SQL.Clear;
    lO.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Obs_Aux).Name + ' ');
    lO.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakeyOld)));
    lD.SQL.Clear;
    lD.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Obs).Name + ' ');
    lD.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakeyNew)));
    lO.Active := True;
    lD.Active := True;
    If lO.Active And (lO.RecordCount > 0) And lD.Active Then
    Begin
      lO.First;
      While Not lO.Eof Do
      Begin
        lD.Append;
        For lI := 0 To lO.Fields.Count-1 Do
          lD.FieldByName(lO.Fields[lI].FullName).AsVariant := lO.FieldByName(lO.Fields[lI].FullName).AsVariant;
        lD.FieldByName('DATAKEY').AsString := pDatakeyNew;
        lD.Post;
        lO.Next;
      End;
    End;
    Result := True;
    lD.Active := False;
    lD.Free;
    lO.Active := False;
    lO.Free;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCerrar_Documento, Trasladar_Observacion', 'Error', E.Message]);
  End;
End;

Function Trasladar_Receta(Const pDatakeyOld, pDatakeyNew, pNumero_Documento : String) : Boolean;
Var
  lI : Integer;
  lO : TQuery;
  lD : TQuery;
Begin
  Result := False;
  Try
    lO := TQuery.Create(Nil);
    lD := TQuery.Create(Nil);
    lO.SQL.Clear;
    lO.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Rec_Aux).Name + ' ');
    lO.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakeyOld)));
    lD.SQL.Clear;
    lD.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Rec).Name + ' ');
    lD.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakeyNew)));
    lO.Active := True;
    lD.Active := True;
    If lO.Active And (lO.RecordCount > 0) And lD.Active Then
    Begin
      lO.First;
      While Not lO.Eof Do
      Begin
        lD.Append;
        For lI := 0 To lO.Fields.Count-1 Do
          lD.FieldByName(lO.Fields[lI].FullName).AsVariant := lO.FieldByName(lO.Fields[lI].FullName).AsVariant;
        lD.FieldByName('DATAKEY').AsString := pDatakeyNew;
        lD.Post;
        lO.Next;
      End;
    End;
    Result := True;
    lD.Active := False;
    lD.Free;
    lO.Active := False;
    lO.Free;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCerrar_Documento, Trasladar_Receta', 'Error', E.Message]);
  End;
End;

Function Trasladar_Maestro(Const pDatakeyOld, pDatakeyNew, pNumero_Documento : String) : Boolean;
Var
  lI : Integer;
  lO : TQuery;
  lD : TQuery;
Begin
  Result := False;
  Try
    lO := TQuery.Create(Nil);
    lD := TQuery.Create(Nil);
    lO.SQL.Clear;
    lO.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + ' ');
    lO.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakeyOld)));
    lD.SQL.Clear;
    lD.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' ');
    lD.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakeyNew)));
    lO.Active := True;
    lD.Active := True;
    If lO.Active And (lO.RecordCount > 0) And lD.Active Then
    Begin
      lO.First;
      While Not lO.Eof Do
      Begin
        lD.Append;
        For lI := 0 To lO.Fields.Count-1 Do
          lD.FieldByName(lO.Fields[lI].FullName).AsVariant := lO.FieldByName(lO.Fields[lI].FullName).AsVariant;
        lD.FieldByName('NUMERO_DOCUMENTO').AsString := pNumero_Documento;
        lD.FieldByName('DATAKEY'   ).AsString := pDatakeyNew;
        lD.FieldByName('ENCABEZADO').AsString := gVariableGlobal.ENCABEZADO.Text;
        lD.FieldByName('PIE_PAGINA').AsString := gVariableGlobal.PIE_PAGINA.Text;
        lD.FieldByName('CAR_PAGADA').AsFloat := 0;
        lD.Post;
        lO.Next;
        Result := True;
      End;
    End;
    lD.Active := False;
    lD.Free;
    lO.Active := False;
    lO.Free;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCerrar_Documento, Trasladar_Maestro', 'Error', E.Message]);
  End;
End;

Function Cerrar_Documento(Var pDatakeyNew : String; pDatakeyOld, pCodigo_Tercero, pTipo_Documento, pCodigo_Documento_Adm : String) : Boolean;
Var
  lId_Salida : String;
  lNumero_Documento : String;
  lCodigo_Documento_Adm : String;
Begin
  Result := False;
  lCodigo_Documento_Adm := pCodigo_Documento_Adm;
  If Not Tablename_Documento_Adm_Codigo_Numero_Documento(pTipo_Documento, lCodigo_Documento_Adm, lNumero_Documento, lId_Salida) Then
  Begin
    Mensajes('No se ha establecido información necesaria en la administración de documentos');
    Exit;
  End;
  Result := Const_Documento_SIN_DOCTO <> lNumero_Documento;
  If Result Then
  Begin
    Result := Documento_Disponible(pTipo_Documento, lNumero_Documento);
  End
  Else
  Begin
    Mensajes('No se ha establecido información necesaria en la administración de documentos');
    Exit;
  End;
  If Result Then
  Begin
    pDatakeyNew := UtCerrar_Documento_GetDataKey;
    Result := Trasladar_Maestro(pDatakeyOld, pDatakeyNew, lNumero_Documento);
    If Result Then
      Result := Trasladar_Receta(pDatakeyOld, pDatakeyNew, lNumero_Documento);
    If Result Then
      Result := Trasladar_Observacion(pDatakeyOld, pDatakeyNew, lNumero_Documento);
    If Result Then
      Result := Trasladar_Detalle(pDatakeyOld, pDatakeyNew, lNumero_Documento);
    If Result Then
      Result := Actualizar_Numero_Documento_Adm(lCodigo_Documento_Adm, lNumero_Documento);
  End;
End;

Function Generar_Nota_Credito(Const pDatakey, pTipo_Documento, pObservacion : String) : Boolean;
Var
  lI : Integer;
  lO : TQuery;
  lD : TQuery;
  lDataKey : String;
  lId_Salida : String;
  lNumero_Documento : String;
  lCodigo_Documento_Adm : String;
Begin
  Result := False;
  If Not Tablename_Documento_Adm_Codigo_Numero_Documento(pTipo_Documento, lCodigo_Documento_Adm, lNumero_Documento, lId_Salida) Then
  Begin
    Mensajes('No se ha establecido información necesaria en la administración de documentos');
    Exit;
  End;
  Result := Const_Documento_SIN_DOCTO <> lNumero_Documento;
  If Result Then
  Begin
    Result := Documento_Disponible(pTipo_Documento, lNumero_Documento);
  End
  Else
  Begin
    Mensajes('No se ha establecido información necesaria en la administración de documentos');
    Exit;
  End;
  Try
    If Result Then
    Begin
      lO := TQuery.Create(Nil);
      lD := TQuery.Create(Nil);
      lO.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' ');
      lO.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakey)) + ' ');
      lO.Active := True ;
      Result := lO.Active And (lO.RecordCount > 0);
      If Result Then
      Begin
        lDataKey := UtCerrar_Documento_GetDataKey;
        lD.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' ');
        lD.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakey)) + ' ');
        lD.Active := True;
        If lD.Active Then
        Begin
          lD.Append;
          For lI := 0 To lD.Fields.Count-1 Do
            lD.FieldByName(lD.Fields[lI].FullName).AsVariant := lO.Fields[lI].AsVariant;
          lD.FieldByName('ORIGEN_REFERENCIA').AsString := lO.FieldByName('TIPO_DOCUMENTO').AsString;
          lD.FieldByName('DATAKEY_REFERENCIA').AsString := lO.FieldByName('DATAKEY').AsString;
          lD.FieldByName('DOCUMENTO_REFERENCIA').AsString := lO.FieldByName('NUMERO_DOCUMENTO').AsString;
          lD.FieldByName('TIPO_DOCUMENTO').AsString := pTipo_Documento;
          lD.FieldByName('NUMERO_DOCUMENTO').AsString := lNumero_Documento;
          lD.FieldByName('DATAKEY').AsString := lDataKey;
          lD.FieldByName('OBSERVACION').AsString := pObservacion;
          lD.Post;
        End;
        lD.Active := False;
        FreeAndNil(lD);
        Result := Actualizar_Numero_Documento_Adm(lCodigo_Documento_Adm, lNumero_Documento);
      End;
      lO.Active := False;
      FreeAndNil(lO);
    End;
  Except
    On E: Exception Do
    Begin
      Result := False;
      gVariableGlobal.Add_Log(E, ['Origen', 'UtCerrar_Documento, Generar_Nota_Credito', 'Error', E.Message]);
    End;
  End;
End;

end.
