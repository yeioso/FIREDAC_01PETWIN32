unit UtCartera;

interface

Function Actualizar_Estado_Cartera : Boolean;
Function Actualizar_Cartera(pTipo_Documento, pDatakey : String) : Boolean;

implementation

Uses
  DB,
  Math,
  UtConexion,
  UtFecha,
  SysUtils,
  UtConexion,
  UtException,
  UtConstantes,
  UtInfoTablas,
  UtHomologacion,
  UtVariablesGlobales;

Function Retornar_Valor_Total_Cartera(pTipo_Documento, pNumero_Documento : String; Var pValor_Total : Double) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  pValor_Total := 0;
  Try
    lSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT SUM(VALOR_TOTAL) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Det).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + Trim_Sentence('TIPO_REFERENCIA'  ) + ' = ' + QuotedStr(pTipo_Documento  ));
    lSQL.SQL.Add(' AND '   + Trim_Sentence('NUMERO_REFERENCIA') + ' = ' + QuotedStr(pNumero_Documento));
    lSQL.Active := True;
    If lSQL.Active Then
    Begin
      pValor_Total := lSQL.FieldByName('RESULTADO').AsFloat;
      Result := True;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'UtCartera, Retornar_Valor_Total_Cartera', '');
  End;
End;

Function Actualizar_Valor_Total_Cartera(pTipo_Documento, pNumero_Documento : String; pValor_Total : Double) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + Trim_Sentence('TIPO_DOCUMENTO'  ) + ' = ' + QuotedStr(pTipo_Documento  ));
    lSQL.SQL.Add(' AND '   + Trim_Sentence('NUMERO_DOCUMENTO') + ' = ' + QuotedStr(pNumero_Documento));
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.Edit;
      lSQL.FieldByName('CAR_PAGADA').AsFloat := pValor_Total;
      lSQL.Post;
      Result := True;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'UtCartera, Actualizar_Valor_Total_Cartera', '');
  End;
End;

Function Actualizar_Estado_Cartera : Boolean;
Var
  lSQL : TQuery;
  lFechaIni : TFecha_Info;
  lFechaFin : TFecha_Info;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' ');
    lSQL.SQL.Add(' WHERE (CAR - CAR_PAGADA) > 0 ');
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.First;
      While (Not lSQL.Eof) Do
      Begin
        lSQL.Edit;
        lFechaIni := Return_Type_Year_Month_Day(lSQL.FieldByName('CAR_FECHAINI').AsString);
        lFechaFin := Return_Type_Year_Month_Day(lSQL.FieldByName('CAR_FECHAFIN').AsString);
        lSQL.FieldByName('CAR_ESTADO_CARTERA').AsString := 'POR VENCER';
        If (lFechaFin.DateTime - lFechaIni.DateTime) > lSQL.FieldByName('CAR_PLAZO').AsFloat Then
        Begin
          lSQL.FieldByName('CAR_ESTADO_CARTERA').AsString := 'VENCIDO';
          lSQL.FieldByName('CAR_DIAS_VENCIDOS').AsFloat := (lFechaFin.DateTime - lFechaIni.DateTime) - lSQL.FieldByName('CAR_PLAZO').AsFloat;
          Case ROUND(lSQL.FieldByName('CAR_DIAS_VENCIDOS').AsFloat) Of
            000..030 : lSQL.FieldByName('CAR_EDAD').AsString := '000 - 030';
            031..060 : lSQL.FieldByName('CAR_EDAD').AsString := '031 - 060';
            061..090 : lSQL.FieldByName('CAR_EDAD').AsString := '061 - 090';
            091..120 : lSQL.FieldByName('CAR_EDAD').AsString := '091 - 120';
            121..150 : lSQL.FieldByName('CAR_EDAD').AsString := '121 - 150';
            151..180 : lSQL.FieldByName('CAR_EDAD').AsString := '151 - 180';
            181..210 : lSQL.FieldByName('CAR_EDAD').AsString := '181 - 210';
            211..240 : lSQL.FieldByName('CAR_EDAD').AsString := '211 - 240';
            241..270 : lSQL.FieldByName('CAR_EDAD').AsString := '241 - 270';
            271..300 : lSQL.FieldByName('CAR_EDAD').AsString := '271 - 300';
            301..330 : lSQL.FieldByName('CAR_EDAD').AsString := '301 - 330';
            331..360 : lSQL.FieldByName('CAR_EDAD').AsString := '331 - 360';
            Else lSQL.FieldByName('CAR_EDAD').AsString := '361 - 999';
          End;
          lSQL.Post;
        End;
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'UtCartera, Actualizar_Estado_Cartera', '');
  End;
End;

Function Actualizar_Cartera(pTipo_Documento, pDatakey : String) : Boolean;
Var
  lSQL : TQuery;
  lValor_Total : DOuble;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + Trim_Sentence('DATAKEY'       ) + ' = ' + QuotedStr(Trim(pDatakey  )));
    lSQL.SQL.Add(' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(pTipo_Documento));
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.First;
      Result := True;
      While (Not lSQL.Eof) And Result Do
      Begin
        Result := Retornar_Valor_Total_Cartera(lSQL.FieldByName('TIPO_REFERENCIA').AsString, lSQL.FieldByName('NUMERO_REFERENCIA').AsString, lValor_Total);
        If Result Then
          Result := Actualizar_Valor_Total_Cartera(lSQL.FieldByName('TIPO_REFERENCIA').AsString, lSQL.FieldByName('NUMERO_REFERENCIA').AsString, lValor_Total);
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    lSQL.Free;
    If Result Then
      Actualizar_Estado_Cartera;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'UtCartera, Actualizar_Cartera', '');
  End;
End;

end.
