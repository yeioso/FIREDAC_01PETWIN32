unit Form_Producto_Receta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ovcbase, ovcef, ovcpb, ovcpf, ovcdbpf, StdCtrls,
  DBCtrls, Grids, DBGrids, UtFormularios, Buttons, ovccmbx,
  ComCtrls, ovcdbfcb, ovceditf, ovcedpop, ovcedcal, ovcdbdat;

type
  TFrProducto_Receta = class(TObjForm)
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
    Label10: TLabel;
    NUMERO_UNIDADES: TOvcDbPictureField;
    Label3: TLabel;
    COSTO_UNITARIO: TOvcDbPictureField;
    Label7: TLabel;
    PRODUCTO_PADRE: TOvcDbPictureField;
    BtnProducto: TSpeedButton;
    lbNombreProducto: TLabel;
    Label4: TLabel;
    COSTO_TOTAL: TOvcDbPictureField;
    BtnReceta: TSpeedButton;
    ID_RECETA: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure NOMBREUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure TbMaestroAfterInsert(DataSet: TDataSet);
    procedure PRODUCTO_PADREExit(Sender: TObject);
    procedure PRODUCTO_PADREUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure BtnProductoClick(Sender: TObject);
    procedure PRODUCTO_PADREKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnRecetaClick(Sender: TObject);
    procedure PRODUCTO_PADREChange(Sender: TObject);
    procedure NUMERO_UNIDADESChange(Sender: TObject);
  private
    { Private declarations }
    FID_TABLA : Integer;
    FCODIGO_PRODUCTO : String;
    Function Abrir_Archivos : Boolean;
    Procedure Cerrar_Archivos;
    Function Actualizar_Costo_Produccion(pCodigo_Producto : String; pValue : Double) : Boolean;
    Function Calcular_Costo_Produccion(pCodigo_Producto : String) : Double;
    Procedure Actualizar_Informacion_Producto;
    procedure StateChange(Sender: TObject); Override;
    procedure DataChange(Sender: TObject; Field: TField); Override;
  Protected
  public
    { Public declarations }
  end;

  Procedure Show_Form_Producto_Receta(pId_Tabla : Integer; pCodigo_Producto : String);

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

Procedure TFrProducto_Receta.Actualizar_Informacion_Producto;
Begin
  lbNombreProducto.Caption := CNX.Retornar_String(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [PRODUCTO_PADRE.Field.AsString], ['NOMBRE'], 'TFrReceta.DsMaestroDataChange');
  If Modo_Edicion Then
  Begin
    NOMBRE.Field.AsString := lbNombreProducto.Caption;
    COSTO_UNITARIO.Field.AsFloat := CNX.Retornar_Double(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [PRODUCTO_PADRE.Field.AsString], ['VALOR_COMPRA'], 'TFrReceta.DsMaestroDataChange');
  End;
End;

procedure TFrProducto_Receta.DataChange(Sender: TObject; Field: TField);
begin
  Inherited;
  If (DsMaestro.State In [dsBrowse]) Or (Assigned(Field) And (Field.FullName = PRODUCTO_PADRE.Field.FullName)) Then
    Actualizar_Informacion_Producto;

  If Assigned(Field) And Modo_Edicion Then
   If (Field.FullName = NUMERO_UNIDADES.Field.FullName     ) Or
      (Field.FullName = COSTO_UNITARIO.Field.FullName) Then
        COSTO_TOTAL.Field.AsFloat := NUMERO_UNIDADES.Field.AsFloat * COSTO_UNITARIO.Field.AsFloat;

  BtnReceta.Enabled := (Not Modo_Edicion) And (ID_RECETA.Field.AsString = 'S');
end;

procedure TFrProducto_Receta.StateChange(Sender: TObject);
begin
  Inherited;
  If Not TbMaestro.Active Then
    Exit;
  Control_Campos_Formulario(Modo_Edicion);
  COSTO_TOTAL.Enabled    := False;
  BtnProducto.Enabled    := DsMaestro.State In [dsInsert];
  PRODUCTO_PADRE.Enabled := DsMaestro.State In [dsInsert];
  BtnExcel.Enabled       := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnBuscar.Enabled      := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1);
  BtnReceta.Enabled      := (Not Modo_Edicion) And (TbMaestro.RecordCount >= 1) And (CNX.Retornar_String(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [PRODUCTO_PADRE.Field.AsString], ['ID_RECETA'], 'TFrReceta.DsMaestroDataChange')  = 'S');
  Registros.Enabled      := (Not Modo_Edicion);
  Case DsMaestro.State Of
    dsInsert : Begin
                 If PRODUCTO_PADRE.Enabled Then
                   PRODUCTO_PADRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_INSERT), '');
               End;
    dsEdit   : Begin
                 If NOMBRE.Enabled Then
                   NOMBRE.SetFocus;
                 Self.Barra_de_Estado(MessageError(IE_STATE_EDIT), '');
               End;
  End;
end;

procedure TFrProducto_Receta.FormCreate(Sender: TObject);
begin
  Caption := Retornar_Info_Tabla(FID_TABLA).Caption;
  Self.Error_RadioGroup := IE_ERROR_OPTION;
  Self.Setting_Form(Self, FID_TABLA, TbMaestro, DsMaestro, Nil, BtnBuscar, BtnExcel, BtnFiltrado, Estado_Actual, DBNavigator1, False, -1);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
  Self.Tag := gVariableGlobal.Valor_Tag;
end;

procedure TFrProducto_Receta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrProducto_Receta.FormDestroy(Sender: TObject);
begin
  Cerrar_Archivos;
end;

procedure TFrProducto_Receta.TbMaestroAfterInsert(DataSet: TDataSet);
begin
  If Modo_Edicion Then
  Begin
    tbMaestro.FieldByName('CODIGO_PRODUCTO').AsString := FCODIGO_PRODUCTO;
//    tbMaestro.FieldByName('PRODUCTO_PADRE' ).AsString := Retornar_Siguiente(Retornar_Info_Tabla(Id_Receta).Name, 'PRODUCTO_PADRE', tbMaestro.FieldByName('PRODUCTO_PADRE').Size, 'TFrReceta.TbMaestroAfterInsert');
  End;
end;

Function TFrProducto_Receta.Abrir_Archivos : Boolean;
Begin
  TbMaestro.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(FID_TABLA).Name);
  TbMaestro.SQL.Add(' WHERE ' + CNX.Trim_Sentence('CODIGO_PRODUCTO') + ' = ' + #39 + Trim(FCODIGO_PRODUCTO) + #39);
  Self.Abrir_Archivo(TbMaestro, ['CODIGO_PRODUCTO', 'PRODUCTO_PADRE']);
  if TbMaestro.Active then
  Begin
    Self.Establecer_Columnas_Grid(Registros, ['PRODUCTO_PADRE', 'NOMBRE', 'NUMERO_UNIDADES', 'COSTO_UNITARIO', 'COSTO_TOTAL'], ['Código', 'Nombre', 'Unidades', 'Costo Unitario', 'Costo Total']);
    Self.Establecer_Permisos_Perfil;
  End;
  Result := TbMaestro.Active;
End;

procedure TFrProducto_Receta.BtnBuscarClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  if Not Modo_Edicion then
    If Show_FrBusqueda(['NOMBRE', 'PRODUCTO_PADRE'], [PRODUCTO_PADRE.Field.FullName], Retornar_Info_Tabla(FID_TABLA).Name, 'CODIGO_PRODUCTO = ' + QuotedStr(Trim(FCODIGO_PRODUCTO)), Retornar_Info_Tabla(Id_Producto_Receta).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      TbMaestro.Locate(PRODUCTO_PADRE.Field.FullName, lResult01, [loCaseInsensitive]);
end;

procedure TFrProducto_Receta.BtnExcelClick(Sender: TObject);
begin
  Exportacion_QRExcel(TbMaestro, Retornar_Info_Tabla(FID_TABLA).Caption);
end;

procedure TFrProducto_Receta.BtnProductoClick(Sender: TObject);
Var
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  If Modo_Edicion Then
    If Show_FrBusqueda(['NOMBRE', 'CODIGO_PRODUCTO'], ['CODIGO_PRODUCTO'], Retornar_Info_Tabla(Id_Producto).Name, '', Retornar_Info_Tabla(Id_Producto).Caption, lResult01, lResult02, lResult03, False, CNX) Then
      PRODUCTO_PADRE.Field.AsString := lResult01;
end;

procedure TFrProducto_Receta.BtnRecetaClick(Sender: TObject);
begin
  Show_Form_Producto_Receta(Id_Producto_Receta, PRODUCTO_PADRE.EditString);
end;

Procedure TFrProducto_Receta.Cerrar_Archivos;
Begin
  If TbMaestro.Active Then
    TbMaestro.Active := False;
End;

procedure TFrProducto_Receta.NOMBREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if Modo_Edicion then
    If Vacio(NOMBRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY;
end;

procedure TFrProducto_Receta.NUMERO_UNIDADESChange(Sender: TObject);
begin
 Actualizar_Informacion_Producto;
end;

procedure TFrProducto_Receta.PRODUCTO_PADREChange(Sender: TObject);
begin
  Actualizar_Informacion_Producto;
end;

procedure TFrProducto_Receta.PRODUCTO_PADREExit(Sender: TObject);
begin
  If Modo_Edicion Then
    If Not Vacio(TOvcDbPictureField(Sender).EditString) Then
      TOvcDbPictureField(Sender).Field.AsString := Justificar(TOvcDbPictureField(Sender).EditString, '0', TOvcDbPictureField(Sender).MaxLength);
end;

procedure TFrProducto_Receta.PRODUCTO_PADREKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_F3 Then
    BtnProducto.Click;
end;

procedure TFrProducto_Receta.PRODUCTO_PADREUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  If Modo_Edicion Then
    If Vacio(PRODUCTO_PADRE.EditString) Then
      ErrorCode := IE_FIELD_EMPTY
    Else
      If Not CNX.Record_Exist(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [TOvcDbPictureField(Sender).EditString]) Then
        ErrorCode := IE_CODE_NOEXISTS;
end;

Function TFrProducto_Receta.Actualizar_Costo_Produccion(pCodigo_Producto : String; pValue : Double) : Boolean;
Var
  lOrigen : TQuery;
Begin
  Result := False;
  Try
    lOrigen := TQuery.Create(Nil);
    lOrigen.Connection := gVariableGlobal.CNX;
    lOrigen.SQL.Clear;
    lOrigen.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto).Name);
    lOrigen.SQL.Add(' WHERE CODIGO_PRODUCTO = ' + #39 + pCodigo_Producto + #39 );
    lOrigen.Active := True;
    If lOrigen.Active And (lOrigen.RecordCount > 0) Then
    Begin
      lOrigen.Edit;
      lOrigen.FieldByName('COSTO_CALCULADO').AsFloat := pValue;
      lOrigen.FieldByName('VALOR_PROPUESTO').AsFloat :=  (1 + (lOrigen.FieldByName('PORC_UTILIDAD').AsFloat/100)) * pValue;;
      lOrigen.Post;
      Result := True;
    End;
    lOrigen.Active := False;
    lOrigen.Free;
  Except
    On E : Exception Do
    Begin
      Result := False;
      gVariableGlobal.Add_Log(['Origen', 'Form_Receta, Actualizar_Costo_Produccion', 'Error', E.Message]);
    End;
  End;
End;

Function TFrProducto_Receta.Calcular_Costo_Produccion(pCodigo_Producto : String) : Double;
Var
  ltmp : Double;
  lOrigen : TQuery;
Begin
  Result := 0;
  Try
    lOrigen := TQuery.Create(Nil);
    lOrigen.Connection := gVariableGlobal.CNX;
    lOrigen.SQL.Clear;
    lOrigen.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto_Receta).Name);
    lOrigen.SQL.Add(' WHERE CODIGO_PRODUCTO = ' + #39 + pCodigo_Producto + #39 );
    lOrigen.Active := True;
    If lOrigen.Active And (lOrigen.RecordCount > 0) Then
    Begin
      lOrigen.First;
      While Not lOrigen.Eof Do
      Begin
        ltmp := CNX.Retornar_Double(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [lOrigen.FieldByName('PRODUCTO_PADRE').AsString], ['VALOR_COMPRA'], 'Calcular_Costo_Produccion');
        Result := Result + (ltmp * lOrigen.FieldByName('NUMERO_UNIDADES').AsFloat);
//        If Retornar_String(Retornar_Info_Tabla(Id_Producto_Receta).Name, ['CODIGO_PRODUCTO'], [lOrigen.FieldByName('PRODUCTO_PADRE').AsString], ['ID_RECETA'], 'orm_Adicion, Calcular_Costo_Produccion')  = 'S' Then
//          Result := Result + Calcular_Costo_Produccion(lOrigen.FieldByName('PRODUCTO_PADRE').AsString);
        lOrigen.Next;
      End;
    End;
    lOrigen.Active := False;
    lOrigen.Free;
  Except
    On E : Exception Do
    Begin
      gVariableGlobal.Add_Log(['Origen', 'Form_Receta, Calcular_Costo_Produccion', 'Error', E.Message]);
    End;
  End;
End;

Procedure Show_Form_Producto_Receta(pId_Tabla : Integer; pCodigo_Producto : String);
Var
  ltmp : Double;
  FrProducto_Receta: TFrProducto_Receta;
Begin
  FrProducto_Receta := TFrProducto_Receta.Create(Application);
  FrProducto_Receta.FID_TABLA := pId_Tabla;
  FrProducto_Receta.FCODIGO_PRODUCTO := pCodigo_Producto;
  If FrProducto_Receta.Abrir_Archivos Then
    FrProducto_Receta.ShowModal;
  If pId_Tabla = Id_Producto_Receta Then
  Begin
    ltmp := FrProducto_Receta.Calcular_Costo_Produccion(pCodigo_Producto);
    FrProducto_Receta.Actualizar_Costo_Produccion(pCodigo_Producto, ltmp);
  End;
  FrProducto_Receta.Free;
End;

end.

