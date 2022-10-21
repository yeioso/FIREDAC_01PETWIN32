unit TableName_Centro_Costos;

interface

Function Create_Tabla_Centro_Costos : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Centro_Costos : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Centro_Costos).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Centro_Costos).Name + '  '       );
      gVariableGlobal.CNX.TMP.SQL.Add('   (   '                                                                    );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_CENTRO_COSTOS ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE               ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + '(100)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ACTIVO            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + '(001)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO             ' + gVariableGlobal.CNX.Return_Type(TYPE_INT     ) + '     ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_CENTRO_COSTOS) '                            + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   )  '                                                                     );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Centro_Costos', 'Tabla',  Retornar_Info_Tabla(Id_Centro_Costos).Name]);
      End;
    End;
  End;
End;

end.
