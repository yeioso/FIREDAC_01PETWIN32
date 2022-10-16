unit UtCerrarCaja;

interface
Procedure Cerrar_Caja;
Function UtCerrarCaja_Pendiente : Boolean;

implementation
Uses
  Classes,
  SysUtils,
  Form_Caja,
  UtConexion,
  UtFunciones,
  UtInfoTablas,
  Form_ListBox,
  UtEspacioBoton,
  UtVariablesGlobales;

Function Espacios_Pendientes : Boolean;
Var
  lSQL : TQuery;
  lListado : TStringList;
Begin
  Result := False;
  Try
    lListado := TStringList.Create;
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.Active := False;
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Espacio).Name + ' ');
    lSQL.SQL.Add(' WHERE ESTADO = ' + QuotedStr(Const_Abrev_Ocupado) + ' ' );
    lSQL.SQL.Add(' OR ESTADO = ' + QuotedStr(Const_Abrev_Reservado) + ' ' );
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        lListado.Add(lSQL.FieldByName('CODIGO_ZONA').AsString + '-' +
                     gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Zona).Name, ['CODIGO_ZONA'], [lSQL.FieldByName('CODIGO_ZONA').AsString], ['NOMBRE'], 'UtCerrarCaja, Espacios_Pendientes') + ' , ' +
                     lSQL.FieldByName('CODIGO_ESPACIO').AsString + '-' + lSQL.FieldByName('NOMBRE').AsString );
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    lSQL.SQL.Clear;
    lSQL.Free;
    Result := lListado.Count > 0;
    If Result Then
       Show_Form_ListBox('Cierre de Caja', lListado);
    lListado.Clear;
    lListado.Free;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'UtCerrarCaja, Espacios_Pendientes']);
  End;
End;

Function Guardar_Usuario_Fecha : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.Active := False;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Caja).Name + ' ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_USUARIO') + '=' + QuotedStr(Trim(gVariableGlobal.Usuario_Actual         )) + ' ');
    lSQL.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('FECHA'         ) + '=' + QuotedStr(Trim(gVariableGlobal.FECHA_ACTUAL.yyyy_mm_dd)) + ' ');
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount >= 0)  Then
    Begin
      lSQL.Edit;
      lSQL.FieldByName('ID_ABIERTA'     ).AsString := 'S';
      lSQL.FieldByName('ID_CERRADA'     ).AsString := 'S';
      lSQL.FieldByName('ESTACION_CIERRE').AsString := Retornar_Maquina;
      lSQL.FieldByName('FECHA_CIERRE'   ).AsString := FormatDateTime('YYYY-MM-DD', Now);
      lSQL.FieldByName('HORA_CIERRE'    ).AsString := FormatDateTime('HH:NN:SS'  , Now);
      lSQL.Post;
      Result := True;
    End;
    lSQL.Active := False;
    lSQL.Free;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'UtCerrarCaja, Guardar_Usuario_Fecha']);
  End;
End;

Procedure Cerrar_Caja;
Begin
  If (Not Espacios_Pendientes) And SiNo('Esta seguro(a) de cerrar la caja?') Then
  Begin
    If Guardar_Usuario_Fecha Then
    Begin
      gVariableGlobal.Cargar_Variables(gVariableGlobal.USUARIO_ACTUAL, gVariableGlobal.PERFIL_ACTUAL);
      Show_Form_Caja(False);
    End;
  End;
End;

Function UtCerrarCaja_Pendiente : Boolean;
Var
  lSQL : TQuery;
  lListado : TStringList;
Begin
  Result := False;
  Try
    lListado := TStringList.Create;
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.Active := False;
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT * FROM '      + Retornar_Info_Tabla(Id_Caja).Name + ' ');
    lSQL.SQL.Add(' WHERE ID_ABIERTA = ' + QuotedStr('S') + ' ' );
    lSQL.SQL.Add(' AND ID_CERRADA = '   + QuotedStr('N') + ' ' );
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lListado.Add('CAJAS PENDIENTES POR CERRAR');
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        lListado.Add('    ' + lSQL.FieldByName('FECHA'         ).AsString + ', ' +
                     lSQL.FieldByName('FECHA_APERTURA').AsString + ', ' +
                     lSQL.FieldByName('HORA_APERTURA' ).AsString + ', ' +
                     gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Usuario).Name, ['CODIGO_USUARIO'], [lSQL.FieldByName('CODIGO_USUARIO').AsString], ['NOMBRE'], 'UtCerrarCaja_Pendiente'));
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    lSQL.SQL.Clear;

    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT DISTINCT ');
    lSQL.SQL.Add(' ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + '.FECHA_DOCUMENTO, ');
    lSQL.SQL.Add(' ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + '.TIPO_DOCUMENTO, ');
    lSQL.SQL.Add(' ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + '.NUMERO_DOCUMENTO, ');
    lSQL.SQL.Add(' ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + '.CODIGO_ESTACION, ');
    lSQL.SQL.Add(' ' + Retornar_Info_Tabla(Id_Tercero          ).Name + '.NOMBRE  ');
    lSQL.SQL.Add(' FROM ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + ' ');
    lSQL.SQL.Add(' INNER JOIN  ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
    lSQL.SQL.Add(' ON ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + '.TIPO_DOCUMENTO = ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + '.TIPO_DOCUMENTO ');
    lSQL.SQL.Add(' AND ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + '.DATAKEY = ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + '.DATAKEY ');
    lSQL.SQL.Add(' INNER JOIN  ' + Retornar_Info_Tabla(Id_Tercero).Name + ' ');
    lSQL.SQL.Add(' ON ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + '.CODIGO_TERCERO = ' + Retornar_Info_Tabla(Id_Tercero).Name + '.CODIGO_TERCERO ');
    lSQL.Active := True;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.First;
      If lListado.Count > 0 Then
        lListado.Add('');
      lListado.Add('DOCUMENTOS ACTIVOS');
      While Not lSQL.Eof Do
      Begin
        lListado.Add('    ' + lSQL.FieldByName('FECHA_DOCUMENTO' ).AsString + ', ' +
                              lSQL.FieldByName('TIPO_DOCUMENTO'  ).AsString + ', ' +
                              lSQL.FieldByName('NUMERO_DOCUMENTO').AsString + ', ' +
                              lSQL.FieldByName('CODIGO_ESTACION' ).AsString + ', ' +
                              lSQL.FieldByName('NOMBRE'          ).AsString);
        lSQL.Next;
      End;
    End;

    lSQL.Free;
    Result := lListado.Count > 0;
    If Result Then
    Begin
      Show_Form_ListBox('Cajas pendientes por cerrar y documentos activos', lListado);
    End;
    lListado.Clear;
    lListado.Free;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'UtCerrarCaja_Pendiente']);
  End;
End;


end.
