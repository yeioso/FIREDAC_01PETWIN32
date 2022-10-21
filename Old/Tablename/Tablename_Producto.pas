unit TableName_Producto;

interface

Function Create_Tabla_Producto : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Producto : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Producto).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Producto).Name + ' '              );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                      );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_BODEGA        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (002)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_LINEA         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (002)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_GRUPO         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (002)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_SUBGRUPO      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (002)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PRODUCTO      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PROVEEDOR     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_BARRAS        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE               ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ORDEN                ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_COMPRA         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  )              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      MARGEN_UTILIDAD      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + ' '        + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_VENTA          ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  )              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_PREPARACION       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_RECETA            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_FACTURABLE        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_INSUMO            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_VENTA             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_COMPRA            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_OCULTAR_DOCTO  '    + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      ID_FECHA_VENCIMIENTO ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_IMPRIMIR_BARCODE  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      COSTO_CALCULADO      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  )              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_UTILIDAD        ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  )              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_PROPUESTO      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  )              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      IMPUESTO_COMPRA      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      IMPUESTO_VENTA       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRODUCTO_PADRE       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NUMERO_UNIDADES      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  )              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FECHA_VENCIMIENTO    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      STOCK_MINIMO         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  )              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      STOCK_MAXIMO         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  )              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CANTIDAD             ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  )              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CANTIDAD_PROPUESTA   ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  )              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      GRAFICO              ' + gVariableGlobal.CNX.Return_Type(TYPE_IMAGE  )              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      EXTENSION_GRAFICO    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (005)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      IMAGE_BARCODE        ' + gVariableGlobal.CNX.Return_Type(TYPE_IMAGE  )              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DESCRIPCION          ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   )              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_DEBITO           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_CREDITO          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_DEBITO        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_CREDITO       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_DEBITO         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_CREDITO        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO             ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    )              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_PRODUCTO) '                                   + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto).Fk[01], 'CODIGO_BODEGA'  , Retornar_Info_Tabla(Id_Bodega       ).Name, 'CODIGO_BODEGA'       ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto).Fk[02], 'CODIGO_LINEA'   , Retornar_Info_Tabla(Id_Linea        ).Name, 'CODIGO_LINEA'        ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto).Fk[03], 'CODIGO_GRUPO'   , Retornar_Info_Tabla(Id_Grupo        ).Name, 'CODIGO_GRUPO'        ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto).Fk[04], 'CODIGO_SUBGRUPO', Retornar_Info_Tabla(Id_Subgrupo     ).Name, 'CODIGO_SUBGRUPO'     ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto).Fk[05], 'IMPUESTO_COMPRA', Retornar_Info_Tabla(Id_Impuesto     ).Name, 'CODIGO_IMPUESTO'     ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto).Fk[06], 'IMPUESTO_VENTA' , Retornar_Info_Tabla(Id_Impuesto     ).Name, 'CODIGO_IMPUESTO'     ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto).Fk[07], 'PRODUCTO_PADRE' , Retornar_Info_Tabla(Id_Producto     ).Name, 'CODIGO_PRODUCTO'     ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto).Fk[08], 'PUC_DEBITO'     , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC'          ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto).Fk[09], 'PUC_CREDITO'    , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC'          ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto).Fk[10], 'CCOSTO_DEBITO'  , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto).Fk[11], 'CCOSTO_CREDITO' , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto).Fk[12], 'CPMTE_DEBITO'   , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Producto).Fk[13], 'CPMTE_CREDITO'  , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   )   '                                                                  );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Producto', 'Tabla',  Retornar_Info_Tabla(Id_Producto).Name]);
      End;
    End;
  End;
End;

end.

