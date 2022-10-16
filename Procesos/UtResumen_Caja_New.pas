unit UtResumen_Caja_New;

interface
Uses
  Classes;

Type
  TResumen_Caja = (RC_All, RC_Totales, RC_Compras, RC_Facturas, RC_Orden_Descripcion, RC_Orden_Cantidad, RC_Orden_Valor);
  TOpciones_Resumen = Set Of TResumen_Caja;

Procedure UtResumen_Caja_New_Execute(Const pCodigo_Usuario, pFechaIni, pFechaFin : String; pLista : TStringList; pResumen_Caja : TOpciones_Resumen);
Procedure UtResumen_Caja_New_Ranges;

implementation
Uses
  Math,
  ovcpf,
  SysUtils,
  StrUtils,
  UtConexion,
  UtFunciones,
  Form_Rangos,
  Form_Splash,
  UtConstantes,
  UtInfoTablas,
  Generics.Defaults,
  UtCalculo_Impuestos,
  UtVariablesGlobales,
  Generics.Collections,
  Tablename_Documento_Adm,
  Form_Print_Documento_Adm;

Const
  Const_Max_Width = 45;

Type
  TDetalle = Class
    CODIGO              : String;
    NOMBRE              : String;
    CANTIDAD            : Double;
    VALOR               : Double;
    PORCENTAJE_VALOR    : Double;
    PORCENTAJE_CANTIDAD : Double;
  End;
  TLista_Detalle = TList<TDetalle>;

Var
  gResumen_Caja : TOpciones_Resumen;

Function UtResumen_Caja_New_Filtro(Const pTipo_Documento, pCodigo_Usuario, pFieldDate, pFechaIni, pFechaFin, pId_Anulado : String) : String;
Begin
  Result := ' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento)) ;
  Result := Result + ' AND ' + gVariableGlobal.CNX.Trim_Sentence(pFieldDate) + ' BETWEEN ' + QuotedStr(Trim(pFechaIni)) + ' AND ' + QuotedStr(Trim(pFechaFin));
  Result := Result + ' AND ' + gVariableGlobal.CNX.Trim_Sentence('ID_ANULADO') + ' = ' + QuotedStr(Trim(pId_Anulado)) + ' ';
  If Not Vacio(pCodigo_Usuario) Then
    Result := Result + ' AND ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario)) + ' ';
End;

Function UtResumen_Caja_New_Get_Info_String(Const pTitle, pOperacion, pTipo_Documento, pCodigo_Usuario, pFieldDate, pFechaIni, pFechaFin, pId_Anulado : String) : String;
Var
  lSQL : String;
Begin
  lSQL := ' SELECT ' + pOperacion + ' AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name;
  lSQL := lSQL + UtResumen_Caja_New_Filtro(pTipo_Documento, pCodigo_Usuario, pFieldDate, pFechaIni, pFechaFin, pId_Anulado);
  Result := gVariableGlobal.CNX.SQL_String(lSQL, 'RESULTADO', 'UtResumen_Caja_New_Get_Info_String');
  Result := IfThen(Not Vacio(Result), pTitle + Result);
End;

Function UtResumen_Caja_New_Get_Info_Double(Const pTitle, pOperacion, pTipo_Documento, pCodigo_Usuario, pFieldDate, pFechaIni, pFechaFin, pId_Anulado : String) : String;
Var
  lSQL : String;
  lValue : Double;
Begin
  lSQL := ' SELECT ' + pOperacion + ' AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name;
  lSQL := lSQL + UtResumen_Caja_New_Filtro(pTipo_Documento, pCodigo_Usuario, pFieldDate, pFechaIni, pFechaFin, pId_Anulado);
  lValue := gVariableGlobal.CNX.SQL_Double(lSQL, 'RESULTADO', 'UtResumen_Caja_New_Get_Info_Double');
  Result := IfThen(lValue > 0,  pTitle + FormatFloat('###,###,###,##0.#0', lValue), '');
End;

Function UtResumen_Caja_New_Detalle(pNombre, pCantidad, pValor, pPorcentaje_Cantidad, pPorcentaje_Valor : String) : String;
Begin
  Result := Copy(pNombre + Justificar(' ', ' ', 20       ), 01, 10) + ' ' +
            Copy(Justificar(pCantidad           , ' ', 06), 01, 06) + ' ' +
            Copy(Justificar(pValor              , ' ', 11), 01, 11) + ' ' +
            Copy(Justificar(pPorcentaje_Cantidad, ' ', 07), 01, 07) + ' ' +
            Copy(Justificar(pPorcentaje_Valor   , ' ', 07), 01, 07);
End;

Function UtResumen_Caja_New_Productos(Const pTitle, pTipo_Documento, pCodigo_Usuario, pFechaIni, pFechaFin, pId_Anulado : String; pLista : TStringList) : Boolean;
Var
  lI : Integer;
  ltmp : String;
  lItem : TDetalle;
  lOrigen : TQuery;
  lListado : TLista_Detalle;
  lSuma_Valor : Double;
  lSuma_Cantidad : Double;
Begin
  lSuma_Valor := 0;
  lSuma_Cantidad := 0;
  Result := False;
  Try
    lOrigen := TQuery.Create(Nil);
    lOrigen.Connection := gVariableGlobal.CNX;
    lOrigen.SQL.Clear;
    lOrigen.SQL.Add(' SELECT CODIGO_PRODUCTO, SUM(CANTIDAD) AS CANTIDAD, SUM(VALOR_TOTAL) AS VALOR FROM ' + Retornar_Info_Tabla(Id_Documento_Det).Name  + ' ');
    lOrigen.SQL.Add(UtResumen_Caja_New_Filtro(pTipo_Documento, pCodigo_Usuario, 'FECHA', pFechaIni, pFechaFin, pId_Anulado));
    lOrigen.SQL.Add(' GROUP BY CODIGO_PRODUCTO'                                                               );
    lOrigen.SQL.Add(' ORDER BY CODIGO_PRODUCTO'                                                               );
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
        lItem.NOMBRE := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [lItem.CODIGO], ['NOMBRE'], 'Calcular_Resumen_Caja, Informacion_Detalle_Documento');
        If lSuma_Valor <> 0 Then
          lItem.PORCENTAJE_VALOR    := lItem.VALOR    / lSuma_Valor    * 100;
        If lSuma_Cantidad <> 0 Then
          lItem.PORCENTAJE_CANTIDAD := lItem.CANTIDAD / lSuma_Cantidad * 100;
      End;
      lListado.Sort(TComparer<TDetalle>.Construct(
              Function(const Item1,Item2:TDetalle): Integer
              Begin
                If (RC_Orden_Descripcion In gResumen_Caja) Then
                  Result := CompareText(Item1.NOMBRE, Item2.NOMBRE)
                Else
                  If (RC_Orden_Valor In gResumen_Caja) Then
                    Result := CompareValue(Item1.PORCENTAJE_VALOR   , Item2.PORCENTAJE_VALOR)
                  Else
                    Result := CompareValue(Item1.PORCENTAJE_CANTIDAD, Item2.PORCENTAJE_CANTIDAD);
                If Not (RC_Orden_Descripcion In gResumen_Caja) Then
                  Result := Result * -1
              End)
              );
      If lListado.Count > 0 Then
      Begin
        pLista.Add(Justificar('-', '-', Const_Max_Width));
        pLista.Add(pTitle);
        ltmp := UtResumen_Caja_New_Detalle('  DESCRIPCION', 'CANTIDAD', 'VALOR', '%VAL', '%CANT');
        pLista.Add(ltmp);
        For lI := 0 To lListado.Count-1 Do
        Begin
          ltmp := UtResumen_Caja_New_Detalle('  ' + lListado[lI].NOMBRE,
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
      gVariableGlobal.Add_Log(E, ['Origen', 'UtResumen_Caja_New_Productos']);
  End;
End;

Function UtResumen_Caja_New_Discriminados(pItem : Array Of String; Const pTitle, pTipo_Documento, pCodigo_Usuario, pFechaIni, pFechaFin, pId_Anulado : String; pLista : TStringList) : Boolean;
Var
  lI : Integer;
  lOk : Boolean;
  lSQL : TQuery;
Begin
  lOk := False;
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    For lI := Low(pItem) To High(pItem) Do
    Begin
      lSQL.Active := False;
      lSQL.SQL.Clear;
      lSQL.SQL.Add(' SELECT  ');
      lSQL.SQL.Add(' PORC_' + pItem[lI] + ' AS PORCENTAJE , ');
      lSQL.SQL.Add(' SUM(VALOR_' + pItem[lI] + ') AS VALOR_IMPUESTO ');
      lSQL.SQL.Add(' FROM ' + Retornar_Info_Tabla(Id_Documento_Det).Name + ' ');
      lSQL.SQL.Add(UtResumen_Caja_New_Filtro(pTipo_Documento, pCodigo_Usuario, 'FECHA', pFechaIni, pFechaFin, pId_Anulado));
      lSQL.SQL.Add(' GROUP BY PORC_' + pItem[lI] + ' ');
      lSQL.Active := True;
      If lSQL.Active And (lSQL.RecordCount > 0) Then
      Begin
        lSQL.First;
        While Not lSQL.Eof Do
        Begin
          If lSQL.FieldByName('PORCENTAJE').AsFloat > 0 Then
          Begin
            If Not lOk Then
            Begin
              pLista.Add(Justificar('-', '-', Const_Max_Width));
              pLista.Add(pTitle);
              lOk := True;
            End;
            pLista.Add('  ' +  pItem[lI] + ' ' + FormatFloat('###,###,##0.#0', lSQL.FieldByName('PORCENTAJE').AsFloat) + '% = ' +
                       FormatFloat('###,###,##0.#0', lSQL.FieldByName('VALOR_IMPUESTO').AsFloat));
          End;
          lSQL.Next;
        End;
      End;
      lSQL.Active := False;
    End;
    lSQL.Free;
    Result := True;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtResumen_Caja_New_Discriminados']);
  End;
End;

Procedure UtResumen_Caja_New_Valores(pItem : Array Of String; Const pTitle, pTipo_Documento, pCodigo_Usuario, pFechaIni, pFechaFin, pId_Anulado : String; pLista : TStringList);
Var
  lI : Integer;
  lOk : Boolean;
Begin
  lOk := False;
  For lI := Low(pItem) To High(pItem) Do
  Begin
    If Not lOk Then
    Begin
      If Not Vacio(pTitle) Then
      Begin
        pLista.Add(Justificar('-', '-', Const_Max_Width));
        pLista.Add('  ' + pTitle);
      End;
      lOk := True;
    End;
    pLista.Add(UtResumen_Caja_New_Get_Info_Double('  ' + StringReplace(pItem[lI], '_', ' ', [rfReplaceAll]) + ': ', 'SUM(' + pItem[lI] + ')', pTipo_Documento, pCodigo_Usuario, 'FECHA_DOCUMENTO', pFechaIni, pFechaFin, pId_Anulado));
  End;
End;

Function UtResumen_Caja_New_Documentos(Const pTipo_Documento, pCodigo_Usuario, pFechaIni, pFechaFin, pId_Anulado : String; pLista : TStringList) : Boolean;
Var
  lOk : Boolean;
  lOrigen : TQuery;
Begin
  lOk := False;
  Result := False;
  Try
    lOrigen := TQuery.Create(Nil);
    lOrigen.Connection := gVariableGlobal.CNX;
    lOrigen.SQL.Clear;
    lOrigen.SQL.Add(' SELECT NUMERO_DOCUMENTO, VALOR_TOTAL FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name  + ' ');
    lOrigen.SQL.Add(UtResumen_Caja_New_Filtro(pTipo_Documento, pCodigo_Usuario, 'FECHA_DOCUMENTO', pFechaIni, pFechaFin, pId_Anulado));
    lOrigen.SQL.Add(' ORDER BY NUMERO_DOCUMENTO' );
    lOrigen.Connection := gVariableGlobal.CNX;
    lOrigen.Active := True;
    If lOrigen.Active Then
    Begin
      lOrigen.First;
      While Not lOrigen.Eof Do
      Begin
        If Not lOk Then
        Begin
          pLista.Add(Justificar('-', '-', Const_Max_Width));
          pLista.Add('  DOCUMENTOS');
          lOk := True;
        End;
        pLista.Add('  ' + lOrigen.FieldByName('NUMERO_DOCUMENTO').AsString + ': ' +
                          Justificar(FormatFloat('###,###,##0.#0', lOrigen.FieldByName('VALOR_TOTAL').AsFloat), ' ', 14)
                  );
        lOrigen.Next;
      End;
    End;
    lOrigen.Active := False;
    lOrigen.Free;
    Result := True;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'UtResumen_Caja_New_Documentos']);
  End;
End;

Function UtResumen_Caja_New_Domicilios(Const pTipo_Documento, pCodigo_Usuario, pFechaIni, pFechaFin, pId_Anulado : String; pLista : TStringList) : Boolean;
Var
  lOk : Boolean;
  lSuma : Double;
  lOrigen : TQuery;
Begin
  lOk := False;
  lSuma := 0;
  Result := False;
  Try
    lOrigen := TQuery.Create(Nil);
    lOrigen.Connection := gVariableGlobal.CNX;
    lOrigen.SQL.Clear;
    lOrigen.SQL.Add(' SELECT NUMERO_DOCUMENTO, VALOR_DOMICILIO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name  + ' ');
    lOrigen.SQL.Add(UtResumen_Caja_New_Filtro(pTipo_Documento, pCodigo_Usuario, 'FECHA_DOCUMENTO', pFechaIni, pFechaFin, pId_Anulado));
    lOrigen.SQL.Add(' ORDER BY NUMERO_DOCUMENTO' );
    lOrigen.Connection := gVariableGlobal.CNX;
    lOrigen.Active := True;
    If lOrigen.Active Then
    Begin
      lOrigen.First;
      While Not lOrigen.Eof Do
      Begin
        If lOrigen.FieldByName('VALOR_DOMICILIO').AsFloat > 0 Then
        Begin
          If Not lOk Then
          Begin
            pLista.Add(Justificar('-', '-', Const_Max_Width));
            pLista.Add('  DOMICILIOS');
            lOk := True;
          End;
          lSuma := lSuma  + lOrigen.FieldByName('VALOR_DOMICILIO').AsFloat;
          pLista.Add('  ' + lOrigen.FieldByName('NUMERO_DOCUMENTO').AsString + ': ' +
                            Justificar(FormatFloat('###,###,##0.#0', lOrigen.FieldByName('VALOR_DOMICILIO').AsFloat), ' ', 14)
                    );
        End;
        lOrigen.Next;
      End;
    End;
    lOrigen.Active := False;
    lOrigen.Free;
    If lSuma > 0 Then
      pLista.Add('  TOTAL DOMICILIOS: ' + Justificar(FormatFloat('###,###,##0.#0', lSuma), ' ', 14));
    Result := True;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'UtResumen_Caja_New_Documentos']);
  End;
End;

Procedure UtResumen_Caja_New_Get_Data(Const pTitle, pTipo_Documento, pCodigo_Usuario, pFechaIni, pFechaFin, pId_Anulado : String; pLista : TStringList);
Begin
  pLista.Add(UtResumen_Caja_New_Get_Info_String(pTitle + ' INICIAL: '    , 'MIN(NUMERO_DOCUMENTO)', pTipo_Documento , pCodigo_Usuario, 'FECHA_DOCUMENTO', pFechaIni, pFechaFin, pId_Anulado));
  pLista.Add(UtResumen_Caja_New_Get_Info_String(pTitle + ' FINAL: '      , 'MAX(NUMERO_DOCUMENTO)', pTipo_Documento , pCodigo_Usuario, 'FECHA_DOCUMENTO', pFechaIni, pFechaFin, pId_Anulado));
  If (RC_All In gResumen_Caja) Or (RC_Orden_Descripcion In gResumen_Caja) Then
    UtResumen_Caja_New_Productos('  Ordenado por descripción: ', pTipo_Documento, pCodigo_Usuario, pFechaIni, pFechaFin, pId_Anulado, pLista)
  Else
  If (RC_All In gResumen_Caja) Or (RC_Orden_Valor In gResumen_Caja) Then
    UtResumen_Caja_New_Productos('  Ordenado por valor: ', pTipo_Documento, pCodigo_Usuario, pFechaIni, pFechaFin, pId_Anulado, pLista)
  Else
    If (RC_All In gResumen_Caja) Or (RC_Orden_Cantidad In gResumen_Caja) Then
      UtResumen_Caja_New_Productos('  Ordenado por cantidad: ', pTipo_Documento, pCodigo_Usuario, pFechaIni, pFechaFin, pId_Anulado, pLista);
  UtResumen_Caja_New_Discriminados(['SERVICIO', 'DESCUENTO', 'IVA', 'RETEIVA', 'RETEFUENTE', 'ICA', 'IMPCONSUMO', 'CREE'], '  Discriminación', pTipo_Documento, pCodigo_Usuario, pFechaIni, pFechaFin, pId_Anulado, pLista);
  UtResumen_Caja_New_Valores(['VALOR_IVA',
                              'VALOR_RETEIVA',
                              'VALOR_RETEFUENTE',
                              'VALOR_ICA',
                              'VALOR_IMPCONSUMO',
                              'VALOR_DESCUENTO',
                              'VALOR_SERVICIO',
                              'VALOR_CREE',
                              'VALOR_INTERES'], '', pTipo_Documento, pCodigo_Usuario, pFechaIni, pFechaFin, pId_Anulado, pLista);

  UtResumen_Caja_New_Valores(['EFE',
                              'EFE_TRM',
                              'TDD',
                              'TDD_TRM',
                              'TDC',
                              'TDC_TRM',
                              'CHE',
                              'CHE_TRM',
                              'SDX',
                              'SDX_TRM',
                              'COR',
                              'COR_TRM',
                              'CAR',
                              'CAR_PAGADA',
                              'CAR_TRM',
                              'CAR_TRM_PAGADA',
                              'TRANSF',
                              'TRANSF_TRM',
                              'SISTEMA_CREDITO',
                              'SISTEMA_CREDITO_TRM'], 'FORMAS DE PAGO', pTipo_Documento, pCodigo_Usuario, pFechaIni, pFechaFin, pId_Anulado, pLista);
  UtResumen_Caja_New_Documentos(pTipo_Documento, pCodigo_Usuario, pFechaIni, pFechaFin, pId_Anulado, pLista);
End;


Function UtResumen_Caja_New_Calcular_Grupo(Const pId : Integer; Const pFieldName, pTipo_Documento, pCodigo_Usuario, pFechaIni, pFechaFin, pId_Anulado : String; pLista : TStringList) : Boolean;
Var
  lOk : Boolean;
  lOrigen : TQuery;
Begin
  lOk := False;
  Result := False;
  Try
    lOrigen := TQuery.Create(Nil);
    lOrigen.Connection := gVariableGlobal.CNX;
    lOrigen.SQL.Clear;
    lOrigen.SQL.Add(' SELECT  ' + Retornar_Info_Tabla(pId).Name + '.'+ pFieldName + ' ,' );
    lOrigen.SQL.Add('         ' + Retornar_Info_Tabla(pId).Name + '.NOMBRE, ');
    lOrigen.SQL.Add(' SUM(' + Retornar_Info_Tabla(Id_Documento_Det).Name + '.CANTIDAD) AS CANTIDAD, ');
    lOrigen.SQL.Add(' SUM(' + Retornar_Info_Tabla(Id_Documento_Det).Name + '.VALOR_TOTAL) AS VALOR_TOTAL  ');
    lOrigen.SQL.Add(' FROM  ' + Retornar_Info_Tabla(pId).Name  + ' ');
    lOrigen.SQL.Add(' INNER JOIN ' + Retornar_Info_Tabla(Id_Producto).Name + ' ON ' + Retornar_Info_Tabla(Id_Producto).Name + '.' + pFieldName + ' = ' + Retornar_Info_Tabla(pId).Name + '.' + pFieldName);
    lOrigen.SQL.Add(' INNER JOIN ' + Retornar_Info_Tabla(Id_Documento_Det).Name + ' ON ' + Retornar_Info_Tabla(Id_Documento_Det).Name + '.CODIGO_PRODUCTO  = ' + Retornar_Info_Tabla(Id_Producto).Name + '.CODIGO_PRODUCTO ');
    lOrigen.SQL.Add(' WHERE ' + Retornar_Info_Tabla(Id_Documento_Det).Name + '.TIPO_DOCUMENTO = ' + QuotedStr(pTipo_Documento));
    lOrigen.SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence( Retornar_Info_Tabla(Id_Documento_Det).Name + '.FECHA') + ' BETWEEN ' + QuotedStr(Trim(pFechaIni)) + ' AND ' + QuotedStr(Trim(pFechaFin)));
    lOrigen.SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence(Retornar_Info_Tabla(Id_Documento_Det).Name + '.ID_ANULADO') + ' = ' + QuotedStr(Trim(pId_Anulado)) + ' ');
    If Not Vacio(pCodigo_Usuario) Then
      lOrigen.SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence(Retornar_Info_Tabla(Id_Documento_Det).Name + '.CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario)) + ' ');
    lOrigen.SQL.Add(' GROUP BY  ' + Retornar_Info_Tabla(pId).Name + '.' + pFieldName + ', ' +Retornar_Info_Tabla(pId).Name + '.NOMBRE ');
    lOrigen.SQL.Add(' ORDER BY VALOR_TOTAL DESC ');
    lOrigen.Active := True;
    If lOrigen.Active Then
    Begin
      lOrigen.First;
      While Not lOrigen.Eof Do
      Begin
        If Not lOk Then
        Begin
          pLista.Add(Justificar('-', '-', Const_Max_Width));
          pLista.Add('  ' + Retornar_Info_Tabla(pId).Caption);
          lOk := True;
        End;
        pLista.Add('  ' +
                     Copy(lOrigen.FieldByName('NOMBRE').AsString + StringOfChar(' ', 15), 01, 15) + ': ' +
                     Justificar(FormatFloat(    '##,##0', lOrigen.FieldByName('CANTIDAD'   ).AsFloat), ' ', 06) + ' - ' +
                     Justificar(FormatFloat('##,###,##0', lOrigen.FieldByName('VALOR_TOTAL').AsFloat), ' ', 10)
                  );
        lOrigen.Next;
      End;
    End;
    lOrigen.Active := False;
    lOrigen.Free;
    Result := True;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'UtResumen_Caja_New_Calcular_Grupo']);
  End;
End;


Function UtResumen_Caja_New_Calcular_Espacios(Const pCodigo_Usuario, pFechaIni, pFechaFin, pId_Anulado : String; pLista : TStringList) : Boolean;
Var
  lOk : Boolean;
  ltmp : String;
  lOrigen : TQuery;
Begin
  lOk := False;
  Result := False;
  Try
    lOrigen := TQuery.Create(Nil);
    lOrigen.Connection := gVariableGlobal.CNX;
    lOrigen.SQL.Clear;
    lOrigen.SQL.Add(' SELECT  ' + Retornar_Info_Tabla(Id_Espacio).Name + '.TIPO_ESPACIO AS TIPO_ESPACIO,' );
    lOrigen.SQL.Add(' SUM(' + Retornar_Info_Tabla(Id_Documento_Det).Name + '.CANTIDAD) AS CANTIDAD, ');
    lOrigen.SQL.Add(' SUM(' + Retornar_Info_Tabla(Id_Documento_Det).Name + '.VALOR_TOTAL) AS VALOR_TOTAL  ');
    lOrigen.SQL.Add(' FROM  ' + Retornar_Info_Tabla(Id_Espacio).Name  + ' ');
    lOrigen.SQL.Add(' INNER JOIN ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' ON ' + Retornar_Info_Tabla(Id_Espacio).Name + '.CODIGO_ESPACIO = ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + '.CODIGO_ESPACIO');
    lOrigen.SQL.Add(' INNER JOIN ' + Retornar_Info_Tabla(Id_Documento_Det).Name + ' ON ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + '.DATAKEY = ' + Retornar_Info_Tabla(Id_Documento_Det).Name + '.DATAKEY');
    lOrigen.SQL.Add(' WHERE ' + Retornar_Info_Tabla(Id_Documento_Det).Name + '.TIPO_DOCUMENTO = ' + QuotedStr(Const_Documento_Factura));
    lOrigen.SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence( Retornar_Info_Tabla(Id_Documento_Det).Name + '.FECHA') + ' BETWEEN ' + QuotedStr(Trim(pFechaIni)) + ' AND ' + QuotedStr(Trim(pFechaFin)));
    lOrigen.SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence(Retornar_Info_Tabla(Id_Documento_Det).Name + '.ID_ANULADO') + ' = ' + QuotedStr(Trim(pId_Anulado)) + ' ');
    If Not Vacio(pCodigo_Usuario) Then
      lOrigen.SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence(Retornar_Info_Tabla(Id_Documento_Det).Name + '.CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(pCodigo_Usuario)) + ' ');
    lOrigen.SQL.Add(' GROUP BY  ' + Retornar_Info_Tabla(Id_Espacio).Name + '.TIPO_ESPACIO ');
    lOrigen.SQL.Add(' ORDER BY VALOR_TOTAL DESC ');
    lOrigen.Active := True;
    If lOrigen.Active Then
    Begin
      lOrigen.First;
      While Not lOrigen.Eof Do
      Begin
        If Not lOk Then
        Begin
          pLista.Add(Justificar('-', '-', Const_Max_Width));
          pLista.Add('  ' + 'DISCRIMINACION DE ESPACIOS');
          lOk := True;
        End;
        ltmp := 'ESTANDARD';
        If lOrigen.FieldByName('TIPO_ESPACIO').AsString = 'D' Then
          ltmp := 'DOMICILIO'
        Else
          If lOrigen.FieldByName('TIPO_ESPACIO').AsString = 'R' Then
            ltmp := 'RECOGER';
        pLista.Add('  ' +
                     Copy(ltmp + StringOfChar(' ', 15), 01, 15) + ': ' +
                     Justificar(FormatFloat(    '##,##0', lOrigen.FieldByName('CANTIDAD'   ).AsFloat), ' ', 06) + ' - ' +
                     Justificar(FormatFloat('##,###,##0', lOrigen.FieldByName('VALOR_TOTAL').AsFloat), ' ', 10)
                  );
        lOrigen.Next;
      End;
    End;
    lOrigen.Active := False;
    lOrigen.Free;
    Result := True;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'UtResumen_Caja_New_Calcular_Grupo']);
  End;
End;


Procedure UtResumen_Caja_New_Execute(Const pCodigo_Usuario, pFechaIni, pFechaFin : String; pLista : TStringList; pResumen_Caja : TOpciones_Resumen);
Var
  lI : Integer;
Begin
  gResumen_Caja := pResumen_Caja;
  Try
    If (RC_All In pResumen_Caja) Or (RC_Totales In pResumen_Caja) Then
    Begin
      pLista.Add(UtResumen_Caja_New_Get_Info_Double('VENTAS: ' , 'SUM(VALOR_TOTAL)', Const_Documento_Factura, pCodigo_Usuario, 'FECHA_DOCUMENTO', pFechaIni, pFechaFin, 'N'));
      pLista.Add(UtResumen_Caja_New_Get_Info_Double('COMPRAS: ', 'SUM(VALOR_TOTAL)', Const_Documento_Compra , pCodigo_Usuario, 'FECHA_DOCUMENTO', pFechaIni, pFechaFin, 'N'));
    End;

    If (RC_All In pResumen_Caja) Or (RC_Compras In pResumen_Caja) Then
    Begin
      UtResumen_Caja_New_Get_Data('COMPRA' , Const_Documento_Compra , pCodigo_Usuario, pFechaIni, pFechaFin, 'N', pLista);
      pLista.Add(UtResumen_Caja_New_Get_Info_Double('NRO. COMPRAS: ', 'COUNT(*)', Const_Documento_Compra, pCodigo_Usuario, 'FECHA_DOCUMENTO', pFechaIni, pFechaFin, 'N'));
      pLista.Add(UtResumen_Caja_New_Get_Info_Double('NRO. COMPRAS ANULADAS: ', 'COUNT(*)', Const_Documento_Compra, pCodigo_Usuario, 'FECHA_DOCUMENTO', pFechaIni, pFechaFin, 'S'));
    End;

    If (RC_All In pResumen_Caja) Or (RC_Facturas In pResumen_Caja) Then
    Begin
      UtResumen_Caja_New_Get_Data('FACTURA', Const_Documento_Factura, pCodigo_Usuario, pFechaIni, pFechaFin, 'N', pLista);
      pLista.Add(UtResumen_Caja_New_Get_Info_Double('NRO.FACTURAS: ', 'COUNT(*)', Const_Documento_Factura, pCodigo_Usuario, 'FECHA_DOCUMENTO', pFechaIni, pFechaFin, 'N'));
      pLista.Add(UtResumen_Caja_New_Get_Info_Double('NRO.FACTURAS ANULADAS: ', 'COUNT(*)', Const_Documento_Factura, pCodigo_Usuario, 'FECHA_DOCUMENTO', pFechaIni, pFechaFin, 'S'));
    End;

    UtResumen_Caja_New_Calcular_Grupo(Id_Bodega  , 'CODIGO_BODEGA'  , Const_Documento_Factura, pCodigo_Usuario, pFechaIni, pFechaFin, 'N', pLista);
    UtResumen_Caja_New_Calcular_Grupo(Id_Linea   , 'CODIGO_LINEA'   , Const_Documento_Factura, pCodigo_Usuario, pFechaIni, pFechaFin, 'N', pLista);
    UtResumen_Caja_New_Calcular_Grupo(Id_Grupo   , 'CODIGO_GRUPO'   , Const_Documento_Factura, pCodigo_Usuario, pFechaIni, pFechaFin, 'N', pLista);
    UtResumen_Caja_New_Calcular_Grupo(Id_Subgrupo, 'CODIGO_SUBGRUPO', Const_Documento_Factura, pCodigo_Usuario, pFechaIni, pFechaFin, 'N', pLista);
    UtResumen_Caja_New_Domicilios(Const_Documento_Factura, pCodigo_Usuario, pFechaIni, pFechaFin, 'N', pLista);

    UtResumen_Caja_New_Calcular_Espacios(pCodigo_Usuario, pFechaIni, pFechaFin, 'N', pLista);

    lI := 0;
    While lI < pLista.Count Do
    Begin
      If Vacio(pLista[lI]) Then
        pLista.Delete(lI)
      Else
        Inc(lI);
    End;

  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'UtResumen_Caja_New_Execute']);
  End;
End;


Function Get_Rangos_Fecha(Var pFechaIni, pFechaFin : String) : Boolean;
Var
  lFrRangos : TFrRangos;
Begin
  lFrRangos := TFrRangos.Create(Nil);
  lFrRangos.Add_Range(pftDate, 'Fecha', 0, 10, 0, ' ', ' ', FormatDateTime('YYYY-MM-DD', Now));
  Result := lFrRangos.Show_Form_Rangos('Rango de Fechas');
  If Result Then
    lFrRangos.Return_RangeStr('Fecha', pFechaIni, pFechaFin , 10);
  lFrRangos.Free;
End;

Procedure UtResumen_Caja_New_Ranges;
Var
  lSQL : TQuery;
  lLista : TStringList;
  lCopias : Integer;
  lDataKey : String;
  lFormato : String;
  lFechaIni : String;
  lFechaFin : String;
  lId_Salida : String;
Begin
  If Not Tablename_Documento_Adm_Formato(Const_Documento_Reporte_Base, lFormato, lId_Salida, lCopias) Then
    Exit;

  If Not Get_Rangos_Fecha(lFechaIni, lFechaFin) Then
    Exit;

  Try
    Show_Splash;
    lLista := TStringList.Create;
    lLista.Add('RESUMEN DE CAJA ' + lFechaIni + ' AL ' + lFechaFin);
    Actualiza__Splash('Buscando informaciòn global...');
    UtResumen_Caja_New_Execute('', lFechaIni, lFechaFin, lLista, [TResumen_Caja.RC_All, TResumen_Caja.RC_Orden_Descripcion]);
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT CODIGO_USUARIO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name  + ' ');
    lSQL.SQL.Add(' WHERE FECHA_DOCUMENTO BETWEEN ' + QuotedStr(lFechaIni) + ' AND ' + QuotedStr(lFechaFin));
    lSQL.SQL.Add(' AND ID_ANULADO = ' + QuotedStr('N'));
    lSQL.SQL.Add(' GROUP BY CODIGO_USUARIO ' );
    lSQL.SQL.Add(' ORDER BY CODIGO_USUARIO ' );
    lSQL.Active := True;
    If lSQL.Active Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        Actualiza__Splash('Buscando informaciòn de ' + gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [lSQL.FieldByName('CODIGO_USUARIO').AsString], ['NOMBRE'], 'UtResumen_Caja_New_Ranges') + '...');
        lLista.Add(Justificar('*', '*', Const_Max_Width));
        lLista.Add('USUARIO - ' + gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [lSQL.FieldByName('CODIGO_USUARIO').AsString], ['NOMBRE'], 'UtResumen_Caja_New_Ranges'));
        UtResumen_Caja_New_Execute(lSQL.FieldByName('CODIGO_USUARIO').AsString, lFechaIni, lFechaFin, lLista, [TResumen_Caja.RC_All, TResumen_Caja.RC_Orden_Descripcion]);
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    lSQL.Free;
//    Tablename_Reporte_Save(lDataKey, lLista);
    lLista.Clear;
    FreeAndNil(lLista);
    Free_Splash;
    Execute_Print_Reporte(lFormato, lId_Salida, lDataKey);
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'UtResumen_Caja_New_Ranges']);
  End;
End;


end.
