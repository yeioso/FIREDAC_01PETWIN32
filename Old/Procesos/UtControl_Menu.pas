unit UtControl_Menu;

interface
Procedure Validar_Opciones_Caja;

implementation
Uses
  Forms,
  Menus,
  UtVariablesGlobales;

Procedure Validar_MenuItem_Caja(pMenuItem : TMenuItem);
Var
  lI : Integer;
Begin
  If (pMenuItem.Tag = 301) Then
  Begin
    pMenuItem.Enabled := Not gVariableGlobal.Caja_Abierta;
    pMenuItem.Visible := Not gVariableGlobal.Caja_Abierta;
  End;
  If (pMenuItem.Tag >= 302) And (pMenuItem.Tag <= 316) Then
  Begin
    pMenuItem.Enabled := gVariableGlobal.Caja_Abierta;
    pMenuItem.Visible := gVariableGlobal.Caja_Abierta;
  End;
  For lI := 0 To pMenuItem.Count-1 Do
    Validar_MenuItem_Caja(pMenuItem[lI]);
End;

Procedure Validar_Opciones_Caja;
Var
  lI : Integer;
Begin
  If Assigned(Application.MainForm) And Assigned(Application.MainForm.Menu) Then
    For lI := 0 To Application.MainForm.Menu.Items.Count-1 Do
      Validar_MenuItem_Caja(Application.MainForm.Menu.Items[lI]);
End;

end.
