unit TableName_Producto_LP;

interface

Function Create_Tabla_Producto_LP : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Producto_LP : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Producto_LP).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Producto_LP).Name + '  '         );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                     );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PRODUCTO_LP  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PRODUCTO     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE              ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_LP             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      RANGO_INICIAL       ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      RANGO_FINAL         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      IMPUESTO_COMPRA     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      IMPUESTO_VENTA      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_ORIGINAL      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORCENTAJE_UTILIDAD ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_VENTA         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO            ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_PRODUCTO_LP) '                              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto_LP).Fk[01], 'CODIGO_PRODUCTO', Retornar_Info_Tabla(Id_Producto).Name, 'CODIGO_PRODUCTO') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto_LP).Fk[02], 'IMPUESTO_COMPRA', Retornar_Info_Tabla(Id_Impuesto).Name, 'CODIGO_IMPUESTO') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto_LP).Fk[03], 'IMPUESTO_VENTA' , Retornar_Info_Tabla(Id_Impuesto).Name, 'CODIGO_IMPUESTO') + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) '                                                                      );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Producto_LP', 'Tabla',  Retornar_Info_Tabla(Id_Producto_LP).Name]);
      End;
    End;
  End;
End;

end.
