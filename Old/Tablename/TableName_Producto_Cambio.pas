unit TableName_Producto_Cambio;

interface
Uses
  UtConexion;

Function Create_Tabla_Producto_Cambio : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  
  UtException,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Producto_Cambio : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Producto_Cambio).Name, 'Create_Tabla_Producto_Cambio') then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Producto_Cambio).Name + '  '   );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                   );
      gVariableGlobal.CNX.TMP.SQL.Add('      DATAKEY           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DATAKEY_FACTURA   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CONSECUTIVO       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (003) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRODUCTO_ORIGINAL ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_ORIGINAL    ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRODUCTO_CAMBIO   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CANTIDAD          ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_UNITARIO    ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TOTAL             ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ACTUALIZADO    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_USUARIO    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      HORA              ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO          ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (DATAKEY) '                                       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Producto_Cambio).Fk[1], 'DATAKEY_FACTURA'  , Retornar_Info_Tabla(Id_Documento_Enc).Name, 'DATAKEY'        ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Producto_Cambio).Fk[2], 'PRODUCTO_ORIGINAL', Retornar_Info_Tabla(Id_Producto     ).Name, 'CODIGO_PRODUCTO') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Producto_Cambio).Fk[3], 'PRODUCTO_CAMBIO'  , Retornar_Info_Tabla(Id_Producto     ).Name, 'CODIGO_PRODUCTO') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + FOREINGKEY(Retornar_Info_Tabla(Id_Producto_Cambio).Fk[4], 'CODIGO_USUARIO'   , Retornar_Info_Tabla(Id_Usuario      ).Name, 'CODIGO_USUARIO' ) + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) '                                                                   );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        Ingresar_Inconsistencias(E, MessageError(IE_ERROR_CREATE) + ' Tabla ' + Retornar_Info_Tabla(Id_Producto_Cambio).Name, 'Create_Tabla_Producto_Cambio');
      End;
    End;
  End;
End;

end.
