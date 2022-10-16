unit TableName_Comprobante;

interface

Function Create_Tabla_Comprobante : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Comprobante : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Comprobante).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Comprobante).Name + '  '       );
      gVariableGlobal.CNX.TMP.SQL.Add('   (   '                                                                  );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_COMPROBANTE ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + '(100)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ACTIVO          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + '(001)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO           ' + gVariableGlobal.CNX.Return_Type(TYPE_INT     ) + '     ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_COMPROBANTE) '                            + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   )  '                                                                   );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Comprobante', 'Tabla',  Retornar_Info_Tabla(Id_Comprobante).Name]);
      End;
    End;
  End;
End;

end.
