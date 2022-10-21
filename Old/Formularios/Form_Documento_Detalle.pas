unit Form_Documento_Detalle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, DB, Grids, DBGrids,
  UtConexion, StdCtrls, Buttons, ExtCtrls;

type
  TFrDocumento_Detalle = class(TForm)
    TbDetalle: TQuery;
    DsDetalle: TDataSource;
    Detalle: TDBGrid;
    Panel1: TPanel;
    BtnAceptar: TBitBtn;
    BtnSalir: TBitBtn;
    procedure BtnSalirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Function Abrir_Detalle(pTipo_Documento, pDatakey : String) : Boolean;
  public
    { Public declarations }
  end;

var
  FrDocumento_Detalle: TFrDocumento_Detalle;
  Function Show_Form_Documento_Detalle(pTipo_Documento, pDatakey : String; Var pConsecutivo : String) : Boolean;

implementation
{$R *.dfm}

Uses
  UtConexion,
  UtInfoTablas;

Function TFrDocumento_Detalle.Abrir_Detalle(pTipo_Documento, pDatakey : String) : Boolean;
Begin
  Try
    TbDetalle.Active := False;
    TbDetalle.Connection := gConexion;
    TbDetalle.SQL.Clear;
    TbDetalle.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det).Name + ' ');
    TbDetalle.SQL.Add(' WHERE TIPO_DOCUMENTO = ' + QuotedStr(Trim(pTipo_Documento)));
    TbDetalle.SQL.Add(' AND DATAKEY = ' + QuotedStr(Trim(pDatakey)));
    TbDetalle.Active := True;
    Result := TbDetalle.Active;
    If Result Then
    Begin
      //Format campo numericos
    End;
  Except

  End;
End;

Function Show_Form_Documento_Detalle(pTipo_Documento, pDatakey : String; Var pConsecutivo : String) : Boolean;
Begin
  Result := False;
  FrDocumento_Detalle := TFrDocumento_Detalle.Create(Nil);
  If FrDocumento_Detalle.Abrir_Detalle(pTipo_Documento, pDatakey) Then
    Result := FrDocumento_Detalle.ShowModal = mrOk;
  If Result Then
    pConsecutivo := FrDocumento_Detalle.TbDetalle.FieldByName('CONSECUTIVO').AsString;
  FrDocumento_Detalle.Free;
End;

procedure TFrDocumento_Detalle.BtnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFrDocumento_Detalle.FormDestroy(Sender: TObject);
begin
  If TbDetalle.Active Then
    TbDetalle.Active := False;
end;

end.
