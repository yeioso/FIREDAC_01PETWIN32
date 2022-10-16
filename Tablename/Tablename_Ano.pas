unit Tablename_Configuracion;

interface
Uses
  UtConexion;

Function Create_Tabla_Configuracion : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  
  UtException,    
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Configuracion : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Configuracion).Name, 'Create_Tabla_Configuracion') then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Configuracion).Name + ' '         );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                      );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_CONFIGURACION ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (002) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE               ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      OBSERVACION          ' + gVariableGlobal.CNX.Return_Type(TYPE_TEXT   ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO             ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_CONFIGURACION) '                             + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) ');
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        Ingresar_Inconsistencias(E, MessageError(IE_ERROR_CREATE) + ' Tabla ' + Retornar_Info_Tabla(Id_Configuracion).Name, 'Create_Tabla_Configuracion');
      End;
    End;
  End;
End;

end.
