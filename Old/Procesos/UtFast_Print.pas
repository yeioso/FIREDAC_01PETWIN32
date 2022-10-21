unit UtFast_Print;

interface
Function Imprimir_Factura_Fast_Print(pEnc, pDet, pRes : Integer; pTipo_Documento, pDatakey : String) : Boolean;
Function Imprimir_La_Z_Fast_Print(pTabla : String) : Boolean;
Function Imprimir_Resumen_Fast_Print(Const pFecha, pUsername : String) : Boolean;
Function Imprimir_Comanda_Detallada_Fast_Print(Const pTable : Integer; Const pTipo_Documento, pDatakey, pConsecutivo : String) : Boolean;
Function Imprimir_Comanda_Resumida_Fast_Print(Const pTable : Integer; Const pTipo_Documento, pDatakey : String) : Boolean;

implementation

Uses
  DB,
  Math,
  Types,
  Classes,
  Printers,
  SysUtils,
  StrUtils,
  Graphics,
  UtConexion,
  UtFunciones,
  UtImpresion,
  UtConstantes,
  UtInfoTablas,
  UtVariablesGlobales;

Type
  TControl_Print = Packed Record
    Row : Integer;
    Cols : Integer;
    Height : Integer;
  End;

Var
  gControl_Print : TControl_Print;

Procedure Imprimir_Linea(pValue : String);
Begin
  gControl_Print.Height := Printer.Canvas.TextHeight('X') + 3;
  Inc(gControl_Print.Row, gControl_Print.Height);
  Printer.Canvas.Font.Style := Printer.Canvas.Font.Style + [TFontStyle.fsBold];
  Printer.Canvas.TextOut(0, gControl_Print.Row, pValue);
End;

Procedure Imprimir_Texto(pTexto : String; pCentrar : Boolean = False);
Var
  ltmp : String;
Begin
  If Not pCentrar Then
    Imprimir_Linea(pTexto)
  Else
  Begin
    ltmp := pTexto;
    While Not Vacio(ltmp) Do
    Begin
      Imprimir_Linea(Centrar_Texto(Copy(ltmp, 1, gControl_Print.Cols), gControl_Print.Cols));
      Delete(ltmp, 1, gControl_Print.Cols)
    End;
  End;
End;

Procedure Imprimir_Totales(pTexto : String; pValue : Double);
Begin
  If pValue > 0 Then
    Imprimir_Linea(Copy(pTexto + StringOfChar(' ', 25), 01, 25) + ' ' + Justificar(FormatFloat('###,###,##0.00', pValue), ' ', 14));
End;

Procedure Cargar_Configuracion(Var pCols : Integer);
Begin
  pCols := IfThen(gVariableGlobal.TAMANO_LINEA < 20, 30, gVariableGlobal.TAMANO_LINEA);
  Printer.Canvas.Font.Style := Printer.Canvas.Font.Style + [TFontStyle.fsBold];
  Printer.Canvas.Font.Size := IfThen(gVariableGlobal.TAMANO_FUENTE < 6, 8, gVariableGlobal.TAMANO_FUENTE);
  Printer.Canvas.Font.Name := IfThen(Vacio(gVariableGlobal.NOMBRE_FUENTE), 'Courier New', Trim(gVariableGlobal.NOMBRE_FUENTE));
End;

Function UtFast_Print_Resumir_Receta(Const pTable : Integer) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(pTable).Name);
    lSQL.SQL.Add(' WHERE ID_RECETA = ' + QuotedStr('A') + ' OR ID_RECETA = ' + QuotedStr('E'));
    lSQL.Active := True;
    Result := lSQL.Active And (lSQL.RecordCount > 0);
    lSQL.Active := False;
    lSQL.DisposeOf;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(['Origen', 'UtFast_Print_Resumir_Receta', 'Error', E.Message]);
  End;
End;

Function Imprimir_Factura_Fast_Print(pEnc, pDet, pRes : Integer; pTipo_Documento, pDatakey : String) : Boolean;
Var
  lI : Integer;
  ltmp : String;
  lNext : String;
  lMaster : TQuery;
  lDetail : TQuery;
  lReceta : TQuery;
  lPrefijo : String;
  lObservacion : String;
Begin
   Result := False;
  If Printer.PrinterIndex <= -1 Then
  Begin
    Mensajes('No hay impresora seleccionada');
    Exit;
  End;
  Try
    lMaster := TQuery.Create(Nil);
    lReceta := TQuery.Create(Nil);
    lMaster.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(pEnc).Name + ' ');
    lMaster.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY'       ) + ' = ' + QuotedStr(Trim(pDatakey       )) + ' ');
    lMaster.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento)) + ' ');
    lMaster.Connection := gVariableGlobal.CNX;
    lReceta.Connection := gVariableGlobal.CNX;
    lMaster.Active := True;
    If lMaster.Active And (lMaster.RecordCount > 0) Then
    Begin
      FillChar(gControl_Print, SizeOf(gControl_Print), #0);
      Printer.BeginDoc;
      Printer.Canvas.Font.Style := Printer.Canvas.Font.Style + [TFontStyle.fsBold];
      Cargar_Configuracion(gControl_Print.Cols);
      Imprimir_Texto(gVariableGlobal.NOMBRE_EMPRESA      , True);
      Imprimir_Texto(gVariableGlobal.ID_EMPRESA          , True);
      Imprimir_Texto(gVariableGlobal.DIRECCION_EMPRESA   , True);
      Imprimir_Texto(gVariableGlobal.TELEFONO_EMPRESA    , True);
      Imprimir_Texto(gVariableGlobal.MUNICIPIO_EMPRESA   , True);
      Imprimir_Texto(gVariableGlobal.DEPARTAMENTO_EMPRESA, True);
      Imprimir_Texto(gVariableGlobal.PAIS_EMPRESA        , True);
      If gVariableGlobal.ENCABEZADO.Count > 0 Then
      Begin
        For lI := 0 To gVariableGlobal.ENCABEZADO.Count-1 Do
        Begin
          Imprimir_Texto(gVariableGlobal.ENCABEZADO[lI], True);
        End;
//        Imprimir_Texto(StringOfChar('-', gControl_Print.Cols));
      End;
      If (pTipo_Documento = Const_Documento_Pedido) Or (pTipo_Documento = Const_Documento_Compra) Then
        lPrefijo := 'COMPRA No:'
      Else
        lPrefijo := 'FACTURA No:';
      If (pTipo_Documento = Const_Documento_Pedido) Or (pTipo_Documento = Const_Documento_Compra) Then
      Begin
        If Not Vacio(gVariableGlobal.DOCUMENTO_COMPRA) Then
          lPrefijo := gVariableGlobal.DOCUMENTO_COMPRA;
      End
      Else
      Begin
        If Not Vacio(gVariableGlobal.DOCUMENTO_FACTURA) Then
          lPrefijo := gVariableGlobal.DOCUMENTO_FACTURA;
      End;

      Imprimir_Linea(StringOfChar('-', gControl_Print.Cols));
      Imprimir_Linea(' ' + Trim(lPrefijo) + ' ' + lMaster.FieldByName('NUMERO_DOCUMENTO').AsString);

      Imprimir_Linea('Fecha: ' + lMaster.FieldByName('FECHA').AsString + ', Hora: ' + lMaster.FieldByName('HORA').AsString);
      Imprimir_Linea(StringOfChar('-', gControl_Print.Cols));

      ltmp := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [lMaster.FieldByName('CODIGO_TERCERO').AsString], ['NOMBRE'], 'UtFast_Print, Imprimir_Factura_Fast_Print');
      Imprimir_Linea('Cliente: ' + ltmp);

      ltmp := Trim(lMaster.FieldByName('CODIGO_TERCERO').AsString);
      Imprimir_Linea('N.I.T.: ' + ltmp);

      ltmp := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [lMaster.FieldByName('CODIGO_USUARIO').AsString], ['NOMBRE'], 'UtFast_Print, Imprimir_Factura_Fast_Print');
      Imprimir_Linea('Cajero: ' + ltmp);

      ltmp := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [lMaster.FieldByName('CODIGO_VENDEDOR').AsString], ['NOMBRE'], 'UtFast_Print, Imprimir_Factura_Fast_Print');
      Imprimir_Linea('Vendedor: ' + ltmp);

      If Not Vacio(lMaster.FieldByName('CODIGO_ESPACIO').AsString) Then
      Begin
        ltmp := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Espacio).Name, ['CODIGO_ESPACIO'], [lMaster.FieldByName('CODIGO_ESPACIO').AsString], ['CODIGO_ZONA'], 'UtFast_Print, Imprimir_Factura_Fast_Print');
        ltmp := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Zona).Name, ['CODIGO_ZONA'], [ltmp], ['NOMBRE'], 'UtFast_Print, Imprimir_Factura_Fast_Print');
        Imprimir_Linea('Zona: ' + ltmp);

        ltmp := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Espacio).Name, ['CODIGO_ESPACIO'], [lMaster.FieldByName('CODIGO_ESPACIO').AsString], ['NOMBRE'], 'UtFast_Print, Imprimir_Factura_Fast_Print');
        Imprimir_Linea('Mesa: ' + ltmp);
      End;

      Imprimir_Linea(StringOfChar('-', gControl_Print.Cols));
      Imprimir_Linea('PRODUCTO                CANT.      VALOR');
      Imprimir_Linea(StringOfChar('-', gControl_Print.Cols));
      lDetail := TQuery.Create(Nil);
      lDetail.SQL.Add('SELECT * FROM ' + Retornar_Info_Tabla(pDet).Name + ' ');
      lDetail.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY'       ) + ' = ' + QuotedStr(Trim(pDatakey       )) + ' ');
      lDetail.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento)) + ' ');
      LDetail.Connection := gVariableGlobal.CNX;
      lDetail.Active := True;
      If lDetail.Active And (lDetail.RecordCount > 0) Then
      Begin
        lDetail.First;
        While Not lDetail.Eof Do
        Begin
          ltmp := Copy(lDetail.FieldByName('NOMBRE').AsString + StringOfChar(' ', 22), 01, 22) + ' ' +
                  Justificar(FormatFloat(    '##0.00', lDetail.FieldByName('CANTIDAD'   ).AsFloat), ' ', 06) + ' ' +
                  Justificar(FormatFloat('###,##0.00', lDetail.FieldByName('VALOR_TOTAL').AsFloat), ' ', 10);
          Imprimir_Linea(ltmp);
          If gVariableGlobal.ID_COMANDA_FACTURA = 'S' Then
          Begin
            lReceta.Active := False;
            lReceta.SQL.Clear;
            lReceta.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(pRes).Name + ' ');
            lReceta.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY'        ) + ' = ' + QuotedStr(Trim(lDetail.FieldByName('DATAKEY'        ).AsString)) + ' ');
            lReceta.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('CONSECUTIVO'    ) + ' = ' + QuotedStr(Trim(lDetail.FieldByName('CONSECUTIVO'    ).AsString)) + ' ');
            lReceta.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('CODIGO_PRODUCTO') + ' = ' + QuotedStr(Trim(lDetail.FieldByName('CODIGO_PRODUCTO').AsString)) + ' ');
            If UtFast_Print_Resumir_Receta(pRes) Then
               lReceta.SQL.Add(' AND ID_RECETA = ' + QuotedStr('A') + ' OR ID_RECETA = ' + QuotedStr('E'));
            lReceta.Active := True;
            While Not lReceta.Eof Do
            Begin
              ltmp := '   ' +
                      Copy(lReceta.FieldByName('NOMBRE').AsString + StringOfChar(' ', 22), 01, 22) + ' ' +
                      Justificar(FormatFloat('##0.00', lReceta.FieldByName('CANTIDAD').AsFloat), ' ', 06);
              Imprimir_Linea(ltmp);
              lReceta.Next;
            End;
            lReceta.Active := False;
          End;
          If (gVariableGlobal.ID_CAMPO_DETALLE = 'S') And (Not Vacio(lDetail.FieldByName('OBSERVACION').AsString)) Then
          Begin
            lObservacion := Trim(lDetail.FieldByName('OBSERVACION').AsString);
            While Not Vacio(lObservacion) Do
            Begin
              ltmp := '   ' + Copy(Copy(lObservacion, 1, 28) + StringOfChar(' ', 28), 01, 28) + ' ';
              Imprimir_Linea(ltmp);
              Delete(lObservacion, 1, 28);
            End;
          End;
          lDetail.Next;
        End;
      End;
      lDetail.Active := False;
      lDetail.Free;
      Imprimir_Linea(StringOfChar('-', gControl_Print.Cols));

//      Imprimir_Totales(pTexto : String; pValue : Double);
      Imprimir_Totales('I.V.A.'               , lMaster.FieldByName('VALOR_IVA'       ).AsFloat);
      Imprimir_Totales('RETEIVA'              , lMaster.FieldByName('VALOR_RETEIVA'   ).AsFloat);
      Imprimir_Totales('RETEFUENTE'           , lMaster.FieldByName('VALOR_RETEFUENTE').AsFloat);
      Imprimir_Totales('I.C.A.'               , lMaster.FieldByName('VALOR_ICA'       ).AsFloat);
      Imprimir_Totales('IMP. CONSUMO'         , lMaster.FieldByName('VALOR_IMPCONSUMO').AsFloat);
      Imprimir_Totales('DESCUENTO'            , lMaster.FieldByName('VALOR_DESCUENTO' ).AsFloat);
      Imprimir_Totales('SERVICIO'             , lMaster.FieldByName('VALOR_SERVICIO'  ).AsFloat);
      Imprimir_Totales('CREE'                 , lMaster.FieldByName('VALOR_CREE'      ).AsFloat);
      Imprimir_Totales('TOTAL'                , lMaster.FieldByName('VALOR_TOTAL'     ).AsFloat);
      Imprimir_Totales('VALOR T.R.M.'         , lMaster.FieldByName('VALOR_TRM'       ).AsFloat);
      Imprimir_Totales('TOTAL T.R.M.'         , lMaster.FieldByName('TOTAL_TRM'       ).AsFloat);
      Imprimir_Totales('VALOR DIVIDIDO'       , lMaster.FieldByName('VALOR_DIVIDIDO'  ).AsFloat);
      Imprimir_Totales('EFECTIVO'             , lMaster.FieldByName('EFE'             ).AsFloat);
      Imprimir_Totales('EFECTIVO T.R.M.'      , lMaster.FieldByName('EFE_TRM'         ).AsFloat);
      Imprimir_Totales('TARJETA DEBITO.'      , lMaster.FieldByName('TDD'             ).AsFloat);
      Imprimir_Totales('TARJETA DEBITO T.R.M.', lMaster.FieldByName('TDD_TRM'         ).AsFloat);
      Imprimir_Totales('TAJETA CREDITO'       , lMaster.FieldByName('TDC'             ).AsFloat);
      Imprimir_Totales('TAJETA CREDITO T.R.M.', lMaster.FieldByName('TDC_TRM'         ).AsFloat);
      Imprimir_Totales('CHEQUE.'              , lMaster.FieldByName('CHE'             ).AsFloat);
      Imprimir_Totales('CHEQUE T.R.M.'        , lMaster.FieldByName('CHE_TRM'         ).AsFloat);
      Imprimir_Totales('SODEXO'               , lMaster.FieldByName('SDX'             ).AsFloat);
      Imprimir_Totales('SODEXO T.R.M.'        , lMaster.FieldByName('SDX_TRM'         ).AsFloat);
      Imprimir_Totales('CORTESIA'             , lMaster.FieldByName('COR'             ).AsFloat);
      Imprimir_Totales('CORTESIA T.R.M.'      , lMaster.FieldByName('COR_TRM'         ).AsFloat);
      Imprimir_Totales('CARTERA'              , lMaster.FieldByName('CAR'             ).AsFloat);
      Imprimir_Totales('CARTERA T.R.M.'       , lMaster.FieldByName('CAR_TRM'         ).AsFloat);
      If (lMaster.FieldByName('VALOR_PAGADO').AsFloat + lMaster.FieldByName('VALOR_VUELTO').AsFloat) > 0 Then
      Begin
        Imprimir_Linea(StringOfChar('-', gControl_Print.Cols));
        Imprimir_Totales('VALOR PAGADO'         , lMaster.FieldByName('VALOR_PAGADO'    ).AsFloat);
        Imprimir_Totales('VALOR VUELTO'         , lMaster.FieldByName('VALOR_VUELTO'    ).AsFloat);
        Imprimir_Linea(StringOfChar('-', gControl_Print.Cols));
      End;

      If gVariableGlobal.PIE_PAGINA.Count > 0 Then
      Begin
        For lI := 0 To gVariableGlobal.PIE_PAGINA.Count-1 Do
        Begin
          Imprimir_Texto(gVariableGlobal.PIE_PAGINA[lI], True);
        End;
      End;
//      Imprimir_Linea('Licenciado a ' + Trim(gNOMBRE_EMPRESA));
      For lI := 1 To 5 Do
        Imprimir_Linea(' ');
      Imprimir_Linea(Chr(27) + Chr(112) + Chr(0) + Chr(10) + Chr(100));
      Printer.EndDoc;
      Result := True;
    End;
    lReceta.Active := False;
    lReceta.Free;
    lMaster.Active := False;
    lMaster.Free;
  Except
   On E:Exception Do
     gVariableGlobal.Add_Log(['Origen', 'UtFast_Print, Imprimir_Factura_Fast_Print', 'Error', E.Message]);
  End;
End;



Function Imprimir_La_Z_Fast_Print(pTabla : String) : Boolean;
Var
  ltmp : String;
  lMaster : TQuery;
  lCantidad : Double;
  lPorcentaje : Double;
Begin
  Try
    lMaster := TQuery.Create(Nil);
    lMaster.SQL.Add(' SELECT * FROM ' + pTabla + ' ');
    lMaster.SQL.Add(' ORDER BY PORCENTAJE DESC ');
    lMaster.Connection := gVariableGlobal.CNX;
    lMaster.Active := True;
    If lMaster.Active And (lMaster.RecordCount > 0) Then
    Begin
      lCantidad := 0;
      lPorcentaje := 0;
      FillChar(gControl_Print, SizeOf(gControl_Print), #0);
      Printer.BeginDoc;
      Printer.Canvas.Font.Style := Printer.Canvas.Font.Style + [TFontStyle.fsBold];
      Cargar_Configuracion(gControl_Print.Cols);
      lMaster.First;
      Imprimir_Linea(StringOfChar('-', gControl_Print.Cols));
      Imprimir_Linea('DESCRIPCION                 CANT.    %');
      Imprimir_Linea(StringOfChar('-', gControl_Print.Cols));
      While Not lMaster.Eof Do
      Begin
        lCantidad := lCantidad + lMaster.FieldByName('CANTIDAD'  ).AsFloat;
        lPorcentaje := lPorcentaje + lMaster.FieldByName('PORCENTAJE').AsFloat;
        ltmp := Copy(lMaster.FieldByName('DESCRIPCION').AsString + StringOfChar(' ', 24), 01, 24) + ' ' +
                Justificar(FormatFloat('#,##0.00', lMaster.FieldByName('CANTIDAD'  ).AsFloat), ' ', 08) + ' ' +
                Justificar(FormatFloat(  '##0.00', lMaster.FieldByName('PORCENTAJE').AsFloat), ' ', 06);
        Imprimir_Linea(ltmp);
        lMaster.Next;
      End;
      Imprimir_Linea(StringOfChar('-', gControl_Print.Cols));
      ltmp := Copy('TOTAL' + StringOfChar(' ', 24), 01, 24) + ' ' +
              Justificar(FormatFloat('#,##0.00', lCantidad  ), ' ', 08) + ' ' +
              Justificar(FormatFloat(  '##0.00', lPorcentaje), ' ', 06);
      Imprimir_Linea(ltmp);
      Printer.EndDoc;
    End;
    lMaster.Active := False;
    lMaster.Free;
  Except
    On E:Exception Do
      gVariableGlobal.Add_Log(['Origen', 'UtFast_Print, Imprimir_La_Z_Fast_Print', 'Error', E.Message]);
  End;
End;

Function Imprimir_Resumen_Fast_Print(Const pFecha, pUsername : String) : Boolean;
Var
  lI : Integer;
  lData : TStringList;
  lMaster : TQuery;
Begin
  If Printer.PrinterIndex <= -1 Then
  Begin
    Mensajes('No hay impresora seleccionada');
    Exit;
  End;
  Try
    lMaster := TQuery.Create(Nil);
    lMaster.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Caja).Name + ' ');
    lMaster.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(gVariableGlobal.USUARIO_ACTUAL)) );
    lMaster.SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence('FECHA') + ' = ' + QuotedStr(Trim(pFecha)));
    lMaster.Connection := gVariableGlobal.CNX;
    lMaster.Active := True;
    If lMaster.Active And (lMaster.RecordCount > 0) Then
    Begin
      lMaster.First;
      lData := TStringList.Create;
      lData.Text := lMaster.FieldByName('DETALLE').AsString;
      FillChar(gControl_Print, SizeOf(gControl_Print), #0);
      Printer.BeginDoc;
      Printer.Canvas.Font.Style := Printer.Canvas.Font.Style + [TFontStyle.fsBold];
      Cargar_Configuracion(gControl_Print.Cols);
      For lI := 0 To lData.Count-1 Do
      Begin
        Imprimir_Linea(lData[lI]);
      End;
      For lI := 1 To 3 Do
        Imprimir_Linea(' ');
      Printer.EndDoc;
      lData.Clear;
      lData.DisposeOf;
    End;
    lMaster.Active := False;
    lMaster.Free;
  Except
    On E:Exception Do
       gVariableGlobal.Add_Log(['Origen', 'UtFast_Print, Imprimir_Resumen_Fast_Print', 'Error', E.Message]);
  End;
End;

Function Imprimir_Comanda_Detallada_Fast_Print(Const pTable : Integer; Const pTipo_Documento, pDatakey, pConsecutivo : String) : Boolean;
Var
  lI : Integer;
  lData : TStringList;
  lMaster : TQuery;
Begin
  If Printer.PrinterIndex <= -1 Then
  Begin
    Mensajes('No hay impresora seleccionada');
    Exit;
  End;
  Try
    lMaster := TQuery.Create(Nil);
    lMaster.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(pTable).Name + ' ');
    lMaster.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakey)) + ' ');
    If Not Vacio(pTipo_Documento) Then
      lMaster.SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento)));
    If Not Vacio(pConsecutivo) Then
      lMaster.SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence('CONSECUTIVO') + ' = ' + QuotedStr(Trim(pConsecutivo)));
    lMaster.Connection := gVariableGlobal.CNX;
    lMaster.Active := True;
    If lMaster.Active And (lMaster.RecordCount > 0) Then
    Begin
      lMaster.First;
      lData := TStringList.Create;
      lData.Text := lMaster.FieldByName('INFO_COMANDA').AsString;
      FillChar(gControl_Print, SizeOf(gControl_Print), #0);
      Printer.BeginDoc;
      Cargar_Configuracion(gControl_Print.Cols);
//    Printer.Canvas.Font.Size := 9;
      For lI := 0 To lData.Count-1 Do
      Begin
        Imprimir_Linea(lData[lI]);
      End;
      For lI := 1 To 3 Do
        Imprimir_Linea(' ');
      Printer.EndDoc;
      lData.Clear;
      lData.DisposeOf;
//      Cortar_Papel_Impresora;
    End;
    lMaster.Active := False;
    lMaster.Free;
  Except
    On E:Exception Do
       gVariableGlobal.Add_Log(['Origen', 'Imprimir_Comanda_Detallada_Fast_Print', 'Error', E.Message]);
  End;
End;

Function Imprimir_Comanda_Resumida_Fast_Print(Const pTable : Integer; Const pTipo_Documento, pDatakey : String) : Boolean;
Var
  lI : Integer;
  lData : TStringList;
  lMaster : TQuery;
Begin
  If Printer.PrinterIndex <= -1 Then
  Begin
    Mensajes('No hay impresora seleccionada');
    Exit;
  End;
  Try
    lMaster := TQuery.Create(Nil);
    lMaster.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(pTable).Name + ' ');
    lMaster.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakey)) + ' ');
    If Not Vacio(pTipo_Documento) Then
      lMaster.SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento)));
    lMaster.Connection := gVariableGlobal.CNX;
    lMaster.Active := True;
    If lMaster.Active And (lMaster.RecordCount > 0) Then
    Begin
      lMaster.First;
      lData := TStringList.Create;
      lData.Text := lMaster.FieldByName('INFO_COMANDA').AsString;
      FillChar(gControl_Print, SizeOf(gControl_Print), #0);
      Printer.BeginDoc;
      Cargar_Configuracion(gControl_Print.Cols);
      For lI := 0 To lData.Count-1 Do
      Begin
        Imprimir_Linea(lData[lI]);
        Result := True;
      End;
      Printer.EndDoc;
      lData.Clear;
      lData.DisposeOf;
//      Cortar_Papel_Impresora;
    End;
    lMaster.Active := False;
    lMaster.Free;
  Except
    On E:Exception Do
       gVariableGlobal.Add_Log(['Origen', 'Imprimir_Comanda_Resumida_Fast_Print', 'Error', E.Message]);
  End;
End;

end.
