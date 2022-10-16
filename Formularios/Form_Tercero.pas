unit Form_Tercero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrTercero = class(TObjForm)
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
    OpenDialog1: TOpenDialog;
    PnlOpcionales: TPanel;
    BtnExcel: TSpeedButton;
    BtnBuscar: TSpeedButton;
    BtnFiltrado: TSpeedButton;
    Paginas: TPageControl;
    Pag00: TTabSheet;
    Pag01: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CODIGO_TERCERO: TOvcDbPictureField;
    NOMBRE: TOvcDbPictureField;
    DIGITO_VERIFICACION: TOvcDbPictureField;
    EQUIVALENCIA: TOvcDbPictureField;
    ID_DOCUMENTO: TDBRadioGroup;
    GRAFICO: TDBImage;
    BtnSubirGrafico: TSpeedButton;
    Pag02: TTabSheet;
    BtnContacto: TSpeedButton;
    BtnSinonimo: TSpeedButton;
    BtnListaPrecio: TSpeedButton;
    ID_CLIENTE: TDBCheckBox;
    ID_PROVEEDOR: TDBCheckBox;
    Label4: TLabel;
    PRIMER_NOMBRE: TOvcDbPictureField;
    Label5: TLabel;
    SEGUNDO_NOMBRE: TOvcDbPictureField;
    PRIMER_APELLIDO: TOvcDbPictureField;
    Label6: TLabel;
    SEGUNDO_APELLIDO: TOvcDbPictureField;
    Label7: TLabel;
    PLAZO: TOvcDbPictureField;
    Label15: TLabel;
    ID_BANCO: TDBCheckBox;
    ID_RUT: TDBCheckBox;
    ID_ACTIVO: TDBCheckBox;
    ID_EMPLEADO: TDBCheckBox;
    Label8: TLabel;
    PORCENTAJE_COMISION: TOvcDbPictureField;
    BtnEstado: TSpeedButton;
    ID_VENDEDOR_PPAL: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CODIGO_TERCEROUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_TERCEROExit(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure BtnSubirGraficoClick(Sender: TObject);
    procedure BtnListaPrecioClick(Sender: TObject);
    procedure BtnContactoClick(Sender: TObject);
    procedure BtnSinonimoClick(Sender: TObject);
    procedure tbMaestroAfterInsert(DataSet: TDataSet);
    procedure BtnEstadoClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Insertar_Sinonimo(pCodigo_Tercero, pCodigo_Sinonimo, pNombre : String);
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    procedure StateChange(Sender: TObject); Override;
    procedure DataChange(Sender: TObject; Field: TField); Override;
    Procedure Procesar_After_Post; Override;
  Protected
  public
    { Public declarations }
  end;

Var
  FrTercero: TFrTercero;
  Procedure Show_Form_Tercero;

implementation
{$R *.dfm}

Uses
  
  UtExcel,
  UtConexion,
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  Form_Busqueda,
  Form_Tercero_LP,
  UtVariablesGlobales,
  Form_Tercero_Resumen,
  Form_Tercero_Contacto,
  Form_Tercero_Sinonimo;


Procedure TFrTercero.Insertar_Sinonimo(pCodigo_Tercero, pCodigo_Sinonimo, pNombre : String);
Var
  lSQLO : TQuery;
Begin
  Try
    lSQLO := TQuery.Create(Nil);
    lSQLO.Connection := CNX;
    lSQLO.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name + ' ');
    lSQLO.SQL.Add(' WHERE ' + CNX.Trim_Sentence('CODIGO_TERCERO' ) + ' = ' +  QuotedStr(Trim(pCodigo_Tercero)));
    lSQLO.SQL.Add(' AND '   + CNX.Trim_Sentence('CODIGO_SINONIMO') + ' = ' +  QuotedStr(Trim(pCodigo_Sinonimo)));
    lSQLO.Active := True;
    If lSQLO.Active And (lSQLO.RecordCount <= 0) Then
    Begin
      lSQLO.Append;
      lSQLO.FieldByName('CODIGO_TERCERO'     ).AsString := Justificar(pCodigo_Tercero , ' ', lSQLO.FieldByName('CODIGO_TERCERO' ).Size);
      lSQLO.FieldByName('CODIGO_SINONIMO'    ).AsString := Justificar(pCodigo_Sinonimo, ' ', lSQLO.FieldByName('CODIGO_SINONIMO').Size);
      lSQLO.FieldByName('NOMBRE'             ).AsString := AnsiUpperCase(Trim(pNombre     ));
      lSQLO.Post;
    End;
    lSQLO.Active := False;
    lSQLO.DisposeOf;
  Except
    On E:Exception Do
      gVariableGlobal.Add_Log(['Origen', 'TFrTercero.Insertar_Sinonimo', 'Error', E.Message]);
  End;
End;

procedure TFrTercero.Procesar_After_Post;
begin
  inherited;
  Insertar_Sinonimo(CODIGO_TERCERO.EditString, CODIGO_TERCERO.EditString, NOMBRE.EditString);
end;

procedure TFrTercero.DataChange(Sender: TObject; Field: TField);
begin
  Inherited;
  If Modo_Edicion Then
    If (Assigned(Field) And (Field.FullName = CODIGO_TERCERO.Field.FullName)) Then
      DIGITO_VERIFICACION.Field.AsString := UtFunciones.Digito_Verificacion(Trim(CODIGO_TERCERO.Field.AsString));
end;

procedure TFrTercero.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_TERCERO.Enabled  := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled        := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled       := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnEstado.Enabled       := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnListaPrecio.Enabled  := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnFiltrado.Enabled     := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnContacto.Enabled     := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnSinonimo.Enabled     := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled       := (Not Modo_Edicion);
  NOMBRE.Enabled          := Modo_Edicion;
  GRAFICO.Enabled         := Modo_Edicion;
  BtnSubirGrafico.Enabled := Modo_Edicion;
  If DsMaestro.State In [dsInsert, dsEdit] Then
    Paginas.ActivePageIndex := 0;
  Case DsMaestro.State Of
    dsInsert : Begin
                 Inicializar_Labels_Formulario(Self, ['lbnombre'], '');
                 If CODIGO_TERCERO.Enabled Then
                   CODIGO_TERCERO.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrTercero.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Tercero).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Tercero, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1);
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrTercero.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrTercero.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

Function TFrTercero.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add('SELECT * FROM ' + Retornar_Info_Tabla(Id_Tercero).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_TERCERO']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_TERCERO', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrTercero.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO'], [CODIGO_TERCERO.Field.FullName], Retornar_Info_Tabla(Id_Tercero).Name, '', Retornar_Info_Tabla(Id_Tercero).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_TERCERO.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrTercero.BtnContactoClick(Sender: TObject);
begin
  Show_Form_Tercero_Contacto(CODIGO_TERCERO.EditString);
end;

procedure TFrTercero.BtnSubirGraficoClick(Sender: TObject);
Var
  lBorrar : Boolean;
  lFileName : String;
begin
  If OpenDialog1.Execute Then
    if Pos(AnsiUpperCase('.jpg'), AnsiUpperCase(OpenDialog1.FileName)) <> 0 then
    Begin
      lFileName := Convert_JPG_BMP(OpenDialog1.FileName, lBorrar);
      GRAFICO.Picture.LoadFromFile(lFileName);
      if lBorrar then
        DeleteFile(lFileName);
    End
    Else
     GRAFICO.Picture.LoadFromFile(OpenDialog1.FileName);
end;

procedure TFrTercero.BtnEstadoClick(Sender: TObject);
begin
  Form_Tercero_Resumen_Show(CODIGO_TERCERO.EditString);
end;

procedure TFrTercero.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Tercero).Caption);
end;

procedure TFrTercero.BtnListaPrecioClick(Sender: TObject);
begin
  Show_Form_TERCERO_LP(CODIGO_TERCERO.EditString);
end;

Procedure TFrTercero.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrTercero.CODIGO_TERCEROExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, ' ', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrTercero.CODIGO_TERCEROUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(CODIGO_TERCERO.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Tercero).Name, [CODIGO_TERCERO.Field.FullName], [CODIGO_TERCERO.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

procedure TFrTercero.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;


procedure TFrTercero.tbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
    ID_ACTIVO.Field.AsString := 'S';
end;

procedure TFrTercero.BtnSinonimoClick(Sender: TObject);
begin
  Show_Form_Tercero_Sinonimo(CODIGO_TERCERO.EditString);
end;

Procedure Show_Form_Tercero;
Begin
  FrTercero := TFrTercero.Create(Application);
  If FrTercero.Abrir_Archivos Then
    FrTercero.Show
  Else
  Begin
    FrTercero.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
