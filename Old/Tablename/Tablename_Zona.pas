unit TableName_Zona;

interface

Function Create_Tabla_Zona : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Zona : Boolean;
Begin
  Result := True;

  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Zona).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Zona).Name + ' '                   );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                       );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_ZONA        '   + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE             '   + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PLANO              '   + gVariableGlobal.CNX.Return_Type(TYPE_IMAGE  ) + ' '        + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ESPACIO_DISPONIBLE '   + gVariableGlobal.CNX.Return_Type(TYPE_IMAGE  ) + ' '        + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ESPACIO_OCUPADA    '   + gVariableGlobal.CNX.Return_Type(TYPE_IMAGE  ) + ' '        + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ESPACIO_RESERVADA  '   + gVariableGlobal.CNX.Return_Type(TYPE_IMAGE  ) + ' '        + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      EXTENSION_PLANO      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (005)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      EXTENSION_DISPONIBLE ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (005)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      EXTENSION_OCUPADA    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (005)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      EXTENSION_RESERVADA  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (005)  ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      ID_OCULTAR_POS '       + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO           '   + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '        + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_ZONA) '                                       + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   )  '                                                                       );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Zona', 'Tabla',  Retornar_Info_Tabla(Id_Zona).Name]);
      End;
    End;
  End;
End;

end.

