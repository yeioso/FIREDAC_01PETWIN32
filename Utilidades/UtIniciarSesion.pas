unit UtIniciarSesion;

interface

Function Iniciar_Sesion(Const pData : String = ''; Const pApp : String = '') : Boolean;

implementation

Uses
  Classes,
  SysUtils,
  UtConexion,
  UtFunciones,
  Form_Splash,
  UtConstantes,
  UtInfoTablas,
  Form_Database,
  UtUpdateFields,
  Form_Wizard_Init,
  Form_Create_Tables,
  UtVariablesGlobales,
  UtManagment_Database;

Function Hay_Tablas : Boolean;
Var
  lI : Integer;
  lLista : TStringList;
Begin
  lI := 0;
  Result := True;
  Try
    Show_Splash;
    lLista := TStringList.Create;
    Retornar_Name_Tablas(lLista);
    While (lI < lLista.Count) And Result Do
    Begin
      Actualiza__Splash('Verificando si existe ' + lLista[lI] + ' tablas existentes...');
      Result := gVariableGlobal.CNX.TableExists(lLista[lI]);
      If Result Then
        Inc(lI);
    End;
    lLista.Free;
  Except

  End;
  Free_Splash;
End;

Function Hay_Datos_Iniciales : Boolean;
Begin
  Result := gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Usuario).Name) And
            gVariableGlobal.CNX.There_Is_Data(Retornar_Info_Tabla(Id_Usuario).Name);
End;

Function Iniciar_Sesion(Const pData : String = ''; Const pApp : String = '') : Boolean;
Var
  lItem : TManagment_Database;
Begin
  lItem := TManagment_Database.Create;
  Result := Form_Database_Show(lItem);
  If Result Then
  Begin
    UtManagment_Database_Existe(lItem, lItem.Name_Instance, '', '', '', '', '', '', 0);
    gVariableGlobal.CNX.SetServer(lItem.ServerName);
    gVariableGlobal.CNX.SetDatabase(lItem.DatabaseName);
    gVariableGlobal.CNX.SetUser(lItem.UserName);
    gVariableGlobal.CNX.SetPassword(lItem.Password);
    gVariableGlobal.CNX.SetPort(lItem.Port);
    gVariableGlobal.CNX.SetConnection(lItem.Connection);
    FreeAndNil(lItem);
    If gVariableGlobal.CNX.Connect(True) Then
    Begin
      If Result Then
        If Not Hay_Tablas Then
          Result := Create_Tables;

      If Result Then
        If Not Hay_Datos_Iniciales Then
          Result := Show_Form_Wizard_Init;

      If Result Then
        Verificacion_Estructura_Tablas;
    End
    Else
    Begin
      Mensajes('No es posible conectase a la base de datos');
    End;
  End;

End;

end.
