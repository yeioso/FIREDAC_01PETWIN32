unit Tablename_Usuario_Comanda;

interface

Function Create_Tabla_Usuario_Comanda : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Usuario_Comanda : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Usuario_Comanda).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Usuario_Comanda).Name + ' ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ( '                                                                );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_USUARIO '  + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_ENVIO '      + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(001)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_COMANDA '    + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(001)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_IMPRESION '  + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(001)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_GENERACION ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(001)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO '        + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '     + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_USUARIO) '                            + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Usuario_Comanda).Fk[1], 'CODIGO_USUARIO', Retornar_Info_Tabla(Id_Usuario).Name, 'CODIGO_USUARIO') + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) '                                                                );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E: Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Usuario_Comanda', 'Tabla',  Retornar_Info_Tabla(Id_Usuario_Comanda).Name]);
      End;
    End;
  End;
End;

end.
