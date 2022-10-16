unit TableName_Contrato_Salario;

interface
Uses
  UtConexion;

Function Create_Tabla_Contrato_Salario : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  
  UtException,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Contrato_Salario : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Contrato_Salario).Name, 'Create_Tabla_Contrato_Salario') then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Contrato_Salario).Name + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                 );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_SALARIO  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_CONTRATO ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA_INICIAL   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA_FINAL     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORCENTAJE      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR           ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO        ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_SALARIO) '                              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Contrato_Salario).Fk[1], 'CODIGO_CONTRATO', Retornar_Info_Tabla(Id_Empleado).Name, 'CODIGO_CONTRATO') + ' ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) '                                                                  );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        Ingresar_Inconsistencias(E, MessageError(IE_ERROR_CREATE) + ' Tabla ' + Retornar_Info_Tabla(Id_Contrato_Salario).Name, 'Create_Tabla_Contrato_Salario');
      End;
    End;
  End;
End;

end.
