unit Tablename_Exp_Imp_Enc;

interface

Function Create_Tabla_Exp_Imp_Enc : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Exp_Imp_Enc : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Exp_Imp_Enc).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Exp_Imp_Enc).Name + ' '         );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                    );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_EXP_IMP     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (002) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ORIGEN_DATOS       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (003) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ESTRUCTURA         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DELIMITADOR        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ORIGEN             ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DESTINO            ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DATASOURCE_ORIGEN  ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DATASOURCE_DESTINO ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      RESUMEN            ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO           ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_EXP_IMP) '                                 + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) ');
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Exp_Imp_Enc', 'Tabla', Retornar_Info_Tabla(Id_Exp_Imp_Enc).Name]);
      End;
    End;
  End;
End;

end.
