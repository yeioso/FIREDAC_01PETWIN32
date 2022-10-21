unit TableName_Ajuste_Kardex;

interface

Function Create_Tabla_Ajuste_Kardex : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Ajuste_Kardex : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Ajuste_Kardex).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Ajuste_Kardex).Name + '  '       );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                     );
      gVariableGlobal.CNX.TMP.SQL.Add('      DATAKEY             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PRODUCTO     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE              ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ESTADO           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NUMERO_DOCUMENTO    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CANTIDAD_CALCULADA  ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CANTIDAD_FISICA     ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DIFERENCIA          ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      OBSERVACION         ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO            ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (DATAKEY, CODIGO_PRODUCTO) '                        + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Ajuste_Kardex).Fk[1], 'CODIGO_PRODUCTO', Retornar_Info_Tabla(Id_Producto).Name, 'CODIGO_PRODUCTO') + ' ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) '                                                                      );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Ajuste_Kardex', 'Tabla',  Retornar_Info_Tabla(Id_Ajuste_Kardex).Name]);
      End;
    End;
  End;
End;

end.
