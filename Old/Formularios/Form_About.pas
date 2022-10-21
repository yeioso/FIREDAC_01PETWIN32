unit Form_About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, Vcl.ComCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    Comments: TLabel;
    PAGINAS: TPageControl;
    PAG01: TTabSheet;
    Image1: TImage;
    PAG02: TTabSheet;
    Image2: TImage;
    OKButton: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;
Procedure Show_Form_About(pApplication, pVersion : String);  

implementation

{$R *.dfm}

Procedure Show_Form_About(pApplication, pVersion : String);
Begin
  AboutBox := TAboutBox.Create(Nil);
  AboutBox.Caption := 'Acerca de...';
  AboutBox.PAG01.Caption := pApplication + ' - ' + pVersion;
  AboutBox.PAG02.Caption := 'Certificación Delphi Developer';
  AboutBox.ShowModal;
  AboutBox.Free;
End;

end.
 
