unit TableName_Documento_Det;

interface

Function Create_Tabla_Documento_Det(pId_Master, pId_Detalle : Integer) : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Documento_Det(pId_Master, pId_Detalle : Integer) : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(pId_Detalle).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(pId_Detalle).Name + ' '                          );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                                  );
      gVariableGlobal.CNX.TMP.SQL.Add('      DATAKEY               ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020 )'           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CONSECUTIVO           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (003) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_DOCUMENTO        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (003) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NUMERO_DOCUMENTO      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_BARRAS         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (100) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PRODUCTO       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PRODUCTO_LP    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (010) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_CENTRO_COSTOS  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_IMPUESTO       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (004) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE                ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (100) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      OBSERVACION           ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT    ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA_TRM             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (010)'            + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_USUARIO        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)'            + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_VENDEDOR       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)'            + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA                 ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (010)'            + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      HORA                  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (010)'            + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_REFERENCIA       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (003) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NUMERO_REFERENCIA     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DATAKEY_REFERENCIA    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_REFERENCIA      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_LP_ENC          ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_LP_DET          ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_BASE             ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_IVA              ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_RETEIVA          ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_RETEFUENTE       ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_ICA              ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_IMPCONSUMO       ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_SERVICIO         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_DESCUENTO        ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_CREE             ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_INTERES          ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CANTIDAD              ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_ORIGINAL        ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_INICIAL         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_BASE            ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_BASICO          ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_CALCULADO       ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_UNITARIO        ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_FLETE           ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_IVA             ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_RETEIVA         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_RETEFUENTE      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_ICA             ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_IMPCONSUMO      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_SERVICIO        ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_DESCUENTO       ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_CREE            ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_INTERES         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_SUBTOTAL        ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_NETO            ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_TOTAL           ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_TRM             ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TOTAL_TRM             ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ACTUALIZADO        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ENLAZADO           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_IMPRESO            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ANULADO            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ESTADO             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_CAMBIO             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_RESTAR             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_KARDEX             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_COMANDA            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      INFO_COMANDA          ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT    ) + '       '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA_VENCIMIENTO     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (010)'            + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CONSECUTIVO_AUX       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (003) '           + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO              ' + gVariableGlobal.CNX.Return_Type(TYPE_INT     ) + ' '                 + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (DATAKEY, CONSECUTIVO) '                                         + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Detalle).Fk[1], 'DATAKEY'             , Retornar_Info_Tabla(pId_Master      ).Name, 'DATAKEY'             ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Detalle).Fk[2], 'CODIGO_PRODUCTO'     , Retornar_Info_Tabla(Id_Producto     ).Name, 'CODIGO_PRODUCTO'     ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Detalle).Fk[3], 'CODIGO_IMPUESTO'     , Retornar_Info_Tabla(Id_Impuesto     ).Name, 'CODIGO_IMPUESTO'     ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Detalle).Fk[4], 'CODIGO_USUARIO'      , Retornar_Info_Tabla(Id_Usuario      ).Name, 'CODIGO_USUARIO'      ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Detalle).Fk[5], 'CODIGO_PRODUCTO_LP'  , Retornar_Info_Tabla(Id_Producto_LP  ).Name, 'CODIGO_PRODUCTO_LP'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Detalle).Fk[6], 'CODIGO_CENTRO_COSTOS', Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Detalle).Fk[7], 'CODIGO_VENDEDOR'     , Retornar_Info_Tabla(Id_Tercero      ).Name, 'CODIGO_TERCERO'      ) + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) '                                                                                   );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Documento_Det,', 'Tabla', Retornar_Info_Tabla(pId_Detalle).Name]);
      End;
    End;
  End;
End;

end.
