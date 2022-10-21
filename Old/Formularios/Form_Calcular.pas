unit Form_Calcular;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, UtFormularios, ovcbase, ovcef, ovcpb, ovcpf,
  ovceditf, ovcedpop, ovcedcal, ovcrlbl, ovcplb;

type
  TFrCalcular = class(TObjForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    pfValor01: TOvcPictureField;
    OvcController1: TOvcController;
    pfValor02: TOvcPictureField;
    pfResultado: TOvcPictureField;
    Panel3: TPanel;
    pnlDocumento: TPanel;
    lbInfo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure pfValor01Change(Sender: TObject);
    procedure pfValor01KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Procedure Calcular_Valores;
  public
    { Public declarations }
  Protected
  end;

Var
  FrCalcular: TFrCalcular;
  Function Show_Calcular(pDocumento : String; pValue : Double; Var pValor_Pago, pVuelto : Double) : Boolean;

implementation
{$R *.dfm}

Uses
  UtVariablesGlobales;

Procedure TFrCalcular.Calcular_Valores;
Begin
  pfResultado.AsFloat := pfValor01.AsFloat - pfValor02.AsFloat;
End;

procedure TFrCalcular.FormCreate(Sender: TObject);
begin
  pfValor01.PictureMask   := gVariableGlobal.ID_MONEDA + '###,###,###.##';
  pfValor02.PictureMask   := gVariableGlobal.ID_MONEDA + '###,###,###.##';
  pfResultado.PictureMask := gVariableGlobal.ID_MONEDA + '###,###,###.##';
  Self.Setting_Form(Self, -1, Nil, Nil, Nil, Nil, Nil, Nil, Nil, Nil);
  Self.FormStyle := fsNormal;
  Self.WindowState := wsNormal;
  Self.BorderStyle := bsDialog;
end;

procedure TFrCalcular.pfValor01Change(Sender: TObject);
begin
  Calcular_Valores;
end;

procedure TFrCalcular.pfValor01KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_RETURN Then
    BtnAceptar.SetFocus;
end;

Function Show_Calcular(pDocumento : String; pValue : Double; Var pValor_Pago, pVuelto : Double) : Boolean;
Begin
  FrCalcular := TFrCalcular.Create(Nil);
  FrCalcular.lbInfo.Caption := 'Número de Documento' + #13 + pDocumento;
  FrCalcular.pfValor02.AsFloat := pValue;
  FrCalcular.Calcular_Valores;
  Result := FrCalcular.ShowModal = mrOk;
  If Result Then
  Begin
    pValor_Pago := FrCalcular.pfValor01.AsFloat  ;
    pVuelto     := FrCalcular.pfResultado.AsFloat;
  End;
  FrCalcular.Free;
End;

end.
