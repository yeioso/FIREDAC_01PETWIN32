unit Tablename_Filtro;

interface

Function Create_Tabla_Filtro : Boolean;

implementation

Uses

  SysUtils,
  UtConexion,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Filtro : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Filtro).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Filtro).Name + '  '         );
      gVariableGlobal.CNX.TMP.SQL.Add('   (   '                                                               );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_FILTRO ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_TAG     ' + gVariableGlobal.CNX.Return_Type(TYPE_INT     ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CAMPO         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      SIGNOINI      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALORINI      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CONECTOR      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (003) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      SIGNOFIN      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALORFIN      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NUMERICO      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO      ' + gVariableGlobal.CNX.Return_Type(TYPE_INT     ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_FILTRO)  '                             + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) '                                                                 );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(e, ['Origen', 'Create_Tabla_Filtro', 'Tabla',  Retornar_Info_Tabla(Id_Filtro).Name]);
      End;
    End;
  End;
End;

end.

