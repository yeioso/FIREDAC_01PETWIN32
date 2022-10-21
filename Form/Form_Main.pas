unit Form_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Form_Frame, Vcl.Menus;

type
  TFrMain = class(TForm)
    MainMenu1: TMainMenu;
    MAESTOS1: TMenuItem;
    ipo1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ipo1Click(Sender: TObject);
  private
    { Private declarations }
    Form_Frame : TFrFrame;
    procedure CloseApplication(Sender: TObject);
  public
    { Public declarations }

  end;

var
  FrMain: TFrMain;

implementation
{$R *.dfm}
Uses
  Form_Tipo;

procedure TFrMain.FormCreate(Sender: TObject);
begin
  Form_Frame := TFrFrame.Create(Self);
  Form_Frame.Parent := Self;
  Form_Frame.BTNSALIR.OnClick := CloseApplication;
end;

procedure TFrMain.CloseApplication(Sender: TObject);
Begin
  Application.Terminate;
End;

procedure TFrMain.FormDestroy(Sender: TObject);
begin
  If Assigned(Form_Frame) Then
    FreeAndNil(Form_Frame);
end;

procedure TFrMain.ipo1Click(Sender: TObject);
begin
  Form_Tipo_Show;
end;

end.
