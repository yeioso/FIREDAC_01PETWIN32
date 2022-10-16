unit UtGenerar_Anulacion;

interface

Function UtGenerar_Anulacion_Execute(Const pTipo_DocumentoInput, pDataKeyInput, pObservacion : String; Var pDataKeyOut, pTipo_DocumentoOut, pNumero_Documento : String) : Boolean;

implementation

Uses
  UtConexion,
  UtFunciones,
  UtInfoTablas,
  UtConstantes,
  Form_Busqueda,
  System.SysUtils,
  UtCerrar_Documento,
  UtVariablesGlobales,
  Tablename_Documento_Adm,
  Form_Print_Documento_Adm;

Procedure UtGenerar_Anulacion_Afectar_Producto(Const pTipo_DocumentoInput, pDataKeyInput, pTipo_DocumentoOut : String);
Var
  lO : TQUERY ;
Begin
  Try
    lO := TQUERY.Create(Nil);
    lO.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det).Name + ' ');
    lO.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY'       ) + ' = ' + QuotedStr(Trim(pDataKeyInput)));
    lO.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_DocumentoInput)));
    lO.Active := True;
    If lO.Active Then
    Begin
      lO.First;
      While Not lO.Eof Do
      Begin
//      UtKardex_Execute_Update(pTipo_DocumentoOut, lO.FieldByName('CODIGO_PRODUCTO').AsString);
        lO.Next;
      End;
    End;
    lO.Active := False;
    FreeAndNil(lO);
  Except
    On E: Exception Do
    Begin
      gVariableGlobal.Add_Log(E, ['Origen', 'UtGenerar_Anulacion_Afectar_Producto', 'Error', E.Message]);
    End;
  End;
End;

Function UtGenerar_Anulacion_Afectar_Detalle(Const pTipo_DocumentoInput, pDataKeyInput, pDataKeyOut, pTipo_DocumentoOut, pNumero_Documento : String) : Boolean;
Var
  lI : Integer;
  lO : TQUERY ;
  lD : TQUERY ;
Begin
  Result := False;
  Try
    lO := TQUERY.Create(Nil);
    lD := TQUERY.Create(Nil);
    lO.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det).Name + ' ');
    lO.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDataKeyInput)));
    lD.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det).Name + ' ');
    lD.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDataKeyOut  )));
    lO.Active := True;
    lD.Active := True;
    If lO.Active And (lO.RecordCount > 0) And lD.Active Then
    Begin
      lO.First;
      While  Not lO.Eof Do
      Begin
        lD.Append;
        For lI := 0 To lD.Fields.Count-1 Do
          lD.FieldByName(lD.Fields[lI].FullName).Value := lO.FieldByName(lD.Fields[lI].FullName).Value;
        lD.FieldByName('TIPO_DOCUMENTO'      ).AsString := pTipo_DocumentoOut;
        lD.FieldByName('NUMERO_DOCUMENTO'    ).AsString := pNumero_Documento;
        lD.FieldByName('DATAKEY'             ).AsString := pDataKeyOut;
        lD.FieldByName('CODIGO_USUARIO'      ).AsString := gVariableGlobal.USUARIO_ACTUAL;
        lD.FieldByName('FECHA'               ).AsString := FormatDateTime('YYYY-MM-DD', Now);
        lD.FieldByName('HORA'                ).AsString := FormatDateTime('HH:NN:SS'  , Now);
        lD.FieldByName('ID_ANULADO'          ).AsString := 'N';
        lD.Post;
        lO.Edit;
        lO.FieldByName('ID_ANULADO'          ).AsString := 'S';
        lO.Post;
        lO.Next;
        Result := True;
      End;
    End;
    lD.Active := False;
    lO.Active := False;
    FreeAndNil(lD);
    FreeAndNil(lO);
  Except
    On E: Exception Do
    Begin
      Result := False;
      gVariableGlobal.Add_Log(E, ['Origen', 'UtGenerar_Anulacion_Afectar_Detalle', 'Error', E.Message]);
    End;
  End;
End;

Function UtGenerar_Anulacion_Execute(Const pTipo_DocumentoInput, pDataKeyInput, pObservacion : String; Var pDataKeyOut, pTipo_DocumentoOut, pNumero_Documento : String) : Boolean;
Var
  lI : Integer;
  lO : TQUERY ;
  lD : TQUERY ;
  lId_Salida : String;
  lNumero_Documento : String;
  lCodigo_Documento_Adm : String;
Begin
  Result := False;
  pTipo_DocumentoOut := Const_Documento_Nota_Credito;
  If (Const_Documento_Pedido       = pTipo_DocumentoInput) Or
     (Const_Documento_Compra       = pTipo_DocumentoInput) Or
     (Const_Documento_Nota_Credito = pTipo_DocumentoInput) Then
    pTipo_DocumentoOut := Const_Documento_Nota_Debito
  Else
     If (Const_Documento_Cotizacion   = pTipo_DocumentoInput) Or
        (Const_Documento_Factura      = pTipo_DocumentoInput) Or
        (Const_Documento_Nota_Debito  = pTipo_DocumentoInput) Then
      pTipo_DocumentoOut := Const_Documento_Nota_Credito;

  If Not Tablename_Documento_Adm_Codigo_Numero_Documento(pTipo_DocumentoOut, lCodigo_Documento_Adm, lNumero_Documento, lId_Salida) Then
  Begin
    Mensajes('No se ha establecido información necesaria en la administración de documentos');
    Exit;
  End;
  Result := Const_Documento_SIN_DOCTO <> lNumero_Documento;
  If Result Then
    Result := Documento_Disponible(pTipo_DocumentoOut, lNumero_Documento)
  Else
  Begin
    Mensajes('No se ha establecido información necesaria en la administración de documentos');
    Exit;
  End;
  If Result Then
  Begin
    gVariableGlobal.CNX.BeginTrans;
    Try
      lO := TQUERY.Create(Nil);
      lD := TQUERY.Create(Nil);
      lO.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' ');
      lO.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDataKeyInput)));
      lD.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' ');
      lD.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDataKeyOut  )));
      lO.Active := True;
      lD.Active := True;
      If lO.Active And (lO.RecordCount > 0) And lD.Active Then
      Begin
        pDataKeyOut := FormatDateTime('YYYYMMDDHHNNSSZZZ', Now);
        lD.Append;
        For lI := 0 To lD.Fields.Count-1 Do
          lD.FieldByName(lD.Fields[lI].FullName).Value := lO.FieldByName(lD.Fields[lI].FullName).Value;
        lD.FieldByName('ORIGEN_REFERENCIA'   ).AsString := lO.FieldByName('TIPO_DOCUMENTO'  ).AsString;
        lD.FieldByName('DATAKEY_REFERENCIA'  ).AsString := lO.FieldByName('DATAKEY').AsString;
        lD.FieldByName('DOCUMENTO_REFERENCIA').AsString := lO.FieldByName('NUMERO_DOCUMENTO').AsString;
        lD.FieldByName('TIPO_DOCUMENTO'      ).AsString := pTipo_DocumentoOut;
        lD.FieldByName('NUMERO_DOCUMENTO'    ).AsString := lNumero_Documento;
        lD.FieldByName('DATAKEY'             ).AsString := pDataKeyOut;
        lD.FieldByName('CODIGO_USUARIO'      ).AsString := gVariableGlobal.USUARIO_ACTUAL;
        lD.FieldByName('CODIGO_ESTACION'     ).AsString := Retornar_Maquina;
        lD.FieldByName('FECHA_DOCUMENTO'     ).AsString := FormatDateTime('YYYY-MM-DD', Now);
        lD.FieldByName('FECHA_VENCIMIENTO'   ).AsString := FormatDateTime('YYYY-MM-DD', Now);
        lD.FieldByName('FECHA'               ).AsString := FormatDateTime('YYYY-MM-DD', Now);
        lD.FieldByName('HORA'                ).AsString := FormatDateTime('HH:NN:SS'  , Now);
        lD.FieldByName('OBSERVACION'         ).AsString := pObservacion;
        lD.FieldByName('ID_ANULADO'          ).AsString := 'N';
        pNumero_Documento                               := lNumero_Documento;
        lD.Post;
        lO.Edit;
        lO.FieldByName('ID_ANULADO').AsString := 'S';
        lO.Post;
        Result := UtGenerar_Anulacion_Afectar_Detalle(pTipo_DocumentoInput, pDataKeyInput, pDataKeyOut, pTipo_DocumentoOut, lNumero_Documento);
        UtGenerar_Anulacion_Afectar_Producto(pTipo_DocumentoInput, pDataKeyInput, pTipo_DocumentoOut);
      End;
      lD.Active := False;
      lO.Active := False;
      FreeAndNil(lD);
      FreeAndNil(lO);
      Result := Actualizar_Numero_Documento_Adm(lCodigo_Documento_Adm, lNumero_Documento);
    Except
      On E: Exception Do
      Begin
        Result := False;
        gVariableGlobal.Add_Log(E, ['Origen', 'UtGenerar_Anulacion_Execute', 'Error', E.Message]);
      End;
    End;
    If Result Then
      gVariableGlobal.CNX.CommitTrans
    Else
      gVariableGlobal.CNX.RollbackTrans;
  End;
End;

end.
