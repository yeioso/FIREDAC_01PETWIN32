unit UtOpciones;

interface

Procedure Ejecutar_Opcion(pTag : Integer; pName : String);

implementation
Uses
  SysUtils,
  Form_PUC,
  Form_Zona,
  Form_Base,
  Form_Area,
  Form_Caja,
  Form_About,
  Form_Cargo,
  Form_Grupo,
  Form_Linea,
  UtConexion,
  Form_Backup,
  UtFunciones,
  Form_Perfil,
  Form_Bodega,
  Form_Tercero,
  UtConstantes,
  UtInfoTablas,
  Form_Usuario,
  UtCerrarCaja,
  Form_Impuesto,
  Form_QrDesign,
  Form_Producto,
  Form_Subgrupo,
  Form_Depurador,
  Form_Parametro,
  Form_Municipio,
  Form_Precargada,
  Form_Abrir_Caja,
  Form_Comprobante,
  UtValidar_Tablas,
  Form_CambioClave,
  Form_Exp_Imp_Enc,
  UtResumen_Caja_New,
  Form_Documento_Adm,
  Form_Centro_Costos,
  Form_Producto_Baja,
  Form_Ajuste_Kardex,
  UtVariablesGlobales,
  Form_Captura_Tercero,
  Form_Documento_Espacio,
  Form_Documento_Captura,
  Form_Documento_Historico,
  UtInicializarMovimientos;

Procedure UtOpciones_Documento(Const pTipo_Documento : String);
Begin
  Show_Form_Documento_Captura(pTipo_Documento);
End;

Procedure Ejecutar_Opcion(pTag : Integer; pName : String);
Begin
  If gVariableGlobal.FECHA_ACTUAL.yyyy_mm_dd <> FormatDateTime('YYYY-MM-DD', Now) Then
    Mensajes('La fecha de la caja no corresponde con la fecha del sistema');
  gVariableGlobal.VALOR_TAG := pTag;
  Case pTag Of
    101   : Show_Form_Cargo        ;
    102   : Show_Form_Area         ;
    103   : Show_Form_Municipio    ;
    104   : Show_Form_PUC          ;
    105   : Show_Form_Centro_Costos;
    106   : Show_Form_Impuesto     ;
    107   : Show_Form_Base         ;
    108   : Show_Form_Documento_Adm;
    109   : Show_Form_Comprobante  ;
    110   : Show_Form_Bodega       ;
    111   : Show_Form_Linea        ;
    112   : Show_Form_Grupo        ;
    113   : Show_Form_Subgrupo     ;
    114   : Show_Form_Producto     ;
    115   : Show_Form_Zona         ;
//    116   : Show_Form_Puerto_TCP   ;

    124   : Show_Form_Tercero      ;
    125   : Form_Captura_Tercero_Get;

//    201   : Show_Form_Contable_Enc ;
//    202   : Enlace_Contable_Automatico;

    301   : Show_Form_Abrir_Caja   ;
    302   : UtOpciones_Documento(Const_Documento_Pedido)      ;
    303   : UtOpciones_Documento(Const_Documento_Compra)      ;
    304   : UtOpciones_Documento(Const_Documento_Cotizacion)  ;
    305   : UtOpciones_Documento(Const_Documento_Factura)     ;
    306   : Show_Form_Documento_Espacio                       ;
    307   : UtOpciones_Documento(Const_Documento_Baja)        ;
    308   : Show_Form_Ajuste_Kardex                           ;
    310   : UtOpciones_Documento(Const_Documento_Nota_Credito);
    311   : UtOpciones_Documento(Const_Documento_Nota_Debito );
    312   : Mensajes('Opcion no disponible') ;//UtOpciones_Documento(Const_Documento_CXC         );
    313   : Mensajes('Opcion no disponible') ;//UtOpciones_Documento(Const_Documento_CXP         );
    314   : Show_Form_Caja(False)                 ;

//    315   : Form_MainFE_Show                      ;

    316   : Cerrar_Caja                           ;

    501   : Show_Form_Documento_Historico                ;
//    502   : Show_Form_Plantilla_Enc(gUSUARIO_ACTUAL, 'T');
//    503   : Show_Form_Plantilla_Enc(gUSUARIO_ACTUAL, 'C');
//    504   : Show_Form_Plantilla_Enc(gUSUARIO_ACTUAL, 'I');
    505   : Show_Form_Caja(True)                         ;
//    506   : Form_Hoja_Inventario_Show                    ;
    507   : UtResumen_Caja_New_Ranges                    ;
//    508   : UtReportes_Bases_Comision_Vendedor_Enc       ;
//    509   : UtReportes_Bases_Movimiento                  ;
//    510   : UtReportes_Bases_Utilidad                    ;

    601   : Form_Depurador_Show    ;

    701   : Show_Form_Perfil                      ;
    702   : Show_Form_Usuario                     ;
    70301 : Show_Form_Precargada                  ;
    70302 : Show_Form_Parametro                   ;
    704   : Show_Form_CambioClave                 ;
    705   : Show_Disenador_Informes               ;
//  706   : Show_Form_Log                         ;
    707   : Begin
//              Show_Form_Registrar(True)           ;
//              Cargar_Informacion_Global           ;
            End;
    708   : Show_Form_Backup(gVariableGlobal.RUTAPROGRAMA)       ;
    709   : Show_Form_Exp_Imp_Enc                 ;
    710   : UtInicializarMovimientos_Execute      ;
//    711   : Form_Lupe_About_Show(gAplicacion, gVersion);
  End;
  gVariableGlobal.VALOR_TAG := 0;
End;

end.
