unit TableName_Producto_Baja;

interface

Function Create_Tabla_Producto_Baja : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Producto_Baja : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Producto_Baja).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Producto_Baja).Name + '  '      );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                    );
      gVariableGlobal.CNX.TMP.SQL.Add('      DATAKEY            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PRODUCTO    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CANTIDAD           ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ACTUALIZADO     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_RESPONSABLE ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_USUARIO     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA              ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      HORA               ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      OBSERVACION        ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO           ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (DATAKEY) '                                        + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto_Baja).Fk[1], 'CODIGO_PRODUCTO'   , Retornar_Info_Tabla(Id_Producto).Name, 'CODIGO_PRODUCTO') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto_Baja).Fk[2], 'CODIGO_RESPONSABLE', Retornar_Info_Tabla(Id_Usuario ).Name, 'CODIGO_USUARIO' ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto_Baja).Fk[3], 'CODIGO_USUARIO'    , Retornar_Info_Tabla(Id_Usuario ).Name, 'CODIGO_USUARIO' ) + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) '                                                                  );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Producto_Baja', 'Tabla',  Retornar_Info_Tabla(Id_Producto_Baja).Name]);
      End;
    End;
  End;
End;

end.
