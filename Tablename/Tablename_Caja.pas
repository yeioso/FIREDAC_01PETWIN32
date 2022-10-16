unit TableName_Caja;

interface

Function Create_Tabla_Caja : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Caja : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Caja).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Caja).Name + ' '               );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                   );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_USUARIO    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ESTACION_APERTURA ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA_APERTURA    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      HORA_APERTURA     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ESTACION_CIERRE   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA_CIERRE      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      HORA_CIERRE       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ABIERTA        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_CERRADA        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_BASE        ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_TRM         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_BASE_TRM    ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DETALLE           ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      OBSERVACIONES     ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO       ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '          + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_USUARIO, FECHA)  '                        + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Caja).Fk[1], 'CODIGO_USUARIO', Retornar_Info_Tabla(Id_Usuario).Name, 'CODIGO_USUARIO') + ' ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) '                                                                 );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Caja', 'Tabla', Retornar_Info_Tabla(Id_Caja).Name]);
      End;
    End;
  End;
End;

end.

