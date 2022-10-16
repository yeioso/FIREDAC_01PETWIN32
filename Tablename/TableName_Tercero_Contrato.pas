unit Tablename_Tercero_Contrato;

interface
Uses
  UtConexion;

Function Create_Tabla_Tercero_Contrato : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  
  UtException,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Tercero_Contrato : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Empleado).Name, 'Create_Tabla_Empleado') then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Empleado).Name + '  '             );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                      );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_TERCERO       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_CONTRATO      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_EMPLEADO      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE               ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TELEFONO             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CELULAR              ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      E_MAIL               ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DIRECCION            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_MUNICIPIO     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (005) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_CONTRATO        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CALCULO_PRESTACIONAL ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_VINCULACION     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (002) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_TURNO         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_CARGO         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_HORA           ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA_INGRESO        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA_RETIRO         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DIRECTA              ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_BANCO         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_CUENTA          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NUMERO_CUENTA        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_EPS           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA_EPS            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_AFP           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA_AFP            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_ARL           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA_ARL            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_CCF           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA_CCF            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_ARP           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_SEGURIDA_SOCIAL   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_EXENTO_RETEFUENTE ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_TIPO_COTIZANTE    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_SUBTIPO_COTIZANTE ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ALIVIO_TRIBUTARIO ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_TIPO_ETAPA_SENA   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ACTIVO            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_AUSENTE           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_RETEFUENTE     ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_CENTRO_COSTOS ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      ID_LEY_50            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      ID_PS_PRIMA          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PROMEDIO_PRIMA       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (003) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      ID_PS_CESANTIAS      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PROMEDIO_CESANTIAS   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (003) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      ID_PS_VACACIONES     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PROMEDIO_VACACIONES  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (003) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      EXENTO_ADT           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ADT_PS            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      GRAFICO              ' + gVariableGlobal.CNX.Return_Type(TYPE_IMAGE  ) + ' '       + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO             ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_CONTRATO) '                                  + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Empleado).Fk[01], 'CODIGO_TERCERO'      , Retornar_Info_Tabla(Id_Tercero      ).Name, 'CODIGO_TERCERO'      ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Empleado).Fk[02], 'CODIGO_MUNICIPIO'    , Retornar_Info_Tabla(Id_Municipio    ).Name, 'CODIGO_MUNICIPIO'    ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Empleado).Fk[03], 'CODIGO_EPS'          , Retornar_Info_Tabla(Id_Tercero      ).Name, 'CODIGO_TERCERO'      ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Empleado).Fk[04], 'CODIGO_AFP'          , Retornar_Info_Tabla(Id_Tercero      ).Name, 'CODIGO_TERCERO'      ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Empleado).Fk[05], 'CODIGO_ARL'          , Retornar_Info_Tabla(Id_Tercero      ).Name, 'CODIGO_TERCERO'      ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Empleado).Fk[06], 'CODIGO_CCF'          , Retornar_Info_Tabla(Id_Tercero      ).Name, 'CODIGO_TERCERO'      ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Empleado).Fk[07], 'CODIGO_ARP'          , Retornar_Info_Tabla(Id_ARP          ).Name, 'CODIGO_ARP'          ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Empleado).Fk[08], 'CODIGO_BANCO'        , Retornar_Info_Tabla(Id_Tercero      ).Name, 'CODIGO_TERCERO'      ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Empleado).Fk[09], 'CODIGO_CARGO'        , Retornar_Info_Tabla(Id_Cargo        ).Name, 'CODIGO_CARGO'        ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Empleado).Fk[10], 'CODIGO_TURNO'        , Retornar_Info_Tabla(Id_Turno_Enc    ).Name, 'CODIGO_TURNO'        ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Empleado).Fk[11], 'CODIGO_CENTRO_COSTOS', Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Empleado).Fk[12], 'DIRECTA'             , Retornar_Info_Tabla(Id_Empleado     ).Name, 'CODIGO_CONTRATO'     ) + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) '                                                                       );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        Ingresar_Inconsistencias(E, MessageError(IE_ERROR_CREATE) + ' Tabla ' + Retornar_Info_Tabla(Id_Empleado).Name, 'Create_Tabla_Empleado');
      End;
    End;
  End;
End;

end.
