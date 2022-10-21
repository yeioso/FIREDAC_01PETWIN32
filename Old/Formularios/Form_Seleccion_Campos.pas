unit Form_Seleccion_Campos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, UtConexion, ExtCtrls, ComCtrls, Grids, DBGrids, StdCtrls, Buttons,
  UtAdministrar_Analisis;

type
  TFrSeleccion_Campos = class(TForm)
    QrPivotes: TQuery;
    pnlData: TPanel;
    pnlBotones: TPanel;
    Paginas: TPageControl;
    Pag00: TTabSheet;
    Pag01: TTabSheet;
    QrValores: TQuery;
    DsPivotes: TDataSource;
    DsValores: TDataSource;
    GridPivotes: TDBGrid;
    pnlPivotes: TPanel;
    Label1: TLabel;
    txtPivote: TEdit;
    BtnPivotes: TSpeedButton;
    pnlValores: TPanel;
    Label2: TLabel;
    BtnValores: TSpeedButton;
    txtValores: TEdit;
    GridValores: TDBGrid;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    pnlInfo: TPanel;
    ListBox1: TListBox;
    procedure QrPivotesBeforeDelete(DataSet: TDataSet);
    procedure QrValoresBeforeDelete(DataSet: TDataSet);
    procedure QrPivotesBeforeInsert(DataSet: TDataSet);
    procedure QrValoresBeforeInsert(DataSet: TDataSet);
    procedure GridPivotesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridValoresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridPivotesDblClick(Sender: TObject);
    procedure GridValoresDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure txtPivoteChange(Sender: TObject);
    procedure BtnPivotesClick(Sender: TObject);
    procedure txtValoresChange(Sender: TObject);
    procedure BtnValoresClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure GridPivotesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridValoresDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FVALIDATE : Boolean;
    FANALISIS : TAnalisis;
    Function Contar_Campos(pTipo_Campo : String) : Integer;
    Function Cargar_Campos : Boolean;
    Function Abrir_Tabla(pQuery : TQuery; pTipo, pValue : String) : Boolean;
    Function Cerrar_Tabla(pQuery : TQuery) : Boolean;
    Procedure Cambiar_Estado_Seleccion(pQuery : TQuery);
  public
    { Public declarations }
  end;

var
  FrSeleccion_Campos: TFrSeleccion_Campos;
  Function Show_Form_Seleccion_Campos(pTipo_Proceso, pCaption, pNombre_Tabla, pNombre_Aux : String; pCampos, pCondiciones : TLista_Analisis; pValidate : Boolean) : Boolean;

implementation
{$R *.dfm}
Uses
  StrUtils,
  UtConexion,
  UtException,
  UtInfoTablas,
  UtHomologacion,
  UtVariablesGlobales;

Function TFrSeleccion_Campos.Contar_Campos(pTipo_Campo : String) : Integer;
Var
  lSQL : TQuery;
Begin
  Result := 0;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT COUNT(*) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Seleccion_Campos).Name + ' '         );
    lSQL.SQL.Add(' WHERE ' + Trim_Sentence('TIPO_PROCESO'  ) + ' = ' + QuotedStr(Trim(FANALISIS.TIPO_PROCESO)));
    lSQL.SQL.Add(' AND '   + Trim_Sentence('TIPO_CAMPO'    ) + ' = ' + QuotedStr(Trim(pTipo_Campo           )));
    lSQL.SQL.Add(' AND '   + Trim_Sentence('SELECCIONADO'  ) + ' = ' + QuotedStr(Trim('S'                   )));
    lSQL.SQL.Add(' AND '   + Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(gUsuario_Actual       )));
    lSQL.SQL.Add(' AND '   + Trim_Sentence('NOMBRE_AUX'    ) + ' = ' + QuotedStr(Trim(FANALISIS.NOMBRE_AUX  )));
    lSQL.Active := True ;
    If lSQL.Active Then
      Result := lSQL.FieldByName('RESULTADO').AsInteger;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'TFrSeleccion_Campos.Contar_Campos', '');
  End;
End;

Function TFrSeleccion_Campos.Cargar_Campos : Boolean;
Var
  lI : Integer;
  lO : TQuery;
  lD : TQuery;
Begin
  Result := False;
  Try
    lO := TQuery.Create(Nil);
    lD := TQuery.Create(Nil);
    lD.Active := False;
    lO.Active := False;
    Configurar_Conexion_Segura(lD);
    Configurar_Conexion_Segura(lO);
    lO.SQL.Clear;
    FANALISIS.Cargar_Analisis(lO);
    lD.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Seleccion_Campos).Name + ' ' );
    lD.SQL.Add(' WHERE ' + Trim_Sentence('CODIGO_USUARIO') +  ' = ' + QuotedStr(Trim(gUsuario_Actual     )));
    lD.SQL.Add(' AND '   + Trim_Sentence('NOMBRE_AUX'    ) +  ' = ' + QuotedStr(Trim(FANALISIS.NOMBRE_AUX)));
    lD.SQL.Add(' AND TIPO_PROCESO = ' + QuotedStr(FANALISIS.TIPO_PROCESO));
    lO.Active := True;
    lD.Active := True;
    If lO.Active And lD.Active And (lD.RecordCount <= 0) Then
    Begin
      For lI := 0 To lO.FieldCount-1 Do
      Begin
        lD.Append;
        lD.FieldByName('CODIGO_USUARIO').AsString := gUsuario_Actual;
        lD.FieldByName('TIPO_PROCESO'  ).AsString := FANALISIS.TIPO_PROCESO;
        lD.FieldByName('TIPO_CAMPO'    ).AsString := IfThen(lO.Fields[lI].DataType In [ftInteger, ftFloat, ftSmallint], 'V', 'P');
        lD.FieldByName('NOMBRE_CAMPO'  ).AsString := lO.Fields[lI].FullName;
        lD.FieldByName('NOMBRE'        ).AsString := lO.Fields[lI].FullName;
        lD.FieldByName('NOMBRE_TABLA'  ).AsString := AnsiUpperCase(Trim(FANALISIS.NOMBRE_TABLA));
        lD.FieldByName('NOMBRE_AUX'    ).AsString := AnsiUpperCase(Trim(FANALISIS.NOMBRE_AUX  ));
        lD.FieldByName('SELECCIONADO'  ).AsString := 'N';
        lD.Post;
      End;
    End;
    lD.Active := True;
    lD.Free;
    lO.Active := True;
    lO.Free;
    Result := True;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'TFrSeleccion_Campos.Cargar_Campos', '');
  End;
End;

procedure TFrSeleccion_Campos.QrPivotesBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFrSeleccion_Campos.QrPivotesBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFrSeleccion_Campos.QrValoresBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFrSeleccion_Campos.QrValoresBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFrSeleccion_Campos.txtPivoteChange(Sender: TObject);
begin
  Abrir_Tabla(QrPivotes, 'P', txtPivote.Text);
end;

procedure TFrSeleccion_Campos.txtValoresChange(Sender: TObject);
begin
  Abrir_Tabla(QrValores, 'V', txtValores.Text);
end;

Function TFrSeleccion_Campos.Abrir_Tabla(pQuery : TQuery; pTipo, pValue : String) : Boolean;
Begin
  Result := False;
  Try
    pQuery.Active := False;
    Configurar_Conexion_Segura(pQuery);
    pQuery.SQL.Clear;
    pQuery.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Seleccion_Campos).Name + ' ');
    pQuery.SQL.Add(' WHERE ' + Trim_Sentence('TIPO_CAMPO'  ) + ' = ' + QuotedStr(Trim(pTipo                 )));
    pQuery.SQL.Add(' AND '   + Trim_Sentence('TIPO_PROCESO') + ' = ' + QuotedStr(Trim(FANALISIS.TIPO_PROCESO)));
    pQuery.SQL.Add(' AND '   + Trim_Sentence('NOMBRE_AUX'  ) + ' = ' + QuotedStr(Trim(FANALISIS.NOMBRE_AUX  )));
    If Trim(pValue) <> '' Then
    Begin
      pQuery.SQL.Add(' AND (NOMBRE LIKE ' + QuotedStr('%' + Trim(pValue) + '%') + ' OR NOMBRE_CAMPO LIKE ' + QuotedStr('%' + Trim(pValue) + '%') + ')');
    End;
    pQuery.Active := True;
    Result := pQuery.Active;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'TFrSeleccion_Campos.Abrir_Tabla', '');
  End;
End;

Function TFrSeleccion_Campos.Cerrar_Tabla(pQuery : TQuery) : Boolean;
Begin
  Result := False;
  Try
    If pQuery.Active Then
      pQuery.Active := False;
    Result := Not pQuery.Active;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'TFrSeleccion_Campos.Cerrar_Tabla', '');
  End;
End;

procedure TFrSeleccion_Campos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If (ModalResult = mrOk) And FVALIDATE Then
  Begin
    CanClose := Contar_Campos('P') > 0;
    If Not CanClose Then
      ShowMessage('Debe seleccionar al menos un pivote')
    Else
    Begin
      CanClose := Contar_Campos('V') > 0;
      If Not CanClose Then
        ShowMessage('Debe seleccionar al menos un valor');
    End;
  End;
end;

procedure TFrSeleccion_Campos.FormCreate(Sender: TObject);
begin
  FANALISIS := TAnalisis.Create;
  Paginas.ActivePageIndex := 0;
  Self.Caption := 'Selección de Campos';
end;

procedure TFrSeleccion_Campos.FormDestroy(Sender: TObject);
begin
  If Assigned(FANALISIS) Then
    FANALISIS.Free;
end;

procedure TFrSeleccion_Campos.BtnPivotesClick(Sender: TObject);
begin
  Abrir_Tabla(QrPivotes, 'P', txtPivote.Text);
end;

procedure TFrSeleccion_Campos.BtnValoresClick(Sender: TObject);
begin
  Abrir_Tabla(QrValores, 'V', txtValores.Text);
end;

Procedure TFrSeleccion_Campos.Cambiar_Estado_Seleccion(pQuery : TQuery);
Begin
  Try
    If (Not pQuery.Active) Or (pQuery.RecordCount <= 0) Then
      Exit;
    pQuery.Edit;
    pQuery.FieldByName('SELECCIONADO').AsString := IfThen(pQuery.FieldByName('SELECCIONADO').AsString = 'N', 'S', 'N');
    pQuery.Post;
  Except
     On E: Exception Do
       Ingresar_Inconsistencias(E, 'TFrSeleccion_Campos.Cambiar_Estado_Seleccion', '');
  End;
End;

procedure TFrSeleccion_Campos.GridPivotesDblClick(Sender: TObject);
begin
  If GridPivotes.SelectedIndex = 2 Then
    Cambiar_Estado_Seleccion(QrPivotes);
end;

procedure TFrSeleccion_Campos.GridPivotesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if QrPivotes.FieldByName('SELECCIONADO').AsString = 'S' then
  begin
    GridPivotes.Canvas.Font.Color  := clWhite;
    GridPivotes.Canvas.Brush.Color := clGreen;
    GridPivotes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFrSeleccion_Campos.GridPivotesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F10 Then
  Begin
    Key := 0;
    Cambiar_Estado_Seleccion(QrPivotes);
  End;
end;

procedure TFrSeleccion_Campos.GridValoresDblClick(Sender: TObject);
begin
  If GridValores.SelectedIndex = 2 Then
    Cambiar_Estado_Seleccion(QrValores);
end;

procedure TFrSeleccion_Campos.GridValoresDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if QrValores.FieldByName('SELECCIONADO').AsString = 'S' then
  begin
    GridValores.Canvas.Font.Color  := clWhite;
    GridValores.Canvas.Brush.Color := clGreen;
    GridValores.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFrSeleccion_Campos.GridValoresKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_F10 Then
  Begin
    Key := 0;
    Cambiar_Estado_Seleccion(QrValores);
  End;
end;

Function Show_Form_Seleccion_Campos(pTipo_Proceso, pCaption, pNombre_Tabla, pNombre_Aux : String; pCampos, pCondiciones : TLista_Analisis; pValidate : Boolean) : Boolean;
Begin
  FrSeleccion_Campos := TFrSeleccion_Campos.Create(Nil);
  FrSeleccion_Campos.Caption := 'Selección de Campos ' + pCaption;
  FrSeleccion_Campos.FVALIDATE := pValidate;
  FrSeleccion_Campos.FANALISIS.TIPO_PROCESO := pTipo_Proceso;
  FrSeleccion_Campos.FANALISIS.CAMPOS       := pCampos      ;
  FrSeleccion_Campos.FANALISIS.NOMBRE_TABLA := pNombre_Tabla;
  FrSeleccion_Campos.FANALISIS.NOMBRE_AUX   := pNombre_Aux  ;
  FrSeleccion_Campos.FANALISIS.CONDICIONES  := pCondiciones ;
  Result := FrSeleccion_Campos.Cargar_Campos;
  If Result Then
  Begin
    Result := FrSeleccion_Campos.Abrir_Tabla(FrSeleccion_Campos.QrPivotes, 'P', '') And
              FrSeleccion_Campos.Abrir_Tabla(FrSeleccion_Campos.QrValores, 'V', '');
    If Result Then
      Result := FrSeleccion_Campos.ShowModal = mrOk;
    FrSeleccion_Campos.Cerrar_Tabla(FrSeleccion_Campos.QrValores);
    FrSeleccion_Campos.Cerrar_Tabla(FrSeleccion_Campos.QrPivotes);
  End;
  FrSeleccion_Campos.Free;
End;


end.
