unit UtCentral_Ventas;

interface
Uses
  UtConexion;

Procedure UtCentral_Ventas_Cargar_Porcentajes(pDetalle : TQuery; Const pTipo_Documento : String; Const pCodigo_Impuesto : String = '');
Function UtCentral_Ventas_Abrir_Archivo_Maestro(pQR : TQuery; Const pTipo_Documento, pCodigo_Espacio : String; Var pDataKey : String; pDomicilio : Boolean) : Boolean;
Function UtCentral_Ventas_Abrir_Archivo_Detalle(pQR : TQuery; Const pDatakey : String) : Boolean;
Function UtCentral_Ventas_Adicionar_Registro_Detalle(pQR : TQuery; Const pDataKey, pTipo_Documento, pCodigo_Producto, pNombre, pId_Fecha_Vencimiento : String; pValor : Double; Const pCantidad : Double = 0; pCodigo_Usuario : String = '') : Boolean;

implementation
Uses
  DB,
  Form_Fecha,
  UtFunciones,
  UtInfoTablas,
  UtConstantes,
  System.StrUtils,
  System.SysUtils,
  UtCerrar_Documento,
  UtVariablesGlobales,
  Tablename_Precargada;

Function UtCentral_Ventas_Retornar_Siguiente(Const pDataKey : String) : String;
Var
  lVlr : Integer;
  lErr : Integer;
  lSQL : TQuery;
Begin
  Result := '00000';
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT MAX(CONSECUTIVO) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDataKey)));
    lSQL.Active := True;
    If lSQL.Active Then
      Result := lSQL.FieldByName('RESULTADO').AsString;
    lSQL.Active := False;
    lSQL.Free;
    Result := Justificar(Result, '0', 3);
    Next_Value(Result);
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCentral_Ventas_Retornar_Siguiente']);
  End;
End;

Procedure UtCentral_Ventas_Cargar_Porcentajes(pDetalle : TQuery; Const pTipo_Documento : String; Const pCodigo_Impuesto : String = '');
Var
  lSQL : TQuery;
  lFieldName : String;
  lCodigo_Impuesto : String;
Begin
  lCodigo_Impuesto := pCodigo_Impuesto;
  lFieldName := 'IMPUESTO_COMPRA';
  If (pTipo_Documento = Const_Documento_Cotizacion) Or (pTipo_Documento = Const_Documento_Factura) Then
    lFieldName := 'IMPUESTO_VENTA';
  If Vacio(lCodigo_Impuesto) Then
    lCodigo_Impuesto := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [pDetalle.FieldByName('CODIGO_PRODUCTO').AsString], [lFieldName], 'TFrDocumento_Captura.BtnPreviewDocClick');
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Impuesto).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_IMPUESTO') + ' = ' + QuotedStr(Trim(lCodigo_Impuesto)));
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      pDetalle.FieldByName('CODIGO_IMPUESTO').AsString := lSQL.FieldByName('CODIGO_IMPUESTO').AsString;
      pDetalle.FieldByName('PORC_BASE'      ).AsFloat  := lSQL.FieldByName('PORC_BASE'      ).AsFloat ;
      pDetalle.FieldByName('PORC_IVA'       ).AsFloat  := lSQL.FieldByName('PORC_IVA'       ).AsFloat ;
      pDetalle.FieldByName('PORC_RETEIVA'   ).AsFloat  := lSQL.FieldByName('PORC_RETEIVA'   ).AsFloat ;
      pDetalle.FieldByName('PORC_RETEFUENTE').AsFloat  := lSQL.FieldByName('PORC_RETEFUENTE').AsFloat ;
      pDetalle.FieldByName('PORC_ICA'       ).AsFloat  := lSQL.FieldByName('PORC_ICA'       ).AsFloat ;
      pDetalle.FieldByName('PORC_IMPCONSUMO').AsFloat  := lSQL.FieldByName('PORC_IMPCONSUMO').AsFloat ;
      pDetalle.FieldByName('PORC_SERVICIO'  ).AsFloat  := lSQL.FieldByName('PORC_SERVICIO'  ).AsFloat ;
      pDetalle.FieldByName('PORC_DESCUENTO' ).AsFloat  := lSQL.FieldByName('PORC_DESCUENTO' ).AsFloat ;
      pDetalle.FieldByName('PORC_CREE'      ).AsFloat  := lSQL.FieldByName('PORC_CREE'      ).AsFloat ;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCentral_Ventas_Cargar_Porcentajes']);
  End;
End;

Function UtCentral_Ventas_Adicionar_Registro_Detalle(pQR : TQuery; Const pDataKey, pTipo_Documento, pCodigo_Producto, pNombre, pId_Fecha_Vencimiento : String; pValor : Double; Const pCantidad : Double = 0; pCodigo_Usuario : String = '') : Boolean;
Var
  lFecha : String;
  lCampo : String;
Begin
  Result := True;
  Try
    If (gVariableGlobal.ID_AGRUPAR_PRODUCTO = 'N') Or (Not pQR.Locate('CODIGO_PRODUCTO', pCodigo_Producto, [loCaseInsensitive])) Then
    Begin
      lCampo := IfThen((pTipo_Documento = Const_Documento_Compra) Or (pTipo_Documento = Const_Documento_Pedido), 'IMPUESTO_COMPRA', 'IMPUESTO_VENTA');
      pQR.Append;
      pQR.FieldByName('DATAKEY'          ).AsString := pDataKey;
      pQR.FieldByName('FECHA_TRM'        ).AsString := FormatDateTime('YYYY-MM-DD', Now);
      pQR.FieldByName('NUMERO_DOCUMENTO' ).AsString := pDataKey;
      pQR.FieldByName('CONSECUTIVO'      ).AsString := UtCentral_Ventas_Retornar_Siguiente(pDataKey);
      pQR.FieldByName('TIPO_DOCUMENTO'   ).AsString := pTipo_Documento;
      pQR.FieldByName('CODIGO_PRODUCTO'  ).AsString := pCodigo_Producto;
      pQR.FieldByName('NOMBRE'           ).AsString := pNombre;
      pQR.FieldByName('VALOR_ORIGINAL'   ).AsFloat  := pValor;
      pQR.FieldByName('VALOR_UNITARIO'   ).AsFloat  := pValor;
      pQR.FieldByName('ID_ACTUALIZADO'   ).AsString := 'N';
      pQR.FieldByName('ID_ENLAZADO'      ).AsString := 'N';
      pQR.FieldByName('ID_IMPRESO'       ).AsString := 'N';
      pQR.FieldByName('ID_ANULADO'       ).AsString := 'N';
      pQR.FieldByName('ID_ESTADO'        ).AsString := 'N';
      pQR.FieldByName('ID_CAMBIO'        ).AsString := 'N';
      pQR.FieldByName('ID_RESTAR'        ).AsString := 'N';
      pQR.FieldByName('ID_IMPRESO'       ).AsString := 'N';
      pQR.FieldByName('CODIGO_USUARIO'   ).AsString := IfThen(Not Vacio(pCodigo_Usuario), pCodigo_Usuario, gVariableGlobal.Usuario_Actual);
      pQR.FieldByName('FECHA'            ).AsString := gVariableGlobal.Fecha_Actual.yyyy_mm_dd;
      pQR.FieldByName('HORA'             ).AsString := FormatDateTime('HH:NN:SS'  , Now);
      pQR.FieldByName('VALOR_TRM'        ).AsFloat  := gVariableGlobal.Valor_TRM;
      UtCentral_Ventas_Cargar_Porcentajes(pQR, pTipo_Documento);
    End
    Else
      pQR.Edit;
    If pCantidad > 0 Then
      pQR.FieldByName('CANTIDAD').AsFloat := pQR.FieldByName('CANTIDAD').AsFloat + pCantidad
    Else
      pQR.FieldByName('CANTIDAD').AsFloat := pQR.FieldByName('CANTIDAD').AsFloat + 1;

    {$IFNDEF CIRUELA}
    If (pTipo_Documento = Const_Documento_Compra) And (pId_Fecha_Vencimiento = 'S') And Vacio(pQR.FieldByName('FECHA_VENCIMIENTO').AsString) Then
    Begin
      If Retornar_Fecha(lFecha) Then
      Begin
        pQR.FieldByName('FECHA_VENCIMIENTO').AsString := lFecha;
        pQR.Post;
      End
      Else
        pQR.Cancel;
    End
    Else
    {$ENDIF}
      pQR.Post;
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Captura.Adicionar_Registro_Detalle']);
      Result := False;
    End;
  End;
End;

Function UtCentral_Ventas_Abrir_Archivo_Maestro(pQR : TQuery; Const pTipo_Documento, pCodigo_Espacio : String; Var pDataKey : String; pDomicilio : Boolean) : Boolean;
Begin
  Result := False;
  Try
    pQR.Active := False;
    pQR.Connection := gVariableGlobal.CNX;
    pQR.SQL.Clear;
    pQR.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + ' ');
    pQR.SQL.Add(' WHERE TIPO_DOCUMENTO =' + QuotedStr(Trim(pTipo_Documento)) + ' ');
    If Not Vacio(pCodigo_Espacio) Then
      pQR.SQL.Add(' AND CODIGO_ESPACIO =' + QuotedStr(Trim(pCodigo_Espacio)) + ' ')
    Else
    Begin
      pQR.SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_ESTACION') + ' ='  + QuotedStr(Trim(AnsiUpperCase(Retornar_Maquina))) + ' ');
      pQR.SQL.Add(' AND ( ');
      pQR.SQL.Add(' '+ gVariableGlobal.CNX.Trim_Sentence('CODIGO_ESPACIO' ) + ' = '  + QuotedStr(Trim(AnsiUpperCase(''))) + ' OR ' + gVariableGlobal.CNX.Null_Sentence('CODIGO_ESPACIO'));
      pQR.SQL.Add(' ) ');
    End;
    pQR.Active := True;
    Result := pQR.Active;
    If Result Then
    Begin
      If pQR.RecordCount <= 0 Then
      Begin
        pQR.Append;
        pQR.FieldByName('DATAKEY'          ).AsString := FormatDateTime('YYYYMMDDHHNNSSZZ', Now);
        pQR.FieldByName('NUMERO_DOCUMENTO' ).AsString := pQR.FieldByName('DATAKEY').AsString;
        pQR.FieldByName('NOMBRE'           ).AsString := 'NOMBRE DE ' + pQR.FieldByName('DATAKEY').AsString;
        pQR.FieldByName('TIPO_DOCUMENTO'   ).AsString := pTipo_Documento;
        pQR.FieldByName('FECHA_DOCUMENTO'  ).AsString := gVariableGlobal.Fecha_Actual.yyyy_mm_dd;
        pQR.FieldByName('FECHA_VENCIMIENTO').AsString := FormatDateTime('YYYY-MM-DD', Now);
        pQR.FieldByName('CODIGO_USUARIO'   ).AsString := gVariableGlobal.Usuario_Actual;
        pQR.FieldByName('CODIGO_ESTACION'  ).AsString := Trim(AnsiUpperCase(Retornar_Maquina));
        pQR.FieldByName('FECHA'            ).AsString := gVariableGlobal.Fecha_Actual.yyyy_mm_dd;
        pQR.FieldByName('HORA'             ).AsString := FormatDateTime('HH:NN:SS', Now);
        pQR.FieldByName('OBSERVACION'      ).AsString := ' ';
        pQR.FieldByName('DIRECCION'        ).AsString := ' ';
        pQR.FieldByName('ID_PREIMPRESO'    ).AsString := 'N';
        pQR.FieldByName('ID_IMPRESO'       ).AsString := 'N';
        pQR.FieldByName('ID_ANULADO'       ).AsString := 'N';
        pQR.FieldByName('ID_ACTUALIZADO'   ).AsString := 'N';
        pQR.FieldByName('VALOR_TRM'        ).AsFloat  := gVariableGlobal.Valor_TRM;
        pQR.FieldByName('NUMERO_PERSONAS'  ).AsFloat  := 1;
        pQR.FieldByName('TIPO_CAPTURA'     ).AsString := 'CAP';
        If Not Vacio(pCodigo_Espacio) Then
          pQR.FieldByName('CODIGO_ESPACIO').AsString := pCodigo_Espacio;
        pQR.FieldByName('ID_DESCARGADO').AsString := 'N';
        If (gVariableGlobal.VALOR_DOMICILIO <> 0) And pDomicilio Then
          pQR.FieldByName('VALOR_DOMICILIO').AsFloat := gVariableGlobal.VALOR_DOMICILIO;
        pQR.Post;
      End;
      If Vacio(pQR.FieldByName('CODIGO_TERCERO').AsString) Then
      Begin
        pQR.Edit;
        Cargar_Precargadas(pQR);
        pQR.Post;
      End;
      pDataKey := pQR.FieldByName('DATAKEY').AsString;
      TFloatField(pQR.FieldByName('VALOR_BRUTO'        )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_INICIAL'      )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_DESCUENTO'    )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_SERVICIO'     )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_IVA'          )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_IMPCONSUMO'   )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_RETEFUENTE'   )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_RETEIVA'      )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_ICA'          )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_CREE'         )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_BASE'         )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_SUBTOTAL'     )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_TOTAL'        )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('EFE'                )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('EFE_TRM'            )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('TDD'                )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('TDD_TRM'            )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('TDC'                )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('TDC_TRM'            )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('CHE'                )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('CHE_TRM'            )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('SDX'                )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('SDX_TRM'            )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('COR'                )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('COR_TRM'            )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('CAR'                )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('CAR_PAGADA'         )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('CAR_TRM'            )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('CAR_TRM_PAGADA'     )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_DOMICILIO'    )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('TOTAL_CON_DOMICILIO')).DisplayFormat := '###,###,###,##0.#0';
    End;
  Except
     On E: Exception Do
     Begin
       Result := False;
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCentral_Ventas_Abrir_Archivo_Maestro']);
     End;
  End;
End;

Function UtCentral_Ventas_Abrir_Archivo_Detalle(pQR : TQuery; Const pDatakey : String) : Boolean;
Begin
  Try
    pQR.Active := False;
    pQR.Connection := gVariableGlobal.CNX;
    pQR.SQL.Clear;
    pQR.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
    pQR.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakey)) + ' ');
    pQR.Active := True;
    Result := pQR.Active;
    If Result Then
    Begin
      TFloatField(pQR.FieldByName('PORC_DESCUENTO' )).DisplayFormat :=  '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_BRUTO'    )).DisplayFormat :=  '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('CANTIDAD'       )).DisplayFormat :=  '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_ORIGINAL' )).DisplayFormat := '$###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_CALCULADO')).DisplayFormat := '$###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_UNITARIO' )).DisplayFormat := '$###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_SUBTOTAL' )).DisplayFormat := '$###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_TOTAL'    )).DisplayFormat := '$###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('VALOR_TRM'      )).DisplayFormat :=  '###,###,###,##0.#0';
      TFloatField(pQR.FieldByName('TOTAL_TRM'      )).DisplayFormat :=  '###,###,###,##0.#0';
    End;
  Except
     On E: Exception Do
     Begin
       Result := False;
       gVariableGlobal.Add_Log(E, ['Origen', 'UtCentral_Ventas_Abrir_Archivo_Detalle']);
     End;
  End;
End;

end.
