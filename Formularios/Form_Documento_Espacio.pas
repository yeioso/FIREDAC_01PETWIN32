unit Form_Documento_Espacio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolWin, ComCtrls, Menus, DBCtrls, Buttons, DB,
  StdCtrls, Grids, DBGrids, ovcbase, ovcef, ovcpb, ovcpf, Spin, ovcdbpf, ovcrlbl,
  ovcplb, ovcdbplb, UtEspacioBoton, UtConexion, UtFormularios;

Type
  TFrDocumento_Espacio = class(TObjForm)
    PopupSalon: TPopupMenu;
    Panel1: TPanel;
    Panel4: TPanel;
    pnlUbicacion: TPanel;
    pfZona: TDBImage;
    PnlUbicaciones: TPanel;
    PageControl2: TPageControl;
    Pag_01: TTabSheet;
    GRID_ZONA: TDBGrid;
    Pag_02: TTabSheet;
    BtnAdministrarEspacio: TSpeedButton;
    AgregarEspacio1: TMenuItem;
    BtnEditar: TSpeedButton;
    lbInfo: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pfZonaMouseDown(Sender: TObject; Button: TMouseButton;  Shift: TShiftState; X, Y: Integer);
    procedure DsZonaDataChange(Sender: TObject; Field: TField);
    procedure pfZonaClick(Sender: TObject);
    procedure AgregarEspacio1Click(Sender: TObject);
    procedure BtnAdministrarEspacioClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
//    procedure SERVIDORExecute(AContext: TIdContext);
  protected
    FExit : Boolean;
    FONLINE : Boolean;
    gUpdate_Info : Boolean;
    gCurrent_Top : Integer;
    gCurrent_Left : Integer;
  private
    { Private declarations }
    gTop : Integer;
    gLeft : Integer;
    Procedure OnException(Sender: TObject; E: Exception);
    Procedure SetInfo;
    Procedure Activar_Espacio(pEspacio : TEspacioButton);
    Procedure Mover_Espacio(pEspacio : TEspacioButton);
    Procedure Cargar_Imagen(pEspacio : TEspacioButton);
    Function Proxima_Mesa : String;
    Function Crear_Espacio(pCodigo_Espacio, pEstado : String; pTop, pLeft : Integer) : TEspacioButton;
    Procedure Eliminar_Espacios(pZona : TDBImage);
    Procedure Cargar_Espacio(pCodigo_Zona : String);
    procedure OnNewButtonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    Procedure Recargar_Espacio_Zona;
  public
    { Public declarations }
  end;

var
  FrDocumento_Espacio: TFrDocumento_Espacio;
  Function Show_Form_Documento_Espacio : Boolean;

implementation
{$R *.dfm}

Uses
  StrUtils,
  Form_Opcion,
  UtFunciones,
  Form_Splash,
  UtConstantes,
  UtInfoTablas,
  Form_Espacio,
  UtManejoError,
  Form_Busqueda,
  UtManagerImages,
  Form_Comentarios,
  UtVariablesGlobales,
  Form_Documento_Captura,
  Form_Administrar_Espacio;

Type
  THackDBGrid = Class(TDBGrid);

Procedure TFrDocumento_Espacio.OnException(Sender: TObject; E: Exception);
Begin
  If (E <> Nil) And (Not Vacio(E.Message)) Then
    gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Espacio']);
End;

Procedure TFrDocumento_Espacio.SetInfo;
Begin
  Try
    If tbMaestro.Active Then
      lbInfo.Caption := 'Zona: ' + Trim(tbMaestro.FieldByName('NOMBRE').AsString);
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Espacio.SetInfo']);
    End;
  End;
End;

Procedure TFrDocumento_Espacio.Cargar_Imagen(pEspacio : TEspacioButton);
Begin
  Try
    Case pEspacio.Estado Of
      Const_Abrev_Ocupado    : Begin
                                 UtManagerImages_Set(TBlobField(tbMaestro.FieldByName('ESPACIO_OCUPADA')), pEspacio.Glyph);
                               End;
      Const_Abrev_Disponible : Begin
                                 UtManagerImages_Set(TBlobField(tbMaestro.FieldByName('ESPACIO_DISPONIBLE')), pEspacio.Glyph);
                               End;
      Const_Abrev_Reservado  : Begin
                                 UtManagerImages_Set(TBlobField(tbMaestro.FieldByName('ESPACIO_RESERVADA')), pEspacio.Glyph);
                               End;
    End;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Espacio.Cargar_Imagen', 'Espacio', pEspacio.CODIGO_ESPACIO]);
  End;
End;

Procedure TFrDocumento_Espacio.Activar_Espacio(pEspacio : TEspacioButton);
Var
  lOk : Boolean;
  lOpcion : Integer;
  lAceptar : Boolean;
begin
  lOk := True;
  If (pEspacio.ESTADO = Const_Abrev_Disponible) Or (pEspacio.ESTADO = Const_Abrev_Reservado) Or Vacio(pEspacio.ESTADO) Then
  Begin
    lOk := (gVariableGlobal.ID_CAPTURA_RAPIDA = 'S');
    lAceptar := lOk;
    If Not lOK Then
    Begin
      lOk := Show_FrOpcion(['Ocupar', 'Reservar'], lOpcion);
      lAceptar := lOk;
    End;

    If lOk Then
    Begin
      If (gVariableGlobal.ID_CAPTURA_RAPIDA = 'S') Then
        lOpcion := 1;
      Case lOpcion Of
        1 : pEspacio.Set_Estado(Const_Abrev_Ocupado  );
        2 : pEspacio.Set_Estado(Const_Abrev_Reservado);
      End;
      pEspacio.Actualizar_Informacion_Espacio;
    End;
  End;
  If lOk Then
  Begin
    Show_Form_Documento_Captura(Const_Documento_Factura, pEspacio.CODIGO_ESPACIO);
    pEspacio.Actualizar_Ambiente_Espacio;
    Cargar_Imagen(pEspacio);
  End;
end;

Procedure TFrDocumento_Espacio.Mover_Espacio(pEspacio : TEspacioButton);
Const
  SC_DragMove = $F012;  { a magic number }
Begin
  gUpdate_Info := True;
  gCurrent_Top := pEspacio.Top;
  gCurrent_Left := pEspacio.Left;
  ReleaseCapture;
  pEspacio.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  If (gCurrent_Top  <> pEspacio.Top ) Or
    (gCurrent_Left <> pEspacio.Left) Then
  gCurrent_Top := 0;
  gCurrent_Left := 0;
  gUpdate_Info := False;
  pEspacio.Actualizar_Informacion_Espacio;
End;

procedure TFrDocumento_Espacio.OnNewButtonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Var
  lEspacio : TEspacioButton;
begin
  lEspacio := Nil;
  If (Sender Is TEspacioButton) Then
    lEspacio := (Sender As TEspacioButton);

  If lEspacio = Nil Then
    Exit;

  Case Button Of
    mbRight : Begin

              End;
    mbLeft  : Begin
               If ssCtrl In Shift  Then
                 Mover_Espacio(lEspacio)
               Else
                 Activar_Espacio(lEspacio);
             End;
  End;
end;

procedure TFrDocumento_Espacio.pfZonaClick(Sender: TObject);
Var
  lI : Integer;
begin
  Try
    For lI := 0 To pfZona.ComponentCount-1 Do
      If pfZona.Components[lI] Is TEspacioButton Then
        (pfZona.Components[lI] As TEspacioButton).Repaint;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrPOS.pfZonaClick']);
  End;
end;

procedure TFrDocumento_Espacio.pfZonaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Shift = [ssRight] then
  Begin
    gTop := Y;
    gLeft := X;
  End;
end;

Function TFrDocumento_Espacio.Proxima_Mesa : String;
Begin
  Result := gVariableGlobal.CNX.Next(Retornar_Info_Tabla(Id_Espacio).Name, '0', ['CODIGO_ESPACIO'], [], [], 4);
End;

Function TFrDocumento_Espacio.Crear_Espacio(pCodigo_Espacio, pEstado : String; pTop, pLeft : Integer) : TEspacioButton;
Var
  lCodigo_Espacio : String;
  lEspacio : TEspacioButton;
begin
  lCodigo_Espacio := pCodigo_Espacio;
  If Vacio(lCodigo_Espacio) Then
    lCodigo_Espacio := Proxima_Mesa;

  lEspacio := TEspacioButton.Create(pfZona);
  lEspacio.Parent := pfZona;
  lEspacio.Top    := pTop ;
  lEspacio.Left   := pLeft;
  lEspacio.Set_Estado(pEstado + ' ');
  pfZona.InsertComponent(lEspacio);
  lEspacio.PopupMenu := Nil;
  lEspacio.OnMouseDown := OnNewButtonMouseDown;
  lEspacio.Set_Codigo_Zona(tbMaestro.FieldByName('CODIGO_ZONA').AsString);
  lEspacio.Set_Codigo_Espacio(lCodigo_Espacio);
  lEspacio.Actualizar_Informacion_Espacio;
  lEspacio.Actualizar_Ambiente_Espacio;
  Cargar_Imagen(lEspacio);
  Result := lEspacio;
End;

Procedure TFrDocumento_Espacio.Recargar_Espacio_Zona;
Begin
  FExit := True;
  If tbMaestro.Active Then
  Begin
    Eliminar_Espacios(pfZona);
    Cargar_Espacio(tbMaestro.FieldByName('CODIGO_ZONA').AsString);
  End;
End;

procedure TFrDocumento_Espacio.DsZonaDataChange(Sender: TObject; Field: TField);
begin
  SetInfo;
  Recargar_Espacio_Zona;
end;

Procedure TFrDocumento_Espacio.Eliminar_Espacios(pZona : TDBImage);
Begin
  While pZona.ComponentCount > 0 Do
  Begin
    If (pZona.Components[pZona.ComponentCount-1] Is TEspacioButton) Then
    Begin
      (pZona.Components[pZona.ComponentCount-1] As TEspacioButton).Free;
    End;
  End;
End;

Procedure TFrDocumento_Espacio.Cargar_Espacio(pCodigo_Zona : String);
Begin
  Try
    CNX.AUX.Active := False;
    CNX.AUX.SQL.Clear;
    CNX.AUX.SQL.Clear;
    CNX.AUX.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Espacio).Name + ' ');
    CNX.AUX.SQL.Add(' WHERE CODIGO_ZONA = ' + #39 + pCodigo_Zona + #39 + ' ');
    CNX.AUX.Active := True;
    If CNX.AUX.Active Then
    Begin
      CNX.AUX.First;
      while Not CNX.AUX.Eof Do
      Begin
        Crear_Espacio(CNX.AUX.FieldByName('CODIGO_ESPACIO').AsString, CNX.AUX.FieldByName('ESTADO').AsString, CNX.AUX.FieldByName('POSICION_Y').AsInteger, CNX.AUX.FieldByName('POSICION_X').AsInteger);
        CNX.AUX.Next;
      End;
    End;
    CNX.AUX.Active := False;
    CNX.AUX.SQL.Clear;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrPOS.Cargar_Mesas']);
  End;
End;


procedure TFrDocumento_Espacio.AgregarEspacio1Click(Sender: TObject);
Var
  lEspacio : TEspacioButton;
begin
  lEspacio := Crear_Espacio('', Const_Abrev_Disponible, gTop,  gLeft);
end;

procedure TFrDocumento_Espacio.BtnAdministrarEspacioClick(Sender: TObject);
begin
  Show_Form_Administrar_Espacio;
  Recargar_Espacio_Zona;
end;

procedure TFrDocumento_Espacio.BtnEditarClick(Sender: TObject);
begin
  Show_Form_Espacio;
  Recargar_Espacio_Zona;
end;

procedure TFrDocumento_Espacio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FExit := True;
end;

procedure TFrDocumento_Espacio.FormCreate(Sender: TObject);
Var
  lPassword : String;
begin
  gVariableGlobal.SetSetting(Self);
  Self.Tag := gVariableGlobal.Valor_Tag;
  Caption := 'Punto de Venta';
  gTop := 0;
  gLeft := 0;
  FONLINE := False;
  gUpdate_Info := True;
  gCurrent_Top := 0;
  gCurrent_Left := 0;
  tbMaestro.SQL.Add(' SELECT * FROM '  + Retornar_Info_Tabla(Id_Zona).Name + ' ');
  If Application.Title = gVariableGlobal.APLICACION_POS Then
  Begin
    tbMaestro.SQL.Add(' WHERE ID_OCULTAR_POS = '  + QuotedStr('N')  + ' ');
    tbMaestro.SQL.Add(' OR ID_OCULTAR_POS IS NULL ');
    Application.OnException := Self.OnException;
  End;
  tbMaestro.SQL.Add(' ORDER BY NOMBRE ');
  pfZona.PopupMenu := PopupSalon;
  Try
//    tbMaestro.ReadOnly := True;
    tbMaestro.Active := True;
    If tbMaestro.Active Then
      THackDBGrid(GRID_ZONA).DefaultRowHeight := 50;
//    Cargar_Puertos;
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Espacio.FormCreate']);
    End;
  End;
end;

Procedure TFrDocumento_Espacio.FormDestroy(Sender: TObject);
begin
  Try
    If tbMaestro.Active Then
      tbMaestro.Active := False;
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Espacio.FormDestroy']);
    End;
  End;
end;

procedure TFrDocumento_Espacio.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key = VK_ESCAPE Then
  Begin
    Close;
    Key := 0;
  End;
end;

Function Show_Form_Documento_Espacio : Boolean;
Begin
  Try
    Result := True;
    FrDocumento_Espacio := TFrDocumento_Espacio.Create(Application);
    If Application.Title = gVariableGlobal.APLICACION_POS Then
    Begin
      FrDocumento_Espacio.FormStyle  := fsNormal;
      FrDocumento_Espacio.WindowState := wsMaximized;
      FrDocumento_Espacio.Visible := False;
      FrDocumento_Espacio.ShowModal;
      FreeAndNil(FrDocumento_Espacio);
    End
    Else
    Begin
      FrDocumento_Espacio.FormStyle  := fsMDIChild;
      FrDocumento_Espacio.WindowState := wsMaximized;
      FrDocumento_Espacio.Show;
    End;
  Except
    On E : Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'Show_Form_Documento_Espacio']);
      Result := False;
    End;
  End;
End;

end.

