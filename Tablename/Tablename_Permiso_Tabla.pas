unit Tablename_Permiso_Tabla;

interface

Function Create_Tabla_Permiso_Tabla: Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Permiso_Tabla : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Permiso_Tabla).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add(' CREATE TABLE ' + Retornar_Info_Tabla(Id_Permiso_Tabla).Name + ' '     );
      gVariableGlobal.CNX.TMP.SQL.Add(' ( '                                                                   );
      gVariableGlobal.CNX.TMP.SQL.Add('  CODIGO_PERFIL      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  TABLA              ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  NOMBRE             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  CAMPOS_READONLY    ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) + '       ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  HABILITA_INSERTAR  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  HABILITA_MODIFICAR ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  HABILITA_ELIMINAR  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  ACTIVO             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  TAG_INFO           ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('  PRIMARY KEY (CODIGO_PERFIL, TABLA) '                           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Permiso_Tabla).Fk[1], 'CODIGO_PERFIL', Retornar_Info_Tabla(Id_Perfil).Name, 'CODIGO_PERFIL') + ' ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ) '                                                                   );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E:Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Tabla', Retornar_Info_Tabla(Id_Permiso_Tabla).Name, 'Origen', 'Create_Tabla_Permiso_Tabla']);
      End;
    End;
  End;
End;

end.
