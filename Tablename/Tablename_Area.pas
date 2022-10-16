unit Tablename_Area;

interface

Function Create_Tabla_Area : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Area : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Area).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Area).Name + ' '               );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                   );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_AREA       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      GRAFICO           ' + gVariableGlobal.CNX.Return_Type(TYPE_IMAGE  ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO          ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_AREA) '                                   + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) ');
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Area', 'Tabla', Retornar_Info_Tabla(Id_Area).Name]);
      End;
    End;
  End;
End;

end.

