unit Tablename_Documento_Receta;

interface

Function Create_Tabla_Documento_Receta(pId_Tabla, pEnc : Integer) : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Documento_Receta(pId_Tabla, pEnc : Integer) : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(pId_Tabla).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(pId_Tabla).Name  + '  '              );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                      );
      gVariableGlobal.CNX.TMP.SQL.Add('      DATAKEY         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)'       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CONSECUTIVO     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (003)'       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PRODUCTO ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)'       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRODUCTO_PADRE  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)'       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NUMERO_UNIDADES ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +                  ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100)'       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      OBSERVACION     ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) +                  ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_RECETA       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)'       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO        ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + '  '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (DATAKEY, CONSECUTIVO, CODIGO_PRODUCTO, PRODUCTO_PADRE) , ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Tabla).Fk[1], 'CODIGO_PRODUCTO', Retornar_Info_Tabla(Id_Producto).Name, 'CODIGO_PRODUCTO') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Tabla).Fk[2], 'PRODUCTO_PADRE' , Retornar_Info_Tabla(Id_Producto).Name, 'CODIGO_PRODUCTO') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Tabla).Fk[3], 'DATAKEY'        , Retornar_Info_Tabla(pEnc       ).Name, 'DATAKEY'        ) + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   )  '                                                                  );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Documento_Receta', 'Tabla', Retornar_Info_Tabla(pId_Tabla).Name]);
      End;
    End;
  End;
End;

end.