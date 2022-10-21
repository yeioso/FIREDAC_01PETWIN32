unit Tablename_Precargada;

interface
Uses
  UtConexion;

Function Create_Tabla_Precargada : Boolean;
Procedure Cargar_Precargadas(pQuery : TQuery);
Function Tablename_Precargada_Producto(Var pCodigo_Producto : String) : Boolean;

implementation

Uses
  Forms,
  SysUtils,
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  UtVariablesGlobales;

Function Create_Tabla_Precargada : Boolean;
Begin
  Result := True;
  if Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Precargada).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Precargada).Name + ' '       );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                 );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PERIODO  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE          ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_TERCERO  ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_SINONIMO ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      LISTA_PRECIO    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_VENDEDOR ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_BASE     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_PRODUCTO ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020) ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_PERIODO) '                              + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Precargada).Fk[01], 'CODIGO_TERCERO' , Retornar_Info_Tabla(Id_Tercero ).Name, 'CODIGO_TERCERO' ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Precargada).Fk[02], 'CODIGO_VENDEDOR', Retornar_Info_Tabla(Id_Tercero ).Name, 'CODIGO_TERCERO' ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Precargada).Fk[03], 'CODIGO_BASE'    , Retornar_Info_Tabla(Id_Base    ).Name, 'CODIGO_BASE'    ) + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add(' ' + gVariableGlobal.CNX.FOREINGKEY(Retornar_Info_Tabla(Id_Precargada).Fk[04], 'CODIGO_PRODUCTO', Retornar_Info_Tabla(Id_Producto).Name, 'CODIGO_PRODUCTO') + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   ) ');
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Proceso', MessageError(IE_ERROR_CREATE), 'Tabla', Retornar_Info_Tabla(Id_Precargada).Name, 'Origen', 'Create_Tabla_Precargada']);
      End;
    End;
  End;
End;

Procedure Cargar_Precargadas(pQuery : TQuery);
Var
  lSQL : TQuery;
Begin
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Precargada).Name + ' ');
    lSQL.SQL.Add(' ORDER BY CODIGO_PERIODO ' );
    lSQL.Active := True ;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.Last;
      If Not Vacio(lSQL.FieldByName('CODIGO_TERCERO').AsString) Then
        pQuery.FieldByName('CODIGO_TERCERO').AsString := lSQL.FieldByName('CODIGO_TERCERO').AsString;
      If Not Vacio(lSQL.FieldByName('CODIGO_SINONIMO').AsString) Then
        pQuery.FieldByName('CODIGO_SINONIMO').AsString := lSQL.FieldByName('CODIGO_SINONIMO').AsString;
      If Not Vacio(lSQL.FieldByName('LISTA_PRECIO').AsString) Then
        pQuery.FieldByName('CODIGO_TERCERO_LP').AsString := lSQL.FieldByName('LISTA_PRECIO').AsString;
       If (Not Vacio(lSQL.FieldByName('CODIGO_VENDEDOR').AsString)) And (gVariableGlobal.ID_PEDIR_VENDEDOR <> 'S') Then
          pQuery.FieldByName('CODIGO_VENDEDOR').AsString := lSQL.FieldByName('CODIGO_VENDEDOR').AsString;
      If Not Vacio(lSQL.FieldByName('CODIGO_BASE').AsString) Then
        pQuery.FieldByName('CODIGO_BASE').AsString := lSQL.FieldByName('CODIGO_BASE').AsString;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
    On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'Tablename_Precargada, Cargar_Precargadas']);
  End;
End;

Function Tablename_Precargada_Producto(Var pCodigo_Producto : String) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  pCodigo_Producto := '';
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Precargada).Name + ' ');
    lSQL.SQL.Add(' ORDER BY CODIGO_PERIODO ' );
    lSQL.Active := True ;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.Last;
      If Not Vacio(lSQL.FieldByName('CODIGO_PRODUCTO').AsString) Then
      Begin
        pCodigo_Producto := lSQL.FieldByName('CODIGO_PRODUCTO').AsString;
        Result := True;
      End;
    End;
    lSQL.Active := False;
    lSQL.Free;

  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'Tablename_Precargada, Tablename_Precargada_Producto']);
  End;
End;

end.

