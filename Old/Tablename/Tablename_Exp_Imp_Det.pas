unit Tablename_Exp_Imp_Det;

interface

Function Create_Tabla_Exp_Imp_Det : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Exp_Imp_Det : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Exp_Imp_Det).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Exp_Imp_Det).Name + ' '        );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                   );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_EXP_IMP    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (002) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CAMPO             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_PRIMARY_KEY    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      EQUIVALENCIA      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ORDEN             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (003) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      LONGITUD          ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ALINEACION        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CARACTER          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CONSTANTE         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      SUSTITUTO_OLD     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      SUSTITUTO_NEW     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO          ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_EXP_IMP, CAMPO) '                         + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Exp_Imp_Det).Fk[1], 'CODIGO_EXP_IMP', Retornar_Info_Tabla(Id_Exp_Imp_Enc).Name, 'CODIGO_EXP_IMP') + ' ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) ');
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Exp_Imp_Det', 'Tabla',  Retornar_Info_Tabla(Id_Exp_Imp_Det).Name]);
      End;
    End;
  End;
End;

end.
