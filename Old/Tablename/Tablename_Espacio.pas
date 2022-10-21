unit Tablename_Espacio;

interface

Function Create_Tabla_Espacio : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Espacio : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Espacio).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Espacio).Name + '  '         );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                 );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_ZONA    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_ESPACIO ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ESTADO         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_ESPACIO   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      POSICION_X     ' + gVariableGlobal.CNX.Return_Type(TYPE_INT     ) + '       ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      POSICION_Y     ' + gVariableGlobal.CNX.Return_Type(TYPE_INT     ) + '       ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TOTAL          ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + '       ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO       ' + gVariableGlobal.CNX.Return_Type(TYPE_INT     ) + '       ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_ESPACIO)  '                             + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Espacio).Fk[1], 'CODIGO_ZONA', Retornar_Info_Tabla(Id_Zona).Name, 'CODIGO_ZONA') + ' ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) '                                                                  );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Espacio', 'Tabla',  Retornar_Info_Tabla(Id_Espacio).Name]);
      End;
    End;
  End;
End;

end.


