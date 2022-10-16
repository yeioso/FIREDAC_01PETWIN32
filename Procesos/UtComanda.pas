unit UtComanda;

interface
Procedure UtComanda_Execute(Const pDatakey : String; Const pTodo : Boolean);
Procedure UtComanda_Set_Impresion(Const pDatakey : String);

implementation

Uses
  Math,
  Classes,
  SysUtils,
  UtConexion,
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtCentral_Ventas,
  UtVariablesGlobales;

Procedure UtComanda_Get_Observacion(Const pDatakey, pCodigo_Producto, pConsecutivo : String; Var pResult : TStringList);
Var
  lSQL : TQUERY;
  lTexto : String;
Begin
  Try
    lSQL := TQUERY.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Obs_Aux).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY'        ) + ' = ' + QuotedStr(Trim(pDatakey        )) + ' ');
    lSQL.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('CODIGO_PRODUCTO') + ' = ' + QuotedStr(Trim(pCodigo_Producto)) + ' ');
    lSQL.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('CONSECUTIVO'    ) + ' = ' + QuotedStr(Trim(pConsecutivo    )) + ' ');
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        If Not Vacio(lSQL.FieldByName('NOMBRE').AsString) Then
          pResult.Add(StringOfChar(' ', 5) + Trim(lSQL.FieldByName('NOMBRE').AsString));
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'UtComanda_Get_Observacion']);
    End;
  End;
End;

Procedure UtComanda_Set_Impresion(Const pDatakey : String);
Var
  lSQL : TQUERY;
Begin
  Try
    lSQL := TQUERY.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakey)) + ' ');
    lSQL.SQL.Add(' AND ID_IMPRESO = ' + QuotedStr('N'));
    lSQL.SQL.Add(' ORDER BY CONSECUTIVO ');
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        lSQL.Edit;
        lSQL.FieldByName('ID_IMPRESO').AsString := 'S';
        lSQL.Post;
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'UtComanda_Set_Impresion']);
    End;
  End;
End;


Procedure UtComanda_Get_Preparacion(Const pDatakey : String; Var pResult : TStringList; Var pExiste : Boolean; pInfo : String; Const pTodo : Boolean; pSangria : Integer);
Var
  lI : Integer;
  lSQL : TQUERY;
  lMax : Integer;
  lTexto : String;
  lDetalle : TStringList;
Begin
  pExiste := False;
  lDetalle := TStringList.Create;
  Try
    lSQL := TQUERY.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakey)) + ' ');
    If Not pTodo Then
      lSQL.SQL.Add(' AND ID_IMPRESO = ' + QuotedStr('N'));
    lSQL.SQL.Add(' ORDER BY CONSECUTIVO ');
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        If gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [lSQL.FieldByName('CODIGO_PRODUCTO').AsString], ['ID_PREPARACION'], 'UtComanda_Get_Preparacion') = 'S' Then
        Begin
          lTexto := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [lSQL.FieldByName('CODIGO_PRODUCTO').AsString], ['NOMBRE'], 'UtComanda_Get_Preparacion');
          If Not Vacio(lTexto) Then
          Begin
            lDetalle.Clear;
            lDetalle.Add(StringOfChar(' ', pSangria) + pInfo );
            lDetalle.Add(StringOfChar(' ', pSangria) + lTexto);
            lDetalle.Add(StringOfChar(' ', pSangria) + 'CANTIDAD: ' + FormatFloat('###,###,##0', lSQL.FieldByName('CANTIDAD').AsFloat));
            UtComanda_Get_Observacion(pDatakey, lSQL.FieldByName('CODIGO_PRODUCTO').AsString, lSQL.FieldByName('CONSECUTIVO').AsString, lDetalle);

            lMax := lDetalle.Count;
            For lI := 0 To lDetalle.Count-1 Do
              pResult.Add (StringOfChar(' ', pSangria) + Trim(lDetalle[lI]));
            For lI := 0 To 6 - lMax Do
            Begin
              pResult.Add (StringOfChar(' ', pSangria) + '.');
              lDetalle.Add(StringOfChar(' ', pSangria) + '.');
            End;

            pResult.Add (StringOfChar(' ', pSangria) + StringOfChar('-', 20));
            lDetalle.Add(StringOfChar(' ', pSangria) + StringOfChar('-', 20));
            lSQL.Edit;
            lSQL.FieldByName('INFO_COMANDA').AsString := lDetalle.Text;
            lSQL.FieldByName('ID_COMANDA').AsString := 'S';
            lSQL.Post;
            pExiste := True;
          End;
        End;
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'UtComanda_Get_Preparacion']);
    End;
  End;
  lDetalle.Clear;
  FreeAndNil(lDetalle);
End;

Procedure UtComanda_Execute(Const pDatakey : String; Const pTodo : Boolean);
Var
  lSQL : TQUERY;
  lInfo : String;
  lTexto : String;
  lExiste : Boolean;
  lResult : TStringList;
  lUbicacion : String;
  lResponsable : String;
  lNro_Comanda : String;
Begin
  Try
    lSQL := TQUERY.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDatakey)) + ' ');
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.Edit;
      lSQL.FieldByName('INFO_COMANDA').Clear;
      lSQL.Post;
      lResult := TStringList.Create;
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        lUbicacion := '';
        lResponsable := '';
        lNro_Comanda := '';
        If Not Vacio(lSQL.FieldByName('DOCUMENTO_COMANDA').AsString) Then
          lNro_Comanda := Trim(lSQL.FieldByName('DOCUMENTO_COMANDA').AsString);
        lTexto := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [lSQL.FieldByName('CODIGO_VENDEDOR').AsString], ['EQUIVALENCIA'], 'UtComanda_Execute');
        If Not Vacio(lTexto) Then
          lResult.Add('Responsable: ' + lTexto + ' - ' + lNro_Comanda)
        Else
        Begin
          lTexto := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [lSQL.FieldByName('CODIGO_VENDEDOR').AsString], ['NOMBRE'], 'UtComanda_Execute');
          If Not Vacio(lTexto) Then
            lResponsable := Trim(lTexto);
        End;

        If Not Vacio(lSQL.FieldByName('CODIGO_ESPACIO').AsString) Then
        Begin
          lTexto := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Espacio).Name, ['CODIGO_ESPACIO'], [lSQL.FieldByName('CODIGO_ESPACIO').AsString], ['NOMBRE'], 'UtComanda_Execute');
          lUbicacion := Trim(lTexto) ;
        End;
        lInfo := lUbicacion + ' - ' + lResponsable + ' - ' + lNro_Comanda;
//      lResult.Add(StringOfChar(' ', 2) + lInfo);
        UtComanda_Get_Preparacion(pDatakey, lResult, lExiste, lInfo, pTodo, 4);
        If lExiste Then
        Begin
          lSQL.Edit;
          lSQL.FieldByName('INFO_COMANDA').AsString := lResult.Text;
          lSQL.Post;
        End;
        lSQL.Next;
      End;
      lResult.Clear;
      FreeAndNil(lResult);
    End;
    lSQL.Active := False;
    FreeAndNil(lSQL);
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'UtComanda_Get_Preparacion']);
    End;
  End;
End;

end.
