unit Form_Documento_Historico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ovcbase, ovcef, ovcpb, ovcpf,
  Buttons, StdCtrls, ExtCtrls, UtFormularios;

type
  TFrDocumento_Historico = class(TObjForm)
    TIPO_DOCUMENTO: TRadioGroup;
    GBBusqueda: TGroupBox;
    Label1: TLabel;
    BtnDatakey: TSpeedButton;
    DATAKEY: TOvcPictureField;
    Panel2: TPanel;
    BtnGenerar: TSpeedButton;
    BtnSalir: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnGenerarClick(Sender: TObject);
    procedure BtnDatakeyClick(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
  private
    { Private declarations }
    Function Retornar_Tipo_Documento : String;
  public
    { Public declarations }
  end;

var
  FrDocumento_Historico: TFrDocumento_Historico;
Function Show_Form_Documento_Historico : Boolean;

implementation
{$R *.dfm}
Uses
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  Form_Busqueda,
  UtVariablesGlobales,
  UtCalculo_Discriminados,
  Tablename_Documento_Adm,
  Form_Print_Documento_Adm;

Function TFrDocumento_Historico.Retornar_Tipo_Documento : String;
Begin
  Result := '';
  Case TIPO_DOCUMENTO.ItemIndex Of
    0 : Result := Const_Documento_Pedido      ;
    1 : Result := Const_Documento_Compra      ;
    2 : Result := Const_Documento_Cotizacion  ;
    3 : Result := Const_Documento_Factura     ;
    4 : Result := Const_Documento_Nota_Credito;
    5 : Result := Const_Documento_Nota_Debito ;
  End;
End;


procedure TFrDocumento_Historico.BtnDatakeyClick(Sender: TObject);
Var
  lDatakey : String;
  lResult2 : String;
  lResult3 : String;
begin
  If Show_FrBusqueda(['CODIGO_VENDEDOR', 'DOCUMENTO_COMANDA', 'FECHA_DOCUMENTO', 'FECHA', 'HORA', 'VALOR_TOTAL', 'CODIGO_TERCERO', 'NUMERO_DOCUMENTO', 'DATAKEY'],
                     ['DATAKEY'],
                     Retornar_Info_Tabla(Id_Documento_Enc).Name,
                     'TIPO_DOCUMENTO = ' + QuotedStr(Retornar_Tipo_Documento),
                     Retornar_Info_Tabla(Id_Documento_Enc).Caption,
                     lDatakey,
                     lResult2,
                     lResult3,
                     False, CNX) Then
    DATAKEY.AsString := lDatakey;
end;

procedure TFrDocumento_Historico.BtnGenerarClick(Sender: TObject);
Var
  lCodigo : String;
  lFormato : String;
  lResult2 : String;
  lResult3 : String;
  lId_Salida : String;
  lNumero_Documento : String;
begin
  If Not Tablename_Documento_Adm_Codigo_Numero_Documento(Retornar_Tipo_Documento,  lCodigo, lNumero_Documento, lId_Salida) Then
    Exit;
//  lCodigo := Retornar_String(Retornar_Info_Tabla(Id_Documento_Enc).Name, ['DATAKEY', 'TIPO_DOCUMENTO'], [DATAKEY.EditString, Retornar_Tipo_Documento], ['CODIGO_DOCUMENTO_ADM'], 'TFrDocumento_Historico.BtnGenerarClick');
  If Not Vacio(lCodigo) Then
  Begin
    lFormato := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Documento_Adm).Name, ['CODIGO_DOCUMENTO_ADM'], [lCodigo], ['FORMATO'], 'TFrDocumento_Historico.BtnGenerarClick');
    lId_Salida := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Documento_Adm).Name, ['CODIGO_DOCUMENTO_ADM'], [lCodigo], ['ID_SALIDA'], 'TFrDocumento_Historico.BtnGenerarClick');
    UtCalculo_Discriminados_Execute(Id_Documento_Enc, Id_Documento_Det, DATAKEY.EditString);
  End;
  If (Not Vacio(lCodigo)) Or Show_FrBusqueda(['CODIGO_DOCUMENTO_ADM', 'NOMBRE', 'TIPO_DOCUMENTO', 'FORMATO'], ['FORMATO', 'ID_SALIDA'], Retornar_Info_Tabla(Id_Documento_Adm).Name, 'TIPO_DOCUMENTO = ' + QuotedStr(Retornar_Tipo_Documento), 'Histórico', lFormato, lId_Salida, lResult3, False, CNX) Then
    Execute_Print_Documento_Adm(Id_Documento_Enc, Id_Documento_Det, Id_Documento_Rec, Retornar_Tipo_Documento, Retornar_Tipo_Documento, DATAKEY.EditString, lFormato, lId_Salida, '', -1, 1);
end;

procedure TFrDocumento_Historico.BtnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFrDocumento_Historico.FormCreate(Sender: TObject);
begin
  Self.Caption := 'Visualización de Documentos';
end;

Function Show_Form_Documento_Historico : Boolean;
Begin
  Result := False;
  FrDocumento_Historico := TFrDocumento_Historico.Create(Nil);
  FrDocumento_Historico.ShowModal;
  FrDocumento_Historico.Free;
End;


end.

