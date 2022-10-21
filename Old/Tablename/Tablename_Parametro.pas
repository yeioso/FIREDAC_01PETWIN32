unit Tablename_Parametro;

interface
Function Create_Tabla_Parametro : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Parametro : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Parametro).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Parametro).Name + ' '             );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                      );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PERIODO       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE               ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      ID_EMPRESA           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE_EMPRESA       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DIRECCION_EMPRESA    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TELEFONO_EMPRESA     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      MUNICIPIO_EMPRESA    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DEPARTAMENTO_EMPRESA ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PAIS_EMPRESA         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      ENCABEZADO           ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PIE_PAGINA           ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) + ' '       + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      ID_STOCK             ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ABRIR_CAJA        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_CORTAR_TIRILLA    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_AGRUPAR_PRODUCTO  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_F_VENCIMIENTO     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_FORMATO_TIRILLA   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_CODIGO_PRODUCTO   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_CODIGO_BARRAS     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_COMANDA_FACTURA   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_PEDIR_VENDEDOR    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DIAS_PREAVISO        ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      VALOR_DOMICILIO      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT   ) + ' '      + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE_FUENTE        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAMANO_FUENTE        ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAMANO_LINEA         ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      IMPRESORA            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      ID_MONEDA            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ORDEN_Z           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      ID_VENDEDOR          ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_PRODUCTO          ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_DECIMALES         ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_DECIMALES_TRM     ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      MARGEN_UTILIDAD      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_CODIGO_BARRAS   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      DOCUMENTO_FACTURA    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DOCUMENTO_COMPRA     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_IMPRESORA       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUERTO_IMPRESORA     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE_IMPRESORA     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (255) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ELEGIR_IMPRESORA '  + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ORDEN_TOTALES '     + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (010) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      ID_IMAGEN_VENTAS     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_IMAGEN_COMPRAS    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      IMAGEN_WIDTH         ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      IMAGEN_HEIGHT        ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      FONT_SIZE_A          ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FONT_SIZE_B          ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      NUMEROS_COMANDAS     ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_COMANDA_DETALLE   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      ID_CAMPO_DETALLE     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FRANQUICIA           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_RECEPTOR      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_FUERZA_VENTA      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      HORAS_RESUMEN_CAJA   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      ID_CAPTURA_RAPIDA     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_CALCULAR_COMPRA_RC ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_BUSQUEDA_C_N '       + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_CAPTURA_RESUMIDA '   + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_SINCRONIZAR_VISTAS ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_CONTROL_KARDEX '     + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      LOGOTIPO '              + gVariableGlobal.CNX.Return_Type(TYPE_IMAGE  ) + ' '       + ', ');

      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO '              + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_PERIODO) '                                    + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) ');
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Parametro', 'Tabla', Retornar_Info_Tabla(Id_Parametro).Name]);
      End;
    End;
  End;
End;

end.





