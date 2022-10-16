unit Form_Stock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, UtConexion, Grids, DBGrids, ExtCtrls, UtFormularios;

type
  TFrStock = class(TForm)
    Timer1: TTimer;
    DsStock: TDataSource;
    DBGrid1: TDBGrid;
    QrStock: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  Protected
    lFormulario : TObjForm;      
  private
    { Private declarations }
    gNumero_Registros : Longint;
    Procedure Cargar_Stock;
  public
    { Public declarations }
  end;

var
  FrStock: TFrStock;
  Function Show_Form_Stock : Boolean;

implementation
{$R *.dfm}

Uses
  UtConexion,
  
  UtConstantes,
  UtInfoTablas,
  UtVariablesGlobales;

Procedure TFrStock.Cargar_Stock;
Begin
  QrStock.Active := False;
  Configurar_Conexion_Segura(QrStock);
  QrStock.SQL.Clear;
  QrStock.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto).Name + ' ');
  QrStock.SQL.Add(' WHERE EXISTENCIA < STOCK_MINIMO ');
  QrStock.SQL.Add(' OR    EXISTENCIA > STOCK_MAXIMO ');
  QrStock.Active := True;
  gNumero_Registros := QrStock.RecordCount;
End;

Function Stock_Existente : Integer;
Var
  lSQL : TQuery;
Begin
  lSQL := TQuery.Create(Nil);
  lSQL.Active := False;
  Configurar_Conexion_Segura(lSQL);
  lSQL.SQL.Clear;
  lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto).Name + ' ');
  lSQL.SQL.Add(' WHERE EXISTENCIA < STOCK_MINIMO ');
  lSQL.SQL.Add(' OR    EXISTENCIA > STOCK_MAXIMO ');
  lSQL.Active := True;
  Result := lSQL.RecordCount;
  lSQL.Active := False;
  lSQL.SQL.Clear;
  lSQL.Free;
End;

procedure TFrStock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
end;

procedure TFrStock.FormCreate(Sender: TObject);
begin
  gNumero_Registros := 0;
  Caption := 'Límites de Stock';
  If Not Assigned(lFormulario) Then
    lFormulario := TObjForm.Create;
  lFormulario.Setting_Form(Self, -1, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;  
end;

procedure TFrStock.FormDestroy(Sender: TObject);
begin
  If QrStock.Active Then
    QrStock.Active := False;
  If Assigned(lFormulario) Then
    lFormulario.Free;    
end;

Function Show_Form_Stock : Boolean;
Var
  lNro_Registros : Longint;
Begin
  Result := True;
  If gCentinela_Stock Then
  Begin
    lNro_Registros := Stock_Existente;
    If  lNro_Registros > 0 Then
    Begin
      If (Not Assigned(FrStock)) Then
      Begin
        FrStock := TFrStock.Create(Nil);
        FrStock.Top := 10;
        FrStock.Left := 10;
        FrStock.Cargar_Stock;
        FrStock.Show;
      End;
      If lNro_Registros <> FrStock.gNumero_Registros Then
        FrStock.Cargar_Stock;
    End
    Else
    Begin
      If Assigned(FrStock) Then
      Begin
        If Assigned(FrStock) Then
        Begin
          FrStock.Free;
          FrStock := Nil;
        End;
      End;
    End;
  End
  Else
  Begin
    If Assigned(FrStock) Then
    Begin
      If Assigned(FrStock) Then
      Begin
        FrStock.Free;
        FrStock := Nil;
      End;
    End;
  End;
End;

end.
