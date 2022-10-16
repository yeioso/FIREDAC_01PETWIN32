unit UtGenerar_Pagos;

interface
Function UtGenerar_Pago_Execute(Const pTipo_Documento, pCodigo_Producto, pCodigo_Tercero : String) : Boolean;

implementation

Uses
  
  UtKardex,
  
  UtConexion,
  UtFunciones,
  UtInfoTablas,
  UtConstantes,
  Form_Busqueda,
  UtHomologacion,
  System.SysUtils,
  UtVariablesGlobales;

Function UtGenerar_Pago_Afectar_Detalle(Const pTipo_Documento, pCodigo_Producto, pCodigo_Tercero, pDataKey : String) : Boolean;
Var
  lI : Integer;
  lO : TQUERY ;
  lD : TQUERY ;
Begin
  Result := False;
  Try
    lO := TQUERY.Create(Nil);
    lD := TQUERY.Create(Nil);
    lO.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' ');
    If pTipo_Documento = Const_Documento_CXC Then
      lO.SQL.Add(' WHERE ' + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(Const_Documento_Factura)))
    Else
      lO.SQL.Add(' WHERE ' + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(Const_Documento_Compra )));
    lO.SQL.Add(' AND ID_ANULADO = ' + QuotedStr('N'));
    lO.SQL.Add(' AND SALDO_PENDIENTE > 0');

    lD.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
    lD.SQL.Add(' WHERE ' + Trim_Sentence('DATAKEY'       ) + ' = ' + QuotedStr(Trim(pDataKey       )));
    lD.SQL.Add(' AND '   + Trim_Sentence('TIPO_DOCUMENTO') + ' = ' + QuotedStr(Trim(pTipo_Documento)));
    lO.Active := True;
    lD.Active := True;
    If lO.Active And (lO.RecordCount > 0) And lD.Active Then
    Begin
      lO.First;
      While  Not lO.Eof Do
      Begin
        lD.Append;
        lD.FieldByName('TIPO_REFERENCIA'   ).AsString := lO.FieldByName('TIPO_DOCUMENTO'  ).AsString;
        lD.FieldByName('NUMERO_REFERENCIA' ).AsString := lO.FieldByName('NUMERO_DOCUMENTO').AsString;
        lD.FieldByName('DATAKEY_REFERENCIA').AsString := lO.FieldByName('DATAKEY'         ).AsString;
        lD.FieldByName('CODIGO_PRODUCTO'   ).AsString := pCodigo_Producto;
        lD.FieldByName('TIPO_DOCUMENTO'    ).AsString := pTipo_Documento;
        lD.FieldByName('NUMERO_DOCUMENTO'  ).AsString := pDataKey       ;
        lD.FieldByName('DATAKEY'           ).AsString := pDataKey       ;
        lD.FieldByName('CODIGO_USUARIO'    ).AsString := gUSUARIO_ACTUAL;
        lD.FieldByName('FECHA'             ).AsString := FormatDateTime('YYYY-MM-DD', Now);
        lD.FieldByName('HORA'              ).AsString := FormatDateTime('HH:NN:SS'  , Now);
        lD.FieldByName('NOMBRE'            ).AsString := lO.FieldByName('TIPO_DOCUMENTO').AsString + '/' + lO.FieldByName('NUMERO_DOCUMENTO').AsString;
        lD.FieldByName('CANTIDAD'          ).AsFloat  := 1;
        lD.FieldByName('VALOR_ORIGINAL'    ).AsFloat  := lO.FieldByName('SALDO_PENDIENTE').AsFloat;;
        lD.FieldByName('ID_ANULADO'        ).AsString := 'N';
        lD.Post;
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
      UtLog_Execute('UtGenerar_Pago_Afectar_Detalle, ' + E.Message);
    End;
  End;
End;

Function UtGenerar_Pago_Execute(Const pTipo_Documento, pCodigo_Producto, pCodigo_Tercero : String) : Boolean;
Var
  lI : Integer;
  lD : TQUERY ;
  lDataKey : String;
Begin
  Result := False;
  lDataKey := FormatDateTime('YYYYMMDDHHNNSSZZ', Now);
  gVariableGlobal.CNX.BeginTrans;
  Try
    If Execute_SQL_Boolean('DELETE FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' WHERE TIPO_DOCUMENTO = ' + QuotedStr(pTipo_Documento), 'UtGenerar_Pago_Execute') And
       Execute_SQL_Boolean('DELETE FROM ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + ' WHERE TIPO_DOCUMENTO = ' + QuotedStr(pTipo_Documento), 'UtGenerar_Pago_Execute') Then
    Begin
      lD := TQUERY.Create(Nil);
      lD.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + ' ');
      lD.Active := True;
      If lD.Active Then
      Begin
        lD.Append;
        lD.FieldByName('TIPO_DOCUMENTO'      ).AsString := pTipo_Documento;
        lD.FieldByName('NUMERO_DOCUMENTO'    ).AsString := lDataKey;
        lD.FieldByName('DATAKEY'             ).AsString := lDataKey;
        lD.FieldByName('CODIGO_USUARIO'      ).AsString := gUSUARIO_ACTUAL;
        lD.FieldByName('CODIGO_ESTACION'     ).AsString := Retornar_Maquina;
        lD.FieldByName('FECHA_DOCUMENTO'     ).AsString := FormatDateTime('YYYY-MM-DD', Now);
        lD.FieldByName('FECHA_VENCIMIENTO'   ).AsString := FormatDateTime('YYYY-MM-DD', Now);
        lD.FieldByName('FECHA'               ).AsString := FormatDateTime('YYYY-MM-DD', Now);
        lD.FieldByName('HORA'                ).AsString := FormatDateTime('HH:NN:SS'  , Now);
        lD.FieldByName('ID_ANULADO'          ).AsString := 'N';
        lD.Post;
        Result := UtGenerar_Pago_Afectar_Detalle(pTipo_Documento, pCodigo_Producto, pCodigo_Tercero, lDataKey);
      End;
      lD.Active := False;
      FreeAndNil(lD);
    End;
  Except
    On E: Exception Do
    Begin
      Result := False;
      UtLog_Execute('UtGenerar_Pago_Execute, ' + E.Message);
    End;
  End;
  If Result Then
    gVariableGlobal.CNX.CommitTrans
  Else
    gVariableGlobal.CNX.RollbackTrans;
End;

end.
