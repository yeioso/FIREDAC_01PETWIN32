unit Form_Progreso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Gauges, ComCtrls;

type
  TFrProgreso = class(TForm)
    Panel1: TPanel;
    lbMensaje: TLabel;
    Progreso: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrProgreso: TFrProgreso;
Procedure Iniciar_Progreso(pMax : Longint);
Procedure Actualizar_Progreso(pPosicion : Longint; pMensaje : String);
Procedure Finalizar_Progreso;  

implementation
{$R *.dfm}


Procedure Iniciar_Progreso(pMax : Longint);
Begin
  FrProgreso := TFrProgreso.Create(Application);
  FrProgreso.Progreso.Min := 0;
  FrProgreso.Progreso.Max := pMax;
  FrProgreso.lbMensaje.Caption := '';
End;

Procedure Actualizar_Progreso(pPosicion : Longint; pMensaje : String);
Begin
  if Assigned(FrProgreso) then
  Begin
    FrProgreso.lbMensaje.Caption := pMensaje;
    FrProgreso.lbMensaje.Repaint;
    If pPosicion < FrProgreso.Progreso.Max Then
      FrProgreso.Progreso.Position := pPosicion;
    FrProgreso.Show;
  End;
End;

Procedure Finalizar_Progreso;
Begin
  if Assigned(FrProgreso) then
    FrProgreso.Free;
  FrProgreso := Nil;
End;




end.
