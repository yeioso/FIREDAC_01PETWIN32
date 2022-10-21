unit Tablename_Usuario;

interface

Function Create_Tabla_Usuario : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Usuario : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Usuario).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Usuario).Name + '  '          );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                  );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_USUARIO  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CONTRASENA      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DIRECCION       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TELEFONO_1      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TELEFONO_2      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      EMAIL           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PERFIL   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_SISTEMA      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_CAJERO       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_VENDEDOR     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_MESERO       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_USUARIO_PPAL ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ADMIN '        + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      GRAFICO         ' + gVariableGlobal.CNX.Return_Type(TYPE_IMAGE  ) + ' '        + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO        ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '        + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_USUARIO) '                               + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Usuario).Fk[1], 'CODIGO_PERFIL', Retornar_Info_Tabla(Id_Perfil).Name, 'CODIGO_PERFIL') + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   )                                                                                   ');
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E: Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Usuario', 'Tabla', Retornar_Info_Tabla(Id_Usuario).Name]);
      End;
    End;
  End;
End;

end.

