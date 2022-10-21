unit Form_Producto_Observacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrProducto_Observacion = class(TObjForm)
    PnlRegistros: TPanel;
    PnlBotones: TPanel;
    NOMBRE: TOvcDbPictureField;
    Label2: TLabel;
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
    Label7: TLabel;
    CODIGO_OBSERVACION: TOvcDbPictureField;
    BtnImportar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure BtnImportarClick(Sender: TObject);
  private
    { Private declarations }
    FCODIGO_PRODUCTO : String;
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    procedure StateChange(Sender: TObject); Override;
  Protected
  public
    { Public declarations }
  end;

  Procedure Show_Form_Producto_Observacion(pCodigo_Producto : String);

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


procedure TFrProducto_Observacion.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  CODIGO_OBSERVACION.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled    := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled   := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnImportar.Enabled := (Not Modo_Edicion);
  Registros.Enabled   := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrProducto_Observacion.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(Id_Producto_Observacion).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, Id_Producto_Observacion, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, True, 0);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Self.Tag := gVariableGlobal.VALOR_TAG;
end;

procedure TFrProducto_Observacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrProducto_Observacion.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrProducto_Observacion.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
    tbMaestro.FieldByName('CODIGO_PRODUCTO').AsString := FCODIGO_PRODUCTO;
end;

Function TFrProducto_Observacion.Abrir_Archivos : Boolean;
Begin
  TbMaestro.Active := False;
  TbMaestro.SQL.Clear;
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto_Observacion).Name);
  TbMaestro.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_PRODUCTO') + ' = ' + #39 + Trim(FCODIGO_PRODUCTO) + #39);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_PRODUCTO', 'CODIGO_OBSERVACION']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['CODIGO_OBSERVACION', 'NOMBRE'], ['Código', 'Nombre']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrProducto_Observacion.BtnBuscarClick(Sender: TObject);
Var
  lFiltro : String;
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Not Modo_Edicion Then
  Begin
    lFiltro := gVariableGlobal.CNX.Trim_Sentence('CODIGO_PRODUCTO') + ' = ' + QuotedStr(Trim(FCODIGO_PRODUCTO));
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_OBSERVACION', 'CODIGO_PRODUCTO'], ['CODIGO_OBSERVACION'], Retornar_Info_Tabla(Id_Producto_Observacion).Name, lFiltro, Retornar_Info_Tabla(Id_Producto_Observacion).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(CODIGO_OBSERVACION.Field.FullName, lResult01, [loCaseInsensitive]);
  End;
end;

procedure TFrProducto_Observacion.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(Id_Producto_Observacion).Caption);
end;

procedure TFrProducto_Observacion.BtnImportarClick(Sender: TObject);
Var
  lO : TQUERY;
  lD : TQUERY;
  lI : Integer;
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Not Show_FrBusqueda(['NOMBRE', 'CODIGO_PRODUCTO'], ['CODIGO_PRODUCTO'], Retornar_Info_Tabla(Id_Producto).Name, '', Retornar_Info_Tabla(Id_Producto).Caption, lResult01, lResult02, lResult03, False, CNX) Then
    Exit;
  Try
    lO := TQUERY.Create(Nil);
    lO.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto_Observacion).Name + ' ');
    lO.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_PRODUCTO') + ' = ' + QuotedStr(Trim(lResult01)) + ' ');

    lD := TQUERY.Create(Nil);
    lD.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto_Observacion).Name + ' ');
    lD.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_PRODUCTO') + ' = ' + QuotedStr(Trim(FCODIGO_PRODUCTO)) + ' ');

    lO.Active := True;
    lD.Active := True;
    If lO.Active And (lO.RecordCount > 0) And lD.Active Then
    Begin
      lO.First;
      While Not lO.Eof Do
      Begin
        lD.Append;
        For lI := 0 To lO.Fields.Count-1 Do
          lD.FieldByName(lO.Fields[lI].FullName).Value := lO.FieldByName(lO.Fields[lI].FullName).Value;
        lD.FieldByName('CODIGO_OBSERVACION').AsString := gVariableGlobal.CNX.Next(Retornar_Info_Tabla(Id_Producto_Observacion).Name, '0',  ['CODIGO_OBSERVACION'], [], [], tbMaestro.FieldByName('CODIGO_OBSERVACION').Size);
        lD.FieldByName('CODIGO_PRODUCTO'   ).AsString := FCODIGO_PRODUCTO;
        lD.Post;
        lO.Next;
      End;
    End;
    lD.Active := False;
    FreeAndNil(lD);
    lO.Active := False;
    FreeAndNil(lO);
    Abrir_Archivos;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrProducto_Observacion.BtnImportarClick']);
  End;
  Mensajes('Proceso terminado');
end;

Procedure TFrProducto_Observacion.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrProducto_Observacion.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

Procedure Show_Form_Producto_Observacion(pCodigo_Producto : String);
Var
  FrProducto_Observacion: TFrProducto_Observacion;
Begin
  FrProducto_Observacion := TFrProducto_Observacion.Create(Application);
  FrProducto_Observacion.FCODIGO_PRODUCTO := pCodigo_Producto;
  If FrProducto_Observacion.Abrir_Archivos Then
    FrProducto_Observacion.ShowModal;
  FrProducto_Observacion.Free;
End;

end.
