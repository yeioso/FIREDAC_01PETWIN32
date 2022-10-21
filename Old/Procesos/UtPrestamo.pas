unit UtPrestamo;

interface

Function Retornar_Valor_Pago_Periodo(pTasa, pPeriodos, pCapital : Double) : Double;
Function Generar_Cuotas(pCodigo_Prestamo, pNombre_Prestamo : String; pForced : Boolean) : Boolean;

implementation
Uses
  Math,
  UtConexion,
  UtFecha,
  SysUtils,
  DateUtils,
  
  UtConexion,
  UtException,
  UtInfoTablas,
  Generics.Collections;

Type
  TData = Class
    Fecha      : TDateTime;
    Credito    : Double   ;
    Cuota      : Double   ;
    Interes    : Double   ;
    Capital    : Double   ;
    Saldo      : Double   ;
    Dias_Mora  : Double   ;
    Valor_Mora : Double   ;
  End;
  TResult_TData = TList<TData>;

Function Retornar_Intereses(pBase, pPorcentaje : Double) : Double;
Begin
  Result := pBase * pPorcentaje / 100;
End;

Function Retornar_Valor_Pago_Periodo(pTasa, pPeriodos, pCapital : Double) : Double;
Begin
  Result := 0;
  If ((Power((1+(pTasa/100)), pPeriodos))-1) <> 0 Then
    Result := ((pTasa/100)*Power((1+(pTasa/100)),pPeriodos))*pCapital/((Power((1+(pTasa/100)), pPeriodos))-1);
End;

Function Retornar_Tasa_Nominal(pTasa, pPeriodos : Double) : Double;
Begin
  Result := Power((1 + (pTasa/pPeriodos)), pPeriodos) - 1;
End;

Function Retornar_Valor_Capital(pValor_Cuota, pValor_Intereses : Double) : Double;
Begin
  Result := pValor_Cuota - pValor_Intereses;
End;

Function Retornar_Valor_Saldo(pSaldo_Anterior, pValor_Cuota : Double) : Double;
Begin
  Result := pSaldo_Anterior - pValor_Cuota;
End;

Function Retornar_Dias_Mora(pFechaFin, pFechaIni : TDate) : Double;
Begin
  Result := pFechaFin - pFechaIni;
End;

Function Retornar_Tasa(pPeriodo : String) : Double;
Begin
  Result := (0.00033); //?
End;

Function Retornar_Valor_Interes_Mora(pPeriodo : String; pValor_Capital, pDias_Mora : Double) : Double;
Begin
  Result := (pValor_Capital * pDias_Mora) * Retornar_Tasa(pPeriodo);
End;

Function Generar_Cuotas_Prestamos(pYear, pMonth, pDay : Word; pPeriodo : AnsiChar; pValor_Saldo, pValor_Cuota, pTasa : Double) : TResult_TData;
Var
  lI : Integer;
  lDay : Word;
  lFin : Boolean;
  lYear : Word;
  lMonth : Word;
  lData : TData;
  lFrac : Double;
  lFecha : TDateTime;
  lValor_Cuota : Double;
  lValor_Saldo : Double;
Begin
  Result := TResult_TData.Create;
  lFin := False;
  lFecha := EncodeDate(pYear, pMonth, pDay);
  lValor_Cuota := pValor_Cuota;
  lValor_Saldo := pValor_Saldo;
  While (lValor_Saldo > 0) And (Not lFin) Do
  Begin
    Case pPeriodo Of
      'Q' : Begin
              DecodeDate(lFecha, lYear, lMonth, lDay);
              If lDay <= 15 Then
                lDay := 15
              Else
                If lDay <= 30 Then
                  lDay := 30;
              If lMonth = 2 Then
                lDay := MonthDays[IsLeapYear(lYear)][lMonth];
              lFecha := EncodeDate(lYear, lMonth, lDay);
            End;
      'M' : Begin
              DecodeDate(lFecha, lYear, lMonth, lDay);
              lDay := 30;
              If lMonth = 2 Then
                lDay := MonthDays[IsLeapYear(lYear)][lMonth];
              lFecha := EncodeDate(lYear, lMonth, lDay);
            End;
      'A' : Begin
              DecodeDate(lFecha, lYear, lMonth, lDay);
              lDay := 30;
              If lMonth = 2 Then
                lDay := MonthDays[IsLeapYear(lYear)][lMonth];
              lFecha := EncodeDate(lYear, lMonth, lDay);
            End;
    End;
    lData := TData.Create;
    lData.Credito := lValor_Saldo;
    lData.Fecha   := lFecha;
    If lValor_Saldo <= lValor_Cuota Then
    Begin
      lData.Interes := RoundTo(lData.Credito * (pTasa/100), 0);
      lData.Cuota   := lData.Credito - lData.Interes;
      lData.Capital := lData.Cuota - lData.Interes;
      lData.Saldo   := 0;
    End
    Else
    Begin
      lData.Cuota   := lValor_Cuota;
      lData.Interes := RoundTo(lData.Credito * (pTasa/100), 0);
      lData.Capital := lData.Cuota - lData.Interes;
      lData.Saldo   := RoundTo(lData.Credito - lData.Capital, 0);
    End;
    lValor_Saldo  := lData.Saldo;
    Result.Add(lData);
    Case pPeriodo Of
      'Q' : lFecha := lFecha + 015;
      'M' : lFecha := lFecha + 030;
      'A' : lFecha := lFecha + 360;
    End;
  End;
  lFecha := EncodeDate(2015, 04, 14);
  For lI := 0 To Result.Count-1 Do
  Begin
//    TData(Result[lI]).Dias_Mora := TData(Result[Result.Count-1]).Fecha - TData(Result[lI]).Fecha;
    If lFecha >= Result[lI].Fecha Then
    Begin
      Result[lI].Dias_Mora := lFecha - Result[lI].Fecha;
      Result[lI].Valor_Mora := RoundTo(Result[lI].Dias_Mora * Result[lI].Capital * Retornar_Tasa(FormatDateTime('YYYY-MM', Result[lI].Fecha)), 0);
    End;
  End;
End;

Function Guardar_Cuotas(pCodigo_Prestamo, pNombre_Prestamo : String; pLista : TResult_TData) : Boolean;
Var
  lI : Integer;
  lSQL : TQuery;
Begin
  Result := True;
  Try
    lSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Prestamo_Det).Name);
    lSQL.SQL.Add(' WHERE CODIGO_PRESTAMO = ' + #39 + pCodigo_Prestamo + #39);
    lSQL.Active := True ;
    If lSQL.Active And (lSQL.RecordCount <= 0) Then
    Begin
      For lI := 0 To pLista.Count-1 Do
      Begin
        lSQL.Append;
        lSQL.FieldByName('CODIGO_PRESTAMO').AsString := pCodigo_Prestamo;
        lSQL.FieldByName('NOMBRE'         ).AsString := pNombre_Prestamo;
        lSQL.FieldByName('ID_DEDUCIDO'    ).AsString := 'N';
        lSQL.FieldByName('FECHA'          ).AsString := FormatDateTime('YYYY-MM-DD', pLista[lI].Fecha);
        lSQL.FieldByName('VALOR_CREDITO'  ).AsFloat  := pLista[lI].Credito;
        lSQL.FieldByName('VALOR_CUOTA'    ).AsFloat  := pLista[lI].Cuota;
        lSQL.FieldByName('VALOR_INTERES'  ).AsFloat  := pLista[lI].Interes;
        lSQL.FieldByName('VALOR_CAPITAL'  ).AsFloat  := pLista[lI].Capital;
        lSQL.FieldByName('SALDO'          ).AsFloat  := pLista[lI].Saldo;
        lSQL.FieldByName('DIAS_MORA'      ).AsFloat  := pLista[lI].Dias_Mora;
        lSQL.FieldByName('VALOR_MORA'     ).AsFloat  := pLista[lI].Valor_Mora;
        lSQL.Post;
      End;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
    On E: Exception Do
    Begin
      Result := False;
      Ingresar_Inconsistencias(E, '', 'UtPrestamo, Generar_Cuotas');
    End;
  End;
End;

Function Forzar_Generacion_Detalles(pCodigo_Prestamo : String) :  Boolean;
Var
  ltmp : String;
Begin
  ltmp := ' SELECT COUNT(*) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Prestamo_Det).Name +
          ' WHERE CODIGO_PRESTAMO = ' + #39 + pCodigo_Prestamo + #39 +
          ' AND ID_DEDUCIDO  = ' + #39 + 'S' + #39;
  If (Execute_SQL_Double(ltmp, 'RESULTADO', 'UtPrestamo, Generar_Cuotas') <= 0) Then

End;

Function Generar_Cuotas(pCodigo_Prestamo, pNombre_Prestamo : String; pForced : Boolean) : Boolean;
Var
  ltmp : String;
  lSQL : TQuery;
  lTasa : Double;
  lFecha : TFecha_Info;
  lPeriodo : AnsiChar;
  lValor_Cuota : Double;
  lValor_Saldo : Double;
  lResult_TData : TResult_TData;
Begin
  Result := True;
  ltmp := ' SELECT COUNT(*) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Prestamo_Det).Name +
          ' WHERE CODIGO_PRESTAMO = ' + #39 + pCodigo_Prestamo + #39;
  If pForced Then
     pForced := Forzar_Generacion_Detalles(pCodigo_Prestamo);
  If (Execute_SQL_Double(ltmp, 'RESULTADO', 'UtPrestamo, Generar_Cuotas') <= 0) Or pForced Then
  Begin
    Try
      ltmp := ' DELETE FROM ' + Retornar_Info_Tabla(Id_Prestamo_Det).Name +
              ' WHERE CODIGO_PRESTAMO = ' + #39 + pCodigo_Prestamo + #39;
      If pForced Then
        Execute_Sentence_SQL(ltmp, 'UtPrestamo, Generar_Cuotas');
      lSQL := TQuery.Create(Nil);
      Configurar_Conexion_Segura(lSQL);
      lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Prestamo_Enc).Name);
      lSQL.SQL.Add(' WHERE CODIGO_PRESTAMO = ' + #39 + pCodigo_Prestamo + #39);
      lSQL.Active := True ;
      If lSQL.Active And (lSQL.RecordCount > 0) Then
      Begin
        lFecha := Return_Type_Year_Month_Day(lSQL.FieldByName('FECHA_DEDUCCION_INI').AsString);
        lPeriodo := AnsiChar((lSQL.FieldByName('PERIODO_CUOTA').AsString + ' ')[1]);
        lTasa := 0;
        lValor_Cuota := 0;
        lValor_Saldo := lSQL.FieldByName('SALDO_CREDITO').AsFloat;
        Case lPeriodo Of
          'Q' : Begin
                  lTasa := lSQL.FieldByName('INTERES_Q').AsFloat;
                  lValor_Cuota := lSQL.FieldByName('PAGO_Q').AsFloat;
                End;
          'M' : Begin
                  lTasa := lSQL.FieldByName('INTERES_M').AsFloat;
                  lValor_Cuota := lSQL.FieldByName('PAGO_M').AsFloat;
                End;
          'A' : Begin
                  lTasa := lSQL.FieldByName('INTERES_A').AsFloat;
                  lValor_Cuota := lSQL.FieldByName('PAGO_A').AsFloat;
                End;
        End;
        lResult_TData := Generar_Cuotas_Prestamos(lFecha.IntYear, lFecha.IntMonth, lFecha.IntDay, lPeriodo, lValor_Saldo, lValor_Cuota, lTasa);
        Result := Guardar_Cuotas(pCodigo_Prestamo, pNombre_Prestamo, lResult_TData);
      End;
      lSQL.Active := False;
      lSQL.Free;
    Except
      On E: Exception Do
      Begin
        Result := False;
        Ingresar_Inconsistencias(E, '', 'UtPrestamo, Generar_Cuotas');
      End;
    End;
  End;
End;

end.
