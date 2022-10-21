unit TableName_Base;

interface
Function Create_Tabla_Base : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Base : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Base).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Base).Name + '  '              );
      gVariableGlobal.CNX.TMP.SQL.Add('   (   '                                                                   );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_BASE          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE               ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(100)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_IVA             ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_RETEIVA         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_RETEFUENTE      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_ICA             ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_IMPCONSUMO      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_SERVICIO        ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_CREE            ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_DESCUENTO       ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_INTERES         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO             ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_BASE) '                          +           '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   )  '                                                                    );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Base', 'Tabla',  Retornar_Info_Tabla(Id_Base).Name]);
      End;
    End;
  End;
End;

end.

