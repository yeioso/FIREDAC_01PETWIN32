unit UtExportar_Plantilla;

interface

Procedure Exportar_Plantilla(pTipo_Proceso, pCodigo_Plantilla, pNombre, pFechaIni, pFechaFin : String);

implementation
Uses
  
  UtConexion,
  UtExcel,
  UtConexion,
  UtInfoTablas,
  UtHomologacion,
  System.SysUtils,
  UtSentencia_SQL;

Procedure Campo_Visible_Pivotes(pCodigo_Plantilla : String; Var pSQL : TQuery);
Var
  lI : Integer;
  lSQL : TQuery;
Begin
  Try
    For lI := 0 To pSQL.Fields.Count-1 Do
      pSQL.Fields[lI].Visible := False;
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gConexion;
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT *  FROM ' + Retornar_Info_Tabla(Id_Plantilla_Det).Name + ' ');
    lSQL.SQL.Add(' WHERE  ' + Trim_Sentence('CODIGO_PLANTILLA') + ' = ' + QuotedStr(Trim(pCodigo_Plantilla)));
    lSQL.Active := True ;
    If pSQL.Active And lSQL.Active Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        lI := 0;
        While lI < pSQL.Fields.Count Do
        Begin
          If AnsiUpperCase(Trim(lSQL.FieldByName('NOMBRE_CAMPO').AsString)) = AnsiUpperCase(Trim(pSQL.Fields[lI].FullName)) Then
            If lSQL.FieldByName('SELECCIONADO').AsString = 'S' Then
              If (lSQL.FieldByName('TIPO_UBICACION').AsString = 'F') Or (lSQL.FieldByName('TIPO_UBICACION').AsString = 'C') Or
                 ((lSQL.FieldByName('TIPO_CAMPO').AsString = 'V') And (lSQL.FieldByName('TIPO_VISIBLE').AsString = 'S'))Then
              Begin
                pSQL.Fields[lI].Visible := True;
                lI := pSQL.Fields.Count;
              End;
          Inc(lI);
        End;
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    lSQL.DisposeOf;
  Except
    On E:Exception Do
      UtLog_Execute('UtExportar_Plantilla, Campo_Visible_Pivotes, ' + E.Message);
  End;
end;

Procedure Exportar_Plantilla(pTipo_Proceso, pCodigo_Plantilla, pNombre, pFechaIni, pFechaFin : String);
Var
  lSQL : TQuery;
Begin
  Try
    lSQL := TQuery.Create(Nil);
    If pTipo_Proceso = 'T' Then
      Cargar_Sentencia_SQL_Transacciones('', pFechaIni, pFechaFin, lSQL)
    Else
      If pTipo_Proceso = 'C' Then
        Cargar_Sentencia_SQL_Contable('', pFechaIni, pFechaFin, lSQL)
      Else
        If pTipo_Proceso = 'I' Then
          Cargar_Sentencia_SQL_Inventario('', pFechaIni, pFechaFin, lSQL);
    lSQL.Active := True;
    Campo_Visible_Pivotes(pCodigo_Plantilla, lSQL);
    Exportacion_QRExcel(lSQL, Copy(pNombre, 1, 10));
    lSQL.Active := False;
    lSQL.DisposeOf;
  Except
    On E:Exception Do
      UtLog_Execute('UtExportar_Plantilla, Exportar_Plantilla, ' + E.Message);
  End;
End;


end.
