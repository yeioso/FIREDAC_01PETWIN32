unit UtResumen_Caja;

interface

Type
  TTipo_Impresion = (TI_All, TI_Totales, TI_Pedidos, TI_Compras, TI_Cotizacion, TI_Factura, TI_Cantidades, TI_Valores, TI_Forma_Pago, TI_TRM, TI_Detalle_Compra, TI_Detalle_Venta);
  TTipo_Impresiones = Set Of TTipo_Impresion;

Procedure Calcular_Resumen_Caja(pCodigo_Usuario, pFecha : String; pTipo_Impresion : TTipo_Impresiones);

implementation
Uses
  Math,
  UtConexion,
  
  Classes,
  SysUtils,
  StrUtils,
  UtConexion,
  
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtHomologacion,
  Generics.Defaults,
  UtCalculo_Impuestos,
  UtVariablesGlobales,
  Generics.Collections;

Type
  TDetalle = Class
    CODIGO              : String;
    NOMBRE              : String;
    CANTIDAD            : Double;
    VALOR               : Double;
    PORCENTAJE_VALOR    : Double;
    PORCENTAJE_CANTIDAD : Double;
  End;

Function Retornar_Documento_Inicial(Const pTipo_Documento, pCodigo_Usuario, pFecha : String) : String;
Var
  lSQL : String;
Begin
  lSQL := ' SELECT MIN(NUMERO_DOCUMENTO) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' ' +
          ' WHERE ' + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario)) + ' ' +
          ' AND '   + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         )) + ' ' +
          ' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento)) ;
  Result := Execute_SQL_String(lSQL, 'RESULTADO', 'UtResumen_Caja, Retornar_Documento_Inicial');
End;

Function Retornar_Documento_Final(Const pTipo_Documento, pCodigo_Usuario, pFecha : String) : String;
Var
  lSQL : String;
Begin
  lSQL := ' SELECT MAX(NUMERO_DOCUMENTO) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' ' +
          ' WHERE ' + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario)) + ' ' +
          ' AND '   + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         )) + ' ' +
          ' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento)) ;
  Result := Execute_SQL_String(lSQL, 'RESULTADO', 'UtResumen_Caja, Retornar_Documento_Final');
End;

Function Retornar_Pago_Inicial(Const pTipo_Documento, pCodigo_Usuario, pFecha : String) : String;
Var
  lSQL : String;
Begin
  lSQL := ' SELECT MIN(NUMERO_DOCUMENTO) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc   ).Name + ' ' +
          ' WHERE ' + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario)) + ' ' +
          ' AND '   + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         )) + ' ' +
          ' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento)) ;
  Result := Execute_SQL_String(lSQL, 'RESULTADO', 'UtResumen_Caja, Retornar_Pago_Inicial');
End;

Function Retornar_Pago_Final(Const pTipo_Documento, pCodigo_Usuario, pFecha : String) : String;
Var
  lSQL : String;
Begin
  lSQL := ' SELECT MAX(NUMERO_DOCUMENTO) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc   ).Name + ' ' +
          ' WHERE ' + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario)) + ' ' +
          ' AND '   + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         )) + ' ' +
          ' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento)) ;
  Result := Execute_SQL_String(lSQL, 'RESULTADO', 'Calcular_Resumen_Caja, Retornar_Pago_Final');
End;

Function Retornar_Total_Cantidad_Documento(Const pTipo_Documento, pCodigo_Usuario, pFecha : String) : Double;
Var
  lSQL : String;
Begin
  lSQL := '';
  lSQL := lSQL + ' SELECT COUNT(*) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name    ;
  lSQL := lSQL + ' WHERE ' + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         ));
  If Not Vacio(pCodigo_Usuario) Then
  lSQL := lSQL + ' AND '   + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario));
  lSQL := lSQL + ' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento));
  Result := Execute_SQL_Double(lSQL, 'RESULTADO', 'UtResumen_Caja, Retornar_Total_Cantidad_Documento');
End;

Function Retornar_Total_Cantidad_CAR(Const pTipo_Documento, pCodigo_Usuario, pFecha : String) : Double;
Var
  lSQL : String;
Begin
  lSQL := '';
  lSQL := lSQL + ' SELECT COUNT(*) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name    ;
  lSQL := lSQL + ' WHERE ' + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         ));
  If Not Vacio(pCodigo_Usuario) Then
  lSQL := lSQL + ' AND '   + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario));
  lSQL := lSQL + ' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento));
  lSQL := lSQL + ' AND  CAR > 0'                                                                       ;
  Result := Execute_SQL_Double(lSQL, 'RESULTADO', 'UtResumen_Caja, Retornar_Total_Cantidad_CAR');
End;

Function Retornar_Total_Cantidad_Abono(Const pTipo_Documento, pCodigo_Usuario, pFecha : String) : Double;
Var
  lSQL : String;
Begin
  lSQL := '';
  lSQL := lSQL + ' SELECT COUNT(*) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name     ;
  lSQL := lSQL + ' WHERE ' + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         )) ;
  If Not Vacio(pCodigo_Usuario) Then
  lSQL := lSQL + ' AND '   + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario)) ;
  lSQL := lSQL + ' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento)) ;
  Result := Execute_SQL_Double(lSQL, 'RESULTADO', 'UtResumen_Caja, Retornar_Total_Cantidad_Abono');
End;

Function Retornar_Total_Cantidad_Anulado(Const pTipo_Documento, pCodigo_Usuario, pFecha : String) : Double;
Var
  lSQL : String;
Begin
  lSQL := '';
  lSQL := lSQL + ' SELECT COUNT(*) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name;
  lSQL := lSQL + ' WHERE ' + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         ));
  If Not Vacio(pCodigo_Usuario) Then
  lSQL := lSQL + ' AND '   + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario));
  lSQL := lSQL + ' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento));
  lSQL := lSQL + ' AND '   + Trim_Sentence('ID_ANULADO'    ) + ' = ' + QuotedStr(Trim('S'            ));
  Result := Execute_SQL_Double(lSQL, 'RESULTADO', 'UtResumen_Caja, Retornar_Total_Cantidad_Anulado');
End;

Function Retornar_Total_Cantidad_Cortesia(Const pTipo_Documento, pCodigo_Usuario, pFecha : String) : Double;
Var
  lSQL : String;
Begin
  lSQL :=  '';
  lSQL := lSQL + ' SELECT COUNT(*) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name    ;
  lSQL := lSQL + ' WHERE '   + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         ));
  If Not Vacio(pCodigo_Usuario) Then
  lSQL := lSQL + ' AND  ' + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario));
  lSQL := lSQL + ' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento));
  lSQL := lSQL + ' AND COR > 0' ;
  Result := Execute_SQL_Double(lSQL, 'RESULTADO', 'UtResumen_Caja, Retornar_Total_Cantidad_Anulado');
End;

Function Retornar_Total_Valor_Forma_Pago(Const pTipo_Documento, pCodigo_Usuario, pFecha, pCampo : String) : Double;
Var
  lSQL : String;
Begin
  lSQL := '';
  lSQL := lSQL + ' SELECT SUM(' + pCampo + ') AS RESULTADO ' ;
  lSQL := lSQL + ' FROM '  +  Retornar_Info_Tabla(Id_Documento_Enc).Name ;
  lSQL := lSQL +' WHERE ' + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         )) ;
  If Not Vacio(pCodigo_Usuario) Then
  lSQL := lSQL + ' AND ' + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario));
  lSQL := lSQL + ' AND ' + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento));
  lSQL := lSQL + ' AND ' + Trim_Sentence('ID_ANULADO'    ) + ' = ' + QuotedStr(Trim('N'            ));
  Result := Execute_SQL_Double(lSQL, 'RESULTADO', 'UtResumen_Caja, Retornar_Total_Valor_Forma_Pago');
End;

Function Retornar_Total_Cantidad_Forma_Pago(Const pTipo_Documento, pCodigo_Usuario, pFecha, pCampo : String) : Double;
Var
  lSQL : String;
Begin
  lSQL := '';
  lSQL := lSQL + ' SELECT SUM(' + pCampo + ') AS RESULTADO ';
  lSQL := lSQL + ' FROM '  +  Retornar_Info_Tabla(Id_Documento_Enc).Name ;
  lSQL := lSQL + ' WHERE ' + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         ));
  If Not Vacio(pCodigo_Usuario) Then
    lSQL := lSQL + ' AND '   + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario));
  lSQL := lSQL + ' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento));
  lSQL := lSQL + ' AND '   + Trim_Sentence('ID_ANULADO'    ) + ' = ' + QuotedStr(Trim('N'            ));
  lSQL := lSQL + ' AND COR <= 0';
  Result := Execute_SQL_Double(lSQL, 'RESULTADO', 'UtResumen_Caja, Retornar_Total_Cantidad_Forma_Pago');
End;

Function Retornar_Cantidad_Productos(Const pTipo_Documento, pCodigo_Usuario, pFecha : String) : Double;
Var
  lSQL : String;
Begin
  lSQL := '';
  lSQL := lSQL + ' SELECT SUM(CANTIDAD) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Det).Name ;
  lSQL := lSQL + ' WHERE ' + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         ))  ;
  If Not Vacio(pCodigo_Usuario) Then
  lSQL := lSQL + ' AND '   + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario))  ;
  lSQL := lSQL + ' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento))  ;
  Result := Execute_SQL_Double(lSQL, 'RESULTADO', 'Calcular_Resumen_Caja, Retornar_Cantidad_Productos')  ;
End;

Function Retornar_Total_Valor_Documento(Const pTipo_Documento, pCodigo_Usuario, pFecha : String) : Double;
Var
  lSQL : String;
Begin
  lSQL := '';
  lSQL := lSQL + ' SELECT SUM(VALOR_TOTAL) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name;
  lSQL := lSQL + ' WHERE ' + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         )) ;
  If Not Vacio(pCodigo_Usuario) Then
    lSQL := lSQL + ' AND '   + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario)) ;
  lSQL := lSQL + ' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento)) ;
  lSQL := lSQL + ' AND '   + Trim_Sentence('ID_ANULADO'    ) + ' = ' + QuotedStr(Trim('N'            )) ;
  Result := Execute_SQL_Double(lSQL, 'RESULTADO', 'Calcular_Resumen_Caja, Retornar_Total_Valor_Documento');
End;

Function Retornar_Total_Dia(Const pTipo_Documento, pFecha : String) : Double;
Var
  lSQL : String;
Begin
  lSQL := '';
  lSQL := lSQL + ' SELECT SUM(VALOR_TOTAL) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name ;
  lSQL := lSQL + ' WHERE ' + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         )) ;
  lSQL := lSQL + ' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento)) ;
  lSQL := lSQL + ' AND '   + Trim_Sentence('ID_ANULADO'    ) + ' = ' + QuotedStr(Trim('N'            )) ;
  Result := Execute_SQL_Double(lSQL, 'RESULTADO', 'Calcular_Resumen_Caja, Retornar_Total_Valor_Documento');
End;

Function Retornar_Total_Valor_CAR(Const pTipo_Documento, pCodigo_Usuario, pFecha : String) : Double;
Var
  lSQL : String;
Begin
  lSQL := '';
  lSQL := lSQL + ' SELECT COUNT(*) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name     ;
  lSQL := lSQL + ' WHERE '   + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         )) ;
  If Not Vacio(pCodigo_Usuario) Then
  lSQL := lSQL + ' AND ' + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario)) ;
  lSQL := lSQL + ' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento)) ;
  lSQL := lSQL + ' AND  CAR > 0'                                                                        ;
  Result := Execute_SQL_Double(lSQL, 'RESULTADO', 'UtResumen_Caja, Retornar_Total_Valor_CAR');
End;

Function Retornar_Total_Valor_Abono(Const pTipo_Documento, pCodigo_Usuario, pFecha : String) : Double;
Var
  lSQL : String;
Begin
  lSQL := '';
  lSQL := lSQL + ' SELECT SUM(VALOR_TOTAL) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name;
  lSQL := lSQL + ' WHERE ' + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         ))    ;
  If Not Vacio(pCodigo_Usuario) Then
    lSQL := lSQL + ' AND '   + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario))    ;
  lSQL := lSQL + ' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento))    ;
  Result := Execute_SQL_Double(lSQL, 'RESULTADO', 'UtResumen_Caja, Retornar_Total_Valor_Abono');
End;

Function Retornar_Total_Valor_Anulado(Const pTipo_Documento, pCodigo_Usuario, pFecha : String) : Double;
Var
  lSQL : String;
Begin
  lSQL := '';
  lSQL := lSQL + ' SELECT SUM(VALOR_TOTAL) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name;
  lSQL := lSQL + ' WHERE ' + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         ))    ;
  If Not Vacio(pCodigo_Usuario) Then
  lSQL := lSQL + ' AND '   + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario))    ;
  lSQL := lSQL + ' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento))    ;
  lSQL := lSQL + ' AND '   + Trim_Sentence('ID_ANULADO'    ) + ' = ' + QuotedStr(Trim('S'            ))    ;
  Result := Execute_SQL_Double(lSQL, 'RESULTADO', 'UtResumen_Caja, Retornar_Total_Cantidad_Anulado');
End;

Function Retornar_Linea_Detalle(pNombre, pCantidad, pValor, pPorcentaje_Cantidad, pPorcentaje_Valor : String) : String;
Begin
  Result := Copy(pNombre + Justificar(' ', ' ', 20       ), 01, 10) + ' ' +
            Copy(Justificar(pCantidad           , ' ', 06), 01, 06) + ' ' +
            Copy(Justificar(pValor              , ' ', 11), 01, 11) + ' ' +
            Copy(Justificar(pPorcentaje_Cantidad, ' ', 07), 01, 07) + ' ' +
            Copy(Justificar(pPorcentaje_Valor   , ' ', 07), 01, 07);
End;

Function Informacion_Detalle_Documento(Const pTableName, pTipo_Documento, pCodigo_Usuario, pFecha, pIdOrdenZ : String; pLista : TStringList) : Boolean;
Var
  lI : Integer;
  ltmp : String;
  lItem : TDetalle;
  lOrigen : TQuery;
  lListado : TList<TDetalle>;
  lSuma_Valor : Double;
  lSuma_Cantidad : Double;
Begin
  lSuma_Valor := 0;
  lSuma_Cantidad := 0;
  Result := False;
  Try
    lOrigen := TQuery.Create(Nil);
    lOrigen.SQL.Clear;
    lOrigen.SQL.Add(' SELECT CODIGO_PRODUCTO, SUM(CANTIDAD) AS CANTIDAD, SUM(VALOR_TOTAL) AS VALOR FROM ' + pTableName  + ' ');
    lOrigen.SQL.Add(' WHERE ' + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario)) + ' ');
    lOrigen.SQL.Add(' AND '   + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         )) + ' ');
    lOrigen.SQL.Add(' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento)) + ' ');
    lOrigen.SQL.Add(' AND '   + Trim_Sentence('ID_ANULADO'    ) + ' = ' + QuotedStr(Trim('N'            )) + ' ');
    lOrigen.SQL.Add(' GROUP BY CODIGO_PRODUCTO'                                                                        );
    lOrigen.SQL.Add(' ORDER BY CODIGO_PRODUCTO'                                                                        );
    Configurar_Conexion_Segura(lOrigen);
    lOrigen.Active := True;
    If lOrigen.Active Then
    Begin
      lListado := TList<TDetalle>.Create;
      lOrigen.First;
      While Not lOrigen.Eof Do
      Begin
        lSuma_Valor := lSuma_Valor + lOrigen.FieldByName('VALOR').AsFloat;
        lSuma_Cantidad := lSuma_Cantidad + lOrigen.FieldByName('CANTIDAD').AsFloat;
        lItem := TDetalle.Create;
        lItem.CODIGO   := Trim(AnsiUpperCase(lOrigen.FieldByName('CODIGO_PRODUCTO').AsString));
        lItem.CANTIDAD := lOrigen.FieldByName('CANTIDAD').AsFloat;
        lItem.VALOR    := lOrigen.FieldByName('VALOR'   ).AsFloat;
        lListado.Add(lItem);
        lOrigen.Next;
      End;
      For lItem In lListado Do
      Begin
        lItem.NOMBRE := Retornar_String(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [lItem.CODIGO], ['NOMBRE'], 'Calcular_Resumen_Caja, Informacion_Detalle_Documento');
        If lSuma_Valor <> 0 Then
          lItem.PORCENTAJE_VALOR    := lItem.VALOR    / lSuma_Valor    * 100;
        If lSuma_Cantidad <> 0 Then
          lItem.PORCENTAJE_CANTIDAD := lItem.CANTIDAD / lSuma_Cantidad * 100;
      End;
      lListado.Sort(TComparer<TDetalle>.Construct(
              Function(const Item1,Item2:TDetalle): Integer
              Begin
                If pIdOrdenZ = 'D' Then
                  Result := CompareText(Item1.NOMBRE, Item2.NOMBRE)
                Else
                If pIdOrdenZ = 'V' Then
                  Result := CompareValue(Item1.PORCENTAJE_VALOR   , Item2.PORCENTAJE_VALOR)
                Else
                  Result := CompareValue(Item1.PORCENTAJE_CANTIDAD, Item2.PORCENTAJE_CANTIDAD);
                Result := Result * -1
              End)
              );
      If lListado.Count > 0 Then
      Begin
        pLista.Add(Justificar('-', '-', 45));
        If Const_Documento_Compra = pTipo_Documento Then
          pLista.Add('COMPRAS')
        Else
          pLista.Add('VENTAS');
        ltmp := Retornar_Linea_Detalle('DESCRIPCION', 'CANTIDAD', 'VALOR', '%VAL', '%CANT');
        pLista.Add(ltmp);
        For lI := 0 To lListado.Count-1 Do
        Begin
          ltmp := Retornar_Linea_Detalle(lListado[lI].NOMBRE,
                                         Trim(FormatFloat('###,###,##0.#0', lListado[lI].CANTIDAD           )),
                                         Trim(FormatFloat('###,###,##0.#0', lListado[lI].VALOR              )),
                                         Trim(FormatFloat('###,###,##0.#0', lListado[lI].PORCENTAJE_VALOR   )),
                                         Trim(FormatFloat('###,###,##0.#0', lListado[lI].PORCENTAJE_CANTIDAD)));
          pLista.Add(ltmp);
        End;
      End;
      For lItem In lListado Do
        lItem.Free;
      lListado.Clear;
      lListado.Free;
    End;
    lOrigen.Active := False;
    lOrigen.Free;
    Result := True;
  Except
    On E : Exception Do
      UtLog_Execute('Calcular_Resumen_Caja, Informacion_Detalle_Documento, ' + E.Message);
  End;
End;

Function Retornar_Linea_Documento(Const pNumero_Documento, pValor : String) : String;
Begin
  Result := Justificar(' ', ' ', 02) +
            Copy(Justificar(pNumero_Documento, ' ', 20, 'I'), 01, 20) + ' = ' +
            Copy(Justificar(pValor           , ' ', 10, 'D'), 01, 10);
End;

Procedure UtResumen_Caja_Documentos(Const pTipo_Documento, pCodigo_Usuario, pFecha_Documento : String; pLista : TStringList);
Var
  lSQL : TQUERY;
Begin
  Try
    lSQL := TQUERY.Create(Nil);
    lSQL.Connection := gConexion;
    lSQL.SQL.Add(' SELECT NUMERO_DOCUMENTO, VALOR_TOTAL FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + Trim_Sentence('TIPO_DOCUMENTO' ) + ' = ' + QuotedStr(Trim(pTipo_Documento )));
    lSQL.SQL.Add(' AND '   + Trim_Sentence('FECHA_DOCUMENTO') + ' = ' + QuotedStr(Trim(pFecha_Documento)));
    lSQL.SQL.Add(' AND '   + Trim_Sentence('CODIGO_USUARIO' ) + ' = ' + QuotedStr(Trim(pCodigo_Usuario )));
    lSQL.SQL.Add(' ORDER BY NUMERO_DOCUMENTO' );
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      pLista.Add(Retornar_Linea_Documento('DOCUMENTO', 'VALOR'));
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
         pLista.Add(Retornar_Linea_Documento(lSQL.FieldByName('NUMERO_DOCUMENTO').AsString,
                    FormatFloat('###,##0.#0', lSQL.FieldByName('VALOR_TOTAL').AsFloat)));
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E : Exception Do
      UtLog_Execute('Calcular_Resumen_Caja, UtResumen_Caja_Documentos, ' + E.Message);
  End;
End;

Procedure Calcular_Resumen_Caja(pCodigo_Usuario, pFecha : String; pTipo_Impresion : TTipo_Impresiones);
Var
  ltmp : Double;
  lSQL : TQuery;
  lTexto : TStringList;
Begin
  Try
    lSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Caja).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario)) + ' ');
    lSQL.SQL.Add(' AND '   + Trim_Sentence('FECHA'         ) + ' = ' + QuotedStr(Trim(pFecha         )) + ' ');
    lSQL.Active := True ;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lTexto := TStringList.Create;
      lTexto.Clear;
      lTexto.Add('ESTADO DE CAJA ');
      lTexto.Add('Fecha: ' + pFecha);
      lTexto.Add('Usuario: ' + Trim(pCodigo_Usuario) + '-' + Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [pCodigo_Usuario], ['NOMBRE'], 'UtResumen_Caja, Calcular_Resumen_Caja'));
      lTexto.Add('VALOR BASE: '        + FormatFloat('###,###,###', lSQL.FieldByName('VALOR_BASE'    ).AsFloat));
      lTexto.Add('VALOR T.R.M.: '      + FormatFloat('###,###,###', lSQL.FieldByName('VALOR_TRM'     ).AsFloat));
      lTexto.Add('VALOR BASE T.R.M.: ' + FormatFloat('###,###,###', lSQL.FieldByName('VALOR_BASE_TRM').AsFloat));
      lTexto.Add(' ');

      If (TI_All In pTipo_Impresion) Or (TI_Totales In pTipo_Impresion) Then
      Begin
        lTexto.Add(' RESUMEN DEL DIA ');
        lTexto.Add('     VENTAS: '  + FormatFloat('###,###,###', Retornar_Total_Dia(Const_Documento_Factura , pFecha)));
        lTexto.Add('     COMPRAS: ' + FormatFloat('###,###,###', Retornar_Total_Dia(Const_Documento_Compra  , pFecha)));

        lTexto.Add(' ');
        lTexto.Add(' RESUMEN GENERAL ');
        lTexto.Add('     BASE :       ' + FormatFloat('###,###,###', lSQL.FieldByName('VALOR_BASE'    ).AsFloat));
        lTexto.Add('     VENTAS :     ' + FormatFloat('###,###,###', Retornar_Total_Valor_Documento(Const_Documento_Factura, pCodigo_Usuario, pFecha)));
        lTexto.Add('     COMPRAS :    ' + FormatFloat('###,###,###', Retornar_Total_Valor_Documento(Const_Documento_Compra , pCodigo_Usuario, pFecha)));
        lTexto.Add(' ' + StringOfChar('=', 28));
        ltmp := lSQL.FieldByName('VALOR_BASE').AsFloat + Retornar_Total_Valor_Documento(Const_Documento_Factura, pCodigo_Usuario, pFecha);
        If gID_CALCULAR_COMPRA_RC = 'S' Then
          ltmp := ltmp - Retornar_Total_Valor_Documento(Const_Documento_Compra , pCodigo_Usuario, pFecha);
        lTexto.Add('     TOTAL CAJA : ' + FormatFloat('###,###,###', ltmp));
        lTexto.Add(' ' + StringOfChar('*', 28));
        lTexto.Add(' ');
      End;


      If (TI_All In pTipo_Impresion) Or (TI_Pedidos In pTipo_Impresion) Or (TI_Compras In pTipo_Impresion) Or (TI_Cotizacion In pTipo_Impresion) Or (TI_Factura In pTipo_Impresion) Then
      Begin
        lTexto.Add('DOCUMENTOS: ');
        If (TI_Pedidos In pTipo_Impresion) Then
        Begin
          lTexto.Add('PEDIDO INICIAL:     ' + Retornar_Documento_Inicial(Const_Documento_Pedido, pCodigo_Usuario, pFecha));
          lTexto.Add('PEDIDO FINAL:       ' + Retornar_Documento_Final  (Const_Documento_Pedido, pCodigo_Usuario, pFecha));
          UtResumen_Caja_Documentos(Const_Documento_Pedido, pCodigo_Usuario, pFecha, lTexto);
        End;
        If (TI_Compras In pTipo_Impresion) Then
        Begin
          lTexto.Add('COMPRA INICIAL:     ' + Retornar_Documento_Inicial(Const_Documento_Compra, pCodigo_Usuario, pFecha));
          lTexto.Add('COMPRA FINAL:       ' + Retornar_Documento_Final  (Const_Documento_Compra, pCodigo_Usuario, pFecha));
          UtResumen_Caja_Documentos(Const_Documento_Compra, pCodigo_Usuario, pFecha, lTexto);
        End;
        If (TI_Cotizacion In pTipo_Impresion) Then
        Begin
          lTexto.Add('COTIZACION INICIAL: ' + Retornar_Documento_Inicial(Const_Documento_Cotizacion, pCodigo_Usuario, pFecha));
          lTexto.Add('COTIZACION FINAL:   ' + Retornar_Documento_Final  (Const_Documento_Cotizacion, pCodigo_Usuario, pFecha));
          UtResumen_Caja_Documentos(Const_Documento_Cotizacion, pCodigo_Usuario, pFecha, lTexto);
        End;
        If (TI_Factura In pTipo_Impresion) Then
        Begin
          lTexto.Add('FACTURA INICIAL:    ' + Retornar_Documento_Inicial(Const_Documento_Factura, pCodigo_Usuario, pFecha));
          lTexto.Add('FACTURA FINAL:      ' + Retornar_Documento_Final  (Const_Documento_Factura, pCodigo_Usuario, pFecha));
          UtResumen_Caja_Documentos(Const_Documento_Factura, pCodigo_Usuario, pFecha, lTexto);
        End;
      End;

      If (TI_All In pTipo_Impresion) Or (TI_Cantidades In pTipo_Impresion) Then
      Begin
        lTexto.Add(' ');
        lTexto.Add('CANTIDADES: ');
        lTexto.Add('NUMERO DE PEDIDOS: '      + FormatFloat('###,###,###', Retornar_Total_Cantidad_Documento(Const_Documento_Pedido    , pCodigo_Usuario, pFecha)));
        lTexto.Add('NUMERO DE COMPRAS: '      + FormatFloat('###,###,###', Retornar_Total_Cantidad_Documento(Const_Documento_Compra    , pCodigo_Usuario, pFecha)));
        lTexto.Add('NUMERO DE COTIZACIONES: ' + FormatFloat('###,###,###', Retornar_Total_Cantidad_Documento(Const_Documento_Cotizacion, pCodigo_Usuario, pFecha)));
        lTexto.Add('NUMERO DE FACTURAS: '     + FormatFloat('###,###,###', Retornar_Total_Cantidad_Documento(Const_Documento_Factura   , pCodigo_Usuario, pFecha)));
        lTexto.Add('PEDIDOS ANULADOS: '       + FormatFloat('###,###,###', Retornar_Total_Cantidad_Anulado  (Const_Documento_Pedido    , pCodigo_Usuario, pFecha)));
        lTexto.Add('COMPRAS ANULADOS: '       + FormatFloat('###,###,###', Retornar_Total_Cantidad_Anulado  (Const_Documento_Compra    , pCodigo_Usuario, pFecha)));
        lTexto.Add('COTIZACIONES ANULADOS: '  + FormatFloat('###,###,###', Retornar_Total_Cantidad_Anulado  (Const_Documento_Cotizacion, pCodigo_Usuario, pFecha)));
        lTexto.Add('FACTURAS ANULADAS: '      + FormatFloat('###,###,###', Retornar_Total_Cantidad_Anulado  (Const_Documento_Factura   , pCodigo_Usuario, pFecha)));
        lTexto.Add('CORTESIAS EN COMPRAS: '   + FormatFloat('###,###,###', Retornar_Total_Cantidad_Cortesia (Const_Documento_Compra    , pCodigo_Usuario, pFecha)));
        lTexto.Add('CORTESIAS EN FACTURAS: '  + FormatFloat('###,###,###', Retornar_Total_Cantidad_Cortesia (Const_Documento_Factura   , pCodigo_Usuario, pFecha)));
        lTexto.Add('PRODUCTOS COMPRADOS: '    + FormatFloat('###,###,###', Retornar_Cantidad_Productos      (Const_Documento_Compra    , pCodigo_Usuario, pFecha)));
        lTexto.Add('PRODUCTOS VENDIDOS: '     + FormatFloat('###,###,###', Retornar_Cantidad_Productos      (Const_Documento_Factura   , pCodigo_Usuario, pFecha)));
      End;

      If (TI_All In pTipo_Impresion) Or (TI_Valores In pTipo_Impresion) Then
      Begin
        lTexto.Add(' ');
        lTexto.Add('VALORES: ');
        lTexto.Add('TOTAL EN PEDIDOS: '       + FormatFloat('###,###,###', Retornar_Total_Valor_Documento   (Const_Documento_Pedido    , pCodigo_Usuario, pFecha)));
        lTexto.Add('TOTAL EN COMPRAS: '       + FormatFloat('###,###,###', Retornar_Total_Valor_Documento   (Const_Documento_Compra    , pCodigo_Usuario, pFecha)));
        lTexto.Add('TOTAL EN COTIZACIONES: '  + FormatFloat('###,###,###', Retornar_Total_Valor_Documento   (Const_Documento_Cotizacion, pCodigo_Usuario, pFecha)));
        lTexto.Add('TOTAL EN FACTURAS: '      + FormatFloat('###,###,###', Retornar_Total_Valor_Documento   (Const_Documento_Factura   , pCodigo_Usuario, pFecha)));
        lTexto.Add('PEDIDOS ANULADOS: '       + FormatFloat('###,###,###', Retornar_Total_Valor_Anulado     (Const_Documento_Pedido    , pCodigo_Usuario, pFecha)));
        lTexto.Add('COMPRAS ANULADOS: '       + FormatFloat('###,###,###', Retornar_Total_Valor_Anulado     (Const_Documento_Compra    , pCodigo_Usuario, pFecha)));
        lTexto.Add('COTIZACIONES ANULADOS:'   + FormatFloat('###,###,###', Retornar_Total_Valor_Anulado     (Const_Documento_Cotizacion, pCodigo_Usuario, pFecha)));
        lTexto.Add('FACTURAS ANULADOS:'       + FormatFloat('###,###,###', Retornar_Total_Valor_Anulado     (Const_Documento_Factura   , pCodigo_Usuario, pFecha)));
        lTexto.Add('CORTESIA EN COMPRAS: '    + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago  (Const_Documento_Compra    , pCodigo_Usuario, pFecha, 'COR')));
        lTexto.Add('CORTESIA EN FACTURAS: '   + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago  (Const_Documento_Factura   , pCodigo_Usuario, pFecha, 'COR')));
      End;

      If (TI_All In pTipo_Impresion) Or (TI_Forma_Pago In pTipo_Impresion) Then
      Begin
        lTexto.Add(' ');
        lTexto.Add('FORMAS DE PAGO: ');
        lTexto.Add('EFECTIVO EN COMPRAS: '           + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'EFE'            )));
        lTexto.Add('EFECTIVO EN VENTAS: '            + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Factura, pCodigo_Usuario, pFecha, 'EFE'            )));
        lTexto.Add('TARJETA DEBITO EN COMPRAS: '     + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'TDD'            )));
        lTexto.Add('TARJETA DEBITO EN VENTAS: '      + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Factura, pCodigo_Usuario, pFecha, 'TDD'            )));
        lTexto.Add('TARJETA CREDITO EN COMPRAS: '    + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'TDC'            )));
        lTexto.Add('TARJETA CREDITO EN VENTAS: '     + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Factura, pCodigo_Usuario, pFecha, 'TDC'            )));
        lTexto.Add('CHEQUE EN COMPRAS: '             + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'CHE'            )));
        lTexto.Add('CHEQUE EN VENTAS: '              + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Factura, pCodigo_Usuario, pFecha, 'CHE'            )));
        lTexto.Add('SODEXO EN COMPRAS: '             + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'SDX'            )));
        lTexto.Add('SODEXO EN VENTAS: '              + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Factura, pCodigo_Usuario, pFecha, 'SDX'            )));
        lTexto.Add('CARTERA EN COMPRAS: '            + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'CAR'            )));
        lTexto.Add('CARTERA EN VENTAS: '             + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Factura, pCodigo_Usuario, pFecha, 'CAR'            )));
        lTexto.Add('CORTESIA EN COMPRAS: '           + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'COR'            )));
        lTexto.Add('CORTESIA EN VENTAS: '            + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Factura, pCodigo_Usuario, pFecha, 'COR'            )));
        lTexto.Add('TRANSFERENCIA EN COMPRAS: '      + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'TRANSF'         )));
        lTexto.Add('TRANSFERENCIA EN VENTAS: '       + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Factura, pCodigo_Usuario, pFecha, 'TRANSF'         )));
        lTexto.Add('SISTEMA DE CREDITO EN COMPRAS: ' + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'SISTEMA_CREDITO')));
        lTexto.Add('SISTEMA DE CREDITO EN VENTAS: '  + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Factura, pCodigo_Usuario, pFecha, 'SISTEMA_CREDITO')));
      End;

      If ((TI_All In pTipo_Impresion) Or (TI_TRM In pTipo_Impresion)) And (gValor_TRM > 0) Then
      Begin
        lTexto.Add(' ');
        lTexto.Add(' T.R.M. ');
        lTexto.Add('TOTAL EN PEDIDOS: '       + FormatFloat('###,###,###', Redondear_TRM(Retornar_Total_Valor_Documento   (Const_Documento_Pedido    , pCodigo_Usuario, pFecha) / gValor_TRM)));
        lTexto.Add('TOTAL EN COMPRAS: '       + FormatFloat('###,###,###', Redondear_TRM(Retornar_Total_Valor_Documento   (Const_Documento_Compra    , pCodigo_Usuario, pFecha) / gValor_TRM)));
        lTexto.Add('TOTAL EN COTIZACIONES: '  + FormatFloat('###,###,###', Redondear_TRM(Retornar_Total_Valor_Documento   (Const_Documento_Cotizacion, pCodigo_Usuario, pFecha) / gValor_TRM)));
        lTexto.Add('TOTAL EN FACTURAS: '      + FormatFloat('###,###,###', Redondear_TRM(Retornar_Total_Valor_Documento   (Const_Documento_Factura   , pCodigo_Usuario, pFecha) / gValor_TRM)));
        lTexto.Add('PEDIDOS ANULADOS: '       + FormatFloat('###,###,###', Redondear_TRM(Retornar_Total_Valor_Anulado     (Const_Documento_Pedido    , pCodigo_Usuario, pFecha) / gValor_TRM)));
        lTexto.Add('COMPRAS ANULADOS: '       + FormatFloat('###,###,###', Redondear_TRM(Retornar_Total_Valor_Anulado     (Const_Documento_Compra    , pCodigo_Usuario, pFecha) / gValor_TRM)));
        lTexto.Add('COTIZACIONES ANULADOS:'   + FormatFloat('###,###,###', Redondear_TRM(Retornar_Total_Valor_Anulado     (Const_Documento_Cotizacion, pCodigo_Usuario, pFecha) / gValor_TRM)));
        lTexto.Add('FACTURAS ANULADOS:'       + FormatFloat('###,###,###', Redondear_TRM(Retornar_Total_Valor_Anulado     (Const_Documento_Factura   , pCodigo_Usuario, pFecha) / gValor_TRM)));
        lTexto.Add('CORTESIA EN COMPRAS: '    + FormatFloat('###,###,###', Redondear_TRM(Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'COR') / gValor_TRM)));
        lTexto.Add('CORTESIA EN FACTURAS: '   + FormatFloat('###,###,###', Redondear_TRM(Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'COR') / gValor_TRM)));

//        lTexto.Add(' ');
//        lTexto.Add('FORMAS DE PAGO: ');
//        lTexto.Add('EFECTIVO EN COMPRAS: '        + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'EFE_TRM')));
//        lTexto.Add('EFECTIVO EN VENTAS: '         + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Factura, pCodigo_Usuario, pFecha, 'EFE_TRM')));
//        lTexto.Add('TARJETA DEBITO EN COMPRAS: '  + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'TDD_TRM')));
//        lTexto.Add('TARJETA DEBITO EN VENTAS: '   + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Factura, pCodigo_Usuario, pFecha, 'TDD_TRM')));
//        lTexto.Add('TARJETA CREDITO EN COMPRAS: ' + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'TDC_TRM')));
//        lTexto.Add('TARJETA CREDITO EN VENTAS: '  + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Factura, pCodigo_Usuario, pFecha, 'TDC_TRM')));
//        lTexto.Add('CHEQUE EN COMPRAS: '          + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'CHE_TRM')));
//        lTexto.Add('CHEQUE EN VENTAS: '           + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Factura, pCodigo_Usuario, pFecha, 'CHE_TRM')));
//        lTexto.Add('SODEXO EN COMPRAS: '          + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'SDX_TRM')));
//        lTexto.Add('SODEXO EN VENTAS: '           + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Factura, pCodigo_Usuario, pFecha, 'SDX_TRM')));
//        lTexto.Add('CARTERA EN COMPRAS: '         + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'CAR_TRM')));
//        lTexto.Add('CARTERA EN VENTAS: '          + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Factura, pCodigo_Usuario, pFecha, 'CAR_TRM')));
//        lTexto.Add('CORTESIA EN COMPRAS: '        + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Compra , pCodigo_Usuario, pFecha, 'COR_TRM')));
//        lTexto.Add('CORTESIA EN VENTAS: '         + FormatFloat('###,###,###', Retornar_Total_Valor_Forma_Pago(Const_Documento_Factura, pCodigo_Usuario, pFecha, 'COR_TRM')));
      End;

      If (TI_All In pTipo_Impresion) Or (TI_Detalle_Compra In pTipo_Impresion) Then
        Informacion_Detalle_Documento(Retornar_Info_Tabla(Id_Documento_Det).Name, Const_Documento_Compra , pCodigo_Usuario, pFecha, 'V', lTexto);
      If (TI_All In pTipo_Impresion) Or (TI_Detalle_Venta In pTipo_Impresion) Then
        Informacion_Detalle_Documento(Retornar_Info_Tabla(Id_Documento_Det).Name, Const_Documento_Factura, pCodigo_Usuario, pFecha, 'V', lTexto);

      lSQL.Edit;
      lSQL.FieldByName('DETALLE').AsString := lTexto.Text;
      lTexto.Clear;
      lTexto.Free;
      lSQL.Post;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
    On E:Exception Do
      UtLog_Execute('Calcular_Resumen_Caja, UtResumen_Caja, ' + E.Message);
  End;
End;

end.
