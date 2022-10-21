unit Form_Tercero_Resumen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, UtConexion;

type
  TFrTercero_Resumen = class(TForm)
    Paginas: TPageControl;
    Pag00: TTabSheet;
    GRID_GENERAL: TDBGrid;
    DsGeneral: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  Private
    { Private declarations }
    FSQL : TQUERY;
    Function Abrir_Tabla(pCodigo_Tercero : String) : Boolean;
  Public
    { Public declarations }
  End;

  Procedure Form_Tercero_Resumen_Show(Const pCodigo_Tercero : String);

implementation
{$R *.dfm}
Uses
  
  UtInfoTablas,
  UtVariablesGlobales;

Function TFrTercero_Resumen.Abrir_Tabla(pCodigo_Tercero : String) : Boolean;
Begin
  Result := False;
  Try
    FSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' ');
    FSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_TERCERO') + ' = ' + QuotedStr(Trim(pCodigo_Tercero)));
    FSQL.SQL.Add(' ORDER BY FECHA DESC, HORA DESC ');
    FSQL.Active := True;
    Result := FSQL.Active;
    If Result Then
    Begin
      TFloatField(FSQL.FieldByName('VALOR_TOTAL'    )).DisplayFormat := '###,###,###,##0.#0';
      TFloatField(FSQL.FieldByName('SALDO_PENDIENTE')).DisplayFormat := '###,###,###,##0.#0';
    End;
  Except
    On E: Exception Do
    Begin
      Result := False;
      gVariableGlobal.Add_Log(['Origen', 'TFrTercero_Resumen.Abrir_Tabla', 'Error', E.Message]);
    End;
  End;
End;

procedure TFrTercero_Resumen.FormCreate(Sender: TObject);
begin
  Self.Caption := 'Estado';
  FSQL := TQUERY.Create(Nil);
  DsGeneral.DataSet := FSQL;
end;

procedure TFrTercero_Resumen.FormDestroy(Sender: TObject);
begin
  If Assigned(FSQL) Then
  Begin
    FSQL.Active := False;
    FreeAndNil(FSQL);
  End;
end;

Procedure Form_Tercero_Resumen_Show(Const pCodigo_Tercero : String);
Var
  FrTercero : TFrTercero_Resumen;
Begin
  FrTercero := TFrTercero_Resumen.Create(Nil);
  If FrTercero.Abrir_Tabla(pCodigo_Tercero) Then
    FrTercero.ShowModal;
  FreeAndNil(FrTercero);
End;

end.
