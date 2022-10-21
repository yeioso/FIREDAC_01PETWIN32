unit Form_Impuesto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat, UtObjetoTransaccional;

type
  TFrImpuesto = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    OvcController1: TOvcController;
    PnlNavegador: TPanel;
    DBNavigator1: TDBNavigator;
    PnlGrid: TPanel;
    Registros: TDBGrid;
    Estado_Actual: TStatusBar;
    Barra_Ayuda01: TStatusBar;
    Barra_Ayuda02: TStatusBar;
    PnlOpcionales: TPanel;
    BtnExcel: TSpeedButton;
    BtnBuscar: TSpeedButton;
    BtnFiltrado: TSpeedButton;
    Pagina: TPageControl;
    Pag00: TTabSheet;
    Pag01: TTabSheet;
    PaginasPUC: TPageControl;
    PagSERVICIO: TTabSheet;
    PagDESCUENTO: TTabSheet;
    lbNombre_PUC_SERVICIO_DB: TLabel;
    BtnPUC_Servicio_DB: TSpeedButton;
    Label25: TLabel;
    PUC_SERVICIO_DB: TOvcDbPictureField;
    lbNombre_PUC_DESCUENTO_CR: TLabel;
    BtnPUC_Descuento_CR: TSpeedButton;
    Label7: TLabel;
    PUC_DESCUENTO_CR: TOvcDbPictureField;
    PagIVA: TTabSheet;
    lbNombre_PUC_IVA_DB: TLabel;
    BtnPUC_IVA_DB: TSpeedButton;
    Label4: TLabel;
    PUC_IVA_DB: TOvcDbPictureField;
    lbNombre_PUC_IVA_CR: TLabel;
    BtnPUC_IVA_CR: TSpeedButton;
    Label27: TLabel;
    PUC_IVA_CR: TOvcDbPictureField;
    lbNombre_CCOSTO_IVA_DB: TLabel;
    BtnCCOSTO_IVA_DB: TSpeedButton;
    Label8: TLabel;
    CCOSTO_IVA_DB: TOvcDbPictureField;
    lbNombre_CCOSTO_IVA_CR: TLabel;
    BtnCCOSTO_IVA_CR: TSpeedButton;
    Label10: TLabel;
    CCOSTO_IVA_CR: TOvcDbPictureField;
    PagRETEIVA: TTabSheet;
    lbNombre_PUC_RETEIVA_DB: TLabel;
    BtnPUC_RETEIVA_DB: TSpeedButton;
    Label18: TLabel;
    PUC_RETEIVA_DB: TOvcDbPictureField;
    lbNombre_PUC_RETEIVA_CR: TLabel;
    BtnPUC_RETEIVA_CR: TSpeedButton;
    Label28: TLabel;
    PUC_RETEIVA_CR: TOvcDbPictureField;
    lbNombre_CCOSTO_RETEIVA_DB: TLabel;
    BtnCCOSTO_RETEIVA_DB: TSpeedButton;
    Label9: TLabel;
    CCOSTO_RETEIVA_DB: TOvcDbPictureField;
    lbNombre_CCOSTO_RETEIVA_CR: TLabel;
    BtnCCOSTO_RETEIVA_CR: TSpeedButton;
    Label13: TLabel;
    CCOSTO_RETEIVA_CR: TOvcDbPictureField;
    PagRETEFUENTE: TTabSheet;
    lbNombre_PUC_RETEFUENTE_DB: TLabel;
    BtnPUC_ReteFuente_DB: TSpeedButton;
    Label20: TLabel;
    PUC_RETEFUENTE_DB: TOvcDbPictureField;
    lbNombre_PUC_RETEFUENTE_CR: TLabel;
    BtnPUC_ReteFuente_CR: TSpeedButton;
    Label29: TLabel;
    PUC_RETEFUENTE_CR: TOvcDbPictureField;
    PagICA: TTabSheet;
    lbNombre_PUC_ICA_DB: TLabel;
    BtnPUC_ICA_DB: TSpeedButton;
    Label21: TLabel;
    PUC_ICA_DB: TOvcDbPictureField;
    lbNombre_PUC_ICA_CR: TLabel;
    BtnPUC_ICA_CR: TSpeedButton;
    Label30: TLabel;
    PUC_ICA_CR: TOvcDbPictureField;
    PagIMPOCONSUMO: TTabSheet;
    lbNombre_PUC_IMPCONSUMO_DB: TLabel;
    BtnPUC_ImpConsumo_DB: TSpeedButton;
    Label23: TLabel;
    PUC_IMPCONSUMO_DB: TOvcDbPictureField;
    lbNombre_PUC_IMPCONSUMO_CR: TLabel;
    BtnPUC_ImpConsumo_CR: TSpeedButton;
    Label31: TLabel;
    PUC_IMPCONSUMO_CR: TOvcDbPictureField;
    PagCREE: TTabSheet;
    lbNombre_PUC_CREE_DB: TLabel;
    BtnPUC_Cree_DB: TSpeedButton;
    Label26: TLabel;
    PUC_CREE_DB: TOvcDbPictureField;
    lbNombre_PUC_CREE_CR: TLabel;
    BtnPUC_Cree_CR: TSpeedButton;
    Label33: TLabel;
    PUC_CREE_CR: TOvcDbPictureField;
    lbNombre_PUC_DESCUENTO_DB: TLabel;
    BtnPUC_Descuento_DB: TSpeedButton;
    Label5: TLabel;
    PUC_DESCUENTO_DB: TOvcDbPictureField;
    lbNombre_PUC_SERVICIO_CR: TLabel;
    BtnPUC_Servicio_CR: TSpeedButton;
    Label32: TLabel;
    PUC_SERVICIO_CR: TOvcDbPictureField;
    lbNombre_CCOSTO_SERVICIO_DB: TLabel;
    BtnCCOSTO_Servicio_DB: TSpeedButton;
    Label11: TLabel;
    CCOSTO_SERVICIO_DB: TOvcDbPictureField;
    lbNombre_CCOSTO_SERVICIO_CR: TLabel;
    BtnCCOSTO_Servicio_CR: TSpeedButton;
    Label17: TLabel;
    CCOSTO_SERVICIO_CR: TOvcDbPictureField;
    lbNombre_CCOSTO_DESCUENTO_CR: TLabel;
    BtnCCOSTO_Descuento_CR: TSpeedButton;
    Label35: TLabel;
    CCOSTO_DESCUENTO_CR: TOvcDbPictureField;
    lbNombre_CCOSTO_DESCUENTO_DB: TLabel;
    BtnCCOSTO_Descuento_DB: TSpeedButton;
    Label38: TLabel;
    CCOSTO_DESCUENTO_DB: TOvcDbPictureField;
    lbNombre_CCOSTO_RETEFUENTE_DB: TLabel;
    BtnCCOSTO_ReteFuente_DB: TSpeedButton;
    Label40: TLabel;
    CCOSTO_RETEFUENTE_DB: TOvcDbPictureField;
    lbNombre_CCOSTO_RETEFUENTE_CR: TLabel;
    BtnCCOSTO_ReteFuente_CR: TSpeedButton;
    Label42: TLabel;
    CCOSTO_RETEFUENTE_CR: TOvcDbPictureField;
    lbNombre_CCOSTO_ICA_DB: TLabel;
    BtnCCOSTO_ICA_DB: TSpeedButton;
    Label44: TLabel;
    CCOSTO_ICA_DB: TOvcDbPictureField;
    lbNombre_CCOSTO_ICA_CR: TLabel;
    BtnCCOSTO_ICA_CR: TSpeedButton;
    Label46: TLabel;
    CCOSTO_ICA_CR: TOvcDbPictureField;
    lbNombre_CCOSTO_IMPCONSUMO_DB: TLabel;
    BtnCCOSTO_ImpConsumo_DB: TSpeedButton;
    Label48: TLabel;
    CCOSTO_IMPCONSUMO_DB: TOvcDbPictureField;
    lbNombre_CCOSTO_IMPCONSUMO_CR: TLabel;
    BtnCCOSTO_ImpConsumo_CR: TSpeedButton;
    Label50: TLabel;
    CCOSTO_IMPCONSUMO_CR: TOvcDbPictureField;
    lbNombre_CCOSTO_CREE_DB: TLabel;
    BtnCCOSTO_Cree_DB: TSpeedButton;
    Label52: TLabel;
    CCOSTO_CREE_DB: TOvcDbPictureField;
    lbNombre_CCOSTO_CREE_CR: TLabel;
    BtnCCOSTO_Cree_CR: TSpeedButton;
    Label54: TLabel;
    CCOSTO_CREE_CR: TOvcDbPictureField;
    gbTOPE: TGroupBox;
    Label12: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label36: TLabel;
    Label6: TLabel;
    PORC_IVA: TOvcDbPictureField;
    PORC_IMPCONSUMO: TOvcDbPictureField;
    PORC_SERVICIO: TOvcDbPictureField;
    PORC_RETEIVA: TOvcDbPictureField;
    PORC_RETEFUENTE: TOvcDbPictureField;
    PORC_ICA: TOvcDbPictureField;
    PORC_CREE: TOvcDbPictureField;
    PORC_DESCUENTO: TOvcDbPictureField;
    Label1: TLabel;
    Label2: TLabel;
    CODIGO_IMPUESTO: TOvcDbPictureField;
    NOMBRE: TOvcDbPictureField;
    PagSubtotal: TTabSheet;
    lbNombre_PUC_SUBTOTAL_DB: TLabel;
    BtnPUC_SUBTOTAL_DB: TSpeedButton;
    Label15: TLabel;
    lbNombre_PUC_SUBTOTAL_CR: TLabel;
    BtnPUC_SUBTOTAL_CR: TSpeedButton;
    Label37: TLabel;
    lbNombre_CCOSTO_SUBTOTAL_DB: TLabel;
    BtnCCOSTO_SUBTOTAL_DB: TSpeedButton;
    Label41: TLabel;
    lbNombre_CCOSTO_SUBTOTAL_CR: TLabel;
    BtnCCOSTO_SUBTOTAL_CR: TSpeedButton;
    Label45: TLabel;
    PUC_SUBTOTAL_DB: TOvcDbPictureField;
    PUC_SUBTOTAL_CR: TOvcDbPictureField;
    CCOSTO_SUBTOTAL_DB: TOvcDbPictureField;
    CCOSTO_SUBTOTAL_CR: TOvcDbPictureField;
    PagTotal: TTabSheet;
    lbNombre_PUC_TOTAL_DB: TLabel;
    BtnPUC_TOTAL_DB: TSpeedButton;
    Label34: TLabel;
    lbNombre_PUC_TOTAL_CR: TLabel;
    BtnPUC_TOTAL_CR: TSpeedButton;
    Label47: TLabel;
    lbNombre_CCOSTO_TOTAL_DB: TLabel;
    BtnCCOSTO_TOTAL_DB: TSpeedButton;
    Label51: TLabel;
    lbNombre_CCOSTO_TOTAL_CR: TLabel;
    BtnCCOSTO_TOTAL_CR: TSpeedButton;
    Label55: TLabel;
    PUC_TOTAL_DB: TOvcDbPictureField;
    PUC_TOTAL_CR: TOvcDbPictureField;
    CCOSTO_TOTAL_DB: TOvcDbPictureField;
    CCOSTO_TOTAL_CR: TOvcDbPictureField;
    lbNombre_CPMTE_SUBTOTAL_DB: TLabel;
    BtnCPMTE_SUBTOTAL_DB: TSpeedButton;
    Label39: TLabel;
    lbNombre_CPMTE_SUBTOTAL_CR: TLabel;
    BtnCPMTE_SUBTOTAL_CR: TSpeedButton;
    Label49: TLabel;
    CPMTE_SUBTOTAL_DB: TOvcDbPictureField;
    CPMTE_SUBTOTAL_CR: TOvcDbPictureField;
    lbNombre_CPMTE_SERVICIO_DB: TLabel;
    BtnCPMTE_SERVICIO_DB: TSpeedButton;
    Label43: TLabel;
    lbNombre_CPMTE_SERVICIO_CR: TLabel;
    BtnCPMTE_SERVICIO_CR: TSpeedButton;
    Label56: TLabel;
    CPMTE_SERVICIO_DB: TOvcDbPictureField;
    CPMTE_SERVICIO_CR: TOvcDbPictureField;
    lbNombre_CPMTE_DESCUENTO_DB: TLabel;
    BtnCPMTE_DESCUENTO_DB: TSpeedButton;
    Label58: TLabel;
    lbNombre_CPMTE_DESCUENTO_CR: TLabel;
    BtnCPMTE_DESCUENTO_CR: TSpeedButton;
    Label60: TLabel;
    CPMTE_DESCUENTO_DB: TOvcDbPictureField;
    CPMTE_DESCUENTO_CR: TOvcDbPictureField;
    lbNombre_CPMTE_IVA_DB: TLabel;
    BtnCPMTE_IVA_DB: TSpeedButton;
    Label62: TLabel;
    lbNombre_CPMTE_IVA_CR: TLabel;
    BtnCPMTE_IVA_CR: TSpeedButton;
    Label64: TLabel;
    CPMTE_IVA_DB: TOvcDbPictureField;
    CPMTE_IVA_CR: TOvcDbPictureField;
    lbNombre_CPMTE_RETEIVA_DB: TLabel;
    BtnCPMTE_RETEIVA_DB: TSpeedButton;
    Label66: TLabel;
    lbNombre_CPMTE_RETEIVA_CR: TLabel;
    BtnCPMTE_RETEIVA_CR: TSpeedButton;
    Label68: TLabel;
    CPMTE_RETEIVA_DB: TOvcDbPictureField;
    CPMTE_RETEIVA_CR: TOvcDbPictureField;
    lbNombre_CPMTE_RETEFUENTE_DB: TLabel;
    BtnCPMTE_RETEFUENTE_DB: TSpeedButton;
    Label70: TLabel;
    lbNombre_CPMTE_RETEFUENTE_CR: TLabel;
    BtnCPMTE_RETEFUENTE_CR: TSpeedButton;
    Label72: TLabel;
    CPMTE_RETEFUENTE_DB: TOvcDbPictureField;
    CPMTE_RETEFUENTE_CR: TOvcDbPictureField;
    lbNombre_CPMTE_ICA_DB: TLabel;
    BtnCPMTE_ICA_DB: TSpeedButton;
    Label74: TLabel;
    lbNombre_CPMTE_ICA_CR: TLabel;
    BtnCPMTE_ICA_CR: TSpeedButton;
    Label76: TLabel;
    CPMTE_ICA_DB: TOvcDbPictureField;
    CPMTE_ICA_CR: TOvcDbPictureField;
    lbNombre_CPMTE_IMPCONSUMO_DB: TLabel;
    BtnCPMTE_IMPCONSUMO_DB: TSpeedButton;
    Label78: TLabel;
    lbNombre_CPMTE_IMPCONSUMO_CR: TLabel;
    BtnCPMTE_IMPCONSUMO_CR: TSpeedButton;
    Label80: TLabel;
    CPMTE_IMPCONSUMO_DB: TOvcDbPictureField;
    CPMTE_IMPCONSUMO_CR: TOvcDbPictureField;
    lbNombre_CPMTE_CREE_DB: TLabel;
    BtnCPMTE_CREE_DB: TSpeedButton;
    Label82: TLabel;
    lbNombre_CPMTE_CREE_CR: TLabel;
    BtnCPMTE_CREE_CR: TSpeedButton;
    Label84: TLabel;
    CPMTE_CREE_DB: TOvcDbPictureField;
    CPMTE_CREE_CR: TOvcDbPictureField;
    lbNombre_CPMTE_TOTAL_DB: TLabel;
    BtnCPMTE_TOTAL_DB: TSpeedButton;
    Label86: TLabel;
    lbNombre_CPMTE_TOTAL_CR: TLabel;
    BtnCPMTE_TOTAL_CR: TSpeedButton;
    Label88: TLabel;
    CPMTE_TOTAL_DB: TOvcDbPictureField;
    CPMTE_TOTAL_CR: TOvcDbPictureField;
    Label3: TLabel;
    PORC_INTERES: TOvcDbPictureField;
    Pag_Interes: TTabSheet;
    lbNombre_PUC_INTERES_DB: TLabel;
    BtnPUC_INTERES_DB: TSpeedButton;
    Label57: TLabel;
    lbNombre_PUC_INTERES_CR: TLabel;
    BtnPUC_INTERES_CR: TSpeedButton;
    Label61: TLabel;
    lbNombre_CCOSTO_INTERES_DB: TLabel;
    BtnCCOSTO_INTERES_DB: TSpeedButton;
    Label65: TLabel;
    lbNombre_CCOSTO_INTERES_CR: TLabel;
    BtnCCOSTO_INTERES_CR: TSpeedButton;
    Label69: TLabel;
    lbNombre_CPMTE_INTERES_DB: TLabel;
    BtnCPMTE_INTERES_DB: TSpeedButton;
    Label73: TLabel;
    lbNombre_CPMTE_INTERES_CR: TLabel;
    BtnCPMTE_INTERES_CR: TSpeedButton;
    Label77: TLabel;
    PUC_INTERES_DB: TOvcDbPictureField;
    PUC_INTERES_CR: TOvcDbPictureField;
    CCOSTO_INTERES_DB: TOvcDbPictureField;
    CCOSTO_INTERES_CR: TOvcDbPictureField;
    CPMTE_INTERES_DB: TOvcDbPictureField;
    CPMTE_INTERES_CR: TOvcDbPictureField;
    Label53: TLabel;
    PORC_BASE: TOvcDbPictureField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
    FOT : TObjeto_Transaccional;
    Function Modo_Edicion : Boolean; Override;
    Procedure Cargar_Eventos;
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    procedure StateChange(Sender: TObject); Override;
    procedure DataChange(Sender: TObject; Field: TField); Override;
  Protected

  public
    { Public declarations }
  end;

Var
  FrImpuesto: TFrImpuesto;
  Procedure Show_Form_Impuesto;

implementation
{$R *.dfm}

Uses
  UtExcel,
  Printers,
  UtConexion,
  
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  Form_Busqueda,
  Form_Seleccion,
  UtVariablesGlobales;

Function TFrImpuesto.Modo_Edicion : Boolean;
Begin
  Result := Inherited;
  FOT.Modo_Edicion := Result;
End;

Procedure TFrImpuesto.Cargar_Eventos;
Begin
  FOT.Eventos_SpeedButton(BtnPUC_SUBTOTAL_DB)      ;
  FOT.Eventos_SpeedButton(BtnPUC_SUBTOTAL_CR)      ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_SUBTOTAL_DB)   ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_SUBTOTAL_CR)   ;
  FOT.Eventos_SpeedButton(BtnCPMTE_SUBTOTAL_DB)    ;
  FOT.Eventos_SpeedButton(BtnCPMTE_SUBTOTAL_CR)    ;
  FOT.Eventos_SpeedButton(BtnPUC_SERVICIO_DB)      ;
  FOT.Eventos_SpeedButton(BtnPUC_SERVICIO_CR)      ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_SERVICIO_DB)   ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_SERVICIO_CR)   ;
  FOT.Eventos_SpeedButton(BtnCPMTE_SERVICIO_DB)    ;
  FOT.Eventos_SpeedButton(BtnCPMTE_SERVICIO_CR)    ;
  FOT.Eventos_SpeedButton(BtnPUC_DESCUENTO_DB)     ;
  FOT.Eventos_SpeedButton(BtnPUC_DESCUENTO_CR)     ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_DESCUENTO_DB)  ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_DESCUENTO_CR)  ;
  FOT.Eventos_SpeedButton(BtnCPMTE_DESCUENTO_DB)   ;
  FOT.Eventos_SpeedButton(BtnCPMTE_DESCUENTO_CR)   ;
  FOT.Eventos_SpeedButton(BtnPUC_IMPCONSUMO_DB)    ;
  FOT.Eventos_SpeedButton(BtnPUC_IMPCONSUMO_CR)    ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_IMPCONSUMO_DB) ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_IMPCONSUMO_CR) ;
  FOT.Eventos_SpeedButton(BtnCPMTE_IMPCONSUMO_DB)  ;
  FOT.Eventos_SpeedButton(BtnCPMTE_IMPCONSUMO_CR)  ;
  FOT.Eventos_SpeedButton(BtnPUC_IVA_DB)           ;
  FOT.Eventos_SpeedButton(BtnPUC_IVA_CR)           ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_IVA_DB)        ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_IVA_CR)        ;
  FOT.Eventos_SpeedButton(BtnCPMTE_IVA_DB)         ;
  FOT.Eventos_SpeedButton(BtnCPMTE_IVA_CR)         ;
  FOT.Eventos_SpeedButton(BtnPUC_RETEIVA_DB)       ;
  FOT.Eventos_SpeedButton(BtnPUC_RETEIVA_CR)       ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_RETEIVA_DB)    ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_RETEIVA_CR)    ;
  FOT.Eventos_SpeedButton(BtnCPMTE_RETEIVA_DB)     ;
  FOT.Eventos_SpeedButton(BtnCPMTE_RETEIVA_CR)     ;
  FOT.Eventos_SpeedButton(BtnPUC_RETEFUENTE_DB)    ;
  FOT.Eventos_SpeedButton(BtnPUC_RETEFUENTE_CR)    ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_RETEFUENTE_DB) ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_RETEFUENTE_CR) ;
  FOT.Eventos_SpeedButton(BtnCPMTE_RETEFUENTE_DB)  ;
  FOT.Eventos_SpeedButton(BtnCPMTE_RETEFUENTE_CR)  ;
  FOT.Eventos_SpeedButton(BtnPUC_ICA_DB)           ;
  FOT.Eventos_SpeedButton(BtnPUC_ICA_CR)           ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_ICA_DB)        ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_ICA_CR)        ;
  FOT.Eventos_SpeedButton(BtnCPMTE_ICA_DB)         ;
  FOT.Eventos_SpeedButton(BtnCPMTE_ICA_CR)         ;
  FOT.Eventos_SpeedButton(BtnPUC_CREE_DB)          ;
  FOT.Eventos_SpeedButton(BtnPUC_CREE_CR)          ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_CREE_DB)       ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_CREE_CR)       ;
  FOT.Eventos_SpeedButton(BtnCPMTE_CREE_DB)        ;
  FOT.Eventos_SpeedButton(BtnCPMTE_CREE_CR)        ;
  FOT.Eventos_SpeedButton(BtnPUC_TOTAL_DB)         ;
  FOT.Eventos_SpeedButton(BtnPUC_TOTAL_CR)         ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_TOTAL_DB)      ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_TOTAL_CR)      ;
  FOT.Eventos_SpeedButton(BtnCPMTE_TOTAL_DB)       ;
  FOT.Eventos_SpeedButton(BtnCPMTE_TOTAL_CR)       ;
  FOT.Eventos_SpeedButton(BtnPUC_INTERES_DB)       ;
  FOT.Eventos_SpeedButton(BtnPUC_INTERES_CR)       ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_INTERES_DB)    ;
  FOT.Eventos_SpeedButton(BtnCCOSTO_INTERES_CR)    ;
  FOT.Eventos_SpeedButton(BtnCPMTE_INTERES_DB)     ;
  FOT.Eventos_SpeedButton(BtnCPMTE_INTERES_CR)     ;

  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_SUBTOTAL_DB      );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_SUBTOTAL_CR      );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_SUBTOTAL_DB   );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_SUBTOTAL_CR   );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_SUBTOTAL_DB    );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_SUBTOTAL_CR    );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_SERVICIO_DB      );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_SERVICIO_CR      );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_SERVICIO_DB   );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_SERVICIO_CR   );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_SERVICIO_DB    );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_SERVICIO_CR    );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_DESCUENTO_DB     );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_DESCUENTO_CR     );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_DESCUENTO_DB  );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_DESCUENTO_CR  );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_DESCUENTO_DB   );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_DESCUENTO_CR   );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_IMPCONSUMO_DB    );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_IMPCONSUMO_CR    );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_IMPCONSUMO_DB );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_IMPCONSUMO_CR );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_IMPCONSUMO_DB  );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_IMPCONSUMO_CR  );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_IVA_DB           );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_IVA_CR           );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_IVA_DB        );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_IVA_CR        );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_IVA_DB         );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_IVA_CR         );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_RETEIVA_DB       );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_RETEIVA_CR       );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_RETEIVA_DB    );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_RETEIVA_CR    );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_RETEIVA_DB     );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_RETEIVA_CR     );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_RETEFUENTE_DB    );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_RETEFUENTE_CR    );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_RETEFUENTE_DB );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_RETEFUENTE_CR );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_RETEFUENTE_DB  );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_RETEFUENTE_CR  );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_ICA_DB           );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_ICA_CR           );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_ICA_DB        );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_ICA_CR        );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_ICA_DB         );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_ICA_CR         );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_CREE_DB          );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_CREE_CR          );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_CREE_DB       );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_CREE_CR       );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_CREE_DB        );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_CREE_CR        );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_TOTAL_DB         );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_TOTAL_CR         );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_TOTAL_DB      );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_TOTAL_CR      );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_TOTAL_DB       );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_TOTAL_CR       );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_INTERES_DB       );
  FOT.Eventos_OvcDbPictureField(Id_PUC          , PUC_INTERES_CR       );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_INTERES_DB    );
  FOT.Eventos_OvcDbPictureField(Id_Centro_Costos, CCOSTO_INTERES_CR    );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_INTERES_DB     );
  FOT.Eventos_OvcDbPictureField(Id_Comprobante  , CPMTE_INTERES_CR     );

End;

procedure TFrImpuesto.DataChange(Sender: TObject; Field: TField);
begin
  Inherited;
  FOT.Actualizar_Label(PUC_SUBTOTAL_DB      , lbNombre_PUC_SUBTOTAL_DB      , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_SUBTOTAL_CR      , lbNombre_PUC_SUBTOTAL_CR      , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_SUBTOTAL_DB   , lbNombre_CCOSTO_SUBTOTAL_DB   , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_SUBTOTAL_CR   , lbNombre_CCOSTO_SUBTOTAL_CR   , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_SUBTOTAL_DB    , lbNombre_CPMTE_SUBTOTAL_DB    , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_SUBTOTAL_CR    , lbNombre_CPMTE_SUBTOTAL_CR    , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_SERVICIO_DB      , lbNombre_PUC_SERVICIO_DB      , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_SERVICIO_CR      , lbNombre_PUC_SERVICIO_CR      , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_SERVICIO_DB   , lbNombre_CCOSTO_SERVICIO_DB   , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_SERVICIO_CR   , lbNombre_CCOSTO_SERVICIO_CR   , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_SERVICIO_DB    , lbNombre_CPMTE_SERVICIO_DB    , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_SERVICIO_CR    , lbNombre_CPMTE_SERVICIO_CR    , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_DESCUENTO_DB     , lbNombre_PUC_DESCUENTO_DB     , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_DESCUENTO_CR     , lbNombre_PUC_DESCUENTO_CR     , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_DESCUENTO_DB  , lbNombre_CCOSTO_DESCUENTO_DB  , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_DESCUENTO_CR  , lbNombre_CCOSTO_DESCUENTO_CR  , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_DESCUENTO_DB   , lbNombre_CPMTE_DESCUENTO_DB   , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_DESCUENTO_CR   , lbNombre_CPMTE_DESCUENTO_CR   , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_IMPCONSUMO_DB    , lbNombre_PUC_IMPCONSUMO_DB    , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_IMPCONSUMO_CR    , lbNombre_PUC_IMPCONSUMO_CR    , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_IMPCONSUMO_DB , lbNombre_CCOSTO_IMPCONSUMO_DB , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_IMPCONSUMO_CR , lbNombre_CCOSTO_IMPCONSUMO_CR , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_IMPCONSUMO_DB  , lbNombre_CPMTE_IMPCONSUMO_DB  , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_IMPCONSUMO_CR  , lbNombre_CPMTE_IMPCONSUMO_CR  , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_IVA_DB           , lbNombre_PUC_IVA_DB           , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_IVA_CR           , lbNombre_PUC_IVA_CR           , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_IVA_DB        , lbNombre_CCOSTO_IVA_DB        , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_IVA_CR        , lbNombre_CCOSTO_IVA_CR        , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_IVA_DB         , lbNombre_CPMTE_IVA_DB         , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_IVA_CR         , lbNombre_CPMTE_IVA_CR         , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_RETEIVA_DB       , lbNombre_PUC_RETEIVA_DB       , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_RETEIVA_CR       , lbNombre_PUC_RETEIVA_CR       , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_RETEIVA_DB    , lbNombre_CCOSTO_RETEIVA_DB    , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_RETEIVA_CR    , lbNombre_CCOSTO_RETEIVA_CR    , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_RETEIVA_DB     , lbNombre_CPMTE_RETEIVA_DB     , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_RETEIVA_CR     , lbNombre_CPMTE_RETEIVA_CR     , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_RETEFUENTE_DB    , lbNombre_PUC_RETEFUENTE_DB    , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_RETEFUENTE_CR    , lbNombre_PUC_RETEFUENTE_CR    , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_RETEFUENTE_DB , lbNombre_CCOSTO_RETEFUENTE_DB , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_RETEFUENTE_CR , lbNombre_CCOSTO_RETEFUENTE_CR , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_RETEFUENTE_DB  , lbNombre_CPMTE_RETEFUENTE_DB  , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_RETEFUENTE_CR  , lbNombre_CPMTE_RETEFUENTE_CR  , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_ICA_DB           , lbNombre_PUC_ICA_DB           , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_ICA_CR           , lbNombre_PUC_ICA_CR           , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_ICA_DB        , lbNombre_CCOSTO_ICA_DB        , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_ICA_CR        , lbNombre_CCOSTO_ICA_CR        , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_ICA_DB         , lbNombre_CPMTE_ICA_DB         , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_ICA_CR         , lbNombre_CPMTE_ICA_CR         , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_CREE_DB          , lbNombre_PUC_CREE_DB          , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_CREE_CR          , lbNombre_PUC_CREE_CR          , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_CREE_DB       , lbNombre_CCOSTO_CREE_DB       , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_CREE_CR       , lbNombre_CCOSTO_CREE_CR       , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_CREE_DB        , lbNombre_CPMTE_CREE_DB        , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_CREE_CR        , lbNombre_CPMTE_CREE_CR        , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_TOTAL_DB         , lbNombre_PUC_TOTAL_DB         , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_TOTAL_CR         , lbNombre_PUC_TOTAL_CR         , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_TOTAL_DB      , lbNombre_CCOSTO_TOTAL_DB      , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_TOTAL_CR      , lbNombre_CCOSTO_TOTAL_CR      , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_TOTAL_DB       , lbNombre_CPMTE_TOTAL_DB       , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_TOTAL_CR       , lbNombre_CPMTE_TOTAL_CR       , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_INTERES_DB       , lbNombre_PUC_INTERES_DB       , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(PUC_INTERES_CR       , lbNombre_PUC_INTERES_CR       , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_INTERES_DB    , lbNombre_CCOSTO_INTERES_DB    , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CCOSTO_INTERES_CR    , lbNombre_CCOSTO_INTERES_CR    , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_INTERES_DB     , lbNombre_CPMTE_INTERES_DB     , Field, (DsMaestro.State In [dsBrowse]));
  FOT.Actualizar_Label(CPMTE_INTERES_CR     , lbNombre_CPMTE_INTERES_CR     , Field, (DsMaestro.State In [dsBrowse]));
end;

procedure TFrImpuesto.StateChange(Sender: TObject);
begin
  Inherited;
  If Not tbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_Impuesto.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled  := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 Pagina.ActivePageIndex := 0;
                 If CODIGO_Impuesto.Enabled Then
                   CODIGO_Impuesto.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 Pagina.ActivePageIndex := 0;
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrImpuesto.FormCreate(Sender: TObject);
begin
  FOT := TObjeto_Transaccional.Create(Self);
  Caption := Retornar_Info_Tabla(Id_Impuesto).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Impuesto, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.Tag := gVariableGlobal.Valor_Tag;
  Cargar_Eventos;
end;

procedure TFrImpuesto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrImpuesto.FormDestroy(Sender: TObject);
begin
  FOT.Modo_Edicion := False;
  Cerrar_Archivos;
  FOT.DisposeOf;
end;

procedure TFrImpuesto.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
  End;
end;

Function TFrImpuesto.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Impuesto).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_Impuesto']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_Impuesto', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrImpuesto.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_Impuesto'], [CODIGO_Impuesto.Field.FullName], Retornar_Info_Tabla(Id_Impuesto).Name, '', Retornar_Info_Tabla(Id_Impuesto).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_Impuesto.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrImpuesto.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Impuesto).Caption);
end;

Procedure TFrImpuesto.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

Procedure Show_Form_Impuesto;
Begin
  FrImpuesto := TFrImpuesto.Create(Application);
  If FrImpuesto.Abrir_Archivos Then
    FrImpuesto.Show
  Else
  Begin
    FrImpuesto.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
