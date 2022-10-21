unit UtLiquidador;

interface
Function Generar_Liquidacion : Boolean;

implementation

Uses
  UtConexion,
  UtHora,
  UtFecha,
  UtConexion,
  
  UtException,
  UtFunciones,
  UtInfoTablas,
  YLiquidacion,
  UtHomologacion,
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  UtLiquidador_Type,
  Generics.Collections;

Type
  TTipo_Concepto = (TTNone, TTBasico, TTDominical, TTFestivo);

Function Insertar_Encabezado_Liquidado(pCodigo_Contrato, pCodigo_Liquidacion, pNombre : String; Var pDatakey : String) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT ' + Top_Sentence(1) +  ' *  FROM ' + Retornar_Info_Tabla(Id_Liquidado_Enc).Name + ' ');
    lSQL.Active := True;
    If lSQL.Active Then
    Begin
      pDatakey := FormatDateTime('YYYYMMDDHHNNSSZZZ', Now);
      lSQL.Append;
      lSQL.FieldByName('DATAKEY'           ).AsString := pDatakey;
      lSQL.FieldByName('NUMERO_DOCUMENTO'  ).AsString := pDatakey;
      lSQL.FieldByName('CODIGO_CONTRATO'   ).AsString := pCodigo_Contrato;
      lSQL.FieldByName('CODIGO_LIQUIDACION').AsString := pCodigo_Liquidacion;
      lSQL.FieldByName('NOMBRE'            ).AsString := pNombre;
      lSQL.Post;
      Result := True;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'UtLiquidador, Insertar_Encabezado_Liquidado', '');
  End;
End;

Function Insertar_Detalle_Liquidado(Const pDatakey : String; pResultado : TList<TRESULTADO> ) : Boolean;
Var
  lI : Integer;
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT ' + Top_Sentence(1) +  ' *  FROM ' + Retornar_Info_Tabla(Id_Liquidado_Det).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + Trim_Sentence('DATAKEY') +  ' = ' + QuotedStr(pDatakey) + ' ');
    lSQL.Active := True;
    If lSQL.Active Then
    Begin
      For lI := 0 To pResultado.Count-1 Do
      Begin
        lSQL.Append;
        lSQL.FieldByName('DATAKEY'             ).AsString := pDatakey;
        lSQL.FieldByName('NUMERO_DOCUMENTO'    ).AsString := pDatakey;
        lSQL.FieldByName('CONSECUTIVO'         ).AsString := Justificar(IntToStr(lI + 1), '0', lSQL.FieldByName('CONSECUTIVO').Size);
        lSQL.FieldByName('CODIGO_CONCEPTO'     ).AsString := pResultado[lI].FCONCEPTO    ;
        lSQL.FieldByName('CODIGO_CENTRO_COSTOS').AsString := pResultado[lI].FCCOSTOS     ;
        lSQL.FieldByName('NOMBRE'              ).AsString := pResultado[lI].FNOMBRE      ;
        lSQL.FieldByName('FECHA'               ).AsString := pResultado[lI].FFECHA       ;
        lSQL.FieldByName('HORA_INICIAL'        ).AsString := pResultado[lI].FHORA_INICIAL;
        lSQL.FieldByName('HORA_FINAL'          ).AsString := pResultado[lI].FHORA_FINAL  ;
        lSQL.FieldByName('CANTIDAD'            ).AsFloat  := pResultado[lI].FCANTIDAD    ;
        lSQL.FieldByName('VALOR'               ).AsFloat  := pResultado[lI].FVALOR       ;
        lSQL.FieldByName('TOTAL'               ).AsFloat  := pResultado[lI].FCANTIDAD * pResultado[lI].FVALOR;
        lSQL.Post;
      End;
      Result := True;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'UtLiquidador, Insertar_Encabezado_Liquidado', '');
  End;
End;


Function Cargar_Conceptos_Ccostos(pCodigo_Turno : String; Var pConceptos : TList<TCONCEPTO>) : Boolean;
Var
  lI : Integer;
  lJ : Integer;
  lSQL : TQuery;
  lCONCEPTO : TCONCEPTO;
  lCONCEPTOS : TList<TCONCEPTO>;
Begin
  Result := False;
  lCONCEPTOS := TList<TCONCEPTO>.Create;
  For lI := 0 To pConceptos.Count-1 Do
  Begin
    Try
      lSQL := TQuery.Create(Nil);
      Configurar_Conexion_Segura(lSQL);
      lSQL.SQL.Clear;
      lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Turno_Det).Name + ' ');
      lSQL.SQL.Add(' WHERE ' + Trim_Sentence('CODIGO_TURNO'   ) + ' = ' + QuotedStr(Trim(pCodigo_Turno)));
      lSQL.SQL.Add(' AND '   + Trim_Sentence('CODIGO_CONCEPTO') + ' = ' + QuotedStr(Trim(pConceptos[lI].FCONCEPTO)));
      lSQL.Active := True;
      If lSQL.Active Then
      Begin
        If lSQL.RecordCount > 0 Then
        Begin
          lSQL.First;
          While Not lSQL.Eof Do
          Begin
            lCONCEPTO := TCONCEPTO.Create;
            lCONCEPTO.FCONCEPTO            := lSQL.FieldByName('CODIGO_CONCEPTO'     ).AsString;
            lCONCEPTO.FCCOSTOS             := lSQL.FieldByName('CODIGO_CENTRO_COSTOS').AsString;
            lCONCEPTO.FNOMBRE_CONCEPTO     := pConceptos[lI].FNOMBRE_CONCEPTO;
            lCONCEPTO.FNOMBRE_CCOSTOS      := Retornar_String(Retornar_Info_Tabla(Id_Centro_Costos).Name, ['CODIGO_CENTRO_COSTOS'], [lCONCEPTO.FCCOSTOS], ['NOMBRE'], 'UtLiquidador, Cargar_Ccostos');
            lCONCEPTO.FCANTIDAD_CCOSTOS    := lSQL.FieldByName('CANTIDAD'  ).AsFloat ;
            lCONCEPTO.FPORCENTAJE_CCOSTOS  := lSQL.FieldByName('PORCENTAJE').AsFloat ;
            lCONCEPTO.FPORCENTAJE_CONCEPTO := pConceptos[lI].FPORCENTAJE_CONCEPTO;
            lCONCEPTO.FPORCENTAJE_EMPLEADO := pConceptos[lI].FPORCENTAJE_EMPLEADO;
            lCONCEPTO.FPORCENTAJE_EMPRESA  := pConceptos[lI].FPORCENTAJE_EMPRESA ;
            lCONCEPTOS.Add(lCONCEPTO);
            lSQL.Next;
          End;
        End
        Else
        Begin
          lCONCEPTO := TCONCEPTO.Create;
          lCONCEPTO.FCONCEPTO            := pConceptos[lI].FCONCEPTO           ;
          lCONCEPTO.FCCOSTOS             := pConceptos[lI].FCCOSTOS            ;
          lCONCEPTO.FNOMBRE_CONCEPTO     := pConceptos[lI].FNOMBRE_CONCEPTO    ;
          lCONCEPTO.FNOMBRE_CCOSTOS      := Retornar_String(Retornar_Info_Tabla(Id_Centro_Costos).Name, ['CODIGO_CENTRO_COSTOS'], [lCONCEPTO.FCCOSTOS], ['NOMBRE'], 'UtLiquidador, Cargar_Ccostos');
          lCONCEPTO.FCANTIDAD_CCOSTOS    := pConceptos[lI].FCANTIDAD_CCOSTOS   ;
          lCONCEPTO.FPORCENTAJE_CCOSTOS  := pConceptos[lI].FPORCENTAJE_CCOSTOS ;
          lCONCEPTO.FPORCENTAJE_CONCEPTO := pConceptos[lI].FPORCENTAJE_CONCEPTO;
          lCONCEPTO.FPORCENTAJE_EMPLEADO := pConceptos[lI].FPORCENTAJE_EMPLEADO;
          lCONCEPTO.FPORCENTAJE_EMPRESA  := pConceptos[lI].FPORCENTAJE_EMPRESA ;
          lCONCEPTOS.Add(lCONCEPTO);
        End;
      End;
      lSQL.Active := False;
      lSQL.Free;
      Result := True;
    Except
       On E: Exception Do
         Ingresar_Inconsistencias(E, 'UtLiquidador, Cargar_Conceptos_Ccostos', '');
    End;
  End;
  For lCONCEPTO In pConceptos Do
    lCONCEPTO.DisposeOf;
  pConceptos.Clear;
  For lI := 0 To lCONCEPTOS.Count-1 Do
  Begin
    lCONCEPTO := lCONCEPTOS[lI];
    pConceptos.Add(lCONCEPTO);
  End;
  lCONCEPTOS.Clear;
  lCONCEPTOS.DisposeOf;
End;

Function Cargar_Conceptos_Detalle(pCodigo_Concepto : String; Var pConceptos : TList<TCONCEPTO>) : Boolean;
Var
  lCONCEPTO : TCONCEPTO;
Begin
  If Not Vacio(pCodigo_Concepto) Then
  Begin
    lCONCEPTO := TCONCEPTO.Create;
    lCONCEPTO.FCONCEPTO            := pCodigo_Concepto;
    lCONCEPTO.FNOMBRE_CONCEPTO     := Retornar_String(Retornar_Info_Tabla(Id_Concepto).Name, ['CODIGO_CONCEPTO'], [pCodigo_Concepto], ['NOMBRE'             ], 'UtLiquidador, Cargar_Conceptos');
    lCONCEPTO.FPERIODICIDAD        := Retornar_String(Retornar_Info_Tabla(Id_Concepto).Name, ['CODIGO_CONCEPTO'], [pCodigo_Concepto], ['ID_PERIODICIDAD'    ], 'UtLiquidador, Cargar_Conceptos');
    lCONCEPTO.FPORCENTAJE_CONCEPTO := Retornar_Double(Retornar_Info_Tabla(Id_Concepto).Name, ['CODIGO_CONCEPTO'], [pCodigo_Concepto], ['PORCENTAJE_CONCEPTO'], 'UtLiquidador, Cargar_Conceptos');
    lCONCEPTO.FPORCENTAJE_EMPLEADO := Retornar_Double(Retornar_Info_Tabla(Id_Concepto).Name, ['CODIGO_CONCEPTO'], [pCodigo_Concepto], ['PORCENTAJE_EMPLEADO'], 'UtLiquidador, Cargar_Conceptos');
    lCONCEPTO.FPORCENTAJE_EMPRESA  := Retornar_Double(Retornar_Info_Tabla(Id_Concepto).Name, ['CODIGO_CONCEPTO'], [pCodigo_Concepto], ['PORCENTAJE_EMPRESA' ], 'UtLiquidador, Cargar_Conceptos');
    pConceptos.Add(lCONCEPTO);
  End;
End;

Function Cargar_Turno_Encabezado(Var pTurno : TTURNO) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Turno_Enc).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + Trim_Sentence('CODIGO_TURNO') + ' = ' + QuotedStr(Trim(pTurno.FCODIGO_TURNO)));
    lSQL.Active := True;
    If lSQL.Active Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        pTurno.FHORAS_DIA   := lSQL.FieldByName('HORAS_DIA'  ).AsFloat ;
        pTurno.FHORAS_TURNO := lSQL.FieldByName('HORAS_TURNO').AsFloat ;
        pTurno.FHORAS_MES   := lSQL.FieldByName('HORAS_MES'  ).AsFloat ;
        pTurno.FBASICO      := lSQL.FieldByName('BASICO'     ).AsString;
        pTurno.FDOMINICAL   := lSQL.FieldByName('DOMINICAL'  ).AsString;
        pTurno.FFESTIVO     := lSQL.FieldByName('FESTIVO'    ).AsString;
        pTurno.FTRANSPORTE  := lSQL.FieldByName('TRANSPORTE' ).AsString;
        pTurno.FSALUD       := lSQL.FieldByName('SALUD'      ).AsString;
        pTurno.FPENSION     := lSQL.FieldByName('PENSION'    ).AsString;
        pTurno.FFSP         := lSQL.FieldByName('FSP'        ).AsString;
        pTurno.RETEFUENTE   := lSQL.FieldByName('RETEFUENTE' ).AsString;
        pTURNO.FHORAS_DIA   := lSQL.FieldByName('HORAS_DIA'   ).AsFloat;
        pTURNO.FHORAS_MES   := lSQL.FieldByName('HORAS_MES'   ).AsFloat;
        pTURNO.FHORAS_TURNO := lSQL.FieldByName('HORAS_TURNO' ).AsFloat;
        Cargar_Conceptos_Detalle(pTurno.FBASICO      , pTurno.FCONCEPTOS);
        Cargar_Conceptos_Detalle(pTurno.FDOMINICAL   , pTurno.FCONCEPTOS);
        Cargar_Conceptos_Detalle(pTurno.FFESTIVO     , pTurno.FCONCEPTOS);
        Cargar_Conceptos_Detalle(pTurno.FTRANSPORTE  , pTurno.FCONCEPTOS);
        Cargar_Conceptos_Detalle(pTurno.FSALUD       , pTurno.FCONCEPTOS);
        Cargar_Conceptos_Detalle(pTurno.FPENSION     , pTurno.FCONCEPTOS);
        Cargar_Conceptos_Detalle(pTurno.FFSP         , pTurno.FCONCEPTOS);
        Cargar_Conceptos_Detalle(pTurno.RETEFUENTE   , pTurno.FCONCEPTOS);
        Cargar_Conceptos_Ccostos(pTurno.FCODIGO_TURNO, pTurno.FCONCEPTOS);
        lSQL.Next;
      End;
      Result := True;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'UtLiquidador, Cargar_Turno_Encabezado', '');
  End;
End;

Function Cargar_Turno_Datos_Horas(Var pTurno : TTURNO) : Boolean;
Var
  lI : Integer;
  lSQL : TQuery;
  lHORA : THORAS;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lSQL);
    For lI := 0 To pTurno.FCONCEPTOS.Count-1 Do
    Begin
      lSQL.Active := False;
      lSQL.SQL.Clear;
      lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Concepto_Hora).Name + ' ');
      lSQL.SQL.Add(' WHERE ' + Trim_Sentence('CODIGO_CONCEPTO') + ' = ' + QuotedStr(Trim(pTurno.FCONCEPTOS[lI].FCONCEPTO)));
      lSQL.SQL.Add(' AND '   + Trim_Sentence('ID_HORA'        ) + ' = ' + QuotedStr(Trim('H'                            )));
      lSQL.Active := True;
      If lSQL.Active Then
      Begin
        lSQL.First;
        While Not lSQL.Eof Do
        Begin
          lHORA := THORAS.Create;
          lHORA.FHORAINI := lSQL.FieldByName('HORA_INICIAL').AsString;
          lHORA.FHORAFIN := lSQL.FieldByName('HORA_FINAL'  ).AsString;
          lHORA.FHoras   := Retornar_Minutos(lHORA.FHORAFIN, lHORA.FHORAINI) / 60;
          pTurno.FCONCEPTOS[lI].FHORAS.Add(lHORA);
          lSQL.Next;
        End;
        Result := True;
      End;
      lSQL.Active := False;
    End;
    lSQL.Free;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'UtLiquidador, Cargar_Turno_Datos_Horas', '');
  End;
End;

Function Cargar_Turnos(Var pTurnos : TList<TTURNO>) : Boolean;
Var
  lSQL : TQuery;
  lTURNO : TTURNO;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Liquidacion).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + Trim_Sentence('ID_ESTADO') + ' = ' + QuotedStr(Trim('A')));
    lSQL.Active := True;
    If lSQL.Active Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        lTURNO := TTURNO.Create;
        lTURNO.FCODIGO_TURNO       := lSQL.FieldByName('CODIGO_TURNO'      ).AsString;
        lTURNO.FCODIGO_LIQUIDACION := lSQL.FieldByName('CODIGO_LIQUIDACION').AsString;
        lTURNO.FNOMBRE_TURNO       := lSQL.FieldByName('NOMBRE'            ).AsString;
        lTURNO.FID_PERIODICIDAD    := lSQL.FieldByName('ID_PERIODICIDAD'   ).AsString;
        lTURNO.FFECHAINI           := Return_Type_Year_Month_Day(lSQL.FieldByName('FECHA_INICIAL').AsString);
        lTURNO.FFECHAFIN           := Return_Type_Year_Month_Day(lSQL.FieldByName('FECHA_FINAL'  ).AsString);
        Cargar_Turno_Encabezado (lTURNO);
        Cargar_Turno_Datos_Horas(lTURNO);
        pTurnos.Add(lTURNO);
        lSQL.Next;
      End;
      Result := True;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'UtLiquidador, Cargar_Turnos', '');
  End;
End;

Function Calcular_Item_Resultado(Const pTipo_Concepto : TTipo_Concepto; Const pConcepto, pCcosto, pNombre, pFecha, pHoraIni, pHoraFin : String; Const pBase, pCantidad, pPorcentaje_Concepto, pPorcentaje_Ccosto : Double) : TRESULTADO;
Begin
  Result := TRESULTADO.Create;
  Result.FCONCEPTO     := pConcepto;
  Result.FCCOSTOS      := pCcosto;
  Result.FNOMBRE       := pNombre;
  Result.FFECHA        := pFecha;
  Result.FHORA_INICIAL := pHoraIni;
  Result.FHORA_FINAL   := pHoraFin;
  Result.FCANTIDAD     := pCantidad * (pPorcentaje_Ccosto / 100);
  Case pTipo_Concepto Of
    TTBasico    ,
    TTDominical ,
    TTFestivo   : Begin
                    Result.FVALOR := pBase * (pPorcentaje_Concepto / 100) {* (pPorcentaje_Ccosto / 100)};
                  End;
  End;
  Result.FTOTAL := Result.FCANTIDAD * Result.FVALOR;
End;

Function Calcular_Liquidacion_Concepto(pTipo_Concepto : TTipo_Concepto; pFecha, pConcepto, pCcostos, pPeriodicidad : String; pBase, pHoras_Dia : Double; Const pConceptos : TList<TCONCEPTO>; Var pResultado : TList<TRESULTADO> ) : Boolean;
Var
  lI : Integer;
  lJ : Integer;
  lItem : TRESULTADO;
Begin
  Result := False;
  For lI := 0 To pConceptos.Count-1 Do
  Begin
    If (pConcepto = pConceptos[lI].FCONCEPTO) And (pConceptos[lI].FPERIODICIDAD = pPeriodicidad) Then
    Begin
      If Vacio(pConceptos[lI].FCCOSTOS) Then
      Begin
        pConceptos[lI].FCCOSTOS := pCcostos;
        pConceptos[lI].FPORCENTAJE_CCOSTOS := 100;
      End;
      If pConceptos[lI].FHORAS.Count <= 0 Then
      Begin
        lItem := Calcular_Item_Resultado(pTipo_Concepto,
                                         pConceptos[lI].FCONCEPTO,
                                         pConceptos[lI].FCCOSTOS ,
                                         Trim(pConceptos[lI].FNOMBRE_CONCEPTO) + ', ' + Trim(pConceptos[lI].FNOMBRE_CCOSTOS),
                                         pFecha, '00:00:00', '00:00:00',
                                         pBase, pHoras_Dia,
                                         pConceptos[lI].FPORCENTAJE_CONCEPTO,
                                         pConceptos[lI].FPORCENTAJE_CCOSTOS);
        pResultado.Add(lItem);
      End
      Else
      Begin
        For lJ := 0 To pConceptos[lI].FHORAS.Count-1 Do
        Begin
          lItem := Calcular_Item_Resultado(pTipo_Concepto,
                                           pConceptos[lI].FCONCEPTO,
                                           pConceptos[lI].FCCOSTOS ,
                                           Trim(pConceptos[lI].FNOMBRE_CONCEPTO) + ', ' + Trim(pConceptos[lI].FNOMBRE_CCOSTOS),
                                           pFecha,
                                           pConceptos[lI].FHORAS[lJ].FHORAINI,
                                           pConceptos[lI].FHORAS[lJ].FHORAFIN,
                                           pBase,
                                           pConceptos[lI].FHORAS[lJ].FHORAS   ,
                                           pConceptos[lI].FPORCENTAJE_CONCEPTO,
                                           pConceptos[lI].FPORCENTAJE_CCOSTOS);
          pResultado.Add(lItem);
        End;
      End;
    End;
  End;
End;

Function Retornar_Devengados(pCodigo_Contrato, pFechaIni, pFechaFin : String; pConceptos : TStringList) : Double;
Var
  lI : Integer;
  lConceptos : String;
  lSentencia : String;
  lSQL : TQuery;
  lHORA : THORAS;
Begin
  Result := 0;
  lSentencia := ' SELECT SUM(LIQUIDADO_DET.TOTAL) AS DEVENGADOS ' +
                ' FROM LIQUIDADO_DET ' +
                ' INNER JOIN LIQUIDADO_ENC ON LIQUIDADO_DET.DATAKEY = LIQUIDADO_ENC.DATAKEY ' +
                ' INNER JOIN CONCEPTO ON LIQUIDADO_DET.CODIGO_CONCEPTO = CONCEPTO.CODIGO_CONCEPTO ' +
                ' WHERE ' + Trim_Sentence('LIQUIDADO_DET.FECHA') + ' BETWEEN ' + QuotedStr(Trim(pFechaIni)) + '  AND ' + QuotedStr(Trim(pFechaFin)) + ' ' +
                ' AND ' + Trim_Sentence('LIQUIDADO_ENC.CODIGO_CONTRATO') + ' = ' + QuotedStr(Trim(pCodigo_Contrato)) + ' '+
                ' AND ' + Trim_Sentence('CONCEPTO.ID_TRANSPORTE') + ' = ' + QuotedStr(Trim('S')) + ' ' ;
  lConceptos := '';
  For lI := 0 To pConceptos.Count-1 Do
    lConceptos := lConceptos + IfThen(lI <> 0, ' OR ', ' ') + 'LIQUIDADO_DET.CODIGO_CONCEPTO = ' + QuotedStr(pConceptos[lI]);
  If Not Vacio(lConceptos) Then
    lSentencia := lSentencia + ' AND (' + lConceptos + ')';
  Try
    lSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lSQL);
    lSQL.Active := False;
    lSQL.SQL.Clear;
    lSQL.SQL.Add(lSentencia);
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
      Result := lSQL.FieldByName('DEVENGADOS').AsFloat;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'UtLiquidador, Retornar_Devengados', '');
  End;
End;

Procedure Establecer_Fecha_Anterior(pFecha : String; Var pFechaIni, pFechaFin : String);
Var
  lFecha : TDate;
  lFechaIni : TFecha_Info;
  lFechaFin : TFecha_Info;
Begin
  lFechaIni := Return_Type_Year_Month_Day(pFecha);
  lFecha := EncodeDate(lFechaIni.IntYear, lFechaIni.IntMonth, 1);
  lFechaIni := Return_Type_Date(lFecha);
  lFechaFin := Return_Type_Year_Month_Day(pFecha);
  lFechaFin := Return_Type_Date(lFechaFin.DateTime - 1);
  If lFechaIni.IntMonth = lFechaFin.IntMonth Then
  Begin
    pFechaIni := lFechaIni.yyyy_mm_dd;
    pFechaFin := lFechaFin.yyyy_mm_dd;
  End
  Else
  Begin
    pFechaIni := lFechaIni.yyyy_mm_dd;
    pFechaFin := lFechaFin.yyyy_mm_dd;
  End;
End;

Function Calcular_Liquidacion_Turno(Var pTurnos : TList<TTURNO>) : Boolean;
Var
  lI : Integer;
  lSQL : TQuery;
  lBase : Double;
  lItem : TRESULTADO;
  lCcostos : String;
  lDataKey : String;
  lFechaIni : String;
  lFechaFin : String;
  lConceptos : TStringList;
  lDevengados : Double;
  lFechatmp : TFecha_Info;
  lRESULTADO : TList<TRESULTADO>;
Begin
  Result := False;
  Try
    lConceptos := TStringList.Create;
    lRESULTADO := TList<TRESULTADO>.Create;
    lSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lSQL);
    For lI := 0 To pTurnos.Count-1 Do
    Begin
      lSQL.Active := False;
      lSQL.SQL.Clear;
      lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Tercero_Contrato).Name + ' ');
      lSQL.SQL.Add(' WHERE ' + Trim_Sentence('CODIGO_TURNO') + ' = ' + QuotedStr(Trim(pTurnos[lI].FCODIGO_TURNO)));
      lSQL.Active := True;
      If lSQL.Active Then
      Begin
        lSQL.First;
        While Not lSQL.Eof Do
        Begin
          If Insertar_Encabezado_Liquidado(lSQL.FieldByName('CODIGO_CONTRATO').AsString, pTurnos[lI].FCODIGO_LIQUIDACION, pTurnos[lI].FNOMBRE_LIQUIDACION, lDataKey) Then
          Begin
            lConceptos.Clear;
            Establecer_Fecha_Anterior(pTurnos[lI].FFECHAINI.yyyy_mm_dd, lFechaIni, lFechaFin);
            lBase := Retornar_Double(Retornar_Info_Tabla(Id_Contrato_Salario).Name, ['CODIGO_SALARIO'], [lSQL.FieldByName('CODIGO_SALARIO').AsString], ['VALOR'], 'UtLiquidador, Calcular_Liquidacion_Turno');
            lCcostos := lSQL.FieldByName('CODIGO_CENTRO_COSTOS').AsString;
            lFechatmp := pTurnos[lI].FFECHAINI;
            While lFechatmp.DateTime <= pTurnos[lI].FFECHAFIN.DateTime Do
            Begin
              If (Not Vacio(pTurnos[lI].FDOMINICAL)) And (DayOfWeek(lFechatmp.DateTime) = 1) Then
                Calcular_Liquidacion_Concepto(TTDominical, lFechatmp.yyyy_mm_dd, pTurnos[lI].FDOMINICAL, lCcostos, pTurnos[lI].FID_PERIODICIDAD, lBase, pTurnos[lI].FHORAS_DIA, pTurnos[lI].FCONCEPTOS, lRESULTADO)
              Else
              Begin
                If (Not Vacio(pTurnos[lI].FFESTIVO)) And Existe_Registro(Retornar_Info_Tabla(Id_Festivo).Name, ['CODIGO_FESTIVO'], [lFechatmp.yyyy_mm_dd], 'UtLiquidador, Calcular_Liquidacion_Turno') Then
                  Calcular_Liquidacion_Concepto(TTFestivo, lFechatmp.yyyy_mm_dd, pTurnos[lI].FFESTIVO, lCcostos, pTurnos[lI].FID_PERIODICIDAD, lBase, pTurnos[lI].FHORAS_DIA, pTurnos[lI].FCONCEPTOS, lRESULTADO)
                Else
                  Calcular_Liquidacion_Concepto(TTBasico, lFechatmp.yyyy_mm_dd, pTurnos[lI].FBASICO, lCcostos, pTurnos[lI].FID_PERIODICIDAD, lBase, pTurnos[lI].FHORAS_DIA, pTurnos[lI].FCONCEPTOS, lRESULTADO);
              End;
              lFechatmp := Return_Type_Date(lFechatmp.Datetime + 1);
            End;
            lConceptos.Add(pTurnos[lI].FBASICO   );
            lConceptos.Add(pTurnos[lI].FDOMINICAL);
            lConceptos.Add(pTurnos[lI].FFESTIVO  );
            If (Not Vacio(pTurnos[lI].FTRANSPORTE)) Then
            Begin
              lDevengados := Retornar_Devengados(lSQL.FieldByName('CODIGO_CONTRATO').AsString, lFechaIni, lFechaFin, lConceptos)
            End;
          End;
          Insertar_Detalle_Liquidado(lDataKey, lRESULTADO);
          For lItem In lRESULTADO Do
            lItem.DisposeOf;
          lRESULTADO.Clear;
          lSQL.Next;
        End;
        Result := True;
      End;
      For lItem In lRESULTADO Do
        lItem.DisposeOf;
      lRESULTADO.Clear;
      lSQL.Active := False;
    End;
    lConceptos.Clear;
    lConceptos.DisposeOf;
    lRESULTADO.DisposeOf;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'UtLiquidador, Calcular_Liquidacion_Turno', '');
  End;
End;

Function Inicializar_Liquidacion_Turno(pTurnos : TList<TTURNO>) : Boolean;
Var
  lI : Integer;
  lSQL : TQuery;
  lSentence : String;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lSQL);
    For lI := 0 To pTurnos.Count-1 Do
    Begin
      lSQL.Active := False;
      lSQL.SQL.Clear;
      lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Liquidado_Enc).Name + ' ');
      lSQL.SQL.Add(' WHERE ' + Trim_Sentence('CODIGO_LIQUIDACION') + ' = ' + QuotedStr(Trim(pTurnos[lI].FCODIGO_LIQUIDACION)));
      lSQL.Active := True;
      If lSQL.Active Then
      Begin
        lSQL.First;
        While Not lSQL.Eof Do
        Begin
          lSentence := ' DELETE FROM ' + Retornar_Info_Tabla(Id_Liquidado_Det).Name + ' ' +
                       ' WHERE '+ Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(lSQL.FieldByName('DATAKEY').AsString));
          If Execute_SQL_Boolean(lSentence, 'UtLiquidador, Inicializar_Liquidacion_Turno') Then
          Begin
            lSQL.Delete;
            lSQL.First;
          End
          Else
            lSQL.Next;;
        End;
        Result := True;
      End;
      lSQL.Active := False;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'UtLiquidador, Inicializar_Liquidacion_Turno', '');
  End;
End;

Function Generar_Liquidacion : Boolean;
Var
  lI : Integer;
  lTURNO : TList<TTURNO>;
Begin
  lTURNO := TList<TTURNO>.Create;
  If Cargar_Turnos(lTURNO) Then
  Begin
    If Inicializar_Liquidacion_Turno(lTURNO) Then
      Calcular_Liquidacion_Turno(lTURNO);
  End;
  For lI := 0 To lTURNO.Count-1 do
    lTURNO[lI].DisposeOf;
  lTURNO.Clear;
  lTURNO.DisposeOf;
End;


end.
