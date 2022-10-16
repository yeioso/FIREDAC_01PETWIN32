unit Form_Zona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrZona = class(TObjForm)
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
    BtnCargarSalon: TSpeedButton;
    BtnCargarMesaDisponible: TSpeedButton;
    BtnCargarMesaOcupada: TSpeedButton;
    BtnCargarMesaReservada: TSpeedButton;
    PLANO: TDBImage;
    ESPACIO_DISPONIBLE: TDBImage;
    ESPACIO_OCUPADA: TDBImage;
    ESPACIO_RESERVADA: TDBImage;
    NOMBRE: TOvcDbPictureField;
    Label2: TLabel;
    Label1: TLabel;
    CODIGO_ZONA: TOvcDbPictureField;
    GB_EXTENSIONES: TGroupBox;
    EXTENSION_PLANO: TOvcDbPictureField;
    EXTENSION_DISPONIBLE: TOvcDbPictureField;
    EXTENSION_RESERVADA: TOvcDbPictureField;
    EXTENSION_OCUPADA: TOvcDbPictureField;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BtnBorrarPlano: TSpeedButton;
    BtnBorrarDisponible: TSpeedButton;
    BtnBorrarOcupado: TSpeedButton;
    BtnBorrarReservado: TSpeedButton;
    ID_OCULTAR_POS: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure CODIGO_ZONAUserValidation(Sender: TObject;  var ErrorCode: Word);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure CODIGO_ZONAExit(Sender: TObject);
    procedure BtnCargarSalonClick(Sender: TObject);
    procedure BtnCargarMesaDisponibleClick(Sender: TObject);
    procedure BtnCargarMesaOcupadaClick(Sender: TObject);
    procedure BtnCargarMesaReservadaClick(Sender: TObject);
    procedure BtnBorrarPlanoClick(Sender: TObject);
    procedure BtnBorrarDisponibleClick(Sender: TObject);
    procedure BtnBorrarOcupadoClick(Sender: TObject);
    procedure BtnBorrarReservadoClick(Sender: TObject);
  private
    { Private declarations }
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    procedure StateChange(Sender: TObject); Override;
    Procedure NewRecord(DataSet: TDataSet); Override;
  Protected
  public
    { Public declarations }
  end;

Var
  FrZona: TFrZona;
  Procedure Show_Form_Zona;

implementation
{$R *.dfm}

Uses
  UtExcel,
  
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  Form_Busqueda,
  UtVariablesGlobales;

procedure TFrZona.NewRecord(DataSet: TDataSet);
begin
  inherited;
  If Modo_Edicion Then
    TbMaestro.FieldByName('ID_OCULTAR_POS').AsString := 'N';
end;

procedure TFrZona.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrZona.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_ZONA.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled    := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled   := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  Registros.Enabled   := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 If CODIGO_ZONA.Enabled Then
                   CODIGO_ZONA.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrZona.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Zona).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Zona, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrZona.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrZona.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

Function TFrZona.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Zona).Name);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_ZONA']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_ZONA', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrZona.BtnCargarMesaDisponibleClick(Sender: TObject);
Var
  lBorrar : Boolean;
  lFileName : String;
begin
  If OpenDialog1.Execute Then
  Begin
    ESPACIO_DISPONIBLE.Picture.LoadFromFile(OpenDialog1.FileName);
    EXTENSION_DISPONIBLE.Field.AsString := StringReplace(ExtractFileExt(OpenDialog1.FileName), '.', '', [rfReplaceAll]);
  End;
//    if Pos(AnsiUpperCase('.jpg'), AnsiUpperCase(OpenDialog1.FileName)) <> 0 then
//    Begin
//      lFileName := Convert_JPG_BMP(OpenDialog1.FileName, lBorrar);
//      ESPACIO_DISPONIBLE.Picture.LoadFromFile(lFileName);
//      if lBorrar then
//        DeleteFile(lFileName);
//    End
//    Else
//     ESPACIO_DISPONIBLE.Picture.LoadFromFile(OpenDialog1.FileName);
end;

procedure TFrZona.BtnCargarMesaOcupadaClick(Sender: TObject);
Var
  lBorrar : Boolean;
  lFileName : String;
begin
  If OpenDialog1.Execute Then
  Begin
    ESPACIO_OCUPADA.Picture.LoadFromFile(OpenDialog1.FileName);
    EXTENSION_OCUPADA.Field.AsString := StringReplace(ExtractFileExt(OpenDialog1.FileName), '.', '', [rfReplaceAll]);
  End;
//    if Pos(AnsiUpperCase('.jpg'), AnsiUpperCase(OpenDialog1.FileName)) <> 0 then
//    Begin
//      lFileName := Convert_JPG_BMP(OpenDialog1.FileName, lBorrar);
//      ESPACIO_OCUPADA.Picture.LoadFromFile(lFileName);
//      if lBorrar then
//        DeleteFile(lFileName);
//    End
//    Else
//     ESPACIO_OCUPADA.Picture.LoadFromFile(OpenDialog1.FileName);
end;

procedure TFrZona.BtnCargarMesaReservadaClick(Sender: TObject);
Var
  lBorrar : Boolean;
  lFileName : String;
begin
  If OpenDialog1.Execute Then
  Begin
    ESPACIO_RESERVADA.Picture.LoadFromFile(OpenDialog1.FileName);
    EXTENSION_RESERVADA.Field.AsString := StringReplace(ExtractFileExt(OpenDialog1.FileName), '.', '', [rfReplaceAll]);
  End;
//    if Pos(AnsiUpperCase('.jpg'), AnsiUpperCase(OpenDialog1.FileName)) <> 0 then
//    Begin
//      lFileName := Convert_JPG_BMP(OpenDialog1.FileName, lBorrar);
//      ESPACIO_RESERVADA.Picture.LoadFromFile(lFileName);
//      if lBorrar then
//        DeleteFile(lFileName);
//    End
//    Else
//     ESPACIO_RESERVADA.Picture.LoadFromFile(OpenDialog1.FileName);
end;

procedure TFrZona.BtnBorrarDisponibleClick(Sender: TObject);
begin
  TbMaestro.FieldByName('ESPACIO_DISPONIBLE').Clear;
end;

procedure TFrZona.BtnBorrarOcupadoClick(Sender: TObject);
begin
  TbMaestro.FieldByName('ESPACIO_OCUPADA').Clear;
end;

procedure TFrZona.BtnBorrarPlanoClick(Sender: TObject);
begin
  TbMaestro.FieldByName('PLANO').Clear;
end;

procedure TFrZona.BtnBorrarReservadoClick(Sender: TObject);
begin
  TbMaestro.FieldByName('ESPACIO_RESERVADA').Clear;
end;

procedure TFrZona.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Not Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_ZONA'], ['CODIGO_ZONA'], Retornar_Info_Tabla(Id_Zona).Name, '', Retornar_Info_Tabla(Id_Zona).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_ZONA.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrZona.BtnCargarSalonClick(Sender: TObject);
Var
  lBorrar : Boolean;
  lFileName : String;
begin
  If OpenDialog1.Execute Then
  Begin
    PLANO.Picture.LoadFromFile(OpenDialog1.FileName);
    EXTENSION_PLANO.Field.AsString := StringReplace(ExtractFileExt(OpenDialog1.FileName), '.', '', [rfReplaceAll]);
  End;
//    if Pos(AnsiUpperCase('.jpg'), AnsiUpperCase(OpenDialog1.FileName)) <> 0 then
//    Begin
//      lFileName := Convert_JPG_BMP(OpenDialog1.FileName, lBorrar);
//      PLANO.Picture.LoadFromFile(lFileName);
//      if lBorrar then
//        DeleteFile(lFileName);
//    End
//    Else
//     PLANO.Picture.LoadFromFile(OpenDialog1.FileName);
end;

procedure TFrZona.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Zona).Caption);
end;

Procedure TFrZona.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrZona.CODIGO_ZONAExit(Sender: TObject);
begin
  if Modo_Edicion then
    if Not Vacio(CODIGO_ZONA.EditString)  then
      CODIGO_ZONA.Field.AsString := Justificar(CODIGO_ZONA.EditString, '0', CODIGO_ZONA.MaxLength);
end;

procedure TFrZona.CODIGO_ZONAUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(CODIGO_ZONA.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If CNX.Record_Exist(Retornar_Info_Tabla(Id_Zona).Name, [CODIGO_ZONA.Field.FullName], [CODIGO_ZONA.EditString]) Then
        ErrorCode := IE_CODE_EXISTS;
end;

Procedure Show_Form_Zona;
Begin
  FrZona := TFrZona.Create(Application);
  If FrZona.Abrir_Archivos Then
    FrZona.Show
  Else
  Begin
    FrZona.Free;
    Mensajes(MessageError(IE_ERROR_LOAD_FORM));
  End;
End;

end.
