unit Form_Splah;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, cyCustomProgressionPanel,
  cyAdvProgressionPanel, ExtCtrls, ComCtrls;

type
  TFrSplah = class(TForm)
    cyAdvProgressionPanel1: TcyAdvProgressionPanel;
    pnlSplash: TPanel;
    Paginas: TPageControl;
    Pag00: TTabSheet;
    Pag01: TTabSheet;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrSplah: TFrSplah;
  Procedure Form_Splash_Start;
  Procedure Form_Splash_Update(pCaption : String);
  Procedure Form_Splash_End;

implementation
{$R *.dfm}

Procedure Form_Splash_Start;
Begin
  FrSplah := TFrSplah.Create(Nil);
  Screen.Cursor := crHourGlass;
  FrSplah.Show;
  FrSplah.cyAdvProgressionPanel1.Open(FrSplah.pnlSplash);
End;

Procedure Form_Splash_Update(pCaption : String);
Begin
  FrSplah.cyAdvProgressionPanel1.Caption := pCaption;
  FrSplah.Repaint;
End;

Procedure Form_Splash_End;
Begin
  FrSplah.cyAdvProgressionPanel1.Close;
  Screen.Cursor := crDefault;
  FrSplah.Free;
  FrSplah := Nil;
End;

procedure TFrSplah.FormCreate(Sender: TObject);
begin
  cyAdvProgressionPanel1.Height := Self.Height;
  cyAdvProgressionPanel1.Width  := Self.Width ;
end;

end.
