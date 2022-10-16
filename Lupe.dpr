program Lupe;

uses
  UtLog,
  Forms,
  Windows,
  SysUtils,
  UtFunciones,
  Form_Inicio,
  Form_Entrada,
  UtCerrarCaja,
  UtIniciarSesion,
  UtVariablesGlobales,
  Form_MenuPpal in 'Formularios\Form_MenuPpal.pas' {FrMenuPpal};

{$R *.res}
Var
  RvHandle : hWnd;
begin
  UtLog_Execute('VERSION', ['Versión', gVariableGlobal.VERSION]);
  RvHandle := FindWindow(Nil, pChar(gVariableGlobal.APLICACION));
  If RvHandle > 0 Then
  begin
    ShowWindow( RvHandle, SW_SHOWNORMAL);
    SetActiveWindow(RvHandle);
    Exit;
  End;
  Application.Initialize;
  Application.Title := gVariableGlobal.APLICACION;
  Application.HelpFile := '';
  Application.CreateForm(TFrMenuPpal, FrMenuPpal);
  If Iniciar_Sesion And Ingreso_Correcto Then
  Begin
    FrMenuPpal.Cargar_Configuraciones;
    Show_Form_Inicio;
    UtCerrarCaja_Pendiente;
    Application.MainFormOnTaskbar := True;
    FrMenuPpal.Timer1.Enabled := True;
    Application.Run;
  End;
  Application.Terminate;

end.
