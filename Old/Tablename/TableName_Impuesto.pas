unit TableName_Impuesto;

interface

Function Create_Tabla_Impuesto : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Impuesto : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Impuesto).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Impuesto).Name + '  '           );
      gVariableGlobal.CNX.TMP.SQL.Add('   (   '                                                                   );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_IMPUESTO      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE               ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(100)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_BASE            ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_IVA             ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_RETEIVA         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_RETEFUENTE      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_ICA             ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_IMPCONSUMO      ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_DESCUENTO       ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_SERVICIO        ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_CREE            ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORC_INTERES         ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_SUBTOTAL_DB      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_SUBTOTAL_CR      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_IVA_DB           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_IVA_CR           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_RETEIVA_DB       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_RETEIVA_CR       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_RETEFUENTE_DB    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_RETEFUENTE_CR    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_ICA_DB           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_ICA_CR           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_IMPCONSUMO_DB    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_IMPCONSUMO_CR    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_SERVICIO_DB      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_SERVICIO_CR      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_CREE_DB          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_CREE_CR          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_DESCUENTO_DB     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_DESCUENTO_CR     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_TOTAL_DB         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_TOTAL_CR         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_INTERES_DB       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PUC_INTERES_CR       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_SUBTOTAL_DB   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_SUBTOTAL_CR   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_IVA_DB        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_IVA_CR        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_RETEIVA_DB    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_RETEIVA_CR    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_RETEFUENTE_DB ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_RETEFUENTE_CR ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_ICA_DB        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_ICA_CR        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_IMPCONSUMO_DB ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_IMPCONSUMO_CR ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_SERVICIO_DB   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_SERVICIO_CR   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_CREE_DB       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_CREE_CR       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_DESCUENTO_DB  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_DESCUENTO_CR  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_TOTAL_DB      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_TOTAL_CR      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_INTERES_DB    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CCOSTO_INTERES_CR    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(020)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_SUBTOTAL_DB    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_SUBTOTAL_CR    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_IVA_DB         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_IVA_CR         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_RETEIVA_DB     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_RETEIVA_CR     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_RETEFUENTE_DB  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_RETEFUENTE_CR  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_ICA_DB         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_ICA_CR         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_IMPCONSUMO_DB  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_IMPCONSUMO_CR  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_SERVICIO_DB    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_SERVICIO_CR    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_CREE_DB        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_CREE_CR        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_DESCUENTO_DB   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_DESCUENTO_CR   ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_TOTAL_DB       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_TOTAL_CR       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_INTERES_DB     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CPMTE_INTERES_CR     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + '(004)' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO             ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) +           ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_IMPUESTO) '                      +           '  ');
      gVariableGlobal.CNX.TMP.SQL.Add(',' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[01], 'PUC_SUBTOTAL_DB'     , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[02], 'PUC_SUBTOTAL_CR'     , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[03], 'PUC_IVA_DB'          , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[04], 'PUC_IVA_CR'          , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[05], 'PUC_RETEIVA_DB'      , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[06], 'PUC_RETEIVA_CR'      , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[07], 'PUC_RETEFUENTE_DB'   , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[08], 'PUC_RETEFUENTE_CR'   , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[09], 'PUC_ICA_DB'          , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[10], 'PUC_ICA_CR'          , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[11], 'PUC_IMPCONSUMO_DB'   , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[12], 'PUC_IMPCONSUMO_CR'   , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[13], 'PUC_SERVICIO_DB'     , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[14], 'PUC_SERVICIO_CR'     , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[15], 'PUC_CREE_DB'         , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[16], 'PUC_CREE_CR'         , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[17], 'PUC_DESCUENTO_DB'    , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[18], 'PUC_DESCUENTO_CR'    , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[19], 'PUC_TOTAL_DB'        , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[20], 'PUC_TOTAL_CR'        , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[21], 'PUC_INTERES_DB'      , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[22], 'PUC_INTERES_CR'      , Retornar_Info_Tabla(Id_PUC          ).Name, 'CODIGO_PUC') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[23], 'CCOSTO_SUBTOTAL_DB'  , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[24], 'CCOSTO_SUBTOTAL_CR'  , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[25], 'CCOSTO_IVA_DB'       , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[26], 'CCOSTO_IVA_CR'       , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[27], 'CCOSTO_RETEIVA_DB'   , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[28], 'CCOSTO_RETEIVA_CR'   , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[29], 'CCOSTO_RETEFUENTE_DB', Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[30], 'CCOSTO_RETEFUENTE_CR', Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[31], 'CCOSTO_ICA_DB'       , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[32], 'CCOSTO_ICA_CR'       , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[33], 'CCOSTO_IMPCONSUMO_DB', Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[34], 'CCOSTO_IMPCONSUMO_CR', Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[35], 'CCOSTO_SERVICIO_DB'  , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[36], 'CCOSTO_SERVICIO_CR'  , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[37], 'CCOSTO_CREE_DB'      , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[38], 'CCOSTO_CREE_CR'      , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[39], 'CCOSTO_DESCUENTO_DB' , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[40], 'CCOSTO_DESCUENTO_CR' , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[41], 'CCOSTO_TOTAL_DB'     , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[42], 'CCOSTO_TOTAL_CR'     , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[43], 'CCOSTO_INTERES_DB'   , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[44], 'CCOSTO_INTERES_CR'   , Retornar_Info_Tabla(Id_Centro_Costos).Name, 'CODIGO_CENTRO_COSTOS') + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[45], 'CPMTE_SUBTOTAL_DB'   , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[46], 'CPMTE_SUBTOTAL_CR'   , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[47], 'CPMTE_IVA_DB'        , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[48], 'CPMTE_IVA_CR'        , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[49], 'CPMTE_RETEIVA_DB'    , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[50], 'CPMTE_RETEIVA_CR'    , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[51], 'CPMTE_RETEFUENTE_DB' , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[52], 'CPMTE_RETEFUENTE_CR' , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[53], 'CPMTE_ICA_DB'        , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[54], 'CPMTE_ICA_CR'        , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[55], 'CPMTE_IMPCONSUMO_DB' , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[56], 'CPMTE_IMPCONSUMO_CR' , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[57], 'CPMTE_SERVICIO_DB'   , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[58], 'CPMTE_SERVICIO_CR'   , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[59], 'CPMTE_CREE_DB'       , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[60], 'CPMTE_CREE_CR'       , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[61], 'CPMTE_DESCUENTO_DB'  , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[62], 'CPMTE_DESCUENTO_CR'  , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[63], 'CPMTE_TOTAL_DB'      , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[64], 'CPMTE_TOTAL_CR'      , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[65], 'CPMTE_INTERES_DB'    , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Impuesto).Fk[66], 'CPMTE_INTERES_CR'    , Retornar_Info_Tabla(Id_Comprobante  ).Name, 'CODIGO_COMPROBANTE'  ) + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   )  '                                                                    );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Impuesto', 'Tabla',  Retornar_Info_Tabla(Id_Impuesto).Name]);
      End;
    End;
  End;
End;

end.

