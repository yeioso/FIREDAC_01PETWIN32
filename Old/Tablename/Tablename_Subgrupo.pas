unit Tablename_Subgrupo;

interface

Function Create_Tabla_Subgrupo : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Subgrupo : Boolean;
Begin
  Result := True;
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Subgrupo).Name + ' '          );
      gVariableGlobal.CNX.TMP.SQL.Add('   ( '                                                                   );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_SUBGRUPO ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (002)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ORDEN           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      GRAFICO         ' + gVariableGlobal.CNX.Return_Type(TYPE_IMAGE  ) + '        ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_MOSTRAR      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO        ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + '        ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_SUBGRUPO) '                              + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) '                                                                   );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Subgrupo', 'Tabla',  Retornar_Info_Tabla(Id_Subgrupo).Name]);
      End;
    End;
  End;
End;

end.

