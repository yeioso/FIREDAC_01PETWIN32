unit TableName_Perfil;

interface

Procedure Ingresar_Registro_Perfil;
Function Create_Tabla_Perfil : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtFunciones,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Perfil : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Perfil).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Perfil).Name + ' '         );
      gVariableGlobal.CNX.TMP.SQL.Add('   (                                                                  ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PERFIL ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO      ' + gVariableGlobal.CNX.Return_Type(TYPE_INT     ) + '       ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_PERFIL) '                                  );
      gVariableGlobal.CNX.TMP.SQL.Add('   )                                                                 ');
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E: Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Tabla', Retornar_Info_Tabla(Id_Perfil).Name, 'Origen', 'Create_Tabla_Perfil']);
      End;
    End;
  End;
End;

Procedure Ingresar_Registro_Perfil;
Var
  lSQL : TQuery;
Begin
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Perfil).Name + ' ');
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount <= 0) Then
    Begin
      lSQL.Append;
      lSQL.FieldByName('CODIGO_PERFIL').AsString := Justificar('0', '0', lSQL.FieldByName('CODIGO_PERFIL').Size);
      lSQL.FieldByName('NOMBRE'       ).AsString := 'NO ESTABLECIDO';
      lSQL.Post;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'Tablename_Perfil, Ingresar_Registro_Perfil']);
  End;
End;

end.
