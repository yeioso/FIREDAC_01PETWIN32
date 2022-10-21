unit Tablename_Producto_Tercero;

interface

Function Create_Tabla_Producto_Tercero : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Producto_Tercero : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Producto_Tercero).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Producto_Tercero).Name + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                 );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PRODUCTO  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_TERCERO   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DOCUMENTO_VENTA  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DOCUMENTO_COMPRA ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO         ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + '  '     + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_PRODUCTO, CODIGO_TERCERO) '             + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto_Tercero).Fk[1], 'CODIGO_PRODUCTO', Retornar_Info_Tabla(Id_Producto).Name, 'CODIGO_PRODUCTO') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto_Tercero).Fk[2], 'CODIGO_TERCERO' , Retornar_Info_Tabla(Id_Tercero ).Name, 'CODIGO_TERCERO' ) + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   )  '                                                                 );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Producto_Tercero' , 'Tabla', Retornar_Info_Tabla(Id_Producto_Tercero).Name]);
      End;
    End;
  End;
End;

end.
