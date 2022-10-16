unit Tablename_Tercero;

interface

Function Create_Tabla_Tercero : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtInfoTablas,
  UtConstantes,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Tercero : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Tercero).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Tercero).Name + ' '              );
      gVariableGlobal.CNX.TMP.SQL.Add('   (   '                                                                    );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_TERCERO      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE              ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DIGITO_VERIFICACION ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      EQUIVALENCIA        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_CLIENTE          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_PROVEEDOR        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_EMPLEADO         ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_VENDEDOR_PPAL    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_BANCO            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_DOCUMENTO        ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (003) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_RUT              ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_ACTIVO           ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (001) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMER_NOMBRE       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      SEGUNDO_NOMBRE      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMER_APELLIDO     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      SEGUNDO_APELLIDO    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (050) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PLAZO               ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PORCENTAJE_COMISION ' + gVariableGlobal.CNX.Return_Type(TYPE_FLOAT  ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO            ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      GRAFICO             ' + gVariableGlobal.CNX.Return_Type(TYPE_IMAGE  ) + ' '       + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_TERCERO)  '                                 + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) '                                                                      );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Tercero', 'Tabla',  Retornar_Info_Tabla(Id_Tercero).Name]);
      End;
    End;
  End;
End;

end.

