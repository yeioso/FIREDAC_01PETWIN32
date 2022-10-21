unit Form_Inicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, ComCtrls, Buttons,
  StdCtrls, ovclabel;

type
  TFrInicio = class(TForm)
    Paginas: TPageControl;
    Panel1: TPanel;
    BtnAceptar: TSpeedButton;
    Pag00: TTabSheet;
    Pag01: TTabSheet;
    Pag02: TTabSheet;
    Pag03: TTabSheet;
    Pag05: TTabSheet;
    Pag06: TTabSheet;
    Pag07: TTabSheet;
    Pag08: TTabSheet;
    Pag09: TTabSheet;
    Pag10: TTabSheet;
    Pag11: TTabSheet;
    Pag12: TTabSheet;
    Pag13: TTabSheet;
    Pag14: TTabSheet;
    Pag15: TTabSheet;
    Timer1: TTimer;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Image4: TImage;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label24: TLabel;
    Image3: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Pag16: TTabSheet;
    Image10: TImage;
    procedure BtnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    Procedure Ocultar_Paginas;
    Procedure Cambiar_Tab;
  public
    { Public declarations }
  end;

var
  FrInicio: TFrInicio;
Function Show_Form_Inicio : Boolean;

implementation
{$R *.dfm}
Type
  TMensajes = Packed Record
    Mensaje     : String ;
    Visualizado : Boolean;
  End;

Var
  gMensajes : Packed Array [0..3]  Of TMensajes;

Procedure Cargar_Mensajes;
Begin
  gMensajes[0].Mensaje := 'Mientras tu compras un animal otro muere en la calle ¡ADOPTA! Un animal abandonado.';
  gMensajes[1].Mensaje := 'No compres uno de raza, adopta uno sin casa.';
  gMensajes[2].Mensaje := 'No compres, mejor adopta. Salva una vida.';
  gMensajes[3].Mensaje := 'Adopta un amigo.';
End;

Procedure TFrInicio.Ocultar_Paginas;
Var
  lI : Integer;
Begin
  For lI := 0 To Paginas.PageCount-1 Do
    Paginas.Pages[lI].TabVisible := False;
End;

Procedure TFrInicio.Cambiar_Tab;
Var
  lMensaje : String;
  lActivePageIndex : Integer;
Begin
  Randomize;
  lActivePageIndex := Paginas.ActivePageIndex;
  Ocultar_Paginas;
  If lActivePageIndex < Paginas.PageCount-1 Then
    lActivePageIndex := lActivePageIndex + 1
  Else
    lActivePageIndex := 0;
  Paginas.Pages[lActivePageIndex].TabVisible := True;
  Paginas.Pages[lActivePageIndex].Caption := IntToStr(lActivePageIndex);
  Paginas.ActivePage := Paginas.Pages[lActivePageIndex];
  lMensaje := gMensajes[Random(4)].Mensaje;
  Paginas.Pages[lActivePageIndex].Caption := lMensaje;
End;

procedure TFrInicio.BtnAceptarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrInicio.FormCreate(Sender: TObject);
Var
  lPagina : Integer;
  lMensaje : String;
begin
  Cargar_Mensajes;
  Self.caption := 'ADOPTA';
  Ocultar_Paginas;
  Randomize;
  lPagina := Random(Paginas.PageCount);
  Paginas.Pages[lPagina].TabVisible := True;
  lMensaje := gMensajes[Random(4)].Mensaje;
  Paginas.Pages[lPagina].Caption := lMensaje;
end;

procedure TFrInicio.Timer1Timer(Sender: TObject);
begin
  Cambiar_Tab;
end;

Function Show_Form_Inicio : Boolean;
Begin
  FrInicio := TFrInicio.Create(Nil);
  FrInicio.ShowModal;
  FrInicio.Free;
End;


end.
