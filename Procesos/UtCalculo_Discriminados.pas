unit UtCalculo_Discriminados;

interface
Function UtCalculo_Discriminados_Execute(Const pEnc, pDet : Integer; Const pDataKey : String) : Boolean;

implementation
Uses
  SysUtils,
  StrUtils,
  UtConexion,
  UtFunciones,
  UtInfoTablas,
  UtValidar_Tablas,
  UtVariablesGlobales;


Function UtCalculo_Discriminados_Valor_Original(Const pDet : Integer; Const pDatakey : String) : Double;
Var
  lI : Integer;
  lSQL : TQuery;
Begin
  Result := 0;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT  ');
    lSQL.SQL.Add(' SUM(VALOR_ORIGINAL) AS VALOR_ORIGINAL ');
    lSQL.SQL.Add(' FROM ' + Retornar_Info_Tabla(pDet).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakey)));
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      Result := lSQL.FieldByName('VALOR_ORIGINAL').AsFloat;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCalculo_Discriminados_Valor_Original']);
  End;
End;

Function UtCalculo_Discriminados_Valor_Bruto(Const pDet : Integer; Const pDatakey : String) : Double;
Var
  lI : Integer;
  lSQL : TQuery;
Begin
  Result := 0;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.Active := False;
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT  ');
    lSQL.SQL.Add(' SUM(VALOR_BRUTO) AS VALOR_BRUTO ');
    lSQL.SQL.Add(' FROM ' + Retornar_Info_Tabla(pDet).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakey)));
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      Result := lSQL.FieldByName('VALOR_BRUTO').AsFloat;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCalculo_Discriminados_Valor_Bruto']);
  End;
End;

Function UtCalculo_Discriminados_Impuesto(Const pDet : Integer; pQuery : TQuery) : Boolean;
Const
  lArray  : Array [0..5] of string = ({'SERVICIO', 'DESCUENTO', }'IVA', 'RETEIVA', 'RETEFUENTE', 'ICA', 'IMPCONSUMO', 'CREE');
Var
  lI : Integer;
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    For lI := Low(lArray) To High(lArray) Do
    Begin
      lSQL.Active := False;
      lSQL.SQL.Clear;
      lSQL.SQL.Add(' SELECT  ');
      lSQL.SQL.Add(' PORC_' + lArray[lI] + ' AS PORCENTAJE , ');
      lSQL.SQL.Add(' SUM(VALOR_NETO) AS VALOR_BASE, ');
      lSQL.SQL.Add(' SUM(VALOR_' + lArray[lI] + ') AS VALOR_IMPUESTO ');
      lSQL.SQL.Add(' FROM ' + Retornar_Info_Tabla(pDet).Name + ' ');
      lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pQuery.FieldByName('DATAKEY').AsString)));
      lSQL.SQL.Add(' GROUP BY PORC_' + lArray[lI] + ' ');
      lSQL.Active := True;
      If lSQL.Active And (lSQL.RecordCount > 0) Then
      Begin
        pQuery.Edit;
        lSQL.First;
        While Not lSQL.Eof Do
        Begin
          If lSQL.FieldByName('PORCENTAJE').AsFloat > 0 Then
          Begin
            If Not (gVariableGlobal.ID_ORDEN_TOTALES = 'MAMASANTA') Then
            Begin
              If Not Vacio(pQuery.FieldByName('DISCRIMINADOS').AsString) Then
                pQuery.FieldByName('DISCRIMINADOS').AsString := pQuery.FieldByName('DISCRIMINADOS').AsString + #13;
              pQuery.FieldByName('DISCRIMINADOS').AsString := pQuery.FieldByName('DISCRIMINADOS').AsString +
                                                              'BASE=' + FormatFloat('###,###,##0.#0', lSQL.FieldByName('VALOR_BASE').AsFloat) + ', ' +
                                                              lArray[lI] + ' ' + FormatFloat('###,###,##0.#0', lSQL.FieldByName('PORCENTAJE').AsFloat) + '= ' +
                                                              FormatFloat('###,###,##0.#0', lSQL.FieldByName('VALOR_IMPUESTO').AsFloat);
            End;
          End;
          lSQL.Next;
        End;
        pQuery.Post;
      End;
      lSQL.Active := False;
    End;
    lSQL.Free;
    Result := True;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCalculo_Discriminados_Impuesto']);
  End;
End;

Function UtCalculo_Discriminados_Forma_Pago(pSQL : TQuery) : String;
Const
  Const_Sandria = '  ';
Begin
  Result := #13 + 'FORMA DE PAGO';
  If pSQL.FieldByName('EFE').AsFloat > 0 Then
  Begin
    Result := Result + #13 + Const_Sandria + 'Efectivo: ' + FormatFloat('###,###,##0,#0', pSQL.FieldByName('EFE').AsFloat);
  End;

  If pSQL.FieldByName('TDD').AsFloat > 0 Then
  Begin
    Result := Result + #13 + Const_Sandria + 'Tarjeta Debito: ' + FormatFloat('###,###,##0,#0', pSQL.FieldByName('TDD').AsFloat) +
                       #13 + Const_Sandria + Trim(gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [pSQL.FieldByName('TDD_ENTIDAD').AsString], ['NOMBRE'], 'UtCalculo_Discriminados_Forma_Pago')) +
                       ', Referencia: ' + Trim(pSQL.FieldByName('TDD_VAUCHE').AsString);
  End;

  If pSQL.FieldByName('TDC').AsFloat > 0 Then
  Begin
    Result := Result + #13 + Const_Sandria + 'Tarjeta Credito: ' + FormatFloat('###,###,##0,#0', pSQL.FieldByName('TDC').AsFloat) +
                       #13 + Const_Sandria + Trim(gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [pSQL.FieldByName('TDC_ENTIDAD').AsString], ['NOMBRE'], 'UtCalculo_Discriminados_Forma_Pago')) +
                       ', Referencia: ' + Trim(pSQL.FieldByName('TDC_VAUCHE').AsString);
  End;

  If pSQL.FieldByName('CHE').AsFloat > 0 Then
  Begin
    Result := Result + #13 + Const_Sandria + 'Cheque: ' + FormatFloat('###,###,##0,#0', pSQL.FieldByName('TDC').AsFloat) +
                       #13 + Const_Sandria + Trim(gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [pSQL.FieldByName('TDC_ENTIDAD').AsString], ['NOMBRE'], 'UtCalculo_Discriminados_Forma_Pago'));
  End;

  If pSQL.FieldByName('TRANSF').AsFloat > 0 Then
  Begin
    Result := Result + #13 + Const_Sandria + 'Transferencia: ' + FormatFloat('###,###,##0,#0', pSQL.FieldByName('TRANSF').AsFloat) +
                       #13 + Const_Sandria + Trim(gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [pSQL.FieldByName('TRANSF_ENTIDAD').AsString], ['NOMBRE'], 'UtCalculo_Discriminados_Forma_Pago')) +
                       IfThen(Not Vacio(pSQL.FieldByName('TRANSF_VAUCHE').AsString), ', Referecia: ' + Trim(pSQL.FieldByName('TRANSF_VAUCHE').AsString));
  End;

  If pSQL.FieldByName('SDX').AsFloat > 0 Then
    Result := Result + #13 + Const_Sandria + 'Sodexo: ' + FormatFloat('###,###,##0,#0', pSQL.FieldByName('SDX').AsFloat);

  If pSQL.FieldByName('COR').AsFloat > 0 Then
    Result := Result + #13 + Const_Sandria + 'Cortesia: ' + FormatFloat('###,###,##0,#0', pSQL.FieldByName('COR').AsFloat);

  If pSQL.FieldByName('SISTEMA_CREDITO').AsFloat > 0 Then
    Result := Result + #13 + Const_Sandria + 'Sistema de Credito: ' + FormatFloat('###,###,##0,#0', pSQL.FieldByName('SISTEMA_CREDITO').AsFloat);

  If pSQL.FieldByName('CAR').AsFloat > 0 Then
    Result := Result + #13 + Const_Sandria + 'Cartera: ' + FormatFloat('###,###,##0,#0', pSQL.FieldByName('CAR').AsFloat);

  If pSQL.FieldByName('VALOR_PAGADO').AsFloat > 0 Then
    Result := Result + #13 + Const_Sandria + 'Valor Pagado en Efectivo: ' + FormatFloat('###,###,##0,#0', pSQL.FieldByName('VALOR_PAGADO').AsFloat);

  If pSQL.FieldByName('VALOR_VUELTO').AsFloat > 0 Then
    Result := Result + #13 + Const_Sandria + 'Valor Vuelto: ' + FormatFloat('###,###,##0,#0', pSQL.FieldByName('VALOR_VUELTO').AsFloat);
End;

Function UtCalculo_Discriminados_Totales(pSQL : TQuery; Const pDet : Integer; Const pDatakey : String) : String;
Const
  Const_Sandria = '  ';
//lArray  : Array [0..11] of string = ({'VALOR_SUBTOTAL', 'VALOR_BASE', }'VALOR_DESCUENTO', 'VALOR_NETO', 'VALOR_SERVICIO', 'VALOR_IVA', 'VALOR_RETEIVA', 'VALOR_RETEFUENTE', 'VALOR_ICA', 'VALOR_IMPCONSUMO', 'VALOR_CREE', 'VALOR_INTERES', 'VALOR_TOTAL', 'VALOR_DIVIDIDO');
//lArray  : Array [0..11] of string = ('VALOR_DESCUENTO', 'VALOR_NETO', 'VALOR_IVA', 'VALOR_IMPCONSUMO', 'VALOR_SERVICIO', 'VALOR_RETEIVA', 'VALOR_RETEFUENTE', 'VALOR_ICA', 'VALOR_CREE', 'VALOR_INTERES', 'VALOR_TOTAL', 'VALOR_DIVIDIDO');
Var
  lV : Double;
  lI : Integer;
  lArray  : Array [0..11] Of string;
Begin
  lArray[00] := 'VALOR_DESCUENTO';
  lArray[01] := 'VALOR_NETO';
  lArray[02] := 'VALOR_IMPCONSUMO';
  lArray[03] := 'VALOR_SERVICIO';
  lArray[04] := 'VALOR_IVA';
  lArray[05] := 'VALOR_RETEIVA';
  lArray[06] := 'VALOR_RETEFUENTE';
  lArray[07] := 'VALOR_ICA';
  lArray[08] := 'VALOR_CREE';
  lArray[09] := 'VALOR_INTERES';
  lArray[10] := 'VALOR_TOTAL';
  lArray[11] := 'VALOR_DIVIDIDO';
  If Not (gVariableGlobal.ID_ORDEN_TOTALES = 'MAMASANTA') Then
    Result := #13 + #13 + 'TOTAL' + #13 + #13;
  lV := UtCalculo_Discriminados_Valor_Bruto(pDet, pDatakey);
  For lI := Low(lArray) To High(lArray) Do
    If pSQL.FieldByName(lArray[lI]).AsFloat > 0 Then
    Begin
      Result := Result + #13 + Const_Sandria + StringReplace(lArray[lI], 'VALOR_', '', [rfReplaceAll]) + ': ' + FormatFloat('###,###,##0,#0', pSQL.FieldByName(lArray[lI]).AsFloat);
    End;
  Result := StringReplace(Result, 'NETO', 'SUBTOTAL', [rfReplaceAll]);
  If gVariableGlobal.ID_ORDEN_TOTALES = 'MAMASANTA' Then
  Begin
    Result := StringReplace(Result, 'SUBTOTAL', 'BASE GRAVADA', [rfReplaceAll]);
  End;
End;

Function UtCalculo_Discriminados_Execute(Const pEnc, pDet : Integer; Const pDataKey : String) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.Active := False;
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' UPDATE ' + Retornar_Info_Tabla(pDet).Name + ' ');
    lSQL.SQL.Add(' SET VALOR_BRUTO = CANTIDAD * VALOR_ORIGINAL' );
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDataKey)));
    lSQL.ExecSQL;
    lSQL.Active := False;
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT * ');
    lSQL.SQL.Add(' FROM ' + Retornar_Info_Tabla(pEnc).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDataKey)));
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.Edit;
      lSQL.FieldByName('DISCRIMINADOS').Clear;
      lSQL.Post;
      Result := UtCalculo_Discriminados_Impuesto(pDet, lSQL);
      If Result Then
      Begin
        lSQL.Edit;
        lSQL.FieldByName('VALOR_INICIAL').AsFloat  := UtCalculo_Discriminados_Valor_Original(pDet, pDataKey);
        lSQL.FieldByName('VALOR_BRUTO'  ).AsFloat  := UtCalculo_Discriminados_Valor_Bruto   (pDet, pDataKey);
        lSQL.FieldByName('DISCRIMINADOS').AsString := lSQL.FieldByName('DISCRIMINADOS').AsString +
                                                      UtCalculo_Discriminados_Totales(lSQL, pDet, pDataKey) + #13 +
                                                      UtCalculo_Discriminados_Forma_Pago(lSQL);

        lSQL.FieldByName('TOTAL_CON_DOMICILIO').AsFloat := 0;
        If lSQL.FieldByName('VALOR_DOMICILIO').AsFloat > 0 Then
        Begin
          lSQL.FieldByName('DISCRIMINADOS').AsString := lSQL.FieldByName('DISCRIMINADOS').AsString + #13 +
                                                        'DOMICILIO: ' + FormatFloat('###,###,##0,#0', lSQL.FieldByName('VALOR_DOMICILIO').AsFloat);
          lSQL.FieldByName('TOTAL_CON_DOMICILIO').AsFloat := lSQL.FieldByName('VALOR_TOTAL').AsFloat + lSQL.FieldByName('VALOR_DOMICILIO').AsFloat;
          lSQL.FieldByName('DISCRIMINADOS').AsString := lSQL.FieldByName('DISCRIMINADOS').AsString + #13 +
                                                        'TOTAL + DOMICILIO: ' + FormatFloat('###,###,##0,#0', lSQL.FieldByName('TOTAL_CON_DOMICILIO').AsFloat);
        End;

        lSQL.Post;
      End;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCalculo_Discriminados_Execute']);
  End;
End;

end.
