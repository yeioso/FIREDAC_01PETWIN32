unit TableName_Contrato_Anexo;

interface
Uses
  UtConexion;

Function Create_Tabla_Contrato_Anexo : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  
  UtException,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Contrato_Anexo : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Contrato_Anexo).Name, 'Create_Tabla_Contrato_Anexo') then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add(' CREATE TABLE ' + Retornar_Info_Tabla(Id_Contrato_Anexo).Name + ' ' );
      gVariableGlobal.CNX.TMP.SQL.Add(' ( '                                                                );
      gVariableGlobal.CNX.TMP.SQL.Add('  CODIGO_ANEXO    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  CODIGO_CONTRATO ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  NOMBRE          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  DESCRIPCION     ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  ARCHIVO_BIN     ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  PRIMARY KEY (CODIGO_ANEXO) '                                + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Contrato_Anexo).Fk[1], 'CODIGO_CONTRATO', Retornar_Info_Tabla(Id_Empleado).Name, 'CODIGO_CONTRATO') + ' ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ) '                                                                );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E: Exception Do
      Begin
        Result := False;
        Ingresar_Inconsistencias(E, MessageError(IE_ERROR_CREATE) + ' Tabla ' + Retornar_Info_Tabla(Id_Contrato_Anexo).Name, 'Create_Tabla_Contrato_Anexo');
      End;
    End;
  End;
End;

end.
