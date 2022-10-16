unit Form_Consulta_Productos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids,Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,
  UtConexion;

type
  TFrConsulta_Productos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    BtnAceptar: TSpeedButton;
    Dato: TEdit;
    procedure BtnAceptarClick(Sender: TObject);
    procedure DatoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FDATA : TMANAGER_DATA;
    Procedure Consultar_Producto;
  public
    { Public declarations }
  end;

var
  FrConsulta_Productos: TFrConsulta_Productos;
  Procedure Form_Consulta_Productos_Show;

implementation
{$R *.dfm}
Uses
  UtFunciones,
  UtInfoTablas,
  UtConstantes,
  UtVariablesGlobales;

procedure TFrConsulta_Productos.BtnAceptarClick(Sender: TObject);
begin
  Close;
end;

Procedure TFrConsulta_Productos.Consultar_Producto;
Var
  lI : Integer;
Begin
  Try
    FDATA.QR.Active := False;
    FDATA.QR.SQL.Clear;
    FDATA.QR.SQL.Add(' SELECT ' + Retornar_Info_Tabla(Id_Producto).Name + '.CODIGO_PRODUCTO AS CODIGO, ');
    FDATA.QR.SQL.Add('        ' + Retornar_Info_Tabla(Id_Producto).Name + '.NOMBRE AS NOMBRE_PRODUCTO, ' );
    FDATA.QR.SQL.Add('  	     ' + Retornar_Info_Tabla(Id_Producto).Name + '.VALOR_VENTA AS VALOR, ');
    FDATA.QR.SQL.Add('  	     ' + Retornar_Info_Tabla(Id_Producto).Name + '.CANTIDAD AS CANTIDAD ');
    FDATA.QR.SQL.Add(' FROM ' + Retornar_Info_Tabla(Id_Producto).Name + ' ' );
    If Not Vacio(Dato.Text) Then
    Begin
      FDATA.QR.SQL.Add(' WHERE ' + Retornar_Info_Tabla(Id_Producto).Name + '.NOMBRE LIKE ' +  QuotedStr('%' + Trim(Dato.Text) + '%'));
      FDATA.QR.SQL.Add(' OR ' + Retornar_Info_Tabla(Id_Producto).Name + '.CODIGO_PRODUCTO LIKE ' +  QuotedStr('%' + Trim(Dato.Text) + '%'));
      FDATA.QR.SQL.Add(' OR ' + Retornar_Info_Tabla(Id_Producto).Name + '.CODIGO_BARRA LIKE ' +  QuotedStr('%' + Trim(Dato.Text) + '%'));
    End;
    FDATA.QR.SQL.Add(' ORDER BY ' + Retornar_Info_Tabla(Id_Producto).Name + '.NOMBRE ');
    FDATA.QR.Active := True;
    If FDATA.QR.Active Then
    Begin
      For lI := 0 To FDATA.QR.Fields.Count-1 Do
        If gVariableGlobal.CNX.FieldNumber(FDATA.QR.Fields[lI].DataType) Then
          FDATA.SetFormatNumber(FDATA.QR.Fields[lI].FullName);
    End;
  Except
    On E:Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrConsulta_Productos.Consultar_Producto']);
  End;
End;

procedure TFrConsulta_Productos.DatoChange(Sender: TObject);
begin
  Consultar_Producto;
end;

procedure TFrConsulta_Productos.FormCreate(Sender: TObject);
begin
  FDATA := TMANAGER_DATA.Create(Retornar_Info_Tabla(Id_Producto).Name, Retornar_Info_Tabla(Id_Producto).Caption);
  FDATA.QR.Connection := gVariableGlobal.CNX;
end;

Procedure Form_Consulta_Productos_Show;
Begin
  FrConsulta_Productos := TFrConsulta_Productos.Create(Nil);
  FrConsulta_Productos.Caption := Retornar_Info_Tabla(Id_Producto).Caption;
  FrConsulta_Productos.Consultar_Producto;
  FrConsulta_Productos.ShowModal;
  FrConsulta_Productos.DisposeOf;
End;


end.


