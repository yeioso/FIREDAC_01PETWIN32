unit UtUpdateFields;

interface

Procedure Verificacion_Estructura_Tablas;

implementation
Uses
  Classes,
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtVariablesGlobales;

Function Exist_Field(pTable, pField : String) : Boolean;
Var
  lI : Integer;
  lLista : TStringList;
Begin
  Result := False;
  lLista := gVariableGlobal.CNX.LoadFieldsnames(pTable);
  lI := 0;
  While (lI < lLista.Count) And (Not Result) Do
  Begin
    Result := Trim(UpperCase(pField)) = Trim(UpperCase(lLista[lI]));
    Inc(lI);
  End;
  lLista.Free;
End;

Procedure Actualizar_Estructura(pTable, pField : String; pType : TTIPO_CAMPO; pSize : Integer);
Var
  lTexto : String;
Begin
  If Not Exist_Field(pTable, pField) Then
  Begin
    Try
      gVariableGlobal.CNX.TMP.Active := False;
      gVariableGlobal.CNX.TMP.SQL.Clear;
      If pSize <= 0 Then
        lTexto := 'ALTER TABLE ' + pTable + ' ADD ' + pField + ' '+ gVariableGlobal.CNX.Return_Type(pType) + ' '
      Else
        lTexto := 'ALTER TABLE ' + pTable + ' ADD ' + pField + ' '+ gVariableGlobal.CNX.Return_Type(pType) + '(' + IntToStr(pSize) + ')';
      gVariableGlobal.CNX.TMP.SQL.Add(lTexto);
      gVariableGlobal.CNX.TMP.ExecSQL;
      gVariableGlobal.CNX.TMP.Active := False;
      gVariableGlobal.CNX.TMP.SQL.Clear;
    Except
      On E : Exception Do
        gVariableGlobal.Add_Log(E, ['Origen', 'Actualizar_Estructura', 'Instruccion', lTexto]);
    End;
  End;
End;

Procedure Verificacion_Estructura_Tablas;
Begin
  If (Not Assigned(gVariableGlobal.CNX)) Or (Not gVariableGlobal.CNX.Connected) Then
    Exit;

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Caja             ).Name, 'ESTACION_APERTURA'   , TYPE_VARCHAR, 100);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Caja             ).Name, 'FECHA_APERTURA'      , TYPE_VARCHAR, 010);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Caja             ).Name, 'HORA_APERTURA'       , TYPE_VARCHAR, 010);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Caja             ).Name, 'ESTACION_CIERRE'     , TYPE_VARCHAR, 100);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Caja             ).Name, 'FECHA_CIERRE'        , TYPE_VARCHAR, 010);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Caja             ).Name, 'HORA_CIERRE'         , TYPE_VARCHAR, 010);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Impuesto         ).Name, 'PORC_BASE'           , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto         ).Name, 'ID_FACTURABLE'       , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto         ).Name, 'ID_INSUMO'           , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto         ).Name, 'FECHA_VENCIMIENTO'   , TYPE_VARCHAR, 010);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto         ).Name, 'MARGEN_UTILIDAD'     , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto         ).Name, 'ID_FECHA_VENCIMIENTO', TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto         ).Name, 'IMAGE_BARCODE'       , TYPE_IMAGE  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto         ).Name, 'ID_IMPRIMIR_BARCODE' , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto         ).Name, 'ID_VENTA'            , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto         ).Name, 'ID_COMPRA'           , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto         ).Name, 'EXTENSION_GRAFICO'   , TYPE_VARCHAR, 005);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto         ).Name, 'CODIGO_PROVEEDOR'    , TYPE_VARCHAR, 020);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto         ).Name, 'CANTIDAD_PROPUESTA'  , TYPE_FLOAT  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto_Baja    ).Name, 'CODIGO_RESPONSABLE'  , TYPE_VARCHAR, 020);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto_Baja    ).Name, 'OBSERVACION'         , TYPE_TEXT   , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'VALOR_PAGADO'        , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'VALOR_VUELTO'        , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'ID_DESCARGADO'       , TYPE_VARCHAR, 001);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'VALOR_PAGADO'        , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'VALOR_VUELTO'        , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'ID_DESCARGADO'       , TYPE_VARCHAR, 001);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'DISCRIMINADOS'       , TYPE_TEXT   , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'TDD_VAUCHE'          , TYPE_VARCHAR, 020);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'TDC_VAUCHE'          , TYPE_VARCHAR, 020);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'TRANSF'              , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'TRANSF_TRM'          , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'TRANSF_ENTIDAD'      , TYPE_VARCHAR, 020);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'TRANSF_VAUCHE'       , TYPE_VARCHAR, 020);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'SISTEMA_CREDITO'     , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'SISTEMA_CREDITO_TRM' , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'CODIGO_DOCUMENTO_ADM', TYPE_VARCHAR, 004);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'DOCUMENTO_COMANDA'   , TYPE_VARCHAR, 020);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'INFO_COMANDA'        , TYPE_TEXT   , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'TOTAL_CON_DOMICILIO' , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'VALOR_BRUTO'        , TYPE_FLOAT  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'DISCRIMINADOS'       , TYPE_TEXT   , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'TDD_VAUCHE'          , TYPE_VARCHAR, 020);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'TDC_VAUCHE'          , TYPE_VARCHAR, 020);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'TRANSF'              , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'TRANSF_TRM'          , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'TRANSF_ENTIDAD'      , TYPE_VARCHAR, 020);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'TRANSF_VAUCHE'       , TYPE_VARCHAR, 020);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'SISTEMA_CREDITO'     , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'SISTEMA_CREDITO_TRM' , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'CODIGO_DOCUMENTO_ADM', TYPE_VARCHAR, 004);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'DOCUMENTO_COMANDA'   , TYPE_VARCHAR, 020);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'INFO_COMANDA'        , TYPE_TEXT   , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'TOTAL_CON_DOMICILIO' , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'VALOR_BRUTO'        , TYPE_FLOAT  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'CUFE'                , TYPE_VARCHAR, 255);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'CUFE'                , TYPE_VARCHAR, 255);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'QR'                  , TYPE_IMAGE  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'QR'                  , TYPE_IMAGE  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'VALOR_BASE'          , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'VALOR_BASE'          , TYPE_FLOAT  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'VALOR_NETO'          , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'VALOR_NETO'          , TYPE_FLOAT  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'DATAKEY_REFERENCIA'  , TYPE_VARCHAR, 020);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'DATAKEY_REFERENCIA'  , TYPE_VARCHAR, 020);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'SALDO_PENDIENTE'     , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'SALDO_PENDIENTE'     , TYPE_FLOAT  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'VALOR_DOMICILIO'     , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'VALOR_DOMICILIO'     , TYPE_FLOAT  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'VALOR_INICIAL'       , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'VALOR_INICIAL'       , TYPE_FLOAT  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'ID_PROPINA'          , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'ID_PROPINA'          , TYPE_VARCHAR, 001);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'DATAKEY_REFERENCIA'  , TYPE_VARCHAR, 020);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'DATAKEY_REFERENCIA'  , TYPE_VARCHAR, 020);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'ID_KARDEX'           , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'ID_KARDEX'           , TYPE_VARCHAR, 001);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'FECHA_VENCIMIENTO'   , TYPE_VARCHAR, 010);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'FECHA_VENCIMIENTO'   , TYPE_VARCHAR, 010);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'CONSECUTIVO_AUX'     , TYPE_VARCHAR, 003);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'CONSECUTIVO_AUX'     , TYPE_VARCHAR, 003);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'PORC_BASE'           , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'PORC_BASE'           , TYPE_FLOAT  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'VALOR_BASE'          , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'VALOR_BASE'          , TYPE_FLOAT  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'VALOR_BASICO'        , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'VALOR_BASICO'        , TYPE_FLOAT  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'ID_RESTAR'           , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'ID_RESTAR'           , TYPE_VARCHAR, 001);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'CODIGO_VENDEDOR'     , TYPE_VARCHAR, 020);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'CODIGO_VENDEDOR'     , TYPE_VARCHAR, 020);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'CODIGO_IMPUESTO'     , TYPE_VARCHAR, 004);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'CODIGO_IMPUESTO'     , TYPE_VARCHAR, 004);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'EXISTENCIA'          , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'EXISTENCIA'          , TYPE_FLOAT  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'VALOR_INICIAL'       , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'VALOR_INICIAL'       , TYPE_FLOAT  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'ID_COMANDA'          , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'ID_COMANDA'          , TYPE_VARCHAR, 001);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'INFO_COMANDA'        , TYPE_TEXT   , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'INFO_COMANDA'        , TYPE_TEXT   , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'ID_IMPRESO'          , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'ID_IMPRESO'          , TYPE_VARCHAR, 001);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'VALOR_BRUTO'         , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'VALOR_BRUTO'         , TYPE_FLOAT  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'NOMBRE_FUENTE'       , TYPE_VARCHAR, 050);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'TAMANO_FUENTE'       , TYPE_INT    , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'TAMANO_LINEA'        , TYPE_INT    , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'IMPRESORA'           , TYPE_VARCHAR, 050);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_F_VENCIMIENTO'    , TYPE_VARCHAR, 010);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_FORMATO_TIRILLA'  , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_CODIGO_PRODUCTO'  , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_CODIGO_BARRAS'    , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_COMANDA_FACTURA'  , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'MARGEN_UTILIDAD'     , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'TIPO_CODIGO_BARRAS'  , TYPE_VARCHAR, 050);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_IMAGEN_VENTAS'    , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_IMAGEN_COMPRAS'   , TYPE_VARCHAR, 001);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'IMAGEN_WIDTH'        , TYPE_INT    , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'IMAGEN_HEIGHT'       , TYPE_INT    , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'DOCUMENTO_FACTURA'    , TYPE_VARCHAR, 050);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'DOCUMENTO_COMPRA'     , TYPE_VARCHAR, 050);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'TIPO_IMPRESORA'       , TYPE_VARCHAR, 050);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'PUERTO_IMPRESORA'     , TYPE_VARCHAR, 050);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_CAMPO_DETALLE'     , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'FRANQUICIA'           , TYPE_VARCHAR, 100);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'CODIGO_RECEPTOR'      , TYPE_VARCHAR, 020);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_FUERZA_VENTA'      , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'HORAS_RESUMEN_CAJA'   , TYPE_VARCHAR, 100);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'DIAS_PREAVISO'        , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_CAPTURA_RAPIDA'    , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_CALCULAR_COMPRA_RC', TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_BUSQUEDA_C_N'      , TYPE_VARCHAR, 001);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_CAPTURA_RESUMIDA'  , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_PEDIR_VENDEDOR'    , TYPE_VARCHAR, 001);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'NOMBRE_IMPRESORA'     , TYPE_VARCHAR, 255);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'FONT_SIZE_A'          , TYPE_INT    , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'FONT_SIZE_B'          , TYPE_INT    , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'NUMEROS_COMANDAS'     , TYPE_INT    , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_COMANDA_DETALLE'   , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'VALOR_DOMICILIO'      , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_SINCRONIZAR_VISTAS', TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_CONTROL_KARDEX'    , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_ELEGIR_IMPRESORA'  , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Parametro        ).Name, 'ID_ORDEN_TOTALES'     , TYPE_VARCHAR, 010);


  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Adm    ).Name, 'IMPRESORA'           , TYPE_VARCHAR, 100);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Documento_Adm    ).Name, 'NRO_COPIAS'          , TYPE_INT    , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Cargo            ).Name, 'ORDEN'               , TYPE_VARCHAR, 004);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Linea            ).Name, 'ID_MOSTRAR'          , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Linea            ).Name, 'GRAFICO'             , TYPE_IMAGE  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Zona             ).Name, 'EXTENSION_PLANO'     , TYPE_VARCHAR, 005);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Zona             ).Name, 'EXTENSION_DISPONIBLE', TYPE_VARCHAR, 005);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Zona             ).Name, 'EXTENSION_OCUPADA'   , TYPE_VARCHAR, 005);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Zona             ).Name, 'EXTENSION_RESERVADA' , TYPE_VARCHAR, 005);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Zona             ).Name, 'ID_OCULTAR_POS'      , TYPE_VARCHAR, 001);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Subgrupo         ).Name, 'ID_MOSTRAR'          , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Subgrupo         ).Name, 'GRAFICO'             , TYPE_IMAGE  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Usuario          ).Name, 'EMAIL'               , TYPE_VARCHAR, 100);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Espacio          ).Name, 'TOTAL'               , TYPE_FLOAT  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto_LP      ).Name, 'IMPUESTO_COMPRA'     , TYPE_VARCHAR, 004);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto_LP      ).Name, 'IMPUESTO_VENTA'      , TYPE_VARCHAR, 004);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Tercero_Sinonimo ).Name, 'TIPO_DOCUMENTO'      , TYPE_VARCHAR, 005);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Tercero_Sinonimo ).Name, 'TIPO_PERSONA'        , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Tercero_Sinonimo ).Name, 'DIGITO_VERIFICACION' , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Tercero_Sinonimo ).Name, 'TIPO_REGIMEN'        , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Tercero_Sinonimo ).Name, 'GRAN_CONTRIBUYENTE'  , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Tercero_Sinonimo ).Name, 'AUTORETENEDOR'       , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Tercero_Sinonimo ).Name, 'ACTIVIDAD_ECONOMICA' , TYPE_VARCHAR, 004);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Hoja_Inventario  ).Name, 'CANTIDAD_NOTASDB'    , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Hoja_Inventario  ).Name, 'CANTIDAD_NOTASCR'    , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Hoja_Inventario  ).Name, 'CANTIDAD_ANULADOS'   , TYPE_FLOAT  , 000);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Tercero          ).Name, 'PORCENTAJE_COMISION' , TYPE_FLOAT  , 000);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Tercero          ).Name, 'ID_VENDEDOR_PPAL'    , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Tercero_Contacto ).Name, 'ID_TRATAMIENTO'      , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Usuario          ).Name, 'ID_USUARIO_PPAL'     , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Usuario          ).Name, 'ID_ADMIN'            , TYPE_VARCHAR, 001);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Linea            ).Name, 'ORDEN'               , TYPE_VARCHAR, 004);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Grupo            ).Name, 'ORDEN'               , TYPE_VARCHAR, 004);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Subgrupo         ).Name, 'ORDEN'               , TYPE_VARCHAR, 004);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto         ).Name, 'ORDEN'               , TYPE_VARCHAR, 004);

  Actualizar_Estructura(Retornar_Info_Tabla(Id_Producto         ).Name, 'ID_OCULTAR_DOCTO'    , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Espacio          ).Name, 'TIPO_ESPACIO'        , TYPE_VARCHAR, 001);
  Actualizar_Estructura(Retornar_Info_Tabla(Id_Usuario_Comanda  ).Name, 'TIPO_GENERACION'     , TYPE_VARCHAR, 001);

End;

end.
