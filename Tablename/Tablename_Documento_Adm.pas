unit Tablename_Documento_Adm;

interface

Function Create_Tabla_Documento_Adm : Boolean;
Function Retornar_Numero_Documento_Adm(pCODIGO_DOCUMENTO_ADM : String) : String; Overload;
Function Actualizar_Numero_Documento_Adm(pCODIGO_DOCUMENTO_ADM, pValue : String) : Boolean;
Function Documento_Disponible(pTipo_Documento, pNumero_Documento : String) : Boolean;
Function Retornar_Nombre_Formato(pTipo_Documento : String) : String;
Function Tablename_Documento_Adm_Codigo_Numero_Documento(pId : String; Var pCodigo, pNumero_Documento, pId_Salida : String) : Boolean;
Function Tablename_Documento_Adm_Info(Const pCodigo : String; Var pFormato, pId_Salida : String; Var pCopias : Integer) : Boolean;
Function Tablename_Documento_Adm_Limit(Const pCodigo, pNumero_Documento : String) : Boolean;
Function Tablename_Documento_Adm_Formato(pTipo : String; Var pFormato, pId_Salida : String; Var pCopias : Integer; Const pMensaje : Boolean = True) : Boolean;

implementation

Uses
  SysUtils,
  Printers,
  UtConexion,
  UtImpresion,
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtManejoError,
  Form_Busqueda,
  UtVariablesGlobales;

Function Create_Tabla_Documento_Adm : Boolean;
Begin
  Result := True;
  If Not gVariableGlobal.CNX.TableExists(Retornar_Info_Tabla(Id_Documento_Adm).Name) then
  Begin
    Try
      gVariableGlobal.CNX.TMP.SQL.Clear;
      gVariableGlobal.CNX.TMP.SQL.Add('   CREATE TABLE ' + Retornar_Info_Tabla(Id_Documento_Adm).Name + ' '          );
      gVariableGlobal.CNX.TMP.SQL.Add('   (  '                                                                       );
      gVariableGlobal.CNX.TMP.SQL.Add('      CODIGO_DOCUMENTO_ADM ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (004)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TIPO_DOCUMENTO       ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (003)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      ID_SALIDA            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (003)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NOMBRE               ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DOCUMENTO_INICIAL    ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DOCUMENTO_ACTUAL     ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      DOCUMENTO_FINAL      ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (020)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      FORMATO              ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      IMPRESORA            ' + gVariableGlobal.CNX.Return_Type(TYPE_VARCHAR) + ' (100)  ' + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      NRO_COPIAS           ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '        + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      TAG_INFO             ' + gVariableGlobal.CNX.Return_Type(TYPE_INT    ) + ' '        + ', ');
      gVariableGlobal.CNX.TMP.SQL.Add('      PRIMARY KEY (CODIGO_DOCUMENTO_ADM) '                              + '  ');
      gVariableGlobal.CNX.TMP.SQL.Add('   )   '                                                                      );
      gVariableGlobal.CNX.TMP.ExecSQL;
    Except
      On E : Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'Create_Tabla_Documento_Adm', 'Tabla', Retornar_Info_Tabla(Id_Documento_Adm).Name]);
      End;
    End;
  End;
End;

Function Retornar_Numero_Documento_Adm(pCODIGO_DOCUMENTO_ADM : String) : String;
Var
  lSQL : TQuery;
Begin
  Result := Const_Documento_SIN_DOCTO;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    lSQL.SQL.Add(' SELECT  * FROM ' + Retornar_Info_Tabla(Id_Documento_Adm).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_DOCUMENTO_ADM') + ' =' + #39 + Trim(pCODIGO_DOCUMENTO_ADM) + #39 + ' ');
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      Result := lSQL.FieldByName('DOCUMENTO_ACTUAL').AsString;
      Next_Value(Result);
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'Tablename_Documento_Adm, Retornar_Numero_Documento_Adm']);
  End;
End;

Function Retornar_Info_Documento_Adm(pTipo_Documento : String; Var pCodigo_Documento_Adm, pNumero_Documento, pFormato, pSalida : String) : Boolean;
Var
  lSQL : TQuery;
Begin
  pSalida := '';
  pFormato := '';
  pNumero_Documento := '';
  pCodigo_Documento_Adm := Const_Documento_SIN_DOCTO;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    lSQL.SQL.Add(' SELECT  * FROM ' + Retornar_Info_Tabla(Id_Documento_Adm).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('TIPO_DOCUMENTO') + ' =' + #39 + Trim(pTipo_Documento) + #39 + ' ');
    lSQL.Active := True;
    Result := lSQL.Active And (lSQL.RecordCount > 0);
    If Result Then
    Begin
      pSalida:= lSQL.FieldByName('ID_SALIDA').AsString;
      pFormato:= lSQL.FieldByName('FORMATO').AsString;
      pNumero_Documento := lSQL.FieldByName('DOCUMENTO_ACTUAL').AsString;
      pCodigo_Documento_Adm := lSQL.FieldByName('CODIGO_DOCUMENTO_ADM').AsString;
      Next_Value(pNumero_Documento);
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(['Origen', 'Tablename_Documento_Adm, Retornar_Numero_Documento_Adm', 'Error', E.Message]);
  End;
End;


Function Actualizar_Numero_Documento_Adm(pCODIGO_DOCUMENTO_ADM, pValue : String) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    lSQL.SQL.Add(' SELECT  * FROM ' + Retornar_Info_Tabla(Id_Documento_Adm).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_DOCUMENTO_ADM') + ' =' + #39 + Trim(pCODIGO_DOCUMENTO_ADM) + #39 + ' ');
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.Edit;
      lSQL.FieldByName('DOCUMENTO_ACTUAL').AsString := pValue;
      lSQL.Post;
    End;
    lSQL.Active := False;
    lSQL.Free;
    Result := True;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(['Origen', 'Tablename_Documento_Adm, Retornar_Numero_Documento_Adm', 'Error', E.Message]);
  End;
End;

Function Documento_Disponible(pTipo_Documento, pNumero_Documento : String) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento)));
    lSQL.SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence('NUMERO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pNumero_Documento)));
    lSQL.Active := True;
    If lSQL.Active Then
      Result := lSQL.RecordCount <= 0;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(['Origen', 'Tablename_Documento_Adm, Documento_Disponible', 'Error', E.Message]);
  End;
End;

Function Retornar_Nombre_Formato(pTipo_Documento : String) : String;
Var
  lSQL : TQuery;
Begin
  Result := '';
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    lSQL.SQL.Add(' SELECT  * FROM ' + Retornar_Info_Tabla(Id_Documento_Adm).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('TIPO_DOCUMENTO') + ' =' + #39 + Trim(pTipo_Documento) + #39 + ' ');
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
      Result := lSQL.FieldByName('FORMATO').AsString;
    lSQL.Active := False;
    lSQL.Free;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(['Origen', 'Tablename_Documento_Adm, Retornar_Nombre_Formato', 'Error', E.Message]);
  End;
End;

Function Tablename_Documento_Adm_Codigo_Numero_Documento(pId : String; Var pCodigo, pNumero_Documento, pId_Salida : String) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  pNumero_Documento := Const_Documento_SIN_DOCTO;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    lSQL.SQL.Add(' SELECT  * FROM ' + Retornar_Info_Tabla(Id_Documento_Adm).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('TIPO_DOCUMENTO') + ' =' + #39 + Trim(pId) + #39 + ' ');
    If Not Vacio(pCodigo) Then
      lSQL.SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_DOCUMENTO_ADM') + ' =' + #39 + Trim(pCodigo) + #39 + ' ');
    lSQL.Active := True;
    Result := lSQL.Active And (lSQL.RecordCount > 0);
    If Result Then
    Begin
      If lSQL.RecordCount = 1 Then
      Begin
        pCodigo := lSQL.FieldByName('CODIGO_DOCUMENTO_ADM').AsString;
        pId_Salida := lSQL.FieldByName('ID_SALIDA').AsString;
        pNumero_Documento := lSQL.FieldByName('DOCUMENTO_ACTUAL').AsString;
      End
      Else
      Begin
        Result := Show_FrBusqueda(['NOMBRE', 'CODIGO_DOCUMENTO_ADM', 'DOCUMENTO_ACTUAL', 'ID_SALIDA'], ['CODIGO_DOCUMENTO_ADM', 'DOCUMENTO_ACTUAL', 'ID_SALIDA'], Retornar_Info_Tabla(Id_Documento_Adm).Name, 'TIPO_DOCUMENTO = ' + QuotedStr(Trim(pId)), Retornar_Info_Tabla(Id_Documento_Adm).Caption, pCodigo, pNumero_Documento, pId_Salida, False, gVariableGlobal.CNX);
      End;

      If Result Then
        If Not Vacio(pNumero_Documento) Then
          Next_Value(pNumero_Documento);
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(['Origen', 'Tablename_Documento_Adm, Tablename_Documento_Adm_Codigo_Numero_Documento', 'Error', E.Message]);
  End;
End;

Function Tablename_Documento_Adm_Info(Const pCodigo : String; Var pFormato, pId_Salida : String; Var pCopias : Integer) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    lSQL.SQL.Add(' SELECT  * FROM ' + Retornar_Info_Tabla(Id_Documento_Adm).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_DOCUMENTO_ADM') + ' =' + #39 + Trim(pCodigo) + #39 + ' ');
    lSQL.Active := True;
    Result := lSQL.Active And (lSQL.RecordCount > 0);
    If Result Then
    Begin
      pCopias := lSQL.FieldByName('NRO_COPIAS').AsInteger;
      pFormato := Trim(lSQL.FieldByName('FORMATO').AsString);
      pId_Salida := Trim(lSQL.FieldByName('ID_SALIDA').AsString);
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(['Origen', 'Tablename_Documento_Adm, Tablename_Documento_Adm_Info', 'Error', E.Message]);
  End;
End;

Function Tablename_Documento_Adm_Limit(Const pCodigo, pNumero_Documento : String) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    lSQL.SQL.Add(' SELECT  * FROM ' + Retornar_Info_Tabla(Id_Documento_Adm).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_DOCUMENTO_ADM') + ' =' + #39 + Trim(pCodigo) + #39 + ' ');
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
      Result := pNumero_Documento <= Trim(lSQL.FieldByName('DOCUMENTO_FINAL').AsString);
    lSQL.Active := False;
    lSQL.Free;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(['Origen', 'Tablename_Documento_Adm, Tablename_Documento_Adm_Limit', 'Error', E.Message]);
  End;
End;


Function Tablename_Documento_Adm_Formato(pTipo : String; Var pFormato, pId_Salida : String; Var pCopias : Integer; Const pMensaje : Boolean = True) : Boolean;
Var
  lNumero_Documento : String;
  lCodigo_Documento_Adm : String;
Begin
  Result := Tablename_Documento_Adm_Codigo_Numero_Documento(pTipo, lCodigo_Documento_Adm, lNumero_Documento, pId_Salida);
  If (Not Result) And pMensaje Then
    Mensajes('Debe definir el formato del documento en el administrador de documentos')
  Else
  Begin
    Result := Tablename_Documento_Adm_Info(lCodigo_Documento_Adm, pFormato, pId_Salida, pCopias);
    If Result Then
    Begin
      If Not FileExists(pFormato) Then
      Begin
        If pMensaje Then
          Mensajes('No existe el formato del documento en el administrador de documentos');
        Result := False;
      End;
    End;
  End;
End;

end.



