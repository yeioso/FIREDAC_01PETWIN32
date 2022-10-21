unit Tablename_Permiso_App;

interface

Function Create_Tabla_Permiso_App : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Permiso_App : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Permiso_App).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add(' CREATE TABLE ' + Retornar_Info_Tabla(Id_Permiso_App).Name + ' '       );
      gVariableGlobal.CNX.TMP.SQL.Add(' ( '                                                                   );
      gVariableGlobal.CNX.TMP.SQL.Add('  CODIGO_PERFIL      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  CONSECUTIVO        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  NOMBRE             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  HABILITA_OPCION    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  TAG_INFO           ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  PRIMARY KEY (CONSECUTIVO) '                                    + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  '+ gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Permiso_App).Fk[1],'CODIGO_PERFIL', Retornar_Info_Tabla(Id_Perfil).Name, 'CODIGO_PERFIL') + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ) '                                                                   );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E: Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Tabla', Retornar_Info_Tabla(Id_Permiso_App).Name, 'Origen', 'Create_Tabla_Permiso_App']);
      End;
    End;
  End;
End;

end.

