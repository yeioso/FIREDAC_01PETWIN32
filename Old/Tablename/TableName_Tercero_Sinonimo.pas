unit TableName_Tercero_Sinonimo;

interface

Function Create_Tabla_Tercero_Sinonimo : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Tercero_Sinonimo : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name    + '  ' );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                     );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_TERCERO      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_SINONIMO     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DIGITO_VERIFICACION ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE              ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DIRECCION           ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TELEFONO            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      EMAIL               ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      WEBSITE             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_MUNICIPIO    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (005) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ACTIVO           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_DOCUMENTO      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (005) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_PERSONA        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_REGIMEN        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      GRAN_CONTRIBUYENTE  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      AUTORETENEDOR       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ACTIVIDAD_ECONOMICA ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO            ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_TERCERO, CODIGO_SINONIMO) '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Fk[1], 'CODIGO_TERCERO'  , Retornar_Info_Tabla(Id_Tercero  ).Name, 'CODIGO_TERCERO'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Fk[2], 'CODIGO_MUNICIPIO', Retornar_Info_Tabla(Id_Municipio).Name, 'CODIGO_MUNICIPIO') + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) '                                                                   );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Tercero_Sinonimo', 'Tabla',  Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name]);
      End;
    End;
  End;
End;

end.
