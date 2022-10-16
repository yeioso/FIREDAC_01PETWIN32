unit TableName_Documento_Enc;
interface

Function Create_Tabla_Documento_Enc(pId_Tabla : Integer) : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Documento_Enc(pId_Tabla : Integer) : Boolean;
Begin
  Result := True;
  If Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(pId_Tabla).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(pId_Tabla).Name + '  '               );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                      );
      gVariableGlobal.CNX.TMP.SQL.Add('      DATAKEY              ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_CAPTURA         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (003)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_DOCUMENTO       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PREFIJO_DOCUMENTO    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NUMERO_DOCUMENTO     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DATAKEY_REFERENCIA   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ORIGEN_REFERENCIA    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (003)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DOCUMENTO_REFERENCIA ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_VENDEDOR      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_TERCERO       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_TERCERO_LP    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (002)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_SINONIMO      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_BASE          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_DOCUMENTO_ADM ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE               ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (100)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      GARANTIA             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (100)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA_DOCUMENTO      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (010)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PLAZO                ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + '      ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA_VENCIMIENTO    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (010)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_ESTACION      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (100)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DIRECCION            ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT    ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      OBSERVACION          ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT    ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ENCABEZADO           ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT    ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PIE_PAGINA           ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT    ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_ESPACIO       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_USUARIO       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA                ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (010)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      HORA                 ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (010)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_PREIMPRESO        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_IMPRESO           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ANULADO           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ACTUALIZADO       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_DESCARGADO        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_PROPINA           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (001)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NUMERO_PERSONAS      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_BRUTO          ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_BASE           ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_SUBTOTAL       ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_NETO           ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORCENTAJE_LP        ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_IVA             ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_RETEIVA         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_RETEFUENTE      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_ICA             ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_IMPCONSUMO      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_SERVICIO        ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_CREE            ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_DESCUENTO       ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      BASE_INTERES         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_INICIAL        ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_IVA            ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_RETEIVA        ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_RETEFUENTE     ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_ICA            ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_IMPCONSUMO     ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_DESCUENTO      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_SERVICIO       ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_CREE           ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_INTERES        ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_TOTAL          ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TOTAL_CON_DOMICILIO  ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_TRM            ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TOTAL_TRM            ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_DIVIDIDO       ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_PAGADO         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_VUELTO         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      EFE                  ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      EFE_TRM              ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TDD                  ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TDD_TRM              ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TDD_ENTIDAD          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TDD_VAUCHE           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TDC                  ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TDC_TRM              ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TDC_ENTIDAD          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TDC_VAUCHE           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CHE                  ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CHE_TRM              ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CHE_ENTIDAD          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      SDX                  ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      SDX_TRM              ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      COR                  ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      COR_TRM              ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TRANSF               ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TRANSF_TRM           ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TRANSF_ENTIDAD       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TRANSF_VAUCHE        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      SISTEMA_CREDITO      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      SISTEMA_CREDITO_TRM  ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CAR                  ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CAR_PAGADA           ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CAR_TRM              ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CAR_TRM_PAGADA       ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CAR_PLAZO            ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CAR_FECHAINI         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (010)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CAR_FECHAFIN         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (010)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CAR_DIAS_VENCIDOS    ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CAR_EDAD             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (010)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CAR_ESTADO_CARTERA   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (010)' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      SALDO_PENDIENTE      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_DOMICILIO      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      DISCRIMINADOS '        + gVariableGlobal.CNX.Return_Type(TYPE_TEXT    ) + ' '      + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      DOCUMENTO_COMANDA '    + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR ) + ' (020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      INFO_COMANDA '         + gVariableGlobal.CNX.Return_Type(TYPE_TEXT    ) + ' '      + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      QR                   ' + gVariableGlobal.CNX.Return_Type(TYPE_IMAGE  ) + '  '      + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CUFE                 ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (255) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO             ' + gVariableGlobal.CNX.Return_Type(TYPE_INT     ) + '      ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (DATAKEY) '                                          + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Tabla).Fk[01], 'CODIGO_VENDEDOR'     , Retornar_Info_Tabla(Id_Tercero      ).Name, 'CODIGO_TERCERO'      ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Tabla).Fk[02], 'CODIGO_USUARIO'      , Retornar_Info_Tabla(Id_Usuario      ).Name, 'CODIGO_USUARIO'      ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Tabla).Fk[03], 'CODIGO_TERCERO'      , Retornar_Info_Tabla(Id_Tercero      ).Name, 'CODIGO_TERCERO'      ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Tabla).Fk[04], 'CODIGO_BASE'         , Retornar_Info_Tabla(Id_Base         ).Name, 'CODIGO_BASE'         ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Tabla).Fk[05], 'CODIGO_ESPACIO'      , Retornar_Info_Tabla(Id_Espacio      ).Name, 'CODIGO_ESPACIO'      ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Tabla).Fk[06], 'TDD_ENTIDAD'         , Retornar_Info_Tabla(Id_Tercero      ).Name, 'CODIGO_TERCERO'      ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Tabla).Fk[07], 'TDC_ENTIDAD'         , Retornar_Info_Tabla(Id_Tercero      ).Name, 'CODIGO_TERCERO'      ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Tabla).Fk[08], 'CHE_ENTIDAD'         , Retornar_Info_Tabla(Id_Tercero      ).Name, 'CODIGO_TERCERO'      ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Tabla).Fk[09], 'TRANSF_ENTIDAD'      , Retornar_Info_Tabla(Id_Tercero      ).Name, 'CODIGO_TERCERO'      ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(pId_Tabla).Fk[10], 'CODIGO_DOCUMENTO_ADM', Retornar_Info_Tabla(Id_Documento_Adm).Name, 'CODIGO_DOCUMENTO_ADM') + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   )  '                                                                     );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Documento_Enc,', 'Tabla',  Retornar_Info_Tabla(pId_Tabla).Name]);
      End;
    End;
  End;
End;

end.

