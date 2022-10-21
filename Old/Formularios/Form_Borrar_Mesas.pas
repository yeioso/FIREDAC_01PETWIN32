unit Form_Borrar_Mesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, DB, UtConexion, Buttons, UtFormularios;

type
  TFrBorrar_Mesas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DsZona: TDataSource;
    DsMesas: TDataSource;
    TbZona: TADOTable;
    tbMesas: TQuery;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBGrid2: TDBGrid;
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DsZonaDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  protected
  private
    { Private declarations }
    Function Abrir_Tabla_Mesas(pZona : String) : Boolean;
    Function Archivos_Abiertos : Boolean;
  public
    { Public declarations }
  end;

var
  FrBorrar_Mesas: TFrBorrar_Mesas;
Function Show_Borrar_Mesas : Boolean;  

implementation
{$R *.dfm}
Uses
  UtConexion,
  
  UtFunciones,
  UtConstantes,
  UtHomologacion;

Function TFrBorrar_Mesas.Abrir_Tabla_Mesas(pZona : String) : Boolean;
Begin
  tbMesas.Active := False;
  Configurar_Conexion_Segura(tbMesas);
  tbMesas.SQL.Clear;
  tbMesas.SQL.Add(' SELECT * FROM ' +  Tabla___Mesa + ' ');
  tbMesas.SQL.Add(' WHERE ' + Trim_Sentence('CODIGO_ZONA') + ' = ' + #39 + pZona + #39);

  tbMesas.Active := True;
  Result := tbMesas.Active;
End;

Function TFrBorrar_Mesas.Archivos_Abiertos : Boolean;
Begin
  Result := (Not Tabla_Vacia(Tabla___Zona, 'TFrBorrar_Mesas.Archivos_Abiertos')) And (Not Tabla_Vacia(Tabla___Mesa, 'TFrBorrar_Mesas.Archivos_Abiertos'));
  If Result Then
  Begin
    Configurar_Conexion_Segura(TbZona);
    TbZona.TableName := Tabla___Zona;
    TbZona.Active := True;
    Result := TbZona.Active;
    If Result Then
      Result := Abrir_Tabla_Mesas(TbZona.FieldByName('CODIGO_ZONA').AsString);
  End
  Else
    Mensajes('No existe registros para la tablas de zona y/o mesas.');
End;

procedure TFrBorrar_Mesas.DsZonaDataChange(Sender: TObject; Field: TField);
begin
  Abrir_Tabla_Mesas(TbZona.FieldByName('CODIGO_ZONA').AsString);
end;

procedure TFrBorrar_Mesas.FormCreate(Sender: TObject);
begin
  Caption := 'Eliminación de Mesas';
  If Not Assigned(lFormulario) Then
    lFormulario := TObjForm.Create;
  lFormulario.Setting_Form(Self, Nil, Nil, Nil, Nil, Nil, Nil, Nil);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;    
end;

procedure TFrBorrar_Mesas.FormDestroy(Sender: TObject);
begin
  If tbMesas.Active Then
    tbMesas.Active := False;
  If TbZona.Active Then
    TbZona.Active := False;
  If Assigned(lFormulario) Then
    lFormulario.Free;    
end;

procedure TFrBorrar_Mesas.SpeedButton1Click(Sender: TObject);
begin
  If tbMesas.RecordCount > 0 Then
  Begin
    If SiNo('Está seguro de eliminar este registro ?' + #13 + 'Mesa: ' + tbMesas.FieldByName('CODIGO_MESA').AsString) Then
    Begin
      tbMesas.Delete;
      Mensajes('Registro eliminado');
    End;
  End
  Else
    Mensajes('No hay registros para ser eliminados');
end;

procedure TFrBorrar_Mesas.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

Function Show_Borrar_Mesas : Boolean;
Begin
  Result := False;
  FrBorrar_Mesas := TFrBorrar_Mesas.Create(Nil);
  Result := FrBorrar_Mesas.Archivos_Abiertos;
  If Result Then
    FrBorrar_Mesas.ShowModal;
  FrBorrar_Mesas.Free;
End;

end.
