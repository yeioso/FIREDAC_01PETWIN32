unit TableName_Producto_Observacion;

interface

Function Create_Tabla_Producto_Observacion : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Producto_Observacion : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Producto_Observacion).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Producto_Observacion).Name + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                     );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_OBSERVACION  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PRODUCTO     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE              ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO            ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_OBSERVACION) '                              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto_Observacion).Fk[01], 'CODIGO_PRODUCTO', Retornar_Info_Tabla(Id_Producto).Name, 'CODIGO_PRODUCTO') + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) '                                                                      );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Producto_Observacion', 'Tabla',  Retornar_Info_Tabla(Id_Producto_Observacion).Name]);
      End;
    End;
  End;
End;

end.
