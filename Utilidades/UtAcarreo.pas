unit UtAcarreo;

interface
Function Acarrear_Documento(pTipo_Documento : String) : Boolean;

implementation

Uses
  SysUtils,
  UtConexion,
  UtFunciones,
  UtInfoTablas,
  Form_Busqueda,
  UtVariablesGlobales;

Function Acarrear_Documento_Base(pTableOld, pTableNew, pTipoOld, pTipoNew, pDatakeyOld, pDatakeyNew : String) : Boolean;
Var
  lI : Integer;
  lO : TQuery;
  lD : TQuery;
Begin
  Result := True;
  Try
    lO := TQuery.Create(Nil);
    lD := TQuery.Create(Nil);
    lO.Connection := gVariableGlobal.CNX;
    lD.Connection := gVariableGlobal.CNX;
    lO.SQL.Add(' SELECT * FROM ' + pTableOld + ' ');
    lO.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakeyOld)));
    lO.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipoOld)));
    lD.SQL.Add(' SELECT * FROM ' + pTableNew + ' ');
    lD.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakeyNew)));
    lD.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipoNew)));
    lO.Active := True;
    lD.Active := True;
    If lO.Active And lD.Active Then
    Begin
      lO.First;
      While Not lO.Eof Do
      Begin
        lD.Append;
        For lI := 0 To lD.Fields.Count-1 Do
          lD.FieldByName(lD.Fields[lI].FullName).AsVariant := lO.FieldByName(lD.Fields[lI].FullName).AsVariant;
        lD.FieldByName('DATAKEY'       ).AsString := pDatakeyNew;
        If Pos('_ENC', AnsiUpperCase(pTableNew)) > 0 Then
        Begin
          lD.FieldByName('TIPO_CAPTURA'        ).AsString := 'ACA';
          lD.FieldByName('ORIGEN_REFERENCIA'   ).AsString := pTipoOld;
          lD.FieldByName('DATAKEY_REFERENCIA'  ).AsString := lO.FieldByName('DATAKEY').AsString;
          lD.FieldByName('DOCUMENTO_REFERENCIA').AsString := lO.FieldByName('NUMERO_DOCUMENTO').AsString;
        End;
        lD.FieldByName('TIPO_DOCUMENTO').AsString := pTipoNew;
        lD.FieldByName('CODIGO_USUARIO').AsString := gVariableGlobal.Usuario_Actual;
        lD.FieldByName('FECHA'         ).AsString := gVariableGlobal.FECHA_ACTUAL.yyyy_mm_dd;
        lD.FieldByName('HORA'          ).AsString := FormatFloat('HH:NN:SS'  , Now);
        lD.Post;
        lO.Next;
      End;
    End;
    lD.Active := False;
    lD.Free;
    lO.Active := False;
    lO.Free;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'UtAcarreo, Acarrear_Documento_Base']);
  End;
End;

Function Acarrear_Documento(pTipo_Documento : String) : Boolean;
Var
  lResult2 : String;
  lResult3 : String;
  lDatakeyOld : String;
  lDatakeyNew : String;
  lTipo_Documento : String;
Begin
  Result := False;
  lDatakeyOld := '';
  lDatakeyNew := '';
  lTipo_Documento := '';
  If pTipo_Documento = 'CMP' Then
    lTipo_Documento := 'PDD'
  Else
    If pTipo_Documento = 'FCT' Then
      lTipo_Documento := 'CTZ';
  If Show_FrBusqueda(['NUMERO_DOCUMENTO', 'CODIGO_TERCERO', 'FECHA_DOCUMENTO', 'VALOR_TOTAL', 'DATAKEY'], ['DATAKEY'], Retornar_Info_Tabla(Id_Documento_Enc).Name, 'TIPO_DOCUMENTO = ' + QuotedStr(lTipo_Documento), 'Acarreo', lDatakeyOld, lResult2, lResult3, False, gVariableGlobal.CNX) Then
  Begin
    gVariableGlobal.CNX.BeginTrans;
    If (Not Vacio(lTipo_Documento)) And (Not Vacio(lDatakeyOld)) Then
    Begin
      lDatakeyNew := FormatDateTime('YYYYMMDDHHNNSSZZZZZZ', Now);
      Result := Acarrear_Documento_Base(Retornar_Info_Tabla(Id_Documento_Enc).Name, Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, lTipo_Documento, pTipo_Documento, lDatakeyOld, lDatakeyNew);
      If Result Then
        Result := Acarrear_Documento_Base(Retornar_Info_Tabla(Id_Documento_Det).Name, Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, lTipo_Documento, pTipo_Documento, lDatakeyOld, lDatakeyNew);
    End;
    If Result Then
      gVariableGlobal.CNX.CommitTrans
    Else
      gVariableGlobal.CNX.RollbackTrans;
  End;
End;



end.
