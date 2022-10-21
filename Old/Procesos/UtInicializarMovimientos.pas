unit UtInicializarMovimientos;

interface
Procedure UtInicializarMovimientos_Execute;


implementation

Uses
  Math,
  SysUtils,
  UtConexion,
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtCentral_Ventas,
  UtVariablesGlobales;

Procedure UtInicializarMovimientos_Execute;
Var
  lOK : Boolean;
Begin
  If Not SiNo('Está seguro(a) de inicializar los movimientos?') Then
    Exit;
  lOK := False;
  Try
    gVariableGlobal.CNX.BeginTrans;
    gVariableGlobal.CNX.SQL_Boolean(' DELETE FROM ' + Retornar_Info_Tabla(Id_Hoja_Inventario  ).Name, 'UtInicializarMovimientos_Execute');
    gVariableGlobal.CNX.SQL_Boolean(' DELETE FROM ' + Retornar_Info_Tabla(Id_Documento_Obs_Aux).Name, 'UtInicializarMovimientos_Execute');
    gVariableGlobal.CNX.SQL_Boolean(' DELETE FROM ' + Retornar_Info_Tabla(Id_Documento_Rec_Aux).Name, 'UtInicializarMovimientos_Execute');
    gVariableGlobal.CNX.SQL_Boolean(' DELETE FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, 'UtInicializarMovimientos_Execute');
    gVariableGlobal.CNX.SQL_Boolean(' DELETE FROM ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, 'UtInicializarMovimientos_Execute');
    gVariableGlobal.CNX.SQL_Boolean(' DELETE FROM ' + Retornar_Info_Tabla(Id_Documento_Obs    ).Name, 'UtInicializarMovimientos_Execute');
    gVariableGlobal.CNX.SQL_Boolean(' DELETE FROM ' + Retornar_Info_Tabla(Id_Documento_Rec    ).Name, 'UtInicializarMovimientos_Execute');
    gVariableGlobal.CNX.SQL_Boolean(' DELETE FROM ' + Retornar_Info_Tabla(Id_Documento_Det    ).Name, 'UtInicializarMovimientos_Execute');
    gVariableGlobal.CNX.SQL_Boolean(' DELETE FROM ' + Retornar_Info_Tabla(Id_Documento_Enc    ).Name, 'UtInicializarMovimientos_Execute');
    gVariableGlobal.CNX.SQL_Boolean(' DELETE FROM ' + Retornar_Info_Tabla(Id_Caja             ).Name, 'UtInicializarMovimientos_Execute');
    gVariableGlobal.CNX.SQL_Boolean(' UPDATE ' + Retornar_Info_Tabla(Id_Documento_Adm).Name + ' SET DOCUMENTO_ACTUAL = DOCUMENTO_INICIAL', 'UtInicializarMovimientos_Execute');
    lOK := True;
    If lOK Then
    Begin
      gVariableGlobal.CNX.CommitTrans;
      Mensajes('Inicialización exitosa');
    End
    Else
    Begin
      gVariableGlobal.CNX.RollbackTrans;
      Mensajes('Inicialización no exitosa');
    End;
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'UtInicializarMovimientos_Execute']);
    End;
  End;
End;



end.
