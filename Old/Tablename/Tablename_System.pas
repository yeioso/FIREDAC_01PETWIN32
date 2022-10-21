unit TableName_System;

interface

Function Create_Tabla_SYSTEM : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_SYSTEM : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_SYSTEM).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_SYSTEM).Name + ' '          );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                );
      gVariableGlobal.CNX.TMP.SQL.Add('      SYSTEM_MACHINE  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (200) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      SYSTEM_SERIAL   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (200) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO        ' + gVariableGlobal.CNX.Return_Type(TYPE_INT     ) + '       ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (SYSTEM_MACHINE) '                                   );
      gVariableGlobal.CNX.TMP.SQL.Add('   )  '                                                                );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E: Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Tabla', Retornar_Info_Tabla(Id_SYSTEM).Name, 'Create_Tabla_SYSTEM']);
      End;
    End;
  End;
End;

end.
