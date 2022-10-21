unit UtInfoTablas;

interface
Uses
  Classes;

Const
  Id_MainIni                = 001;
  Id_Filtro                 = 001;
  Id_Perfil                 = 002;
  Id_Permiso_Menu           = 003;
  Id_Permiso_Tabla          = 004;
  Id_Permiso_App            = 005;
  Id_Usuario                = 006;
  Id_Caja                   = 007;
  Id_Zona                   = 008;
  Id_Espacio                = 009;
  Id_Bodega                 = 010;
  Id_Linea                  = 011;
  Id_Grupo                  = 012;
  Id_Subgrupo               = 013;
  Id_Cargo                  = 014;
  Id_Area                   = 015;
  Id_Comprobante            = 016;
  Id_Centro_Costos          = 017;
  Id_PUC                    = 018;
  Id_Impuesto               = 019;
  Id_Base                   = 020;
  Id_Documento_Adm          = 021;
  Id_Municipio              = 022;
  Id_Producto               = 023;
  Id_Producto_Receta        = 024;
  Id_Producto_LP            = 025;
  Id_Producto_Baja          = 026;
  Id_Producto_Observacion   = 027;
  Id_Tercero                = 028;
  Id_Tercero_Contacto       = 029;
  Id_Tercero_Sinonimo       = 030;
  Id_Tercero_LP             = 031;
  Id_Producto_Tercero       = 032;
  Id_Precargada             = 033;
  Id_Parametro              = 034;
  Id_Documento_Enc_Aux      = 035;
  Id_Documento_Det_Aux      = 036;
  Id_Documento_Rec_Aux      = 037;
  Id_Documento_Obs_Aux      = 038;
  Id_Documento_Enc          = 039;
  Id_Documento_Det          = 040;
  Id_Documento_Obs          = 041;
  Id_Documento_Rec          = 042;
  Id_Ajuste_Kardex          = 043;
  Id_Hoja_Inventario        = 044;
  Id_Exp_Imp_Enc            = 045;
  Id_Exp_Imp_Det            = 046;
  Id_Usuario_Comanda        = 047;
  Id_SYSTEM                 = 048;
  Id_MainFin                = 048;


Type
 TInfo_Tabla = Packed Record
   Id        : Integer;
   Name      : String ;
   Caption   : String ;
   CodeField : String ;
   NameField : String ;
   Search    : Integer;
   Fk        : Array[1..100] Of String;
 End;

Function Retornar_Id_Tabla(pTableName : String) : Integer;
Function Retornar_Id_Caption(pTableName : String) : Integer;
Function Retornar_Id_Field(pCodeField : String) : Integer;
Function Retornar_Info_Tabla(pId : Integer) : TInfo_Tabla;
Procedure Retornar_Caption_Tablas(pTablas : TStrings);
Procedure Retornar_Name_Tablas(pTablas : TStrings);

implementation

Uses
  SysUtils;

Var
  gInfo_Tablas : Packed Array[Id_MainIni..Id_MainFin] Of TInfo_Tabla;

Procedure Cargar_Tablas(pId, pSearch : Integer; pName, pCaption, pCodeField, pNameField : String);
Var
  lI : Integer;
Begin
  gInfo_Tablas[pId].Id        := pId          ;
  gInfo_Tablas[pId].Name      := pName        ;
  gInfo_Tablas[pId].Caption   := pCaption     ;
  gInfo_Tablas[pId].Search    := pSearch      ;
  gInfo_Tablas[pId].CodeField := pCodeField   ;
  gInfo_Tablas[pId].NameField := pNameField   ;
  Randomize;
  For lI := 1 To 50 Do
    gInfo_Tablas[pId].Fk[lI] := 'FK' + IntToStr(pId) + '_' + IntToStr(lI) + IntToStr(Random(100));
End;

Procedure Preparar_Tablas;
Begin
  Cargar_Tablas(Id_Filtro                , Id_Filtro                , 'FILTRO'                , 'Filtro'                        , 'CODIGO_FILTRO'       , 'NOMBRE');
  Cargar_Tablas(Id_Perfil                , Id_Perfil                , 'PERFIL'                , 'Perfiles'                      , 'CODIGO_PERFIL'       , 'NOMBRE');
  Cargar_Tablas(Id_Permiso_Menu          , Id_Permiso_Menu          , 'PERMISO_MENU'          , 'Permisos de Menú'              , 'CODIGO_PERFIL'       , 'NOMBRE');
  Cargar_Tablas(Id_Permiso_Tabla         , Id_Permiso_Tabla         , 'PERMISO_TABLA'         , 'Permisos de Tabla'             , 'CODIGO_PERFIL'       , 'NOMBRE');
  Cargar_Tablas(Id_Permiso_App           , Id_Permiso_App           , 'PERMISO_APP'           , 'Permisos de Aplicación'        , 'CODIGO_PERFIL'       , 'NOMBRE');

  Cargar_Tablas(Id_Usuario               , Id_Usuario               , 'USUARIO'               , 'Usuario'                       , 'CODIGO_USUARIO'      , 'NOMBRE');
  Cargar_Tablas(Id_Zona                  , Id_Zona                  , 'ZONA'                  , 'Zona'                          , 'CODIGO_ZONA'         , 'NOMBRE');
  Cargar_Tablas(Id_Espacio               , Id_Espacio               , 'ESPACIO'               , 'Espacio'                       , 'CODIGO_ESPACIO'      , 'NOMBRE');

  Cargar_Tablas(Id_Bodega                , Id_Bodega                , 'BODEGA'                , 'Bodega'                        , 'CODIGO_BODEGA'       , 'NOMBRE');
  Cargar_Tablas(Id_Linea                 , Id_Linea                 , 'LINEA'                 , 'Linea'                         , 'CODIGO_LINEA'        , 'NOMBRE');
  Cargar_Tablas(Id_Grupo                 , Id_Grupo                 , 'GRUPO'                 , 'Grupo'                         , 'CODIGO_GRUPO'        , 'NOMBRE');
  Cargar_Tablas(Id_Subgrupo              , Id_Subgrupo              , 'SUBGRUPO'              , 'Subgrupo'                      , 'CODIGO_SUBGRUPO'     , 'NOMBRE');
  Cargar_Tablas(Id_Cargo                 , Id_Cargo                 , 'CARGO'                 , 'Cargo'                         , 'CODIGO_CARGO'        , 'NOMBRE');
  Cargar_Tablas(Id_Area                  , Id_Area                  , 'AREA'                  , 'Area'                          , 'CODIGO_AREA'         , 'NOMBRE');
  Cargar_Tablas(Id_Comprobante           , Id_Comprobante           , 'COMPROBANTE'           , 'Comprobante'                   , 'CODIGO_COMPROBANTE'  , 'NOMBRE');
  Cargar_Tablas(Id_Centro_Costos         , Id_Centro_Costos         , 'CENTRO_COSTOS'         , 'Centro de Costos'              , 'CODIGO_CENTRO_COSTOS', 'NOMBRE');
  Cargar_Tablas(Id_PUC                   , Id_PUC                   , 'PUC'                   , 'Plan Unico de Cuentas'         , 'CODIGO_PUC'          , 'NOMBRE');

  Cargar_Tablas(Id_Impuesto              , Id_Impuesto              , 'IMPUESTO'              , 'Impuestos'                     , 'CODIGO_IMPUESTO'     , 'NOMBRE');
  Cargar_Tablas(Id_Base                  , Id_Base                  , 'BASE'                  , 'Bases'                         , 'CODIGO_BASE'         , 'NOMBRE');
  Cargar_Tablas(Id_Documento_Adm         , Id_Documento_Adm         , 'DOCUMENTO_ADM'         , 'Administración de Documento'   , 'CODIGO_DOCUMENTO_ADM', 'NOMBRE');

  Cargar_Tablas(Id_Municipio             , Id_Municipio             , 'MUNICIPIO'             , 'Municipio'                     , 'CODIGO_MUNICIPIO'    , 'NOMBRE');

  Cargar_Tablas(Id_Producto              , Id_Producto              , 'PRODUCTO'              , 'Producto'                      , 'CODIGO_PRODUCTO'     , 'NOMBRE');
  Cargar_Tablas(Id_Producto_LP           , Id_Producto_LP           , 'PRODUCTO_LP'           , 'Producto (Lista de Precios)'   , 'CODIGO_PRODUCTO_LP'  , 'NOMBRE');
  Cargar_Tablas(Id_Producto_Receta       , Id_Producto_Receta       , 'PRODUCTO_RECETA'       , 'Producto (Receta)'             , 'CODIGO_PRODUCTO'     , 'NOMBRE');
  Cargar_Tablas(Id_Producto_Baja         , Id_Producto_Baja         , 'PRODUCTO_BAJA'         , 'Producto (Baja)'               , 'CODIGO_PRODUCTO'     , 'NOMBRE');
  Cargar_Tablas(Id_Producto_Observacion  , Id_Producto_Observacion  , 'PRODUCTO_OBSERVACION'  , 'Producto (Observación)'        , 'CODIGO_PRODUCTO'     , 'NOMBRE');

  Cargar_Tablas(Id_Tercero               , Id_Tercero               , 'TERCERO'               , 'Tercero'                       , 'CODIGO_TERCERO'      , 'NOMBRE');
  Cargar_Tablas(Id_Tercero_Contacto      , Id_Tercero_Contacto      , 'TERCERO_CONTACTO'      , 'Contactos (Tercero)'           , 'CODIGO_CONTACTO'     , 'NOMBRE');
  Cargar_Tablas(Id_Tercero_Sinonimo      , Id_Tercero_Sinonimo      , 'TERCERO_SINONIMO'      , 'Sinonimo (Tercero)'            , 'CODIGO_SINONIMO'     , 'NOMBRE');
  Cargar_Tablas(Id_Tercero_LP            , Id_Tercero_LP            , 'TERCERO_LP'            , 'Lista de Precios (Tercero)'    , 'CODIGO_TERCERO_LP'   , 'NOMBRE');
  Cargar_Tablas(Id_Producto_Tercero      , Id_Producto_Tercero      , 'PRODUCTO_TERCERO'      , 'Producto (Tercero)'            , 'CODIGO_PRODUCTO'     , 'NOMBRE');
  Cargar_Tablas(Id_Caja                  , Id_Caja                  , 'CAJA'                  , 'Caja'                          , 'FECHA'               , 'FECHA');
  Cargar_Tablas(Id_Precargada            , Id_Precargada            , 'PRECARGADA'            , 'Precargada'                    , 'CODIGO_PERIODO'      , 'NOMBRE');
  Cargar_Tablas(Id_Parametro             , Id_Parametro             , 'PARAMETRO'             , 'Parametros'                    , 'CODIGO_PERIODO'      , 'NOMBRE');
  Cargar_Tablas(Id_Documento_Enc_Aux     , Id_Documento_Enc_Aux     , 'DOCUMENTO_ENC_AUX'     , 'Documento Aux. (Encabezado)'   , 'NUMERO_DOCUMENTO'    , 'NOMBRE');
  Cargar_Tablas(Id_Documento_Det_Aux     , Id_Documento_Det_Aux     , 'DOCUMENTO_DET_AUX'     , 'Documento Aux. (Detalle)'      , 'NUMERO_DOCUMENTO'    , 'NOMBRE');
  Cargar_Tablas(Id_Documento_Rec_Aux     , Id_Documento_Rec_Aux     , 'DOCUMENTO_REC_AUX'     , 'Documento Aux. (Receta)'       , 'DATAKEY'             , 'NOMBRE');
  Cargar_Tablas(Id_Documento_Obs_Aux     , Id_Documento_Obs_Aux     , 'DOCUMENTO_OBS_AUX'     , 'Documento Aux. (Observación)'  , 'DATAKEY'             , 'NOMBRE');

  Cargar_Tablas(Id_Documento_Enc         , Id_Documento_Enc         , 'DOCUMENTO_ENC'         , 'Documento (Encabezado)'        , 'NUMERO_DOCUMENTO'    , 'NOMBRE');
  Cargar_Tablas(Id_Documento_Det         , Id_Documento_Det         , 'DOCUMENTO_DET'         , 'Documento (Detalle)'           , 'NUMERO_DOCUMENTO'    , 'NOMBRE');
  Cargar_Tablas(Id_Documento_Rec         , Id_Documento_Rec         , 'DOCUMENTO_REC'         , 'Documento (Receta)'            , 'DATAKEY'             , 'NOMBRE');
  Cargar_Tablas(Id_Documento_Obs         , Id_Documento_Obs         , 'DOCUMENTO_OBS'         , 'Documento (Observación)'       , 'DATAKEY'             , 'NOMBRE');

  Cargar_Tablas(Id_Hoja_Inventario       , Id_Hoja_Inventario       , 'HOJA_INVENTARIO'       , 'Hoja de Inventario'            , 'NUMERO_DOCUMENTO'    , 'NOMBRE');

  Cargar_Tablas(Id_Ajuste_Kardex         , Id_Ajuste_Kardex         , 'AJUSTE_KARDEX'         , 'Ajuste de Kardex'              , 'CODIGO_PRODUCTO'     , 'NOMBRE');

  Cargar_Tablas(Id_Exp_Imp_Enc           , Id_Exp_Imp_Enc           , 'EXP_IMP_ENC'           , 'Exportación/Importacion(Master)', 'CODIGO_EXP_IMP'    , 'NOMBRE'           );
  Cargar_Tablas(Id_Exp_Imp_Det           , Id_Exp_Imp_Det           , 'EXP_IMP_DET'           , 'Exportación/Importacion(Detail)', 'CODIGO_EXP_IMP'    , 'NOMBRE'           );

  Cargar_Tablas(Id_Usuario_Comanda       , Id_Usuario_Comanda       , 'USUARIO_COMANDA'       , 'Comanda por usuario'            , 'CODIGO_USUARIO'    , 'TIPO_ENVIO'       );

  Cargar_Tablas(Id_SYSTEM                , Id_SYSTEM                , 'SYSTEM'                , 'System Info'                    , 'SYSTEM_MACHINE'    , 'SYSTEM_MACHINE');
End;

Function Retornar_Id_Tabla(pTableName : String) : Integer;
Var
  lI : Integer;
Begin
  lI := 1;
  Result := -1;
  While (lI <= Id_MainFin) And (Result = -1) Do
  Begin
    If AnsiUpperCase(gInfo_Tablas[lI].Name) = AnsiUpperCase(pTableName) then
      Result := lI;
    Inc(lI);
  End;
End;

Function Retornar_Id_Caption(pTableName : String) : Integer;
Var
  lI : Integer;
Begin
  lI := 1;
  Result := -1;
  While (lI <= Id_MainFin) And (Result = -1) Do
  Begin
    If AnsiUpperCase(gInfo_Tablas[lI].Caption) = AnsiUpperCase(pTableName) then
      Result := lI;
    Inc(lI);
  End;
End;

Function Retornar_Id_Field(pCodeField : String) : Integer;
Var
  lI : Integer;
Begin
  lI := 1;
  Result := -1;
  While (lI <= Id_MainFin) And (Result = -1) Do
  Begin
    If AnsiUpperCase(gInfo_Tablas[lI].CodeField) = AnsiUpperCase(pCodeField) then
      Result := lI;
    Inc(lI);
  End;
End;

Function Retornar_Info_Tabla(pId : Integer) : TInfo_Tabla;
Begin
  FillChar(Result, SizeOf(Result), #0);
  If (pId >= Id_MainIni) And (pId <= Id_MainFin) then
    Result := gInfo_Tablas[pId];
End;

Procedure Retornar_Info_Tablas(pLista : TStringList; pInfo, pLimiteIni, pLimiteFin : Integer);
Var
  lI : Integer;
Begin
  pLista.Clear;
  For lI := Id_MainIni To Id_MainFin Do
    If (lI >= pLimiteIni) And (lI <= pLimiteFin) Then
      Case pInfo Of
        1 : pLista.Add(gInfo_Tablas[lI].Caption);
        2 : pLista.Add(gInfo_Tablas[lI].Name   );
      End;
End;

Procedure Retornar_Caption_Tablas(pTablas : TStrings);
Var
  lI : Integer;
Begin
  pTablas.Clear;
  For lI := Id_MainIni To Id_MainFin Do
    pTablas.Add(Retornar_Info_Tabla(lI).Caption);
End;

Procedure Retornar_Name_Tablas(pTablas : TStrings);
Var
  lI : Integer;
Begin
  pTablas.Clear;
  For lI := Id_MainIni To Id_MainFin Do
    pTablas.Add(Retornar_Info_Tabla(lI).Name);
End;

Initialization
  Preparar_Tablas;

end.
