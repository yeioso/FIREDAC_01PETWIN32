unit Form_Frame;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.Menus;

type
  TFrFrame = class(TFrame)
    pnlHead: TPanel;
    StatusBarInfo: TStatusBar;
    BTNSALIR: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
