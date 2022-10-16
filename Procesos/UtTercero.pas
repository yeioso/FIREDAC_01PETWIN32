unit UtTercero;

interface
Function Definir_Datos_Tercero(pCodigo_Tercero, pTipo_Doc : String; Var pCodigo_Sinonimo, pCodigo_Tercero_LP, pCodigo_Documento_Adm : String) : Boolean;

implementation

Uses
  DB,
  Math,
  UtFecha,
  SysUtils,
  UtConexion,
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtVariablesGlobales;

Function Actualizar_Tercero_Sinonimo(pCodigo_Tercero : String; Var pCodigo_Sinonimo : String) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_TERCERO' ) + ' = ' + QuotedStr(Trim(pCodigo_Tercero )));
    lSQL.Active := True;
    If lSQL.Active Then
    Begin
     If (lSQL.RecordCount <= 0) Then
     Begin
       lSQL.Append;
       lSQL.FieldByName('CODIGO_TERCERO' ).AsString := Justificar(pCodigo_Tercero, ' ', lSQL.FieldByName('CODIGO_TERCERO' ).Size);
       lSQL.FieldByName('CODIGO_SINONIMO').AsString := Justificar(pCodigo_Tercero, ' ', lSQL.FieldByName('CODIGO_SINONIMO').Size);
       lSQL.Post;
     End
     Else
       lSQL.First;
     pCodigo_Sinonimo := lSQL.FieldByName('CODIGO_SINONIMO').AsString;
     Result := True;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtTercero, Actualizar_Tercero_Sinonimo']);
  End;
End;

Function Actualizar_Tercero_LP(pCodigo_Tercero : String; Var pCodigo_Tercero_LP : String) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Tercero_LP).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_TERCERO') + ' = ' + QuotedStr(Trim(pCodigo_Tercero)));
    lSQL.Active := True;
    If lSQL.Active Then
    Begin
     If (lSQL.RecordCount <= 0) Then
     Begin
       lSQL.Append;
       lSQL.FieldByName('CODIGO_TERCERO'   ).AsString := Justificar(pCodigo_Tercero, ' ', lSQL.FieldByName('CODIGO_TERCERO'   ).Size);
       lSQL.FieldByName('CODIGO_TERCERO_LP').AsString := Justificar('1'            , '0', lSQL.FieldByName('CODIGO_TERCERO_LP').Size);
       lSQL.Post;
     End
     Else
       lSQL.First;
     pCodigo_Tercero_LP := lSQL.FieldByName('CODIGO_TERCERO_LP').AsString;
     Result := True;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'UtTercero, Actualizar_Tercero_LP']);
  End;
End;


Function Definir_Datos_Tercero(pCodigo_Tercero, pTipo_Doc : String; Var pCodigo_Sinonimo, pCodigo_Tercero_LP, pCodigo_Documento_Adm : String) : Boolean;
Begin
  Result := Actualizar_Tercero_Sinonimo(pCodigo_Tercero, pCodigo_Sinonimo) And
            Actualizar_Tercero_LP(pCodigo_Tercero, pCodigo_Tercero_LP);
End;



end.
