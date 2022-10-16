unit UtImportar_Datos;

interface
Function UtImportar_Datos_Execute(Const pCODIGO_EXP_IMP : String) : Boolean;

implementation

Uses
  Classes,
  Data.DB,
  SysUtils,
  StrUtils,
  Variants,
  UtConexion,
  UtFunciones,
  Form_Splash,
  UtInfoTablas,
  Form_ListBox,
  UtEspacioBoton,
  UtVariablesGlobales;

Function UtImportar_Datos_Archivo(pM, pD : TQUERY) : Boolean;
Var
  lI : Integer;
  lJ : Integer;
  lL : String;
  lC : Integer;
  lF : TStringList;
  lPos : Array Of Integer;
  lData : TQUERY;
  lWhere : String;
  lPosIni : Integer;
  lValues : TStringList;
Begin
  lC := 0;
  lI := 0;
  lJ := -1;
  lWhere := '';
  Try
    lValues := TStringList.Create;
    lF := TStringList.Create;
    lF.LoadFromFile(Trim(pM.FieldByName('ORIGEN').AsString));
    lData := TQUERY.Create(Nil);
    lData.Connection := gVariableGlobal.CNX;
    If lF.Count > 0 Then
    Begin
      Show_Splash(lF.Count);
      pD.First;
      While Not pD.Eof Do
      Begin
        Inc(lC);
        Inc(lJ);
        Try
          If Trim(pD.FieldByName('ID_PRIMARY_KEY').AsString) = 'S' Then
          Begin
            Inc(lI);
            SetLength(lPos, lI);
            lPos[lI - 1] := lJ;
            lWhere := lWhere + IfThen(Not Vacio(lWhere), ' AND ') + Trim(pD.FieldByName('CAMPO').AsString) + ' = :' + Trim(pD.FieldByName('CAMPO').AsString);
          End;
        Except
          On E: Exception Do
          Begin
            gVariableGlobal.Add_Log(E, ['Origen', 'UtImportar_Datos_Archivo']);
          End;
        End;
        pD.Next;
      End;
      lData.SQL.Clear;
      lData.SQL.Add(pM.FieldByName('DESTINO').AsString);
      If Pos('WHERE', lData.SQL.Text) <= 0 Then
        lData.SQL.Add(' WHERE ' + lWhere)
      Else
        lData.SQL.Add(' AND ' + lWhere);

      For lI := 0 To lF.Count-1 Do
      Begin
        Try
          If pM.FieldByName('ESTRUCTURA').AsString = 'D' Then
            Desglosar_Texto_Caracter(lF[lI], Trim(pM.FieldByName('DELIMITADOR').AsString),  lValues);

          Actualiza__Splash(FormatFloat('###,###,###', lI) + ' / ' + FormatFloat('###,###,###', lF.Count) + '...');
          lData.Active := False;
          For lJ := 0 To lData.Params.Count-1 Do
            If lPos[lJ] < lValues.Count Then
              lData.Params.ParamByName(lData.Params[lJ].Name).Value := lValues[lPos[lJ]]
            Else
              lData.Params.ParamByName(lData.Params[lJ].Name).Value := '-1';
          lData.Active := True;
          If lData.Active And (lData.RecordCount <= 0) Then
          Begin
            lJ := -1;
            lData.Append;
            pD.First;
            lL := '';
            lPosIni := 1;
            While Not pD.Eof Do
            Begin
              Inc(lJ);
              Try
                If Not Vacio(pD.FieldByName('CONSTANTE').AsString) Then
                  lL := pD.FieldByName('CONSTANTE').AsString
                Else
                  If lJ < lValues.Count Then
                    lL := lValues[lJ]
                  Else
                    If lValues.Count = 0 Then
                    Begin
                      lL := Copy(lF[lI], lPosIni, pD.FieldByName('LONGITUD').AsInteger);
                      Inc(lPosIni, pD.FieldByName('LONGITUD').AsInteger);
                    End;
                lL := Justificar(lL, (Trim(pD.FieldByName('CARACTER').AsString) + ' ')[1], pD.FieldByName('LONGITUD').AsInteger, ((pD.FieldByName('ALINEACION').AsString) + '')[1]);
                lData.FieldByName(Trim(pD.FieldByName('CAMPO').AsString)).AsString := lL;
              Except
                On E: Exception Do
                Begin
                  gVariableGlobal.Add_Log(E, ['Origen', 'UtImportar_Datos_Archivo']);
                End;
              End;
              pD.Next;
            End;
            lData.Post;
          End;
        Except
          On E: Exception Do
          Begin
            gVariableGlobal.Add_Log(E, ['Origen', 'UtImportar_Datos_Archivo']);
          End;
        End;
      End;
      Free_Splash;
    End;
    lData.Active := False;
    FreeAndNil(lData);
    lF.Clear;
    FreeAndNil(lF);
    lValues.Clear;
    FreeAndNil(lValues);
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'UtImportar_Datos_Archivo']);
    End;
  End;
End;


Function UtImportar_Datos_Dabatase(pM, pD : TQUERY) : Boolean;
Var
  lI : Integer;
  lJ : Integer;
  lO : TQUERY;
  lD : TQUERY;
  lWhere : String;
  lFields : String;
  lType : Array of TFieldType;
  lOrigen : Array of String;
  lDestino : Array of String;
  lValues : Array of String;
  lCaracter : Array of String;
  lLongitud : Array of Integer;
  lAlineacion : Array of String;
Begin
  lI := 0;
  Try
    lO := TQUERY.Create(Nil);
    lO.Connection := gVariableGlobal.CNX;
    lO.SQL.Add(pM.FieldByName('ORIGEN').AsString);

    lD := TQUERY.Create(Nil);
    lD.Connection := gVariableGlobal.CNX;
    lD.SQL.Add(pM.FieldByName('DESTINO').AsString);

    lO.Active := True;
    lD.Active := True;
    If lO.Active And (lO.RecordCount > 0) Then
    Begin
      lI := 0;
      lFields := '';
      pD.First;
      While Not pD.Eof Do
      Begin
        Try
          If Trim(pD.FieldByName('ID_PRIMARY_KEY').AsString) = 'S' Then
          Begin
            Inc(lI);
            SetLength(lType      , lI);
            SetLength(lValues    , lI);
            SetLength(lOrigen    , lI);
            SetLength(lDestino   , lI);
            SetLength(lCaracter  , lI);
            SetLength(lLongitud  , lI);
            SetLength(lAlineacion, lI);
            lType      [lI - 1] := lD.FieldByName(Trim(pD.FieldByName('CAMPO').AsString)).DataType;
            lOrigen    [lI - 1] := Trim(pD.FieldByName('EQUIVALENCIA').AsString);
            lDestino   [lI - 1] := Trim(pD.FieldByName('CAMPO'       ).AsString);
            lCaracter  [lI - 1] := Trim(pD.FieldByName('CARACTER'    ).AsString);
            lAlineacion[lI - 1] := Trim(pD.FieldByName('ALINEACION'  ).AsString);
            lLongitud  [lI - 1] := pD.FieldByName('LONGITUD').AsInteger;
            lFields := lFields + IfThen(Not Vacio(lFields), ';') + Trim(pD.FieldByName('CAMPO').AsString);
          End;
        Except
          On E: Exception Do
          Begin
            gVariableGlobal.Add_Log(E, ['Origen', 'UtImportar_Datos_Dabatase']);
          End;
        End;
        pD.Next;
      End;
      lI := 0;

      Show_Splash(lO.RecordCount);
      lO.First;
      While Not lO.Eof Do
      Begin
        Inc(lI);
        Actualiza__Splash(FormatFloat('###,###,###', lI) + ' / ' + FormatFloat('###,###,###', lO.RecordCount) + '...');
        lD.Active := False;
        lD.SQL.Clear;
        lD.SQL.Add(pM.FieldByName('DESTINO').AsString);
        lWhere := '';
        For lJ := Low(lOrigen) tO High(lOrigen) Do
        Begin
          lWhere := lWhere + IfThen(Not Vacio(lWhere), ' AND ') + lDestino[lJ] + ' = ';
          If lType[lJ] In [ftString, ftWideString] Then
            lWhere := lWhere + QuotedStr(Justificar(lO.FieldByName(Trim(lOrigen[lJ])).AsString, (Trim(lCaracter[lJ]) + ' ')[1], lLongitud[lJ], (lAlineacion[lJ] + '')[1]))
          Else
            lWhere := lWhere + Justificar(lO.FieldByName(Trim(lOrigen[lJ])).AsString, (Trim(lCaracter[lJ]) + ' ')[1], lLongitud[lJ], (lAlineacion[lJ] + '')[1]);
        End;
        If Pos('WHERE', lD.SQL.Text) <= 0 Then
          lD.SQL.Add(' WHERE ' + lWhere)
        Else
          lD.SQL.Add(' AND ' + lWhere);
        lD.Active := True;
        If lD.Active And (lD.RecordCount <= 0) Then
        Begin
          lD.Append;
          pD.First;
          While Not pD.Eof Do
          Begin
            Try
              If lO.FieldByName(Trim(pD.FieldByName('CAMPO').AsString)).DataType In [ftString, ftWideString] Then
                lD.FieldByName(Trim(pD.FieldByName('CAMPO').AsString)).AsString := Justificar(lO.FieldByName(Trim(pD.FieldByName('EQUIVALENCIA').AsString)).AsString, (Trim(pD.FieldByName('CARACTER').AsString) + ' ')[1], pD.FieldByName('LONGITUD').AsInteger, ((pD.FieldByName('ALINEACION').AsString) + '')[1])
              Else
                lD.FieldByName(Trim(pD.FieldByName('CAMPO').AsString)).Value := lO.FieldByName(Trim(pD.FieldByName('CAMPO').AsString)).Value;
            Except
              On E: Exception Do
              Begin
                gVariableGlobal.Add_Log(E, ['Origen', 'UtImportar_Datos_Dabatase']);
              End;
            End;
            pD.Next;
          End;
          lD.Post;
        End;
        lO.Next;
      End;
      Free_Splash;
    End;
    lD.Active := False;
    FreeAndNil(lD);
    lO.Active := False;
    FreeAndNil(lO);
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'UtImportar_Datos_Dabatase']);
    End;
  End;
End;

Function UtImportar_Datos_Execute(Const pCODIGO_EXP_IMP : String) : Boolean;
Var
  lM : TQUERY;
  lD : TQUERY;
Begin
  Try
    lM := TQUERY.Create(Nil);
    lM.Connection := gVariableGlobal.CNX;
    lD := TQUERY.Create(Nil);
    lD.Connection := gVariableGlobal.CNX;
    lM.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Exp_Imp_Enc).Name + ' ');
    lM.SQL.Add(' WHERE CODIGO_EXP_IMP = ' + QuotedStr(Trim(pCODIGO_EXP_IMP)) + ' ');
    lD.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Exp_Imp_Det).Name + ' ');
    lD.SQL.Add(' WHERE CODIGO_EXP_IMP = ' + QuotedStr(Trim(pCODIGO_EXP_IMP)) + ' ');
    lD.SQL.Add(' ORDER BY ORDEN ');
    lM.Active := True ;
    lD.Active := True ;
    If lM.Active And lD.Active Then
    Begin
      If (lM.FieldByName('ORIGEN_DATOS').AsString = 'TXT') Or
         (lM.FieldByName('ORIGEN_DATOS').AsString = 'CVS') Then
        Result := UtImportar_Datos_Archivo(lM, lD)
      Else
        Result := UtImportar_Datos_Dabatase(lM, lD);
    End;
    lD.Active := True ;
    lD.Active := False;
    lM.Active := False;
    FreeAndNil(lD);
    FreeAndNil(lM);
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'UtImportar_Datos_Execute']);
    End;
  End;
End;

end.
