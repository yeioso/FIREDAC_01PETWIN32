unit Tablename_Permiso_Menu;

interface

Function Create_Tabla_Permiso_Menu : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Permiso_Menu : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Permiso_Menu).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add(' CREATE TABLE ' + Retornar_Info_Tabla(Id_Permiso_Menu).Name + ' '                        );
      gVariableGlobal.CNX.TMP.SQL.Add(' ( '                                                                                     );
      gVariableGlobal.CNX.TMP.SQL.Add('  CODIGO_PERFIL      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  OPCION             ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  NOMBRE             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  HABILITA_OPCION    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  ACTIVO             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  TAG_INFO           ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  PRIMARY KEY (CODIGO_PERFIL, OPCION) '                                             + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  '+ gVariableGlobal.CNX.FOREINGKEY('01','CODIGO_PERFIL', Retornar_Info_Tabla(Id_Perfil).Name, 'CODIGO_PERFIL') + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ) '                                                                 );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E: Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Tabla', Retornar_Info_Tabla(Id_Permiso_Menu).Name, 'Origen', 'Create_Tabla_Permiso_Menu']);
      End;
    End;
  End;
End;

end.
