unit Form_RadaCube_Lupe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, rsGrid, rsRadarCube, StdCtrls, Menus, rsCommonTypes, OLEDB,
  DB, UtConexion, ComCtrls, ImgList, ToolWin, ExtCtrls, ActnList,
  ActnMan, ActnCtrls, ActnMenus, {$IF CompilerVersion >= 15.0}XPMan, ActnPopup,
  XPStyleActnCtrls, ActnColorMaps,{$IFEND} Registry, rsArrays, rsExport,
  rsDiskOLAPCube, System.Actions, System.ImageList, Vcl.OleCtrls, SHDocVw,
  VCLTee.TeeProcs, VCLTee.TeEngine, rsChart, rsPreview, VCLTee.teePrevi,
  DBCtrls, Buttons;

type
  TSection = class
  private
    SectionName: string;
    SectionID: string;
    SectionBody: string;
    function ExtractSectionName(const s: string): string;
  public
    constructor Create(const ID: string; const Body: string);
    function ThisSection(const Name: string): boolean;
  end;

  TSections = class(TStringList)
  private
    function GetSection(const id: string): TSection;
    procedure SetSection(const id: string; const Value: TSection);
    procedure FreeObjects;
    function GetItem(Index: integer): TSection;
    procedure SetItem(Index: integer; const Value: TSection);
  public
    constructor Create;
    procedure Clear; override;
    destructor Destroy; override;
    procedure LoadFromFile(const FileName: string);
    procedure Add(const SectionID: string; const SectionBody: string); overload;
    property Sections[const id: string]: TSection read GetSection write SetSection;
    property Items[Index: integer]: TSection read GetItem write SetItem; default;
  end;

  TFrRCLupe = class(TForm)
    IL: TImageList;
    ActionList1: TActionList;
    actUndo: TAction;
    actRedo: TAction;
    pmSavedStates: TPopupMenu;
    N1231231: TMenuItem;
    N1231232: TMenuItem;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton1: TToolButton;
    actConnect: TAction;
    actDisconnect: TAction;
    actConnSettings: TAction;
    actExit: TAction;
    actSave: TAction;
    ToolButton2: TToolButton;
    tbSavedStates: TToolButton;
    sdPivotState: TSaveDialog;
    actLoad: TAction;
    odSavedState: TOpenDialog;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    actAllAreas: TAction;
    actPivotView: TAction;
    actOLAPSlice: TAction;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    actToggle: TAction;
    ToolButton11: TToolButton;
    expPDF: TAction;
    ToolBar3: TToolBar;
    ToolButton13: TToolButton;
    expBMP: TAction;
    expXLS: TAction;
    expXML: TAction;
    expTXT: TAction;
    expRTF: TAction;
    expWMF: TAction;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    actCopy: TAction;
    actCopyWithLegend: TAction;
    actCopyWhole: TAction;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    actPrint: TAction;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton12: TToolButton;
    ePDF: TOLAPExportToPDF;
    ExportDialog: TSaveDialog;
    eTXT: TOLAPExportToTXT;
    eRTF: TOLAPExportToRTF;
    eBMP: TOLAPExportToBMP;
    eWMF: TOLAPExportToMF;
    eXLS: TOLAPExportToXLS;
    eXML: TOLAPExportToXML;
    actShowDiagram: TAction;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ePrint: TOLAPExportToPrint;
    OLAPCube: TOLAPCube;
    actOpenDesignTimeCube: TAction;
    actCreateRunTimeCube: TAction;
    actRefreshFactTable: TAction;
    actDrillThrough: TAction;
    Splitter1: TSplitter;
    PC: TPageControl;
    ViewSheet: TTabSheet;
    DescriptionSheet: TTabSheet;
    Panel2: TPanel;
    DescriptionPanel: TPanel;
    DescriptionLabel: TLabel;
    Panel4: TPanel;
    Label2: TLabel;
    Panel5: TPanel;
    Grid: TOLAPGrid;
    wbDescription: TWebBrowser;
    IL2: TImageList;
    actVisualSettings: TAction;
    eHTML: TOLAPExportToHTML;
    expHTML: TAction;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    CreateOLAPCubeinRunTime1: TMenuItem;
    CloseActiveCube1: TMenuItem;
    RefreshFactTable1: TMenuItem;
    N1: TMenuItem;
    Savecurrentstate1: TMenuItem;
    Loadpivotstate1: TMenuItem;
    N2: TMenuItem;
    Print1: TMenuItem;
    N6: TMenuItem;
    Exit1: TMenuItem;
    Edit1: TMenuItem;
    Undo1: TMenuItem;
    Redo1: TMenuItem;
    N3: TMenuItem;
    Copy1: TMenuItem;
    Copywithlegend1: TMenuItem;
    Copywholegrid1: TMenuItem;
    N4: TMenuItem;
    ogglepivotareas1: TMenuItem;
    View1: TMenuItem;
    Cubestructireview1: TMenuItem;
    Pivitareasview1: TMenuItem;
    OLAPsliceview1: TMenuItem;
    Export1: TMenuItem;
    ExporttotheBMPfile1: TMenuItem;
    ExporttothePDFfile1: TMenuItem;
    ExporttotheRTFfile1: TMenuItem;
    Exporttothetextfile1: TMenuItem;
    ExporttotheWMFfile1: TMenuItem;
    ExporttotheXLSfile1: TMenuItem;
    ExporttotheXMLfile1: TMenuItem;
    ExporttotheHTMLfile1: TMenuItem;
    VisualSettings1: TMenuItem;
    procedure actSaveExecute(Sender: TObject);
    procedure actRedoExecute(Sender: TObject);
    procedure actUndoExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actLoadExecute(Sender: TObject);
    procedure actAllAreasExecute(Sender: TObject);
    procedure actPivotViewExecute(Sender: TObject);
    procedure actOLAPSliceExecute(Sender: TObject);
    procedure actToggleExecute(Sender: TObject);
    procedure expPDFExecute(Sender: TObject);
    procedure expTXTExecute(Sender: TObject);
    procedure expBMPExecute(Sender: TObject);
    procedure expXLSExecute(Sender: TObject);
    procedure expXMLExecute(Sender: TObject);
    procedure expRTFExecute(Sender: TObject);
    procedure expWMFExecute(Sender: TObject);
    procedure actShowDiagramExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure GridGetPopupMenu(Sender: TObject; EventArgs: TPopupMenuArgs);
    procedure OLAPCubeCalculateField(Sender: TObject;
      Args: TCalculateFieldArgs);
    procedure actOpenDesignTimeCubeExecute(Sender: TObject);
    procedure actCreateRunTimeCubeExecute(Sender: TObject);
    procedure CloseActiveCube1Click(Sender: TObject);
    procedure actDrillThroughExecute(Sender: TObject);
    procedure GridDrawCell(Sender: TObject;
      EventArgs: TEventDrawCellArgs);
    procedure OLAPCubeDefineIndex(Sender: TObject; Args: TDefineIndexArgs);
    procedure GridPaintCell(Sender: TObject;
      EventArgs: TEventPaintCellArgs);
    procedure OLAPCubeAfterReadDatabase(Sender: TObject;
      Args: TAfterReadDatabaseArgs);
    procedure tvReportsChange(Sender: TObject; Node: TTreeNode);
    procedure actVisualSettingsExecute(Sender: TObject);
    procedure GridChangeShowMode(Sender: TObject; EventArgs: TEventArgs);
    procedure expHTMLExecute(Sender: TObject);
    procedure OLAPCubeAggregate(Sender: TObject;
      EventArgs: TAggregateArgs);
    procedure actCopyExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FTOTAL : Boolean;
    FCOSTO : Boolean;
    FRECAUDO : Boolean;
    FFECHAINI : String;
    FFECHAFIN : String;
    FEXPANDING : Boolean;
    FPRESUPUESTO : Boolean;
    FPRESUPUESTO_RECAUDO : Boolean;
    FTRANSACCIONES : TQuery;
    FTIPO_PROCESO : String;
    FCODIGO_PLANTILLA : String;
    fSavedStates: TStringObjectArray;
    fPopupRow, fPopupCol: integer;
    FCategories_Picture: TDDataColumn;
    Sections: TSections;
    FButton: TButton;
    Procedure Carga_Info_Transacciones;
    procedure Cargar_Info_Pivotes(pCodigo_Plantilla, pTipo_Campo : String);
    procedure Cargar_Info_Valores(pCodigo_Plantilla, pTipo_Campo : String);
    procedure Guardar_Info_Pivotes(Const pCodigo_Plantilla, pNombre_Campo, pTipo_Ubicacion, pOrden : String);
    procedure Guardar_Distribucion_Pivotes;
    Procedure ExpandedAll;
    procedure Distribuir_Pivotes;
    procedure GridAction(Sender: TObject);
    procedure LoadSavedState(Sender: TObject);
    procedure MenuDiagramShow(Sender: TObject);
    { This function takes the BLOB image field fetched from the table as AnsiString or TStream
      and returns the position from which the bitmap in the string/stream starts or -1.
      This may be needed if the BLOB field contains the OLE object instead of a pure image (like MS Access for example) }
    function BitmapBeginning(const s: AnsiString): integer; overload;
    function BitmapBeginning(Stream: TStream): Int64; overload;
    procedure OpenBrowser(const Source: string);
    procedure OnInitMeasuresHandler(Sender: TObject);
    procedure OnShowMeasure(Sender: TObject; EventArgs: TShowMeasureArgs);
    procedure OnDateMemberSort(Sender: TObject; EventArgs: TEventMemberSortArgs);
    procedure OnToggleSortOrder(Sender: TObject);
    procedure OnGroupMembers(Sender: TObject);
    procedure OnForecastingMembers(Sender: TObject);
    procedure OnClickReplaceContent(Sender: TObject);
    procedure OnCalcForecastedMembers(Sender: TObject; EventArgs: TCalcMemberArgs);
    procedure OnCalcTrendMembers(Sender: TObject; EventArgs: TCalcMemberArgs);
    procedure OnCalcTrendMembers2(Sender: TObject; EventArgs: TCalcMemberArgs);
    procedure HighlightCalculated(Sender: TObject; EventArgs: TEventDrawCellArgs);
    procedure DrawCaptions(Sender: TObject; EventArgs: TEventDrawCellArgs);
    procedure DrawPictures(Sender: TObject; EventArgs: TEventDrawCellArgs);
    procedure DrawMemberCaption(Sender: TObject; EventArgs: TEventDrawCellArgs);
    procedure PaintTrend(Sender: TObject; EventArgs: TEventPaintCellArgs);
    procedure ShowDataCellDetails(Sender: TObject; EventArgs: TPopupMenuArgs);
    procedure AddChartingItem(Sender: TObject; EventArgs: TPopupMenuArgs);
    procedure AddDrillThrough(Sender: TObject; EventArgs: TPopupMenuArgs);
    procedure Cargar_Info_Instancia_Cubo(pCubo: TOLAPCube; pSQL: TQuery; pTipo_Proceso : String);
  public
    Chart: TOLAPChart;
    procedure CleanUpGrid;
    procedure InitSamples;
    procedure InitSimpleSales;
    procedure InitMeasuresAndMeasureModes;
    procedure InitChangeSortOrder;
    procedure InitGroups;
    procedure InitCalculatedMembers;
    procedure InitReplaceCells;
    procedure InitPlacePicturesInCells;
    procedure InitPaintingWithinCells;
    procedure InitCustomizingContextMenu;
    procedure InitCharting;
    procedure ActivateOLAPCube;
    procedure InitDrillThrough;
    procedure ActivateSection(Section: TSection);
  end;

var
  FrRCLupe: TFrRCLupe;

Procedure Form_RadaCube_Lupe_Show(pCodigo_Plantilla, pTipo_Proceso, pCaption, pFechaIni, pFechaFin : String);

implementation
{$R *.dfm}
uses
  Math,
  
  OleCtnrs,
  rsGDIPApi,
  rsGDIPobj,
  rsGDIPutil,
  UtConexion,
  UtFunciones,
  Form_Splash,
  Form_Opcion,
  UtInfoTablas,
  rsMemoDataSet,
  UtHomologacion,
  rsExportOptions,
  UtSentencia_SQL,
  rsDrillThroughForm,
  UtVariablesGlobales,
  UtExportar_Plantilla,
  UtAdministrar_Analisis;

Var
  FCAMPOS_Transacciones : TLista_Analisis;

function RemoveBrackets(const s: string): string;
var
  i, j: integer;
begin
  i := 1; j := length(s);
  if s[i] = '[' then inc(i);
  if s[j] = ']' then dec(j);
  Result := copy(s, i, j - i + 1);
end;

procedure TFrRCLupe.actAllAreasExecute(Sender: TObject);
begin
  Grid.OLAPPanelSettings.ShowAreasMode := rsAll;
end;

procedure TFrRCLupe.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrRCLupe.actLoadExecute(Sender: TObject);
var
  M: TMemoryStream;
begin
  if not odSavedState.Execute then EXIT;
  if (odSavedState.FilterIndex = 1) then
    begin
      M := TMemoryStream.Create;
      M.LoadFromFile(odSavedState.FileName);
      M.Position := 0;
      Grid.LoadFromStream(M);
    end
  else if (odSavedState.FilterIndex = 2) then
    begin
      Grid.Serializer.ReadXML(odSavedState.FileName);
    end;
end;

procedure TFrRCLupe.actOLAPSliceExecute(Sender: TObject);
begin
  Grid.OLAPPanelSettings.ShowAreasMode := rsDataOnly;
end;

procedure TFrRCLupe.actPivotViewExecute(Sender: TObject);
begin
  Grid.OLAPPanelSettings.ShowAreasMode := rsPivot;
end;

procedure TFrRCLupe.actRedoExecute(Sender: TObject);
begin
  Grid.History.Redo;
end;

procedure TFrRCLupe.actSaveExecute(Sender: TObject);
var
  S: string;
  M: TMemoryStream;
  MI: TMenuItem;
begin
  if not sdPivotState.Execute then EXIT;
  S := ExtractFileName(sdPivotState.FileName);
  M := TMemoryStream.Create;
  if (sdPivotState.FilterIndex = 1) then
    begin
      Grid.SaveToStream(M);
      M.SaveToFile(sdPivotState.FileName);

      fSavedStates.AddPointer(S, M);

      MI := TMenuItem.Create(pmSavedStates);
      pmSavedStates.Items.Add(MI);
      tbSavedStates.Enabled := True;
      MI.Tag := Integer(M);
      MI.Caption := S;
      MI.OnClick := LoadSavedState;
    end
  else if (sdPivotState.FilterIndex = 2) then
    begin
      Grid.Serializer.WriteXML(sdPivotState.FileName);
    end
end;

procedure TFrRCLupe.actToggleExecute(Sender: TObject);
begin
  Grid.ToggleLayout;
end;

procedure TFrRCLupe.actUndoExecute(Sender: TObject);
begin
  Grid.History.Undo;
end;


procedure TFrRCLupe.expBMPExecute(Sender: TObject);
begin
  if not Grid.Active then EXIT;
  ExportDialog.FileName := '';
  ExportDialog.DefaultExt := 'bmp';
  ExportDialog.Filter := 'BMP files|*.bmp';
  if ExportDialog.Execute then
   begin
    eBMP.Grid := Grid;
    eBMP.ExportToFile(ExportDialog.FileName);
    ShowMessage('Exportación Completada!');
   end;
end;

procedure TFrRCLupe.expPDFExecute(Sender: TObject);
begin
  if not Grid.Active then EXIT;
  ExportDialog.FileName := '';
  ExportDialog.DefaultExt := 'pdf';
  ExportDialog.Filter := 'PDF files|*.pdf';
  if ExportDialog.Execute then
   begin
    ePDF.Grid := Grid;
    ePDF.ExportToFile(ExportDialog.FileName);
    ShowMessage('Exportación Completada!');
   end;
end;

procedure TFrRCLupe.expRTFExecute(Sender: TObject);
begin
  if not Grid.Active then EXIT;
  ExportDialog.FileName := '';
  ExportDialog.DefaultExt := 'rtf';
  ExportDialog.Filter := 'RTF files|*.rtf';
  if ExportDialog.Execute then
   begin
    eRTF.Grid := Grid;
    eRTF.ExportToFile(ExportDialog.FileName);
    ShowMessage('Exportación Completada!');
   end;
end;

procedure TFrRCLupe.expTXTExecute(Sender: TObject);
begin
  if not Grid.Active then EXIT;
  ExportDialog.FileName := '';
  ExportDialog.DefaultExt := 'txt';
  ExportDialog.Filter := 'Text files|*.txt';
  if ExportDialog.Execute then
   begin
    eTXT.Grid := Grid;
    eTXT.ExportToFile(ExportDialog.FileName);
    ShowMessage('Exportación Completada!');
   end;
end;

procedure TFrRCLupe.expWMFExecute(Sender: TObject);
begin
  if not Grid.Active then EXIT;
  ExportDialog.FileName := '';
  ExportDialog.DefaultExt := 'wmf';
  ExportDialog.Filter := 'WMF files|*.wmf';
  if ExportDialog.Execute then
   begin
    eWMF.Grid := Grid;
    eWMF.ExportToFile(ExportDialog.FileName);
    ShowMessage('Exportación Completada!');
   end;
end;

procedure TFrRCLupe.expXLSExecute(Sender: TObject);
Var
  lOption : Integer;
begin
  If Not Grid.Active then
    EXIT;
  If Show_FrOpcion(['Resumido', 'Detallado'], lOption) Then
  Begin
    Case lOption Of
      1 : Begin
            ExportDialog.FileName := '';
            ExportDialog.DefaultExt := 'xls';
            ExportDialog.Filter := 'MS Excel files|*.xls';
            if ExportDialog.Execute then
            begin
              eXLS.Grid := Grid;
              eXLS.ExportToFile(ExportDialog.FileName);
              ShowMessage('Exportación Completada!');
            end;
          End;
      2 : Begin
            Exportar_Plantilla(FTIPO_PROCESO, FCODIGO_PLANTILLA, Self.Caption, FFECHAINI, FFECHAFIN);
            ShowMessage('Exportación Completada!');
          End;
    End;
  End;
end;

procedure TFrRCLupe.expXMLExecute(Sender: TObject);
begin
  if not Grid.Active then EXIT;
  ExportDialog.FileName := '';
  ExportDialog.DefaultExt := 'xml';
  ExportDialog.Filter := 'XML files|*.xml';
  if ExportDialog.Execute then
   begin
    eXML.Grid := Grid;
    eXML.ExportToFile(ExportDialog.FileName);
    ShowMessage('Exportación Completada!');
   end;
end;

procedure TFrRCLupe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TFrRCLupe.FormCreate(Sender: TObject);
begin
  FEXPANDING := False;
  FTRANSACCIONES := TQuery.Create(Nil);
  FTRANSACCIONES.Name := 'QR' + 'TRANSACCIONES';
  Configurar_Conexion_Segura(FTRANSACCIONES);

  fSavedStates := TStringObjectArray.Create;
  Sections := TSections.Create();
  Sections.LoadFromFile(ChangeFileExt(Application.ExeName, '.txt'));
  Grid.OLAPPanelSettings.BtnsShow := False;
  Grid.OnGridEvent := GridAction;
  Chart := TOLAPChart.Create(nil);
  Chart.EmbedsToGrid := True;
  Chart.Grid := Grid;
  Chart.Align := alClient;
  Chart.Visible := False;
  Chart.Title.Visible := False;
end;

procedure TFrRCLupe.FormDestroy(Sender: TObject);
begin
  FTRANSACCIONES.DisposeOf;
  FreeAndNil(Sections);
  actDisconnect.Execute;
  fSavedStates.Free;
  Chart.Free;
  SetLength(FCAMPOS_Transacciones , 0);
end;

procedure TFrRCLupe.GridAction(Sender: TObject);
begin
  Guardar_Distribucion_Pivotes;
  ExpandedAll;
  actUndo.Enabled := Grid.Active and not Grid.History.First;
  actRedo.Enabled := Grid.Active and not Grid.History.Last;
  actSave.Enabled := Grid.Active;
  actLoad.Enabled := Grid.Active;
  actToggle.Enabled := Grid.Active;
  tbSavedStates.Enabled := Grid.Active;
  if not Grid.Active then
   begin
    pmSavedStates.Items.Clear;
    fSavedStates.Clear;
   end;
end;

procedure TFrRCLupe.LoadSavedState(Sender: TObject);
var
  M: TMemoryStream;
begin
  M := TMemoryStream(TMenuItem(Sender).Tag);
  M.Position := 0;
  Grid.LoadFromStream(M);
end;

procedure TFrRCLupe.actShowDiagramExecute(Sender: TObject);
begin
  Chart.Visible := not Chart.Visible;
  actShowDiagram.Checked := Chart.Visible;
end;

procedure TFrRCLupe.actPrintExecute(Sender: TObject);
begin
  if not Grid.Active then EXIT;
  if Chart.Visible then
    {$IF CompilerVersion >= 18.5}
    VCLTee.TeePrevi.TeePreview(Self, Chart)
    {$ELSE}
    ChartPreview(Self, Chart)
    {$IFEND}
   else ShowPreview(ePrint);
end;

function FindActionByName(ActionList: TCustomActionList; const ActionName: string): TContainedAction;
var
  i: integer;
begin
  for i := 0 to ActionList.ActionCount - 1 do
  begin
    Result := ActionList[i];
    if Result.Name = ActionName then EXIT;
  end;
  Result := nil;
end;
 
procedure TFrRCLupe.GridGetPopupMenu(Sender: TObject;
  EventArgs: TPopupMenuArgs);
var
  C: ICell;
  M: TMenuItem;
begin
  C := Grid.Cellset.Cells[EventArgs.Column, EventArgs.Row];
  if C.CellType <> ctData then EXIT;

  fPopupRow := EventArgs.Row;
  fPopupCol := EventArgs.Column;

  M := TMenuItem.Create(EventArgs.Popup);
  EventArgs.Popup.Items.Add(M);
  M.Caption := '-';

  M := TMenuItem.Create(EventArgs.Popup);
  EventArgs.Popup.Items.Add(M);
  M.Caption := 'Show the cell area in the diagram';
  M.OnClick := MenuDiagramShow;
  EventArgs.Popup.Images := IL;
  M.ImageIndex := 20;

  M := TMenuItem.Create(EventArgs.Popup);
  EventArgs.Popup.Items.Add(M);
  M.Action := FindActionByName(ActionList1, 'actDrillThrough');
end;

procedure TFrRCLupe.MenuDiagramShow(Sender: TObject);
var
  D: IDataCell;
  MR, MC: IMemberCell;
begin
  // Get the selected data cell
  D := IDataCell(Grid.Cellset.Cells[fPopupCol, fPopupRow]);
  // Get the cells for the corresponding members in the row and column areas
  MR := IMemberCell(Grid.Cellset.Cells[Grid.Cellset.FixedColumns - 1, D.StartRow]);
  MC := IMemberCell(Grid.Cellset.Cells[D.StartColumn, Grid.Cellset.FixedRows - 1]);
  Chart.BeginUpdate;
  
  // Controlling member in the row area
  if (MR.Member = nil) or (MR.Member.Parent = nil)
   then Chart.RowsParentUniqueName := ''
   else Chart.RowsParentUniqueName := MR.Member.Parent.UniqueName;

  // Controlling member in the column area
  if (MC.Member = nil) or (MC.Member.Parent = nil)
   then Chart.ColumnsParentUniqueName := ''
   else Chart.ColumnsParentUniqueName := MC.Member.Parent.UniqueName;
   
  Chart.EndUpdate;
  // The actShowDiagram.Execute does nothing more than manipulates the diagram Visible property
  actShowDiagram.Execute;
end;

procedure TFrRCLupe.OLAPCubeCalculateField(Sender: TObject; Args: TCalculateFieldArgs);
var
  Year, Month, Day: word;
  D: TDateTime;
  OrdersRow: TDDataRow;
begin
  { The event allows to calculate the fields marked as calculated }
  IF FTIPO_PROCESO = 'V' Then
  Begin
    if Args.ThisTable(FTRANSACCIONES) then
    with Args.Row do
    begin
      If FTOTAL And FCOSTO Then
        If AsFloat['TOTAL'] <> 0 Then
          AsFloat['Rentabilidad'           ] := (AsFloat['TOTAL'  ] - AsFloat['TOTAL']/AsFloat['TOTAL']) * 100;

      If FTOTAL And FPRESUPUESTO Then
        If AsFloat['PRESUPUESTO'] <> 0 Then
          AsFloat['Cumplimiento de Ventas' ] := (AsFloat['TOTAL'  ] / AsFloat['PRESUPUESTO'           ]) * 100;

      If FRECAUDO And FPRESUPUESTO_RECAUDO Then
        If AsFloat['PRESUPUESTO_RECAUDO'] <> 0 Then
          AsFloat['Cumplimiento de Recaudo'] := (AsFloat['RECAUDO'] / AsFloat['PRESUPUESTO_RECAUDO']   ) * 100;
    end;
//
//  if Args.ThisTable('qrOrderDetails') then
//  with Args.Row do
//  begin
//    AsCurrency['Sales'] := AsInteger['Quantity'] * AsCurrency['UnitPrice'] * (1 - AsFloat['Discount']);
//
//    OrdersRow := GetParentRow('qrOrders');
//    D := OrdersRow.AsDateTime['orderdate'];
//    DecodeDate(D, Year, Month, Day);
//    // Year
//    AsInteger['Year'] := Year;
//    AsString['Month'] := FormatSettings.LongMonthNames[Month];
//    if Month in [1, 2, 3] then
//      AsString['Quarter'] := '1st quarter'
//    else if Month in [4, 5, 6] then
//      AsString['Quarter'] := '2nd quarter'
//    else if Month in [7, 8, 9] then
//      AsString['Quarter'] := '3rd quarter'
//    else
//      AsString['Quarter'] := '4th quarter';
//  end;
  End;
end;

procedure TFrRCLupe.actOpenDesignTimeCubeExecute(Sender: TObject);
begin
  Grid.Cube := OLAPCube;
  OLAPCube.Active := True;
end;

Procedure Control_Boolean(Var pFlag : Boolean; pValueA, pValueB : String);
Begin
  If Not pFlag Then
    pFlag := AnsiUpperCase(Trim(pValueA)) = AnsiUpperCase(Trim(pValueB));
End;

procedure TFrRCLupe.Cargar_Info_Instancia_Cubo(pCubo: TOLAPCube; pSQL: TQuery; pTipo_Proceso : String);
Var
  lSQL : TQuery;
  Table : TDDataTable;
Begin
  FTOTAL := False;
  FCOSTO := False;
  FRECAUDO := False;
  FPRESUPUESTO := False;
  FPRESUPUESTO_RECAUDO := False;
  Try
    Table := pCubo.AddDataTable(pSQL);
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gConexion;
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT *  FROM ' + Retornar_Info_Tabla(Id_Plantilla_Det).Name + ' ');
    lSQL.SQL.Add(' WHERE  ' + Trim_Sentence('CODIGO_PLANTILLA') + ' = ' + QuotedStr(Trim(FCODIGO_PLANTILLA)));
    lSQL.SQL.Add(' AND  '   + Trim_Sentence('SELECCIONADO'    ) + ' = ' + QuotedStr('S'                    ));
    lSQL.SQL.Add(' AND  '   + Trim_Sentence('TIPO_CAMPO'      ) + ' = ' + QuotedStr('V'                    ));
    lSQL.Active := True ;
    lSQL.First;
    While Not lSQL.Eof Do
    Begin
      If lSQL.FieldByName('TIPO_CAMPO').AsString = 'P' Then
      Begin
        pCubo.AddHierarchy('Pivotes', pSQL, Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString), '', Trim(lSQL.FieldByName('NOMBRE').AsString));
      End
      Else
        pCubo.AddMeasure(pSQL, Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString), Trim(lSQL.FieldByName('NOMBRE').AsString)).DefaultFormat := '#,#';
      Control_Boolean(FTOTAL              , 'TOTAL'              , Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString));
      Control_Boolean(FCOSTO              , 'COSTO'              , Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString));
      Control_Boolean(FRECAUDO            , 'RECAUDO'            , Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString));
      Control_Boolean(FPRESUPUESTO        , 'PRESUPUESTO'        , Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString));
      Control_Boolean(FPRESUPUESTO_RECAUDO, 'PRESUPUESTO_RECAUDO', Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString));
      lSQL.Next;
    End;
    lSQL.Active := False;

    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT *  FROM ' + Retornar_Info_Tabla(Id_Plantilla_Det).Name + ' ');
    lSQL.SQL.Add(' WHERE  ' + Trim_Sentence('CODIGO_PLANTILLA') + ' = ' + QuotedStr(Trim(FCODIGO_PLANTILLA)));
    lSQL.SQL.Add(' AND  '   + Trim_Sentence('SELECCIONADO'    ) + ' = ' + QuotedStr('S'                    ));
    lSQL.SQL.Add(' AND  '   + Trim_Sentence('TIPO_CAMPO'      ) + ' = ' + QuotedStr('P'                    ));
    lSQL.Active := True ;
    lSQL.First;
    While Not lSQL.Eof Do
    Begin
      If lSQL.FieldByName('TIPO_CAMPO').AsString = 'P' Then
      Begin
        pCubo.AddHierarchy('Pivotes', pSQL, Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString), '', Trim(lSQL.FieldByName('NOMBRE').AsString));
      End
      Else
        pCubo.AddMeasure(pSQL, Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString), Trim(lSQL.FieldByName('NOMBRE').AsString)).DefaultFormat := '#,#';
      Control_Boolean(FTOTAL              , 'TOTAL'              , Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString));
      Control_Boolean(FCOSTO              , 'COSTO'              , Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString));
      Control_Boolean(FRECAUDO            , 'RECAUDO'            , Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString));
      Control_Boolean(FPRESUPUESTO        , 'PRESUPUESTO'        , Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString));
      Control_Boolean(FPRESUPUESTO_RECAUDO, 'PRESUPUESTO_RECAUDO', Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString));
      lSQL.Next;
    End;

    If pTipo_Proceso = 'V' Then
    Begin
      If FTOTAL And FCOSTO Then
        pCubo.AddCalculatedMeasure(pSQL, ftFloat, 'Rentabilidad');

      If FTOTAL And FPRESUPUESTO Then
        pCubo.AddCalculatedMeasure(pSQL, ftFloat, 'Cumplimiento de Ventas');

      If FRECAUDO And FPRESUPUESTO_RECAUDO Then
        pCubo.AddCalculatedMeasure(pSQL, ftFloat, 'Cumplimiento de Recaudo');
    End;

    lSQL.Active := False;
    lSQL.DisposeOf;
  Except
    On E:Exception Do
      UtLog_Execute('TFrRCLupe.Cargar_Info_Instancia_Cubo, ' + E.Message);
  End;
end;

procedure TFrRCLupe.Cargar_Info_Pivotes(pCodigo_Plantilla, pTipo_Campo : String);
Var
  lI : Integer;
  lJ : Integer;
  lK : Integer;
  lSQL : TQuery;
Begin
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gConexion;
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT *  FROM ' + Retornar_Info_Tabla(Id_Plantilla_Det).Name + ' ');
    lSQL.SQL.Add(' WHERE  ' + Trim_Sentence('CODIGO_PLANTILLA') + ' = ' + QuotedStr(Trim(pCodigo_Plantilla)));
    lSQL.SQL.Add(' AND  '   + Trim_Sentence('TIPO_CAMPO'      ) + ' = ' + QuotedStr(pTipo_Campo            ));
    lSQL.SQL.Add(' ORDER BY TIPO_ORDEN '                                                                           );
    lSQL.Active := True ;
    If lSQL.Active Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        For lI :=  0 To Grid.Dimensions.Count - 1 Do
          For lJ := 0 To Grid.Dimensions[lI].Hierarchies.Count-1 Do
          Begin
            If (Grid.Dimensions[lI].Hierarchies.Items[lJ].CubeHierarchy.DisplayField) = Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString) Then
            Begin
              If lSQL.FieldByName('TIPO_UBICACION').AsString = 'F' Then
              Begin
                Grid.PivotingLast(Grid.Dimensions[lI].Hierarchies.Items[lJ], laRow);
              End
              Else
                If lSQL.FieldByName('TIPO_UBICACION').AsString = 'C' Then
                  Grid.PivotingLast(Grid.Dimensions[lI].Hierarchies.Items[lJ], laColumn)
                Else
                  If lSQL.FieldByName('TIPO_UBICACION').AsString = 'P' Then
                    Grid.PivotingLast(Grid.Dimensions[lI].Hierarchies.Items[lJ], laPage);
            End;
          End;
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    lSQL.DisposeOf;
  Except
    On E:Exception Do
      UtLog_Execute('TFrRCLupe.Cargar_Info_Pivotes, ' + E.Message);
  End;
end;

procedure TFrRCLupe.Cargar_Info_Valores(pCodigo_Plantilla, pTipo_Campo : String);
Var
  lI : Integer;
  lSQL : TQuery;
Begin
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gConexion;
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT *  FROM ' + Retornar_Info_Tabla(Id_Plantilla_Det).Name + ' ');
    lSQL.SQL.Add(' WHERE  ' + Trim_Sentence('CODIGO_PLANTILLA') + ' = ' + QuotedStr(Trim(pCodigo_Plantilla)));
    lSQL.SQL.Add(' AND  '   + Trim_Sentence('TIPO_CAMPO'      ) + ' = ' + QuotedStr(pTipo_Campo            ));
    lSQL.SQL.Add(' ORDER BY TIPO_ORDEN '                                                                           );
    lSQL.Active := True ;
    If lSQL.Active Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        For lI :=  0 To Grid.Measures.Count - 1 Do
        Begin
          If Pos(Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString), Trim(Grid.Measures[lI].UniqueName)) > 0  Then
            Grid.Measures[lI].Visible := Trim(lSQL.FieldByName('TIPO_VISIBLE').AsString) = 'S';
        End;
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    lSQL.DisposeOf;
  Except
    On E:Exception Do
      UtLog_Execute('TFrRCLupe.Cargar_Info_Valores, ' + E.Message);
  End;
end;

procedure TFrRCLupe.Distribuir_Pivotes;
var
  lI : Integer;
  lJ : Integer;
begin
  Grid.BeginUpdate;
  Cargar_Info_Pivotes(FCODIGO_PLANTILLA, 'F');
  Cargar_Info_Pivotes(FCODIGO_PLANTILLA, 'C');
  Cargar_Info_Pivotes(FCODIGO_PLANTILLA, 'P');
  Cargar_Info_Valores(FCODIGO_PLANTILLA, 'V');
  Grid.EndUpdate;
end;

procedure TFrRCLupe.Guardar_Info_Pivotes(Const pCodigo_Plantilla, pNombre_Campo, pTipo_Ubicacion, pOrden : String);
Var
  lSQL : TQuery;
Begin
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gConexion;
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT *  FROM ' + Retornar_Info_Tabla(Id_Plantilla_Det).Name + ' ');
    lSQL.SQL.Add(' WHERE  ' + Trim_Sentence('CODIGO_PLANTILLA') + ' = ' + QuotedStr(Trim(pCodigo_Plantilla)));
    lSQL.SQL.Add(' AND  '   + Trim_Sentence('NOMBRE_CAMPO'    ) + ' = ' + QuotedStr(pNombre_Campo          ));
    lSQL.Active := True ;
    lSQL.First;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.Edit;
      lSQL.FieldByName('TIPO_UBICACION').AsString := pTipo_Ubicacion;
      lSQL.FieldByName('TIPO_ORDEN'    ).AsString := Justificar(pOrden, '0', lSQL.FieldByName('TIPO_ORDEN').Size);
      lSQL.Post;
    End;
    lSQL.Active := False;
  Except
    On E:Exception Do
      UtLog_Execute('TFrRCLupe.Guardar_Info_Pivotes, ' + E.Message);
  End;
end;

procedure TFrRCLupe.Guardar_Distribucion_Pivotes;
var
  lI : Integer;
  lJ : Integer;
begin
  For lI := 0 To Grid.Layout.RowAxisLength-1 Do
    Guardar_Info_Pivotes(FCODIGO_PLANTILLA, Grid.Layout.RowAxis[lI].DisplayName   , 'F', IntToStr(lI));

  For lI := 0 To Grid.Layout.ColumnAxisLength-1 Do
    Guardar_Info_Pivotes(FCODIGO_PLANTILLA, Grid.Layout.ColumnAxis[lI].DisplayName, 'C', IntToStr(lI));

  For lI := 0 To Grid.Layout.PageAxisLength-1 Do
    Guardar_Info_Pivotes(FCODIGO_PLANTILLA, Grid.Layout.PageAxis[lI].DisplayName  , 'P', IntToStr(lI));
end;

Procedure TFrRCLupe.ExpandedAll;
var
  lI : Integer;
  lJ : Integer;
begin
  If FEXPANDING Then
    Exit;
  FEXPANDING := True;
  Try
    For lI := 0 To Grid.Layout.RowAxisLength-1 Do
    Begin
      For lJ := 0 To Grid.Layout.RowAxis[lI].Levels.Count-1 Do
        Grid.CellSet.ExpandAllNodes(TMemberExpandStatus.esNextHierarchy, Grid.Layout.RowAxis[lI].Levels[lJ]);
    End;

    For lI := 0 To Grid.Layout.ColumnAxisLength-1 Do
    Begin
      For lJ := 0 To Grid.Layout.ColumnAxis[lI].Levels.Count-1 Do
        Grid.CellSet.ExpandAllNodes(TMemberExpandStatus.esNextHierarchy, Grid.Layout.ColumnAxis[lI].Levels[lJ]);
    End;

    For lI := 0 To Grid.Layout.PageAxisLength-1 Do
    Begin
      For lJ := 0 To Grid.Layout.PageAxis[lI].Levels.Count-1 Do
        Grid.CellSet.ExpandAllNodes(TMemberExpandStatus.esNextHierarchy, Grid.Layout.PageAxis[lI].Levels[lJ]);
    End;
  Except
    On E:Exception Do
      UtLog_Execute('TFrRCLupe.ExpandedAll, ' + E.Message);
  End;
  FEXPANDING := False;
end;

Procedure TFrRCLupe.Carga_Info_Transacciones;
Var
  FANALISIS : TAnalisis;
Begin
  Try
    FANALISIS := TAnalisis.Create;
    FANALISIS.CAMPOS       := FCAMPOS_Transacciones;
    FANALISIS.CONDICIONES  := [];
    If FTIPO_PROCESO = 'T' Then
      FANALISIS.Cargar_Analisis_Transacciones('', FFECHAINI, FFECHAFIN, FTRANSACCIONES)
    Else
      If FTIPO_PROCESO = 'C' Then
        FANALISIS.Cargar_Analisis_Contable('', FFECHAINI, FFECHAFIN, FTRANSACCIONES)
      Else
        If FTIPO_PROCESO = 'I' Then
          FANALISIS.Cargar_Analisis_Inventario('', FFECHAINI, FFECHAFIN, FTRANSACCIONES);
    FANALISIS.DisposeOf;
  Except
    On E:Exception Do
      UtLog_Execute('TFrRCLupe.Carga_Info_Transacciones, ' + E.Message);
  End;
End;


procedure TFrRCLupe.actCreateRunTimeCubeExecute(Sender: TObject);
var
//  Cube: TOLAPCube;
  H1, H2, H3: TCubeHierarchy;
begin
  Show_Splash;

  { This method shows how to create an OLAP Cube entirely in run time }
//  Cube := TOLAPCube.Create(Self);
  Try
    Actualiza__Splash('Preparando entorno...');
    OLAPCube.Active := False;
    Actualiza__Splash('Definiendo estructura...');
    Carga_Info_Transacciones;
    Actualiza__Splash('Estableciendo estructura...');
    Self.Cargar_Info_Instancia_Cubo(OLAPCube, FTRANSACCIONES, FTIPO_PROCESO);
    Actualiza__Splash('Creando campos calculados...');
    OLAPCube.OnCalculateField := OLAPCubeCalculateField;

  //  with Cube do
  //  begin
  //    { Assign an event to calculate fields in }
  ////    OnCalculateField := OLAPCubeCalculateField;
  //
  ////    { The field "Sales" must be calculated in the OnCalculateField event }
  ////    AddCalculatedMeasure(qrOrderDetails, ftCurrency, 'Sales');
  ////    AddMeasure(qrOrderDetails, 'Quantity').DefaultFormat := '#,#';
  ////
  ////    AddHierarchy('Customers', qrCustomers, 'CompanyName', '', 'Customers');
  ////
  ////    { The Field "Employee Name" must be calculated in the OnCalculateField event }
  ////    AddCalculatedColumn(qrEmployees, 'Employee Name', ftWideString).Size := 50;
  ////    { We might as well use a calculated field as a source field for hierarchy }
  ////    AddHierarchy('Emloyees', qrEmployees, 'Employee Name', 'ReportsTo', 'Employees');
  ////    AddHierarchy('Shippers', qrShippers, 'CompanyName', '', 'Shippers');
  ////
  ////    // In the "Products" dimension we create two composite hierarchies: "Suppliers" and "Categories"
  ////    { Create three different levels: "Suppliers", "Products", and "Categories"}
  ////    H1 := AddHierarchy('Products', qrSuppliers, 'CompanyName', '', 'Suppliers');
  ////    H2 := AddHierarchy('Products', qrProducts, 'ProductName', '', 'Products');
  ////    H3 := AddHierarchy('Products', qrCategories, 'CategoryName', '', 'Categories');
  ////    { One way to make up a composite hierarchy is to call MakeUpCompositeHierarchy method for every level }
  ////    MakeUpCompositeHierarchy('Products', 'Suppliers', H1);
  ////    MakeUpCompositeHierarchy('Products', 'Suppliers', H2);
  ////    { Another way is to call MakeUpCompositeHierarchyOfObjects method with all levels at once }
  ////    MakeUpCompositeHierarchyOfObjects('Products', 'Categories', [H3, H2]);
  ////
  ////    { The fields Year, Quarter, and Month must be calculated in the OnCalculateField event }
  ////    H1 := AddCalculatedHierarchy('Date', qrOrderDetails, ftInteger, 'Year');
  ////    H2 := AddCalculatedHierarchy('Date', qrOrderDetails, ftWideString, 'Quarter');
  ////    H3 := AddCalculatedHierarchy('Date', qrOrderDetails, ftWideString, 'Month');
  ////    { And the third way is to call MakeUpCompositeHierarchyOfNames method with all levels given by their names }
  ////    MakeUpCompositeHierarchyOfNames('Date', 'OrderDate', ['Year', 'Quarter', 'Month']);
  ////
  ////    { Add relations between all tables in the data schema }
  ////    AddDataRelation(qrCustomers, 'CustomerID', qrOrders, 'CustomerID');
  ////    AddDataRelation(qrOrders, 'OrderID', qrOrderDetails, 'OrderID');
  ////    AddDataRelation(qrEmployees, 'EmployeeID', qrOrders, 'EmployeeID');
  ////    AddDataRelation(qrShippers, 'ShipperID', qrOrders, 'ShipVia');
  ////    AddDataRelation(qrProducts, 'ProductID', qrOrderDetails, 'ProductID');
  ////    AddDataRelation(qrSuppliers, 'SupplierID', qrProducts, 'SupplierID');
  ////    AddDataRelation(qrCategories, 'CategoryID', qrProducts, 'CategoryID');
  //  end;
  //
  //  Grid.Cube := Cube;
  //  Cube.Active := True;
    Actualiza__Splash('Cargando información...');
    OLAPCube.Active := True;
    Actualiza__Splash('Ubicando pivotes...');
    Distribuir_Pivotes;
  Except
    On E:Exception Do
      UtLog_Execute('TFrRCLupe.actCreateRunTimeCubeExecute, ' + E.Message);
  End;
  Free_Splash;
end;

procedure TFrRCLupe.CloseActiveCube1Click(Sender: TObject);
begin
  Grid.Cube.Active := False;
end;


procedure TFrRCLupe.actDrillThroughExecute(Sender: TObject);
var
  D: IDataCell;
  ADataSet: TrsMemoDataSet;
  Form: TDrillThroughForm;
begin
  // Get the clicked cell
  D := IDataCell(Grid.Cellset.Cells[fPopupCol, fPopupRow]);
  // Create a dataset to hold drillthrough results
  ADataSet := TrsMemoDataSet.Create(nil);
  try
    // Do Drill Through
    D.Drillthrough(ADataSet, 0, dtmEntireSchemaMembers);
    // Create the form to display the outcome
    Form := TDrillThroughForm.Create(nil);
    try
      // Assign the dataset and show up the window
      Form.Dataset := ADataset;
      Form.ShowModal;
    finally
      Form.DataSet := nil;
      Form.Free;
    end;
  finally
    // We're in charge of destroying the drill through results
    FreeAndNil(ADataSet);
  end;
end;

procedure TFrRCLupe.GridDrawCell(Sender: TObject; EventArgs: TEventDrawCellArgs);
var
  Image: TBitmap;
  Member: TMember;
  Row: TDDataRow;
  Stream: TStream;
begin
  Exit;
  { We use the event to put an image into the grid cells that display members of the "Categories" hierarchy }
  if EventArgs.Cell.CellType = ctMember then
  begin
    // Get the displaying member
    Member := IMemberCell(EventArgs.Cell).Member;
    // Make sure the member belongs to the "Categories" hierarchy
    if (Member <> nil) and (Member.CubeMember <> nil) and WideSameStr(Member.CubeMember.Hierarchy.DisplayName, 'Categories') then
    begin
      // Now we need the image to draw in the cell. In this example it is in the "qrCategory.Picture" field, so we must find it.
      // First get the table row that contains data for the corresponding dimension member. For that purpose we use
      // the Category index defined in the TfmMain.OLAPCubeDefineIndex event handler.
      Row := FCategories_Picture.Table.FindRow('Category', Member.DisplayName);
      if Row = nil then EXIT;
      // Good! Now we have a real chance to fetch the image from the "Picture" field
      Stream := Row.GetBlobStream(FCategories_Picture);
      if Stream <> nil then
      try
        if Stream.Size = 0 then EXIT; // No image? Get out of the event handler
        // Now we have the BLOB field from the database, but it's not an image - the MS Access stores images as OLE objects.
        // So we need to skip the OLE header in order to read the correct bitmap
        if BitmapBeginning(Stream) < 0 then raise Exception.Create('Wrong image field');
        // Now everything seems to be alright - we may read the image from the current stream position
        Image := TBitmap.Create;
        try
          Image.Transparent := True;
          Image.LoadFromStream(Stream);
          // At the end of the day set up the newly created image
          EventArgs.Image := Image;
          EventArgs.ImagePosition := ipTopOnText;
        finally
          // No longer need the original Image because EventArgs.Image took its deep copy
          FreeAndNil(Image);
        end;
      finally
        // Need to kill Stream as well
        FreeAndNil(Stream);
      end;
    end;
  end;
end;

procedure TFrRCLupe.OLAPCubeDefineIndex(Sender: TObject; Args: TDefineIndexArgs);
begin
//  { Here we can index the tables we're gonna search for the records }
//  if Args.ThisTable(qrCategories) then
//    // The index named "Category" will index the table by the "CategoryName" field
//    Args.Indexes.AddKeyColumns('Category', 'CategoryName');
end;

function TFrRCLupe.BitmapBeginning(const s: AnsiString): integer;
begin
  // Simply search for 'BM' tag - this must be the right position
  Result := pos('BM', s);
  if Result = 0 then Result := -1;
end;

function TFrRCLupe.BitmapBeginning(Stream: TStream): Int64;
var
  n: Int64;
  c: AnsiChar;
begin
  // Search the stream for 'BM' char sequence
  Result := -1;
  n := Stream.Size;
  while Stream.Position < n do
  begin
    Stream.ReadBuffer(c, SizeOf(c));
    if c = 'B' then
    begin
      Stream.ReadBuffer(c, SizeOf(c));
      if c = 'M' then
        begin
          Stream.Seek(-2, soFromCurrent);
          Result := Stream.Position;
          EXIT;
        end
      else if c = 'B' then
        Stream.Seek(-1, soFromCurrent);
    end;
  end;
end;

procedure TFrRCLupe.GridPaintCell(Sender: TObject; EventArgs: TEventPaintCellArgs);
begin
  Exit;
  EventArgs.DrawCell;
end;

procedure TFrRCLupe.OLAPCubeAfterReadDatabase(Sender: TObject; Args: TAfterReadDatabaseArgs);
begin
  Exit;
  { The event occurs just after the data base is loaded, but the grid hasn't started to draw itself.
    Here we try to find some columns of interest in the data schema }
  FCategories_Picture := Args.DataSet.FindDataColumn('qrCategories.Picture');
end;

procedure TFrRCLupe.CleanUpGrid;
var
  i, j: integer;
  M: TMeasure;
  H: THierarchy;
begin
  Grid.OnInitMeasures := nil;
  Grid.OnCalcMember := nil;
  Grid.OnMemberSort := nil;
  Grid.OnDrawCell := nil;
  Grid.OnPaintCell := nil;
  Grid.OnGetPopupMenu := nil;
  Grid.OnDrawCell := GridDrawCell;
  Grid.OnShowMeasure := OnShowMeasure;
  with Grid do
  begin
    BeginUpdate;
    while Layout.RowAxisLength > 0 do PivotingOut(Layout.RowAxis[0]);
    while Layout.ColumnAxisLength > 0 do PivotingOut(Layout.ColumnAxis[0]);
    while Layout.PageAxisLength > 0 do PivotingOut(Layout.PageAxis[0]);
    for i := 0 to Measures.Count - 1 do
    begin
      M := Measures[i];
      M.Visible := False;
      for j := 1 to M.ShowModes.Count - 1 do
        M.ShowModes[j].Visible := False;
    end;
    EndUpdate;
  end;
  H := Grid.Dimensions.FindHierarchyByDisplayName('Date');
  if H <> nil then H.OverrideSortMethods := False;
  Grid.Dimensions.DeleteGroups;
  Grid.Dimensions.DeleteCalculatedMembers;

  if FButton <> nil then
  begin
    FButton.Parent := nil;
    FreeAndNil(FButton);
  end;
end;

procedure TFrRCLupe.InitSimpleSales;
var
  H: THierarchy;
  M: TMeasure;
begin
  ActivateOLAPCube;
  with Grid do
  begin
    BeginUpdate;
    // Hide bookmarks
    OLAPPanelSettings.BtnsShow := False;
    // Show only data area
    OLAPPanelSettings.ShowAreasMode := rsDataOnly;
    // Search for a hierarchy named "Products by categories"...
    H := Dimensions.FindHierarchyByDisplayName('Products by categories');
    // ...and put it into the Row grid area
    if H <> nil then PivotingLast(H, laRow);
    H := Dimensions.FindHierarchyByDisplayName('Date');
    if H <> nil then PivotingLast(H, laColumn);
    // Search for a measure named "Sales"...
    M := Measures.FindByDisplayName('Sales');
    // ...and make it visible
    if M <> nil then M.Visible := True;
    EndUpdate;
  end;
end;


procedure TSections.Add(const SectionID: string; const SectionBody: string);
var
  Section: TSection;
begin
  if SectionID <> '' then
  begin
    Section := TSection.Create(SectionID, SectionBody);
    SetSection(SectionID, Section);
  end;
end;


procedure TSections.Clear;
begin
  FreeObjects;
  inherited Clear;
end;

constructor TSections.Create;
begin
  inherited;
  CaseSensitive := False;
end;

destructor TSections.Destroy;
begin
  FreeObjects;
  inherited Destroy;
end;

procedure TSections.FreeObjects;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
  begin
    inherited Objects[i].Free;
    inherited Objects[i] := nil;
  end;
end;

function TSections.GetItem(Index: integer): TSection;
begin
  Result := TSection(objects[Index]);
end;

function TSections.GetSection(const id: string): TSection;
var
  index: integer;
begin
  index := IndexOf(id);
  if index >= 0 then Result := TSection(objects[index]) else Result := nil;
end;

procedure TSections.LoadFromFile(const FileName: string);
var
  FileStrings: TStrings;
  SectionName, SectionBody, s: string;
  i: integer;
begin
  If Not FileExists(FileName) Then
    Exit;
  FileStrings := TStringList.Create();
  FileStrings.LoadFromFile(FileName);
  try
    Clear;
    SectionName := ''; SectionBody := '';
    for i := 0 to FileStrings.Count - 1 do
    begin
      s := FileStrings[i];
      if (s <> '') and (s[1] = '[') then
        begin
          if SectionName <> '' then Add(RemoveBrackets(SectionName), Trim(SectionBody));
          SectionName := s; SectionBody := '';
        end
      else
        begin
          if SectionBody = '' then SectionBody := s else SectionBody := SectionBody + #13#10 + s;
        end;
    end;
    if SectionName <> '' then Add(RemoveBrackets(SectionName), Trim(SectionBody));
  finally
    FileStrings.Free;
  end;
end;

procedure TSections.SetItem(Index: integer; const Value: TSection);
begin
  objects[Index] := Value;
end;

procedure TSections.SetSection(const id: string; const Value: TSection);
var
  index: integer;
begin
  index := IndexOf(id);
  if index >= 0 then
    begin
      objects[index].Free;
      objects[index] := Value;
    end
  else
    AddObject(id, Value);  
end;


constructor TSection.Create(const ID: string; const Body: string);
begin
  SectionID := ID;
  SectionName := ExtractSectionName(ID);
  SectionBody := Body;
end;

function ExtractIDPart(const s: string; var Index: integer): string;
var
  StartPos: integer;
begin
  StartPos := Index;
  while Index <= length(s) do if s[index] = ':' then BREAK else inc(Index);
  Result := copy(s, StartPos, Index - StartPos);
  inc(Index);
end;

procedure TFrRCLupe.tvReportsChange(Sender: TObject; Node: TTreeNode);
begin
  if Node = nil then EXIT;
  ActivateSection(TSection(Node.Data));
end;

procedure TFrRCLupe.ActivateSection(Section: TSection);
var
  OldCursor: HCursor;
begin
  if Section = nil then EXIT;
  OldCursor := GetCursor;
  SetCursor(LoadCursor(0, IDC_WAIT));
  DescriptionLabel.Caption := Section.SectionBody;
  CleanUpGrid;
  ViewSheet.TabVisible := True;
  PC.ActivePage := ViewSheet;
  try
    if Section.ThisSection('Samples') then
      begin
        PC.ActivePage := DescriptionSheet;
        InitSamples;
        OpenBrowser('Samples.htm');
      end
    else if Section.ThisSection('Simple Sales Report') then
      begin
        InitSimpleSales;
        OpenBrowser('SimpleSales.htm');
      end
    else if Section.ThisSection('Measures and Measure Modes') then
      begin
        InitMeasuresAndMeasureModes;
        OpenBrowser('MeasureModes.htm');
      end
    else if Section.ThisSection('Change Sort Order') then
      begin
        InitChangeSortOrder;
        OpenBrowser('ChangeSortOrder.htm');
      end
    else if Section.ThisSection('Grouping Members') then
      begin
        InitGroups;
        OpenBrowser('GroupMembers.htm');
      end
    else if Section.ThisSection('Calculated Members') then
      begin
        InitCalculatedMembers;
        OpenBrowser('CalculatedMembers.htm');
      end
    else if Section.ThisSection('Replace Cell Content') then
      begin
        InitReplaceCells;
        OpenBrowser('ReplaceCells.htm');
      end
    else if Section.ThisSection('Place Pictures in Cells') then
      begin
        InitPlacePicturesInCells;
        OpenBrowser('PlacePicturesInCells.htm');
      end
    else if Section.ThisSection('Painting Within Cells') then
      begin
        InitPaintingWithinCells;
        OpenBrowser('PaintingWithinCells.htm');
      end
    else if Section.ThisSection('Customizing Context Menu') then
      begin
        InitCustomizingContextMenu;
        OpenBrowser('CustomizingContextMenu.htm');
      end
    else if Section.ThisSection('Charting') then
      begin
        InitCharting;
        OpenBrowser('Charting.htm');
      end
    else if Section.ThisSection('Drill Through') then
      begin
        InitDrillThrough;
        OpenBrowser('DrillThrough.htm');
      end
    else if Section.ThisSection('Useful tips') then
      begin
        PC.ActivePage := DescriptionSheet;
        ViewSheet.TabVisible := False;
        OpenBrowser('UsefulTips.htm');
      end
  finally
    SetCursor(OldCursor);
  end;
end;

procedure TFrRCLupe.OpenBrowser(const Source: string);
begin
  wbDescription.Navigate(ExtractFilePath(Application.ExeName) + 'html\' + Source);
end;

function TSection.ExtractSectionName(const s: string): string;
var
  i: integer;
begin
  i := length(s);
  while i > 0 do if s[i] = ':' then BREAK else dec(i);
  if i = 0 then
    Result := s
  else
    Result := copy(s, i + 1, length(s));  
end;

function TSection.ThisSection(const Name: string): boolean;
begin
  Result := (AnsiCompareText(SectionName, Name) = 0);
end;

procedure TFrRCLupe.InitMeasuresAndMeasureModes;
var
  H: THierarchy;
  M: TMeasure;
begin
  ActivateOLAPCube;
  // OnShowMeasure event handler is to calculate the value of the custom "Rank by Row" show mode
  Grid.OnShowMeasure := OnShowMeasure;
  with Grid do
  begin
    BeginUpdate;
    // Hide bookmarks
    OLAPPanelSettings.BtnsShow := False;
    // Show only data area
    OLAPPanelSettings.ShowAreasMode := rsAll;
    // Search for a hierarchy named "Products by categories"...
    H := Dimensions.FindHierarchyByDisplayName('Products by categories');
    // ...and put it into the Row grid area
    if H <> nil then PivotingLast(H, laRow);
    H := Dimensions.FindHierarchyByDisplayName('Date');
    if H <> nil then PivotingLast(H, laRow);
    // Search for a measure named "Sales"...
    M := Measures.FindByDisplayName('Sales');
    // ...and make it visible
    if M <> nil then M.Visible := True;

    if M <> nil then
    begin
      // Turn on the "Percent of Column Total" and "Rank by row" modes for the "Sales measure"
      M.ShowModes[2].Visible := True;
      M.ShowModes.ShowModeByCaption['Rank by row'].Visible := True;
      // Note that the "Rank by Row" mode is calculated in the OnShowMeasure event handler
    end;

    // Show the second measure named "Quantity"
    M := Measures.FindByDisplayName('Quantity');
    if M <> nil then M.Visible := True;

    EndUpdate;
  end;
end;

procedure TFrRCLupe.OnInitMeasuresHandler(Sender: TObject);
var
  M: TMeasure;
begin
  // Add a new show mode named "Rank by Row" in the "Sales" measure 
  M := (Sender as TCustomOLAPGrid).Measures.FindByDisplayName('Sales');
  if M <> nil then M.ShowModes.Add('Rank by Row');
end;

procedure TFrRCLupe.ActivateOLAPCube;
begin
  if not OLAPCube.Active then
  begin
    Grid.OnInitMeasures := OnInitMeasuresHandler;
    OLAPCube.Active := True;
  end;
end;

procedure TFrRCLupe.OnShowMeasure(Sender: TObject; EventArgs: TShowMeasureArgs);
var
  MC: IMemberCell;
  Rank: integer;
  i: integer;
begin
  if EventArgs.ShowMode.Caption = 'Rank by row' then
   begin
    EventArgs.ReturnValue := '';
    if VarIsNull(EventArgs.OriginalData) then EXIT;
    Rank := 1;
    for i := 0 to Length(EventArgs.RowSiblings) - 1 do
     begin
      if VarCompareValue(EventArgs.Evaluator.SiblingValue(EventArgs.RowSiblings[i]),
        EventArgs.OriginalData) = vrGreaterThan     then inc(Rank);
     end;
    EventArgs.ReturnValue := IntToStr(Rank);
    EventArgs.ReturnData := Rank;
   end;
end;

procedure TFrRCLupe.InitSamples;
begin
  with Grid do
  begin
    OLAPPanelSettings.BtnsShow := False;
    // Show only data area
    OLAPPanelSettings.ShowAreasMode := rsAll;
  end;  
end;

procedure TFrRCLupe.OnDateMemberSort(Sender: TObject; EventArgs: TEventMemberSortArgs);
var
  L: integer;
  I1, I2: integer;

  // The function returns the position of the given month on the time axis.
  // It assumes that the month is given by a string from the standard LongMonthNames Delphi array.
  function LongMonthIndex(const MonthLongName: string): integer;
  var
    i: integer;
  begin
    Result := -1;
    for i := 1 to 12 do
{$IF CompilerVersion >= 24}
    if AnsiSameText(MonthLongName, FormatSettings.LongMonthNames[i]) then
{$ELSE}
    if AnsiSameText(MonthLongName, LongMonthNames[i]) then
{$IFEND}
    begin
      Result := i;
      BREAK;
    end;
  end;

begin
  with EventArgs do
  begin
    // Get the member level
    L := MemberLow.Level.Index;
    // For the "Year" level simply compare member captions
    if (L = 0) then
      Result := AnsiCompareStr(MemberLow.DisplayName, MemberHigh.DisplayName);
    // The "Quarter" members we sort considering their parent members so that the 1998-Q1 goes after 1997-Q4.
    // However you don't actually need to do it - they will be displayed in the right order anyway because
    //   the parent level (Year) is sorted too. Here we do it for another purpose used on demostrating calculated members.    
    if (L = 1) then
      // Could be the following code if we didn't need to take into consideration the parent members:
      // Result := AnsiCompareStr(MemberLow.DisplayName, MemberHigh.DisplayName);
      Result := AnsiCompareStr(MemberLow.Parent.DisplayName + MemberLow.DisplayName, MemberHigh.Parent.DisplayName + MemberHigh.DisplayName);
    // The "Month" level is a bit more complex, for we have to compare the positions of months on the time axis.
    // Note that we sort it without consideration of the parent members so that here the 1998-Q1-January goes BEFORE 1996-Q4-December
    //   (but we don't seem to be unhappy because all parent members are sorted correctly,
    //   so we always see Months in a correct order anyway)
    if L = 2 then
    begin
      I1 := LongMonthIndex(MemberLow.DisplayName);
      I2 := LongMonthIndex(MemberHigh.DisplayName);
      if I1 > I2 then Result := 1 else if I1 < I2 then Result := -1 else Result := 0;
    end;
    // And last invert the result if the hierarchy must be sorted in a descending order
    if SortingMethod = msNameDesc then Result := -Result;
  end;
end;

procedure TFrRCLupe.InitChangeSortOrder;
var
  H: THierarchy;
  M: TMeasure;
begin
  ActivateOLAPCube;
  // OnShowMeasure event handler is to change the members sort order
  Grid.OnMemberSort := OnDateMemberSort;
  with Grid do
  begin
    BeginUpdate;
    // Hide bookmarks
    OLAPPanelSettings.BtnsShow := False;
    // Show only data area
    OLAPPanelSettings.ShowAreasMode := rsAll;
    // Search for a hierarchy named "Date"...
    H := Dimensions.FindHierarchyByDisplayName('Date');
    if H <> nil then
    begin
      // Change the hierarchy sort method so it can be sorted in our own event handler
      H.OverrideSortMethods := True;
      // Place "Date" first in the Row area
      PivotingFirst(H, laRow);
    end;
    // Search for a measure named "Sales"...
    M := Measures.FindByDisplayName('Sales');
    // ...and make it visible
    if M <> nil then M.Visible := True;

    // Show the second measure named "Quantity"
    M := Measures.FindByDisplayName('Quantity');
    if M <> nil then M.Visible := True;

    EndUpdate;
  end;
  FButton := TButton.Create(DescriptionPanel);
  FButton.Caption := 'Toggle OnMemberSort Event';
  FButton.Top := DescriptionLabel.Top + DescriptionLabel.Height + 10;
  FButton.Width := 200;
  FButton.Parent := DescriptionPanel;
  FButton.OnClick := OnToggleSortOrder;
end;

procedure TFrRCLupe.OnToggleSortOrder(Sender: TObject);
var
  H: THierarchy;
begin
  // Get the hierarchy and revert OverrideSortMethods property
  H := Grid.Dimensions.FindHierarchyByDisplayName('Date');
  if H <> nil then H.OverrideSortMethods := not H.OverrideSortMethods;
  // Resort right away to reflect changes
  H.Sort;
end;

procedure TFrRCLupe.InitGroups;
var
  H: THierarchy;
  M: TMeasure;
begin
  ActivateOLAPCube;
  with Grid do
  begin
    BeginUpdate;
    // Hide bookmarks
    OLAPPanelSettings.BtnsShow := False;
    // Show only data area
    OLAPPanelSettings.ShowAreasMode := rsAll;
    // Search for a hierarchy named "Products by categories"...
    H := Dimensions.FindHierarchyByDisplayName('Products by categories');
    // ...and place it in the Row area
    if H <> nil then PivotingFirst(H, laRow);
    // Search for a measure named "Sales"...
    M := Measures.FindByDisplayName('Sales');
    // ...and make it visible
    if M <> nil then M.Visible := True;

    EndUpdate;
  end;
  FButton := TButton.Create(DescriptionPanel);
  FButton.Caption := 'Create Group';
  FButton.Top := DescriptionLabel.Top + DescriptionLabel.Height + 10;
  FButton.Width := 200;
  FButton.Parent := DescriptionPanel;
  FButton.OnClick := OnGroupMembers;
end;

procedure TFrRCLupe.OnGroupMembers(Sender: TObject);
var
  H: THierarchy;
  L: TLevel;
  M: TMember;
  i: integer;
  ArrayOfMembers: array of TMember; // to hold the members to put in a group
begin
  // Search for the wanted hiearchy
  H := Grid.Dimensions.FindHierarchyByDisplayName('Products by categories');
  if H <> nil then
  begin
    // We only need the very first level ("Categories")
    L := H.Levels[0];
    // Initially there's no members in the array
    SetLength(ArrayOfMembers, 0);
    // Look through all members of the level
    for i := 0 to L.Members.Count - 1 do
    begin
      M := L.Members[i];
      // Keep hold of "Beverages" and, just in case, check that we're not going to group another group
      if (M.MemberType <> mtGroup) and (WideCompareText(M.DisplayName, 'Beverages') <> 0) then
      begin
        // Increase the array length and put another member in it
        SetLength(ArrayOfMembers, length(ArrayOfMembers) + 1);
        ArrayOfMembers[length(ArrayOfMembers) - 1] := M;
      end;
    end;
    // Now everything's ready - create the group and fill it up with members
    H.CreateGroup('All but Beverages', cmpLast, ArrayOfMembers);
  end;
end;

procedure TFrRCLupe.InitCalculatedMembers;
var
  H: THierarchy;
  M: TMeasure;
begin
  ActivateOLAPCube;
  // OnMemberSort event handler is to change the members sort order
  Grid.OnMemberSort := OnDateMemberSort;
  Grid.OnDrawCell := HighlightCalculated;
  with Grid do
  begin
    BeginUpdate;
    // Hide bookmarks
    OLAPPanelSettings.BtnsShow := False;
    // Show only data area
    OLAPPanelSettings.ShowAreasMode := rsDataOnly;
    // Search for a hierarchy named "Products by categories"...
    H := Dimensions.FindHierarchyByDisplayName('Products by categories');
    // ...and put it into the Row grid area
    if H <> nil then PivotingLast(H, laRow);
    H := Dimensions.FindHierarchyByDisplayName('Date');
    if H <> nil then
    begin
      // Change the hierarchy sort method so it can be sorted in our own event handler
      H.OverrideSortMethods := True;
      // Place "Date" first in the Column area
      PivotingLast(H, laColumn);
    end;
    // Search for a measure named "Sales"...
    M := Measures.FindByDisplayName('Sales');
    // ...and make it visible
    if M <> nil then M.Visible := True;
    // Expand the year 1998 to see all its quarters
    CellSet.FindMember('1998').DrillAction(esNextLevel);
    EndUpdate;
  end;
  FButton := TButton.Create(DescriptionPanel);
  FButton.Caption := 'Create Forecasted Member';
  FButton.Top := DescriptionLabel.Top + DescriptionLabel.Height + 10;
  FButton.Width := 200;
  FButton.Parent := DescriptionPanel;
  FButton.OnClick := OnForecastingMembers;
end;

procedure TFrRCLupe.OnForecastingMembers(Sender: TObject);
var
  H: THierarchy;
begin
  // Get the hierarchy
  H := Grid.Dimensions.FindHierarchyByDisplayName('Date');
  if H <> nil then
  begin
    // The event handler to calculate new members
    Grid.OnCalcMember := OnCalcForecastedMembers;
    // Do add calculated member at the "Quarter" level (H.Levels[1])
    H.CreateCalculatedMember('3rd Quarter', 'This calculated member displays the forecasted values for the 3rd quarter of 1998',
      H.Levels[1], H.FindMemberByName('1998'), cmpLast);
  end;
  // Hide the button "just in case"
  FButton.Parent := nil; 
end;

procedure TFrRCLupe.OnCalcForecastedMembers(Sender: TObject; EventArgs: TCalcMemberArgs);
var
  H: THierarchy;
  L: TLevel;
  M: TMember;
  D: TDoubleArray;
  b0, b1: double;
  i: integer;
begin
  // Check if we're to calculate our new forecasted member
  if WideCompareText(EventArgs.Evaluator.CalculatedMembers[0].DisplayName, '3rd Quarter') = 0 then
  begin
    // Get the hierarchy in a familiar way
    H := Grid.Dimensions.FindHierarchyByDisplayName('Date');
    if H <> nil then
    begin
      // In the D array we're going to keep all member values to use at forecasting
      D := TDoubleArray.Create();
      try
        // Gonna take all members (except for the calculated ones) from the hierarchy, "Quarter" level
//        L := H.Levels[1];
//        // Look through all the members
//        for i := 0 to L.Members.Count - 1 do
//        begin
//          M := L.Members[i];
//          // Skip any calculated member
//          if M.MemberType <> mtCalculated then
//            // Take the value of the cell with the changed "Quarter" member and put it in the array
//            D.Add(EventArgs.Evaluator.SiblingValue(M));
//        end;
//        // Now simply calculate the forecasted value using the static TEvaluator.Stat_LinearTrend method
//        TEvaluator.Stat_LinearTrend(D, b0, b1);
//        EventArgs.ReturnData := b0 + b1 * D.Count;
//        EventArgs.ReturnValue := FormatFloat('# ##0,00', EventArgs.ReturnData);
//        if EventArgs.ReturnData = 0 then EventArgs.ReturnData := NULL;
      finally
        // Always destroy the array
//        FreeAndNil(D);
      end;
    end;
  end;
end;

procedure TFrRCLupe.HighlightCalculated(Sender: TObject; EventArgs: TEventDrawCellArgs);
var
  A: ICubeAddress;
  i: integer;
begin
  // Only highlight hierarchy members and data cells
  if EventArgs.Cell.CellType = ctMember then
    A := IMemberCell(EventArgs.Cell).Address
  else if EventArgs.Cell.CellType = ctData then
    A := IDataCell(EventArgs.Cell).Address
  else
    EXIT;

  // Change the font style if any member in the cell address is a calculated one.    
  for i := 0 to A.LevelsCount - 1 do
    if A.Members[i].MemberType = mtCalculated then
    begin
      EventArgs.Font.Style := EventArgs.Font.Style + [fsBold];
      BREAK;
    end;
end;

procedure TFrRCLupe.DrawCaptions(Sender: TObject; EventArgs: TEventDrawCellArgs);
var
  M: IMemberCell;
begin
  // Only do something if a hierarchy member is being displayed
  if EventArgs.Cell.CellType = ctMember then
  begin
    // Get the member cell interface
    M := IMemberCell(EventArgs.Cell);
    // Only cells of the "Year" level are changed
    if (M.Member <> nil) and (WideCompareText(M.Member.Level.DisplayName, 'Year') = 0) then
      // Symply add "Year" prefix to the member name 
      EventArgs.Text := 'Year ' + M.Member.DisplayName;
  end;
end;

procedure TFrRCLupe.InitReplaceCells;
var
  H: THierarchy;
  M: TMeasure;
begin
  ActivateOLAPCube;
  // OnShowMeasure event handler is to change the members sort order
  Grid.OnMemberSort := OnDateMemberSort;
  with Grid do
  begin
    BeginUpdate;
    // Hide bookmarks
    OLAPPanelSettings.BtnsShow := False;
    // Show only data area
    OLAPPanelSettings.ShowAreasMode := rsAll;
    // Search for a hierarchy named "Date"...
    H := Dimensions.FindHierarchyByDisplayName('Date');
    if H <> nil then
    begin
      // Change the hierarchy sort method so it can be sorted in our own event handler
      H.OverrideSortMethods := True;
      // Place "Date" first in the Row area
      PivotingFirst(H, laRow);
    end;
    // Search for a measure named "Sales"...
    M := Measures.FindByDisplayName('Sales');
    // ...and make it visible
    if M <> nil then M.Visible := True;

    // Show the second measure named "Quantity"
    M := Measures.FindByDisplayName('Quantity');
    if M <> nil then M.Visible := True;

    EndUpdate;
  end;
  FButton := TButton.Create(DescriptionPanel);
  FButton.Caption := 'Replace Content';
  FButton.Top := DescriptionLabel.Top + DescriptionLabel.Height + 10;
  FButton.Width := 200;
  FButton.Parent := DescriptionPanel;
  FButton.OnClick := OnClickReplaceContent;
end;

procedure TFrRCLupe.OnClickReplaceContent(Sender: TObject);
begin
  // Assign a new event handler
  Grid.OnDrawCell := DrawCaptions;
  // Rebuild displayed members
  Grid.CellSet.Rebuild;
end;

procedure TFrRCLupe.InitPlacePicturesInCells;
var
  H: THierarchy;
  M: TMeasure;
begin
  ActivateOLAPCube;
  // OnShowMeasure event handler is to change the members sort order
  Grid.OnMemberSort := OnDateMemberSort;
  Grid.OnDrawCell := DrawPictures;
  Grid.OnCalcMember := OnCalcTrendMembers;
  with Grid do
  begin
    BeginUpdate;
    // Hide bookmarks
    OLAPPanelSettings.BtnsShow := False;
    // Show only data area
    OLAPPanelSettings.ShowAreasMode := rsDataOnly;
    // Search for a hierarchy named "Categories"...
    H := Dimensions.FindHierarchyByDisplayName('Categories');
    // ...and put it into the Row grid area
    if H <> nil then PivotingLast(H, laRow);
    H := Dimensions.FindHierarchyByDisplayName('Products');
    if H <> nil then PivotingLast(H, laRow);
    H := Dimensions.FindHierarchyByDisplayName('Date');
    if H <> nil then
    begin
      // Change the hierarchy sort method so it can be sorted in our own event handler
      H.OverrideSortMethods := True;
      // Place "Date" first in the Column area
      PivotingLast(H, laColumn);
      // Add a calculated member at the "Quarter" level (H.Levels[1])
      H.CreateCalculatedMember('3rd Quarter', 'This calculated member displays the forecasted values for the 3rd quarter of 1998',
        H.Levels[1], H.FindMemberByName('1998'), cmpLast);
      // Add the "Trend" calculated member at the top of the hierarchy
      H.CreateCalculatedMember('Trend', 'Displays the trend of the previuos sales',  H.Levels[0], nil, cmpLast);
    end;
    // Search for a measure named "Sales"...
    M := Measures.FindByDisplayName('Sales');
    // ...and make it visible
    if M <> nil then M.Visible := True;
    // Expand the "Condiments" group open in the Row area
    CellSet.FindMember('Condiments').DrillAction(esNextHierarchy);
    EndUpdate;
  end;
end;

procedure TFrRCLupe.OnCalcTrendMembers(Sender: TObject; EventArgs: TCalcMemberArgs);
var
  H: THierarchy;
  L: TLevel;
  M: TMember;
  D: TDoubleArray;
  b0, b1: double;
  i: integer;
begin
//  if WideCompareText(EventArgs.Evaluator.CalculatedMembers[0].DisplayName, '3rd Quarter') = 0 then
//  begin
//    // Get the hierarchy in a familiar way
//    H := Grid.Dimensions.FindHierarchyByDisplayName('Date');
//    if H <> nil then
//    begin
//      // In the D array we're going to keep all member values to use at forecasting
//      D := TDoubleArray.Create();
//      try
//        // Gonna take all members (except for the calculated ones) from the hierarchy, "Quarter" level
//        L := H.Levels[1];
//        // Look through all the members
//        for i := 0 to L.Members.Count - 1 do
//        begin
//          M := L.Members[i];
//          // Skip any calculated member
//          if M.MemberType <> mtCalculated then
//            // Take the value of the cell with the changed "Quarter" member and put it in the array
//            D.Add(EventArgs.Evaluator.SiblingValue(M));
//        end;
//        // Now simply calculate the forecasted value using the static TEvaluator.Stat_LinearTrend method
//        TEvaluator.Stat_LinearTrend(D, b0, b1);
//        EventArgs.ReturnData := b0 + b1 * D.Count;
//        EventArgs.ReturnValue := FormatFloat('# ##0.00', EventArgs.ReturnData);
//        if EventArgs.ReturnData = 0 then EventArgs.ReturnData := NULL;
//      finally
//        // Always destroy the array
//        FreeAndNil(D);
//      end;
//    end;
//  end;

//  if WideCompareText(EventArgs.Evaluator.CalculatedMembers[0].DisplayName, 'Trend') = 0 then
//  begin
//    // Get the hierarchy in a familiar way
//    H := Grid.Dimensions.FindHierarchyByDisplayName('Date');
//    if H <> nil then
//    begin
//      // In the D array we're going to keep all member values to use at forecasting
//      D := TDoubleArray.Create();
//      try
//        // Gonna take all members (except for the calculated ones) from the hierarchy, "Quarter" level
//        L := H.Levels[1];
//        // Look through all the members
//        for i := 0 to L.Members.Count - 1 do
//        begin
//          M := L.Members[i];
//          // Skip any calculated member
//          if M.MemberType <> mtCalculated then
//            // Take the value of the cell with the changed "Quarter" member and put it in the array
//            D.Add(EventArgs.Evaluator.SiblingValue(M));
//        end;
//        // Now simply calculate the forecasted value using the static TEvaluator.Stat_LinearTrend method
//        TEvaluator.Stat_LinearTrend(D, b0, b1);
//        EventArgs.ReturnData := Sign(b0 + b1 * D.Count - D[0]);
//        EventArgs.ReturnValue := IntToStr(EventArgs.ReturnData);
//        if EventArgs.ReturnData = 0 then EventArgs.ReturnData := NULL;
//      finally
//        // Always destroy the array
//        FreeAndNil(D);
//      end;
//    end;
//  end;
end;

procedure TFrRCLupe.DrawPictures(Sender: TObject; EventArgs: TEventDrawCellArgs);
var
  D: IDataCell;
  A: ICubeAddress;
  M: TMember;
  B: TBitmap;
begin
  // Make captions of all calculated members strong navy
  if (EventArgs.Cell.CellType = ctMember) then
  if (IMemberCell(EventArgs.Cell).Member <> nil) and
     (IMemberCell(EventArgs.Cell).Member.MemberType = mtCalculated) then
  begin
    EventArgs.Font.Style := [fsBold];
    EventArgs.Font.Color := clNavy;
  end;
  // Only change cells in the data area
  if (EventArgs.Cell.CellType = ctData) then
  begin
    D := IDataCell(EventArgs.Cell);
    // Search for the "Trend" member
    M := Grid.Dimensions.FindHierarchyByDisplayName('Date').FindMemberByName('Trend');
    // Check if the cell being displayed has to do with the "Trend" member
    if (M <> nil) and D.Address.HasMember(M) then
    begin
      // Clear text
      EventArgs.Text := '';
      // Get the appropriate bitmap from the image list ...
      B := TBitmap.Create;
      if D.Data = -1 then IL2.GetBitmap(0, B) else IL2.GetBitmap(1, B);
      // ... and assign it as the image to display
      EventArgs.Image := B;
      B.Free;
      // Set the picture disposition
      EventArgs.AlignText := taCenter;
      EventArgs.ImagePosition := ipUnderText;
    end;
  end;
  // Make a call on the predefined event handler which draws pictures
  // for the "Categories" members
  GridDrawCell(Sender, EventArgs);
end;

procedure TFrRCLupe.InitPaintingWithinCells;
var
  H: THierarchy;
  M: TMeasure;
  Cell: IMemberCell;
begin
  ActivateOLAPCube;
  // OnShowMeasure event handler is to change the members sort order
  Grid.OnMemberSort := OnDateMemberSort;
  Grid.OnDrawCell := DrawMemberCaption;
  Grid.OnCalcMember := OnCalcTrendMembers2;
  Grid.OnPaintCell := PaintTrend;
  with Grid do
  begin
    BeginUpdate;
    // Hide bookmarks
    OLAPPanelSettings.BtnsShow := False;
    // Show only data area
    OLAPPanelSettings.ShowAreasMode := rsDataOnly;
    // Search for a hierarchy named "Products by categories"...
    H := Dimensions.FindHierarchyByDisplayName('Products by categories');
    // ...and put it into the Row grid area
    if H <> nil then PivotingLast(H, laRow);
    H := Dimensions.FindHierarchyByDisplayName('Date');
    if H <> nil then
    begin
      // Change the hierarchy sort method so it can be sorted in our own event handler
      H.OverrideSortMethods := True;
      // Place "Date" first in the Column area
      PivotingLast(H, laColumn);
      // Add a calculated member at the "Quarter" level (H.Levels[1])
      H.CreateCalculatedMember('3rd Quarter', 'This calculated member displays the forecasted values for the 3rd quarter of 1998',
        H.Levels[1], H.FindMemberByName('1998'), cmpLast);
      // Add the "Trend, °" calculated member at the top of the hierarchy
      H.CreateCalculatedMember('Trend, °', '', H.Levels[0], nil, cmpLast);
    end;
    // Search for a measure named "Sales"...
    M := Measures.FindByDisplayName('Sales');
    // ...and make it visible
    if M <> nil then M.Visible := True;
    // Expand the year 1998 to see all its quarters
    CellSet.FindMember('1998').DrillAction(esNextLevel);
    // Expand open the "Condiments" group in the Row area
    CellSet.FindMember('Condiments').DrillAction(esNextLevel);
    EndUpdate;
  end;
end;

procedure TFrRCLupe.PaintTrend(Sender: TObject; EventArgs: TEventPaintCellArgs);
var
  gradBMP : TBitmap;
  cell: ICell;
  wStr: WideString;
  CalcValue: integer;

  function ColorToCardinal(AColor: TColor): Cardinal;
  begin
    Result := MakeColor(GetRValue(AColor),
                        GetGValue(AColor),
                        GetBValue(AColor));
  end;

  procedure RestrictInteger(var AVar: integer; MinX, MaxX: Longint);
  begin
    if AVar < MinX then
      AVar := MinX
    else
      if AVar > MaxX then
        AVar := MaxX;
  end;

  function ColorSetBright(AColor: TColor; ABright: integer): TColor;
  var
    r,g,b: byte;
    RGBLong: Longint;
  begin
    RGBLong := ColorToRGB(AColor);
    R := GetBlue(RGBLong);
    G := GetGreen(RGBLong);
    B := GetRed(RGBLong);
    if ABright > 0 then
      begin
        R := Round(R + (255 - R)*(ABright/100.0));
        G := Round(G + (255 - G)*(ABright/100.0));
        B := Round(B + (255 - B)*(ABright/100.0));
      end
    else
      begin
        R := Round(R + R*(ABright/100.0));
        G := Round(G + G*(ABright/100.0));
        B := Round(B + B*(ABright/100.0));
      end;
    Result := RGB(r,g,b);
  end;

  function MixColor(c1,c2,c3: TColor; p1,p2,p3: byte): TColor;
  var
    r,g,b: array [0..2] of  byte;
    r1,r2,r3: real;
    RGBLong: Longint;
  begin
    RGBLong := ColorToRGB(c1);
    R[0] := GetBlue(RGBLong); G[0] := GetGreen(RGBLong); B[0] := GetRed(RGBLong);
    RGBLong := ColorToRGB(c2);
    R[1] := GetBlue(RGBLong); G[1] := GetGreen(RGBLong); B[1] := GetRed(RGBLong);
    RGBLong := ColorToRGB(c3);
    R[2] := GetBlue(RGBLong); G[2] := GetGreen(RGBLong); B[2] := GetRed(RGBLong);
    r1 := p1 / 255;
    r2 := p2 / 255;
    r3 := p3 / 255;
    Result := RGB(Round(r1*R[0]+r2*R[1]+r3*R[2]), Round(r1*G[0]+r2*G[1]+r3*G[2]),
                  Round(r1*B[0]+r2*B[1]+r3*B[2]));
  end;

  procedure DrawPoligonByDegree(ABitmap: TBitmap; ADegree: integer);
  const
    MaxGrad = 60;
  var
    LeftTop, RightTop: integer;
    Points: array [0..3] of TPoint;
    color: TColor;
    Hdiv: integer;

    procedure DrawGDIPLUS(AColor: TColor);
    var
      GraphicsGDIPLUS: TGPGraphics;
      SolidBrush: TGPSolidBrush;
      GPPoints: array [0..3] of TGPPoint;
    begin
      GraphicsGDIPLUS := TGPGraphics.Create(ABitmap.Canvas.Handle);
      SolidBrush := TGPSolidBrush.Create(ColorToCardinal(AColor));

      GPPoints[0] := MakePoint(Points[0].X, Points[0].Y);
      GPPoints[1] := MakePoint(Points[1].X, Points[1].Y);
      GPPoints[2] := MakePoint(Points[2].X, Points[2].Y);
      GPPoints[3] := MakePoint(Points[3].X, Points[3].Y);

      GraphicsGDIPLUS.SetSmoothingMode(SmoothingModeAntiAlias);
      GraphicsGDIPLUS.FillPolygon(SolidBrush, PGPPoint(@GPPoints),4);
      SolidBrush.Free;
      GraphicsGDIPLUS.Free;
    end;

  begin
      Points[0] := Point(ABitmap.Width-1, ABitmap.Height-1);
      Points[1] := Point(1, ABitmap.Height-1);
      RestrictInteger(ADegree, -89, 89);

      if ADegree > 0 then
        begin
          LeftTop := ABitmap.Height-1;
          RightTop := min(round(ABitmap.Width*Tan(DegToRad(ADegree))), ABitmap.Height);
          RightTop := ABitmap.Height - RightTop;
        end
      else
        begin
          LeftTop := min(round(-ABitmap.Width*Tan(DegToRad(ADegree))), ABitmap.Height);
          LeftTop := ABitmap.Height - LeftTop;
          RightTop := ABitmap.Height-1;
        end;

      Points[2] := Point(1, LeftTop);
      Points[3] := Point(ABitmap.Width-1, RightTop);

      RestrictInteger(ADegree, -MaxGrad, MaxGrad);
      ADegree := Round(ADegree * (255/(MaxGrad)));

      if ADegree > 0 then
        Color := MixColor(clRed, clYellow, clGreen, 0, 255 - ADegree, ADegree)
      else
        Color := MixColor(clRed, clYellow, clGreen, -ADegree, 255 + ADegree, 0);
      Color := ColorSetBright(Color, 25);

      ABitmap.Canvas.Brush.Color := Color;
      ABitmap.Canvas.Pen.Color := Color;
      DrawGDIPLUS(Color);
  end;

begin
  EventArgs.DrawCell;
  cell := EventArgs.Cell; 
  if cell <> nil then
  if cell.CellType = ctData then
  if IDataCell(cell).Address.HasMember(
    grid.Dimensions.FindHierarchyByDisplayName('Date').FindMemberByName('Trend, °')) then
  begin
    wStr := IDataCell(cell).ColumnMember.Member.DisplayName;
    wStr := Cell.Value;
    wStr := copy(wStr,0,Length(wStr)-1);
    if Trim(wStr) = '' then
      CalcValue := 0
    else
      CalcValue := Round(StrToFloat(wStr));

    gradBMP := TBitmap.Create;
    gradBMP.Width := EventArgs.Rect.Right - EventArgs.Rect.Left;
    gradBMP.Height := EventArgs.Rect.Bottom - EventArgs.Rect.Top;
    gradBMP.Canvas.Brush.Color := clWhite;
    gradBMP.Canvas.FillRect(gradBMP.Canvas.ClipRect);
    gradBMP.Transparent := True;
    gradBMP.TransparentColor := clWhite;
    DrawPoligonByDegree(gradBMP,  CalcValue);

    EventArgs.Canvas.CopyMode := cmSrcAnd;
    EventArgs.Canvas.CopyRect(EventArgs.Rect, gradBMP.Canvas, gradBMP.Canvas.ClipRect);
    gradBMP.Free;
  end;
end;

procedure TFrRCLupe.OnCalcTrendMembers2(Sender: TObject; EventArgs: TCalcMemberArgs);
var
  H: THierarchy;
  L: TLevel;
  M: TMember;
  D: TDoubleArray;
  b0, b1: double;
  i: integer;
begin
//  if WideCompareText(EventArgs.Evaluator.CalculatedMembers[0].DisplayName, '3rd Quarter') = 0 then
//  begin
//    // Get the hierarchy in a familiar way
//    H := Grid.Dimensions.FindHierarchyByDisplayName('Date');
//    if H <> nil then
//    begin
//      // In the D array we're going to keep all member values to use at forecasting
//      D := TDoubleArray.Create();
//      try
//        // Gonna take all members (except for the calculated ones) from the hierarchy, "Quarter" level
//        L := H.Levels[1];
//        // Look through all the members
//        for i := 0 to L.Members.Count - 1 do
//        begin
//          M := L.Members[i];
//          // Skip any calculated member
//          if M.MemberType <> mtCalculated then
//            // Take the value of the cell with the changed "Quarter" member and put it in the array
//            D.Add(EventArgs.Evaluator.SiblingValue(M));
//        end;
//        // Now simply calculate the forecasted value using the static TEvaluator.Stat_LinearTrend method
//        TEvaluator.Stat_LinearTrend(D, b0, b1);
//        EventArgs.ReturnData := b0 + b1 * D.Count;
//        EventArgs.ReturnValue := FormatFloat('# ##0.00', EventArgs.ReturnData);
//        if EventArgs.ReturnData = 0 then EventArgs.ReturnData := NULL;
//      finally
//        // Always destroy the array
//        FreeAndNil(D);
//      end;
//    end;
//  end;
//
//  if WideCompareText(EventArgs.Evaluator.CalculatedMembers[0].DisplayName, 'Trend, °') = 0 then
//  begin
//    // Get the hierarchy in a familiar way
//    H := Grid.Dimensions.FindHierarchyByDisplayName('Date');
//    if H <> nil then
//    begin
//      // In the D array we're going to keep all member values to use at forecasting
//      D := TDoubleArray.Create();
//      try
//        // Gonna take all members (except for the calculated ones) from the hierarchy, "Quarter" level
//        L := H.Levels[1];
//        // Look through all the members
//        for i := 0 to L.Members.Count - 1 do
//        begin
//          M := L.Members[i];
//          // Skip any calculated member
//          if M.MemberType <> mtCalculated then
//            // Take the value of the cell with the changed "Quarter" member and put it in the array
//            D.Add(EventArgs.Evaluator.SiblingValue(M));
//        end;
//        // Now simply calculate the forecasted value using the static TEvaluator.Stat_LinearTrend method
//        TEvaluator.Stat_LinearTrend(D, b0, b1);
//        if D[0] = 0 then
//          EventArgs.ReturnData := NULL
//        else
//          begin
//            b0 := ArcTan((b0 + b1*D.Count - D[0])/D[0])*180/Pi;
//            EventArgs.ReturnData := b0;
//            EventArgs.ReturnValue := FormatFloat('0.0', b0) + '°';
//          end;
//      finally
//        // Always destroy the array
//        FreeAndNil(D);
//      end;
//    end;
//  end;
end;

procedure TFrRCLupe.DrawMemberCaption(Sender: TObject; EventArgs: TEventDrawCellArgs);
begin
  // Make captions of all calculated members strong navy
  if (EventArgs.Cell.CellType = ctMember) then
  if (IMemberCell(EventArgs.Cell).Member <> nil) and
     (IMemberCell(EventArgs.Cell).Member.MemberType = mtCalculated) then
  begin
    EventArgs.Font.Style := [fsBold];
    EventArgs.Font.Color := clNavy;
  end;
end;

procedure TFrRCLupe.InitCustomizingContextMenu;
var
  H: THierarchy;
  M: TMeasure;
begin
  ActivateOLAPCube;
  // OnShowMeasure event handler is to change the members sort order
  Grid.OnGetPopupMenu := ShowDataCellDetails;
  Grid.OnMemberSort := OnDateMemberSort;
  with Grid do
  begin
    BeginUpdate;
    // Hide bookmarks
    OLAPPanelSettings.BtnsShow := False;
    // Show only data area
    OLAPPanelSettings.ShowAreasMode := rsAll;
    // Search for the "Categories" hierarchy
    H := Dimensions.FindHierarchyByDisplayName('Categories');
    if H <> nil then PivotingFirst(H, laRow);
    // Search for a hierarchy named "Date"...
    H := Dimensions.FindHierarchyByDisplayName('Date');
    if H <> nil then
    begin
      // Change the hierarchy sort method so it can be sorted in our own event handler
      H.OverrideSortMethods := True;
      // Place "Date" first in the Row area
      PivotingFirst(H, laColumn);
    end;
    // Search for a measure named "Sales"...
    M := Measures.FindByDisplayName('Sales');
    // ...and make it visible
    if M <> nil then M.Visible := True;

    // Show the second measure named "Quantity"
    M := Measures.FindByDisplayName('Quantity');
    if M <> nil then M.Visible := True;
    EndUpdate;
  end;
end;

procedure TFrRCLupe.ShowDataCellDetails(Sender: TObject; EventArgs: TPopupMenuArgs);
var
  C: ICell;
  D: IDataCell;
  M, M2: TMenuItem;
  i: integer;
begin
  C := Grid.Cellset.Cells[EventArgs.Column, EventArgs.Row];
  // Only change context menu for the data cells
  if C.CellType = ctData then
  begin
    D := IDataCell(C);

    // Add the menu delimiter
    M := TMenuItem.Create(EventArgs.Popup);
    M.Caption := '-';
    EventArgs.Popup.Items.Add(M);

    // Add new menu item
    M := TMenuItem.Create(EventArgs.Popup);
    M.Caption := 'Cell Details';
    EventArgs.Popup.Items.Add(M);

    // Add a sub-item for the corresponding measure
    if D.Address.Measure <> nil then
    begin
      M2 := TMenuItem.Create(EventArgs.Popup);
      M2.Caption := 'Measure: ' + D.Address.Measure.DisplayName;
      M.Add(M2);
    end;

    // Add a sub-item for every hierarchy member
    for i := 0 to D.Address.LevelsCount - 1 do
    begin
      M2 := TMenuItem.Create(EventArgs.Popup);
      M2.Caption := D.Address.Levels[i].DisplayName +  ': ' + D.Address.Members[i].DisplayName;
      M.Add(M2);
    end;
  end;
end;

procedure TFrRCLupe.AddChartingItem(Sender: TObject; EventArgs: TPopupMenuArgs);
var
  C: ICell;
  M: TMenuItem;
begin
  C := Grid.Cellset.Cells[EventArgs.Column, EventArgs.Row];
  if C.CellType <> ctData then EXIT;

  // Remember Row and Column of the clicked cell in the form fields
  fPopupRow := EventArgs.Row;
  fPopupCol := EventArgs.Column;

  // Add the menu delimiter
  M := TMenuItem.Create(EventArgs.Popup);
  EventArgs.Popup.Items.Add(M);
  M.Caption := '-';

  // Add a sub-item which being clicked will show the diagram
  M := TMenuItem.Create(EventArgs.Popup);
  EventArgs.Popup.Items.Add(M);
  M.Caption := 'Show the cell area in the diagram';
  M.OnClick := MenuDiagramShow;
  EventArgs.Popup.Images := IL;
  M.ImageIndex := 20;
end;

procedure TFrRCLupe.InitCharting;
var
  H: THierarchy;
  M: TMeasure;
begin
  ActivateOLAPCube;
  // OnShowMeasure event handler is to change the members sort order
  Grid.OnMemberSort := OnDateMemberSort;
  Grid.OnGetPopupMenu := AddChartingItem;
  with Grid do
  begin
    BeginUpdate;
    // Hide bookmarks
    OLAPPanelSettings.BtnsShow := False;
    // Show only data area
    OLAPPanelSettings.ShowAreasMode := rsAll;
    // Search for the "Categories" hierarchy
    H := Dimensions.FindHierarchyByDisplayName('Categories');
    if H <> nil then PivotingFirst(H, laRow);

    // Search for a hierarchy named "Date"...
    H := Dimensions.FindHierarchyByDisplayName('Date');
    if H <> nil then
    begin
      // Change the hierarchy sort method so it can be sorted in our own event handler
      H.OverrideSortMethods := True;
      // Place "Date" first in the Row area
      PivotingFirst(H, laColumn);
    end;

    // Search for a measure named "Sales"...
    M := Measures.FindByDisplayName('Sales');
    // ...and make it visible
    if M <> nil then M.Visible := True;
    EndUpdate;
  end;
end;

procedure TFrRCLupe.InitDrillThrough;
var
  H: THierarchy;
  M: TMeasure;
begin
  ActivateOLAPCube;
  // OnShowMeasure event handler is to change the members sort order
  Grid.OnMemberSort := OnDateMemberSort;
  Grid.OnGetPopupMenu := AddDrillThrough;
  with Grid do
  begin
    BeginUpdate;
    // Hide bookmarks
    OLAPPanelSettings.BtnsShow := False;
    // Show only data area
    OLAPPanelSettings.ShowAreasMode := rsAll;
    // Search for the "Categories" hierarchy
    H := Dimensions.FindHierarchyByDisplayName('Categories');
    if H <> nil then PivotingFirst(H, laRow);
    // Search for a hierarchy named "Date"...
    H := Dimensions.FindHierarchyByDisplayName('Date');
    if H <> nil then
    begin
      // Change the hierarchy sort method so it can be sorted in our own event handler
      H.OverrideSortMethods := True;
      // Place "Date" first in the Row area
      PivotingFirst(H, laColumn);
    end;
    // Search for a measure named "Sales"...
    M := Measures.FindByDisplayName('Sales');
    // ...and make it visible
    if M <> nil then M.Visible := True;

    // Show the second measure named "Quantity"
    M := Measures.FindByDisplayName('Quantity');
    if M <> nil then M.Visible := True;
    EndUpdate;
  end;
end;

procedure TFrRCLupe.AddDrillThrough(Sender: TObject; EventArgs: TPopupMenuArgs);
var
  C: ICell;
  M: TMenuItem;
begin
  C := Grid.Cellset.Cells[EventArgs.Column, EventArgs.Row];
  if C.CellType <> ctData then EXIT;

  // Remember the clicked cell in the form fields
  fPopupRow := EventArgs.Row;
  fPopupCol := EventArgs.Column;

  // Add menu separator
  M := TMenuItem.Create(EventArgs.Popup);
  EventArgs.Popup.Items.Add(M);
  M.Caption := '-';

  // Add menu item which being clicked will show the "Drill Through" window
  M := TMenuItem.Create(EventArgs.Popup);
  EventArgs.Popup.Items.Add(M);
  // On click the item will execute the "actDrillThrough" action
  M.Action := FindActionByName(ActionList1, 'actDrillThrough');
end;

procedure TFrRCLupe.actVisualSettingsExecute(Sender: TObject);
begin
  Grid.ShowSettingsDialog;
end;

procedure TFrRCLupe.GridChangeShowMode(Sender: TObject; EventArgs: TEventArgs);
begin
  ToolButton8.Down := False;
  ToolButton9.Down := False;
  ToolButton10.Down := False;
  Case Grid.OLAPPanelSettings.ShowAreasMode Of
    rsAll      : ToolButton8.Down  := True;
    rsPivot    : ToolButton9.Down  := True;
    rsDataOnly : ToolButton10.Down := True;
  End;
end;

procedure TFrRCLupe.expHTMLExecute(Sender: TObject);
begin
  if not Grid.Active then EXIT;
  ExportDialog.FileName := '';
  ExportDialog.DefaultExt := 'htm';
  ExportDialog.Filter := 'HTML files|*.htm';
  if ExportDialog.Execute then
   begin
    eHTML.Grid := Grid;
    eHTML.ExportToFile(ExportDialog.FileName);
    ShowMessage('Exportación Completada!');
   end;
end;

procedure TFrRCLupe.OLAPCubeAggregate(Sender: TObject; EventArgs: TAggregateArgs);
var
  i: integer;
  S: Int64;
  Arr: TInt64Array;
begin
  if EventArgs.CubeMeasure.DisplayName = 'Measure1' then
  if EventArgs.ArrayToAggregate is TInt64Array then
  begin
    Arr := EventArgs.ArrayToAggregate as TInt64Array;
    S := 0;
    for i := 0 to Arr.Count - 1 do  S := S + Arr[i];
    EventArgs.Result := S;
  end;
end;

procedure TFrRCLupe.actCopyExecute(Sender: TObject);
begin
  Grid.InternalGrid.CopyRect(Grid.InternalGrid.Selection, [cfTEXT], eaSelectedRange ,false, false);
end;

Procedure Form_RadaCube_Lupe_Show(pCodigo_Plantilla, pTipo_Proceso, pCaption, pFechaIni, pFechaFin : String);
Begin
  FrRCLupe := TFrRCLupe.Create(Nil);
  FrRCLupe.FFECHAINI := pFechaIni;
  FrRCLupe.FFECHAFIN := pFechaFin;
  FrRCLupe.Caption   := Trim(pCaption) ;
  FrRCLupe.FTIPO_PROCESO := pTipo_Proceso;
  FrRCLupe.FCODIGO_PLANTILLA := pCodigo_Plantilla;
  FrRCLupe.CreateOLAPCubeinRunTime1.Click;
  FrRCLupe.Show;
End;

end.