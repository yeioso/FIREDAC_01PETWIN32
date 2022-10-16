unit TableName_Tercero_LP;

interface

Function Create_Tabla_Tercero_LP : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Tercero_LP : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Tercero_LP).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Tercero_LP).Name + '  '        );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                   );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_TERCERO    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_TERCERO_LP ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (002) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORCENTAJE        ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO          ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_TERCERO, CODIGO_TERCERO_LP) '                             + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Tercero_LP).Fk[1], 'CODIGO_TERCERO', Retornar_Info_Tabla(Id_Tercero).Name, 'CODIGO_TERCERO') + ' ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) '                                                                    );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Tercero_LP', 'Tabla',  Retornar_Info_Tabla(Id_Tercero_LP).Name]);
      End;
    End;
  End;
End;

end.
