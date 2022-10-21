unit UtCalculo_Impuestos;

interface
Uses
  DB,
  UtConexion;

Function Redondear_Calculo(pValue : Double) : Double;
Function Redondear_TRM(pValue : Double) : Double;
Function Calcular_Impuestos_Detalle(pMaster, pDetail : TQuery) : Boolean;
Function Calcular_Impuesto_Encabezado(pQuery : TQuery; pDataSource : TDataSource) : Boolean; Overload;
Function Calcular_Impuesto_Encabezado(pQuery : TQuery; pDataSource : TDataSource; pDetalle : Integer) : Boolean; Overload;
Function Calcular_Detalles_Documento(pEnc, pDet : Integer; pDataKey : String) : Boolean;
Function Recalcular_Documentos(Const pEnc, pDet : Integer; Const pFechaIni, pFechaFin : String) : Boolean;

implementation
Uses
  Math,
  SysUtils,
  UtFunciones,
  Form_Splash,
  UtConstantes,
  UtInfoTablas,
  UtCentral_Ventas,
  UtVariablesGlobales,
  UtCalculo_Discriminados;

Function Redondear_Calculo(pValue : Double) : Double;
Var
  lI : Integer;
  lInt : Integer;
Begin
  Result := RoundTo(pValue, gVariableGlobal.ID_DECIMALES);
  If Round(Result) < Round(pValue) Then
  Begin
    lInt := 1;
    For lI := 1 To gVariableGlobal.ID_DECIMALES Do
    Begin
      lInt := lInt * 10;
      If Round(Result) < Round(pValue) Then
      Begin
        Result := RoundTo(pValue + lInt, gVariableGlobal.ID_DECIMALES);
      End;
    End;
  End;
End;

Function Redondear_TRM(pValue : Double) : Double;
Begin
  Result := RoundTo(pValue, gVariableGlobal.ID_Decimales_TRM);
End;

Function Retornar_Valor_Base(pDataKey, pConsecutivo : String) : Double;
Var
  lSQL : TQuery;
Begin
  Result := 0;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT SUM(VALOR_SUBTOTAL) AS RESULTADO ');
    lSQL.SQL.Add(' FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY'    ) + ' = '  + QuotedStr(Trim(pDataKey     )));
    lSQL.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('CONSECUTIVO') + ' <> ' + QuotedStr(Trim(pConsecutivo)));
    lSQL.Active := True ;
    If lSQL.Active Then
      Result := Redondear_Calculo(lSQL.FieldByName('RESULTADO').AsFloat);
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCalculo_Impuestos, Retornar_Valor_Base']);
  End;
End;

Function Calculo_Impuesto(pPorcentaje, pBase : Double) : Double;
Begin
//  Result := Redondear_Calculo(pBase * (pPorcentaje/100));
  Result := pBase * (pPorcentaje/100);
End;

Function Lista_Precio_Producto(pCodigo_Producto, pTipo_Documento : String; pCantidad, pValor : Double; Var pCodigo_Producto_LP, pCodigo_Impuesto, pTipoLP : String; Var pValorOut : Double) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto_LP).Name );
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_PRODUCTO') + ' = '  + QuotedStr(Trim(pCodigo_Producto)));
    lSQL.SQL.Add(' AND ' );
    lSQL.SQL.Add(' ( ' );
    lSQL.SQL.Add(  ' ( ' );
      lSQL.SQL.Add('RANGO_INICIAL <= '   + FormatFloat('#############0', pCantidad));
      lSQL.SQL.Add('AND RANGO_FINAL >= ' + FormatFloat('#############0', pCantidad));
      lSQL.SQL.Add('AND ');
      lSQL.SQL.Add(' ( ');
      lSQL.SQL.Add('TIPO_LP = ' + QuotedStr('C') + ' OR ' + 'TIPO_LP = ' + QuotedStr('I'));
      lSQL.SQL.Add(' ) ');
    lSQL.SQL.Add(  ' ) ' );
    lSQL.SQL.Add(  ' OR  ( ' );
      lSQL.SQL.Add('RANGO_INICIAL <= '   + FormatFloat('#############0', pValor));
      lSQL.SQL.Add('AND RANGO_FINAL >= ' + FormatFloat('#############0', pValor));
      lSQL.SQL.Add('AND ');
      lSQL.SQL.Add(' ( ');
      lSQL.SQL.Add('TIPO_LP = ' + QuotedStr('V') + ' OR ' + 'TIPO_LP = ' + QuotedStr('I'));
      lSQL.SQL.Add(' ) ');
    lSQL.SQL.Add(  ' ) ' );
    lSQL.SQL.Add(' ) ' );
    lSQL.Active := True ;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      pCodigo_Producto_LP := lSQL.FieldByName('CODIGO_PRODUCTO_LP').AsString;
      pValorOut := lSQL.FieldByName('VALOR_VENTA').AsFloat;
      pTipoLP := lSQL.FieldByName('TIPO_LP').AsString;
      If pTipo_Documento = Const_Documento_Compra Then
        pCodigo_Impuesto := lSQL.FieldByName('IMPUESTO_COMPRA').AsString
      Else
        If pTipo_Documento = Const_Documento_Factura Then
          pCodigo_Impuesto := lSQL.FieldByName('IMPUESTO_VENTA').AsString;
      Result := True;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCalculo_Impuestos, Lista_Precio_Producto']);
  End;
End;

Function Calcular_Impuestos_Detalle(pMaster, pDetail : TQuery) : Boolean;
Var
  lValor : Double;
  lTipoLP : String;
  lSubtotal : Double;
  lCantidad : Double;
  lFieldName : String;
  lLista_Precio : String;
  lCodigo_Impuesto : String;
Begin
  lValor := 0;
  Result := True;
  lSubtotal := 0;
  lCantidad := 0;
  Try
    If (Not pDetail.Active) Or Vacio(pDetail.FieldByName('CODIGO_PRODUCTO').AsString) Or Vacio(pDetail.FieldByName('CONSECUTIVO').AsString) Then
      Exit;

    If Not (pDetail.State In [dsInsert, dsEdit]) Then
      pDetail.Edit;

    If Vacio(pDetail.FieldByName('DATAKEY').AsString) Then
      pDetail.FieldByName('DATAKEY').AsString := pMaster.FieldByName('DATAKEY').AsString;
    pDetail.FieldByName('VALOR_SERVICIO'    ).AsFloat := 0;
    pDetail.FieldByName('VALOR_BASE'        ).AsFloat := 0;
    pDetail.FieldByName('VALOR_IVA'         ).AsFloat := 0;
    pDetail.FieldByName('VALOR_IMPCONSUMO'  ).AsFloat := 0;
    pDetail.FieldByName('VALOR_RETEIVA'     ).AsFloat := 0;
    pDetail.FieldByName('VALOR_RETEFUENTE'  ).AsFloat := 0;
    pDetail.FieldByName('VALOR_ICA'         ).AsFloat := 0;
    pDetail.FieldByName('VALOR_CREE'        ).AsFloat := 0;
    pDetail.FieldByName('TOTAL_TRM'         ).AsFloat := 0;
    pDetail.FieldByName('VALOR_LP_DET'      ).AsFloat := 0;
    pDetail.FieldByName('VALOR_LP_ENC'      ).AsFloat := 0;

    pDetail.FieldByName('CODIGO_PRODUCTO_LP').Clear;
    pDetail.FieldByName('VALOR_BASE' ).AsFloat := pDetail.FieldByName('VALOR_ORIGINAL').AsFloat * (IfThen(pDetail.FieldByName('CANTIDAD').AsFloat >= 0, 1, -1));
    pDetail.FieldByName('VALOR_BRUTO').AsFloat := pDetail.FieldByName('VALOR_ORIGINAL').AsFloat * pDetail.FieldByName('CANTIDAD').AsFloat * (IfThen(pDetail.FieldByName('CANTIDAD').AsFloat >= 0, 1, -1));
    If (pMaster.FieldByName('TIPO_DOCUMENTO').AsString = Const_Documento_Cotizacion) Or
       (pMaster.FieldByName('TIPO_DOCUMENTO').AsString = Const_Documento_Factura   ) Or
       (pMaster.FieldByName('TIPO_DOCUMENTO').AsString = Const_Documento_Factura   ) Or
       (pMaster.FieldByName('TIPO_DOCUMENTO').AsString = Const_Documento_Factura   ) Then
    Begin
      pDetail.FieldByName('VALOR_BASE' ).AsFloat := Redondear_Calculo(pDetail.FieldByName('VALOR_ORIGINAL').AsFloat);
      pDetail.FieldByName('VALOR_BRUTO').AsFloat := Redondear_Calculo(pDetail.FieldByName('VALOR_ORIGINAL').AsFloat * pDetail.FieldByName('CANTIDAD').AsFloat);
    End;
    pDetail.FieldByName('VALOR_INICIAL').AsFloat := pDetail.FieldByName('VALOR_BASE').AsFloat;
    pDetail.FieldByName('VALOR_DESCUENTO').AsFloat := Calculo_Impuesto(pDetail.FieldByName('PORC_DESCUENTO').AsFloat, pDetail.FieldByName('VALOR_ORIGINAL').AsFloat);
    pDetail.FieldByName('VALOR_BASE'     ).AsFloat := pDetail.FieldByName('VALOR_BASE').AsFloat - pDetail.FieldByName('VALOR_DESCUENTO').AsFloat;
    pDetail.FieldByName('VALOR_BASICO'   ).AsFloat := pDetail.FieldByName('VALOR_BASE').AsFloat;
    If pDetail.FieldByName('PORC_BASE').AsFloat <> 0 Then
    Begin
      pDetail.FieldByName('VALOR_BASE').AsFloat := pDetail.FieldByName('VALOR_BASE').AsFloat / pDetail.FieldByName('PORC_BASE').AsFloat;
//      If (pMaster.FieldByName('TIPO_DOCUMENTO').AsString = Const_Documento_Cotizacion) Or (pMaster.FieldByName('TIPO_DOCUMENTO').AsString = Const_Documento_Factura) Then
      pDetail.FieldByName('PORC_IVA'  ).AsFloat := (pDetail.FieldByName('PORC_BASE').AsFloat -1) * 100;
    End;
    pDetail.FieldByName('VALOR_CALCULADO').AsFloat := pDetail.FieldByName('VALOR_BASE').AsFloat;

    If (pMaster.FieldByName('TIPO_DOCUMENTO').AsString = Const_Documento_Cotizacion) Or (pMaster.FieldByName('TIPO_DOCUMENTO').AsString = Const_Documento_Factura) Then
    Begin
      If Lista_Precio_Producto(pDetail.FieldByName('CODIGO_PRODUCTO').AsString, pDetail.FieldByName('TIPO_DOCUMENTO').AsString, pDetail.FieldByName('CANTIDAD').AsFloat, pDetail.FieldByName('VALOR_ORIGINAL').AsFloat * pDetail.FieldByName('CANTIDAD').AsFloat, lLista_Precio, lCodigo_Impuesto, lTipoLP, lValor) Then
      Begin
        pDetail.FieldByName('CODIGO_PRODUCTO_LP').AsString := lLista_Precio;
        If (lTipoLP = 'I') Then
        Begin
          If lCodigo_Impuesto <> pDetail.FieldByName('CODIGO_IMPUESTO').AsString Then
            UtCentral_Ventas_Cargar_Porcentajes(pDetail, pDetail.FieldByName('TIPO_DOCUMENTO').AsString, lCodigo_Impuesto);
        End
        Else
        Begin
          pDetail.FieldByName('VALOR_CALCULADO').AsFloat := lValor;
          pDetail.FieldByName('VALOR_LP_DET').AsFloat := pDetail.FieldByName('VALOR_ORIGINAL').AsFloat - lValor;
        End;
      End;
    End;
    pDetail.FieldByName('VALOR_SUBTOTAL').AsFloat := Abs(pDetail.FieldByName('VALOR_CALCULADO').AsFloat) * pDetail.FieldByName('CANTIDAD').AsFloat;
    pDetail.FieldByName('VALOR_NETO'    ).AsFloat := pDetail.FieldByName('VALOR_SUBTOTAL').AsFloat;

//    If (pMaster.FieldByName('TIPO_DOCUMENTO').AsString = Const_Documento_Cotizacion) Or (pMaster.FieldByName('TIPO_DOCUMENTO').AsString = Const_Documento_Factura) Then
//        pDetail.FieldByName('VALOR_SUBTOTAL').AsFloat := Redondear_Calculo(pDetail.FieldByName('VALOR_SUBTOTAL').AsFloat);

    If (pMaster.FieldByName('BASE_DESCUENTO').AsFloat <= lSubtotal) And (pDetail.FieldByName('PORC_DESCUENTO').AsFloat <> 0) Then
    Begin
//      pDetail.FieldByName('VALOR_DESCUENTO').AsFloat := Calculo_Impuesto(pDetail.FieldByName('PORC_DESCUENTO').AsFloat, pDetail.FieldByName('VALOR_SUBTOTAL').AsFloat);
//      pDetail.FieldByName('VALOR_SUBTOTAL').AsFloat  := pDetail.FieldByName('VALOR_SUBTOTAL').AsFloat - pDetail.FieldByName('VALOR_DESCUENTO').AsFloat;
      pDetail.FieldByName('VALOR_DESCUENTO').AsFloat := Calculo_Impuesto(pDetail.FieldByName('PORC_DESCUENTO').AsFloat, Abs(pDetail.FieldByName('VALOR_ORIGINAL').AsFloat) * pDetail.FieldByName('CANTIDAD').AsFloat);
      pDetail.FieldByName('VALOR_SUBTOTAL' ).AsFloat := (Abs(pDetail.FieldByName('VALOR_ORIGINAL').AsFloat) * pDetail.FieldByName('CANTIDAD').AsFloat) - pDetail.FieldByName('VALOR_DESCUENTO').AsFloat;
    End;

    If pMaster.FieldByName('PORCENTAJE_LP').AsFloat <> 0 Then
    Begin
      pDetail.FieldByName('VALOR_NETO').AsFloat := (1 - (pMaster.FieldByName('PORCENTAJE_LP').AsFloat/100)) * pDetail.FieldByName('VALOR_SUBTOTAL').AsFloat;
      pDetail.FieldByName('VALOR_LP_ENC').AsFloat := pDetail.FieldByName('VALOR_SUBTOTAL').AsFloat - pDetail.FieldByName('VALOR_NETO').AsFloat;
    End;

    If (gVariableGlobal.SERVICIO_MANUAL = 'N') Or (pMaster.FieldByName('ID_PROPINA').AsString = 'S') Then
      If pMaster.FieldByName('BASE_SERVICIO').AsFloat <= lSubtotal Then
        pDetail.FieldByName('VALOR_SERVICIO' ).AsFloat := Calculo_Impuesto(pDetail.FieldByName('PORC_SERVICIO' ).AsFloat, pDetail.FieldByName('VALOR_NETO').AsFloat);

    If (pMaster.FieldByName('BASE_IVA').AsFloat <= lSubtotal) Then
      pDetail.FieldByName('VALOR_IVA').AsFloat := Calculo_Impuesto(pDetail.FieldByName('PORC_IVA').AsFloat, pDetail.FieldByName('VALOR_NETO').AsFloat);

    If pMaster.FieldByName('BASE_IMPCONSUMO').AsFloat <= lSubtotal Then
      pDetail.FieldByName('VALOR_IMPCONSUMO').AsFloat := Calculo_Impuesto(pDetail.FieldByName('PORC_IMPCONSUMO').AsFloat, pDetail.FieldByName('VALOR_NETO').AsFloat);

    If pMaster.FieldByName('BASE_RETEIVA').AsFloat <= lSubtotal Then
      pDetail.FieldByName('VALOR_RETEIVA').AsFloat := Calculo_Impuesto(pDetail.FieldByName('PORC_RETEIVA').AsFloat, pDetail.FieldByName('VALOR_NETO').AsFloat);

    If pMaster.FieldByName('BASE_RETEFUENTE').AsFloat <= lSubtotal Then
      pDetail.FieldByName('VALOR_RETEFUENTE').AsFloat := Calculo_Impuesto(pDetail.FieldByName('PORC_RETEFUENTE').AsFloat, pDetail.FieldByName('VALOR_NETO').AsFloat);

    If pMaster.FieldByName('BASE_ICA').AsFloat <= lSubtotal Then
      pDetail.FieldByName('VALOR_ICA').AsFloat := Calculo_Impuesto(pDetail.FieldByName('PORC_ICA').AsFloat, pDetail.FieldByName('VALOR_NETO').AsFloat);

    If pMaster.FieldByName('BASE_CREE').AsFloat <= lSubtotal Then
      pDetail.FieldByName('VALOR_CREE').AsFloat := Calculo_Impuesto(pDetail.FieldByName('PORC_CREE').AsFloat, pDetail.FieldByName('VALOR_NETO').AsFloat);

    If pMaster.FieldByName('BASE_INTERES').AsFloat <= lSubtotal Then
      pDetail.FieldByName('VALOR_INTERES').AsFloat := Calculo_Impuesto(pDetail.FieldByName('PORC_INTERES').AsFloat, pDetail.FieldByName('VALOR_NETO').AsFloat);

    lCantidad := pDetail.FieldByName('CANTIDAD').AsFloat;
//    If lCantidad <= 0 Then
//      lCantidad := 1;
    pDetail.FieldByName('VALOR_DESCUENTO').AsFloat := Calculo_Impuesto(pDetail.FieldByName('PORC_DESCUENTO').AsFloat, Abs(pDetail.FieldByName('VALOR_ORIGINAL').AsFloat) * lCantidad);
    pDetail.FieldByName('VALOR_UNITARIO'  ).AsFloat := Abs((0 + pDetail.FieldByName('VALOR_NETO'      ).AsFloat
                                                            + pDetail.FieldByName('VALOR_SERVICIO'  ).AsFloat
                                                            + pDetail.FieldByName('VALOR_IVA'       ).AsFloat
                                                            + pDetail.FieldByName('VALOR_IMPCONSUMO').AsFloat
                                                            + pDetail.FieldByName('VALOR_RETEIVA'   ).AsFloat
                                                            + pDetail.FieldByName('VALOR_RETEFUENTE').AsFloat
                                                            + pDetail.FieldByName('VALOR_INTERES'   ).AsFloat
                                                            + pDetail.FieldByName('VALOR_ICA'       ).AsFloat)) / lCantidad;
    pDetail.FieldByName('VALOR_UNITARIO').AsFloat := pDetail.FieldByName('VALOR_UNITARIO').AsFloat;
    If (pMaster.FieldByName('TIPO_DOCUMENTO').AsString = Const_Documento_Cotizacion) Or (pMaster.FieldByName('TIPO_DOCUMENTO').AsString = Const_Documento_Factura) Then
      pDetail.FieldByName('VALOR_UNITARIO').AsFloat := Redondear_Calculo(pDetail.FieldByName('VALOR_UNITARIO').AsFloat);
    pDetail.FieldByName('VALOR_TOTAL'   ).AsFloat := Abs(pDetail.FieldByName('VALOR_UNITARIO').AsFloat) * lCantidad;
    If pDetail.FieldByName('VALOR_TRM').AsFloat <> 0 Then
       pDetail.FieldByName('TOTAL_TRM').AsFloat := Redondear_TRM(pDetail.FieldByName('VALOR_TOTAL').AsFloat / pDetail.FieldByName('VALOR_TRM').AsFloat);
  Except
     On E: Exception Do
     Begin
       Result := False;
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCalculo_Impuestos, Calcular_Impuestos_Detalle']);
     End;
  End;
End;



Function Calcular_Impuesto_Encabezado(pQuery : TQuery; pDataSource : TDataSource) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT  ');
    lSQL.SQL.Add(' SUM(VALOR_DESCUENTO ) AS TVALOR_DESCUENTO , ');
    lSQL.SQL.Add(' SUM(VALOR_SERVICIO  ) AS TVALOR_SERVICIO  , ');
    lSQL.SQL.Add(' SUM(VALOR_IVA       ) AS TVALOR_IVA       , ');
    lSQL.SQL.Add(' SUM(VALOR_IMPCONSUMO) AS TVALOR_IMPCONSUMO, ');
    lSQL.SQL.Add(' SUM(VALOR_RETEFUENTE) AS TVALOR_RETEFUENTE, ');
    lSQL.SQL.Add(' SUM(VALOR_RETEIVA   ) AS TVALOR_RETEIVA   , ');
    lSQL.SQL.Add(' SUM(VALOR_ICA       ) AS TVALOR_ICA       , ');
    lSQL.SQL.Add(' SUM(VALOR_CREE      ) AS TVALOR_CREE      , ');
    lSQL.SQL.Add(' SUM(VALOR_INTERES   ) AS TVALOR_INTERES   , ');
    lSQL.SQL.Add(' SUM(VALOR_BASE      ) AS TVALOR_BASE      , ');
    lSQL.SQL.Add(' SUM(VALOR_NETO      ) AS TVALOR_NETO      , ');
    lSQL.SQL.Add(' SUM(VALOR_SUBTOTAL  ) AS TVALOR_SUBTOTAL  , ');
    lSQL.SQL.Add(' SUM(VALOR_TOTAL     ) AS TVALOR_TOTAL     , ' );
    lSQL.SQL.Add(' SUM(TOTAL_TRM       ) AS TTOTAL_TRM         ' );
    lSQL.SQL.Add(' FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pQuery.FieldByName('DATAKEY').AsString)));
    lSQL.Active := True ;
    If lSQL.Active Then
    Begin
      If Not (pDataSource.State In [dsInsert, dsEdit]) Then
        pQuery.Edit;
      pQuery.FieldByName('VALOR_DESCUENTO'    ).AsFloat := lSQL.FieldByName('TVALOR_DESCUENTO' ).AsFloat;
      pQuery.FieldByName('VALOR_SERVICIO'     ).AsFloat := lSQL.FieldByName('TVALOR_SERVICIO'  ).AsFloat;
      pQuery.FieldByName('VALOR_IVA'          ).AsFloat := lSQL.FieldByName('TVALOR_IVA'       ).AsFloat;
      pQuery.FieldByName('VALOR_IMPCONSUMO'   ).AsFloat := lSQL.FieldByName('TVALOR_IMPCONSUMO').AsFloat;
      pQuery.FieldByName('VALOR_RETEFUENTE'   ).AsFloat := lSQL.FieldByName('TVALOR_RETEFUENTE').AsFloat;
      pQuery.FieldByName('VALOR_RETEIVA'      ).AsFloat := lSQL.FieldByName('TVALOR_RETEIVA'   ).AsFloat;
      pQuery.FieldByName('VALOR_ICA'          ).AsFloat := lSQL.FieldByName('TVALOR_ICA'       ).AsFloat;
      pQuery.FieldByName('VALOR_CREE'         ).AsFloat := lSQL.FieldByName('TVALOR_CREE'      ).AsFloat;
      pQuery.FieldByName('VALOR_INTERES'      ).AsFloat := lSQL.FieldByName('TVALOR_INTERES'   ).AsFloat;
      pQuery.FieldByName('VALOR_BASE'         ).AsFloat := lSQL.FieldByName('TVALOR_BASE'      ).AsFloat;
      pQuery.FieldByName('VALOR_SUBTOTAL'     ).AsFloat := lSQL.FieldByName('TVALOR_SUBTOTAL'  ).AsFloat;
      pQuery.FieldByName('VALOR_NETO'         ).AsFloat := lSQL.FieldByName('TVALOR_NETO'      ).AsFloat;
      pQuery.FieldByName('VALOR_TOTAL'        ).AsFloat := lSQL.FieldByName('TVALOR_TOTAL'     ).AsFloat;
      pQuery.FieldByName('TOTAL_TRM'          ).AsFloat := lSQL.FieldByName('TTOTAL_TRM'       ).AsFloat;
      pQuery.FieldByName('TOTAL_CON_DOMICILIO').AsFloat := pQuery.FieldByName('VALOR_TOTAL').AsFloat + pQuery.FieldByName('VALOR_DOMICILIO').AsFloat;
      pQuery.Post;
      Result := True;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCalculo_Impuestos, Calcular_Impuesto_Encabezado']);
  End;
End;

Function Calcular_Impuesto_Encabezado(pQuery : TQuery; pDataSource : TDataSource; pDetalle : Integer) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT  ');
    lSQL.SQL.Add(' SUM(VALOR_DESCUENTO ) AS TVALOR_DESCUENTO , ');
    lSQL.SQL.Add(' SUM(VALOR_SERVICIO  ) AS TVALOR_SERVICIO  , ');
    lSQL.SQL.Add(' SUM(VALOR_IVA       ) AS TVALOR_IVA       , ');
    lSQL.SQL.Add(' SUM(VALOR_IMPCONSUMO) AS TVALOR_IMPCONSUMO, ');
    lSQL.SQL.Add(' SUM(VALOR_RETEFUENTE) AS TVALOR_RETEFUENTE, ');
    lSQL.SQL.Add(' SUM(VALOR_RETEIVA   ) AS TVALOR_RETEIVA   , ');
    lSQL.SQL.Add(' SUM(VALOR_ICA       ) AS TVALOR_ICA       , ');
    lSQL.SQL.Add(' SUM(VALOR_CREE      ) AS TVALOR_CREE      , ');
    lSQL.SQL.Add(' SUM(VALOR_INTERES   ) AS TVALOR_INTERES   , ');
    lSQL.SQL.Add(' SUM(VALOR_SUBTOTAL  ) AS TVALOR_SUBTOTAL  , ');
    lSQL.SQL.Add(' SUM(VALOR_TOTAL     ) AS TVALOR_TOTAL     , ' );
    lSQL.SQL.Add(' SUM(TOTAL_TRM       ) AS TTOTAL_TRM         ' );
    lSQL.SQL.Add(' FROM ' + Retornar_Info_Tabla(pDetalle).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pQuery.FieldByName('DATAKEY').AsString)));
    lSQL.Active := True ;
    If lSQL.Active Then
    Begin
      If Not (pDataSource.State In [dsInsert, dsEdit]) Then
        pQuery.Edit;
      pQuery.FieldByName('VALOR_DESCUENTO' ).AsFloat := lSQL.FieldByName('TVALOR_DESCUENTO' ).AsFloat;
      pQuery.FieldByName('VALOR_SERVICIO'  ).AsFloat := lSQL.FieldByName('TVALOR_SERVICIO'  ).AsFloat;
      pQuery.FieldByName('VALOR_IVA'       ).AsFloat := lSQL.FieldByName('TVALOR_IVA'       ).AsFloat;
      pQuery.FieldByName('VALOR_IMPCONSUMO').AsFloat := lSQL.FieldByName('TVALOR_IMPCONSUMO').AsFloat;
      pQuery.FieldByName('VALOR_RETEFUENTE').AsFloat := lSQL.FieldByName('TVALOR_RETEFUENTE').AsFloat;
      pQuery.FieldByName('VALOR_RETEIVA'   ).AsFloat := lSQL.FieldByName('TVALOR_RETEIVA'   ).AsFloat;
      pQuery.FieldByName('VALOR_ICA'       ).AsFloat := lSQL.FieldByName('TVALOR_ICA'       ).AsFloat;
      pQuery.FieldByName('VALOR_CREE'      ).AsFloat := lSQL.FieldByName('TVALOR_CREE'      ).AsFloat;
      pQuery.FieldByName('VALOR_INTERES'   ).AsFloat := lSQL.FieldByName('TVALOR_INTERES'   ).AsFloat;
      pQuery.FieldByName('VALOR_SUBTOTAL'  ).AsFloat := lSQL.FieldByName('TVALOR_SUBTOTAL'  ).AsFloat;
      pQuery.FieldByName('VALOR_TOTAL'     ).AsFloat := lSQL.FieldByName('TVALOR_TOTAL'     ).AsFloat;
      pQuery.FieldByName('TOTAL_TRM'       ).AsFloat := lSQL.FieldByName('TTOTAL_TRM'       ).AsFloat;
      pQuery.Post;
    End;
    lSQL.Active := False;
    lSQL.Free;
    Result := True;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCalculo_Impuestos, Calcular_Impuesto_Encabezado']);
  End;
End;

Function Calcular_Detalles_Documento(pEnc, pDet : Integer; pDataKey : String) : Boolean;
Var
  lM : TQuery;
  lD : TQuery;
  lDS : TDataSource;
Begin
  Result := True;
  Try
    lM := TQuery.Create(Nil);
    lM.Connection := gVariableGlobal.CNX;
    lD := TQuery.Create(Nil);
    lD.Connection := gVariableGlobal.CNX;
    lDS := TDataSource.Create(lM);
    lM.DataSource := lDS;
    lM.SQL.Add(' SELECT * FROM '+ Retornar_Info_Tabla(pEnc).Name + ' ');
    lM.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDataKey)));
    lD.SQL.Add(' SELECT * FROM '+ Retornar_Info_Tabla(pDet).Name + ' ');
    lD.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDataKey)));
    lM.Active := True;
    lD.Active := True;
    If lM.Active And lD.Active Then
    Begin
      lD.First;
      While (Not lD.Eof) And Result Do
      Begin
        Result := Calcular_Impuestos_Detalle(lM, lD);
        If (lD.State In [dsInsert, dsEdit]) Then
          lD.Post;
        lD.Next;
      End;
      If Result Then
        Result := Calcular_Impuesto_Encabezado(lM, lDS);
    End;
    lD.Active := False;
    lM.Active := False;
    lDS.Free;
    lD.Free;
    lM.Free;
  Except
    On E: Exception Do
    Begin
      Result := False;
      gVariableGlobal.Add_Log(E, ['Origen', 'UtCalculo_Impuestos, Calcular_Detalles_Documento']);
    End;
  End;
End;

Function Recalcular_Documentos(Const pEnc, pDet : Integer; Const pFechaIni, pFechaFin : String) : Boolean;
Var
  lI : Integer;
  lM : TQuery;
  lD : TQuery;
  lDS : TDataSource;
Begin
  lI := 0;
  Show_Splash;
  Result := True;
  Try
    lM := TQuery.Create(Nil);
    lM.Connection := gVariableGlobal.CNX;
    lD := TQuery.Create(Nil);
    lD.Connection := gVariableGlobal.CNX;
    lDS := TDataSource.Create(lM);
    lM.DataSource := lDS;
    lM.SQL.Add(' SELECT * FROM '+ Retornar_Info_Tabla(pEnc).Name + ' ');
    lM.SQL.Add(' WHERE FECHA_DOCUMENTO BETWEEN  '+ QuotedStr(pFechaIni) + ' AND ' + QuotedStr(pFechaFin)  + ' ');
    lM.SQL.Add(' ORDER BY NUMERO_DOCUMENTO ');
    lM.Active := True;
    If lM.Active Then
    Begin
      lM.First;
      While  Not lM.Eof Do
      Begin
        Inc(lI);
        {$IFNDEF CIRUELA} Actualiza__Splash('Procesando ' + FormatFloat('###,###,###', lI) + ' / ' + FormatFloat('###,###,###', lM.RecordCount) + '...'); {$ENDIF}
        lD.Active := False;
        lD.SQL.Clear;
        lD.SQL.Add(' SELECT * FROM '+ Retornar_Info_Tabla(pDet).Name + ' ');
        lD.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(lM.FieldByName('DATAKEY').AsString)) + ' ');
  //    lD.SQL.Add(' AND '  + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(lM.FieldByName('TIPO_DOCUMENTO').AsString)) + ' ');
        lD.Active := True;
        lD.First;
        While (Not lD.Eof) And Result Do
        Begin
          Result := Calcular_Impuestos_Detalle(lM, lD);
          If (lD.State In [dsInsert, dsEdit]) Then
            lD.Post;
          lD.Next;
        End;
        If Result Then
        Begin
          Result := Calcular_Impuesto_Encabezado(lM, lDS);
          UtCalculo_Discriminados_Execute(pEnc, pDet, lM.FieldByName('DATAKEY').AsString);
        End;
        lM.Next;
      End;
    End;
    lD.Active := False;
    lM.Active := False;
    lDS.Free;
    lD.Free;
    lM.Free;
  Except
    On E: Exception Do
    Begin
      Result := False;
      gVariableGlobal.Add_Log(E, ['Origen', 'UtCalculo_Impuestos, Recalcular_Documentos']);
    End;
  End;
  Free_Splash;
End;

end.
