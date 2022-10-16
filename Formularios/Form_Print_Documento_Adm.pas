unit Form_Print_Documento_Adm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, qrpDatasetInterface, qrdDatasetInterface_ADO, qrddlgs, DB, QuickRpt;

type
  TFrPrint_Documento_Adm = class(TForm)
    ReportDesignerDialog1: TReportDesignerDialog;
    QRDesignADOQueryInterface1: TQRDesignADOQueryInterface;
    ReportPrinterDialog1: TReportPrinterDialog;
    procedure ReportDesignerDialog1BeforeOpenDataset(DataSet: TDataSet);
    procedure ReportDesignerDialog1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ReportDesignerDialog1AfterReportLoaded(Form: TForm;  QRD: TComponent);
    procedure ReportDesignerDialog1BeforePrint(Sender: TCustomQuickRep;  var PrintReport: Boolean);
  private
    { Private declarations }
    FFECHA : String;
    FID_ENC : Integer;
    FID_DET : Integer;
    FDATAKEY : String;
    FREPORTE : Integer;
    FDETALLES : Integer;
    FID_SALIDA : String;
    FPAGE_LENGTH : Extended;
    FCONSECUTIVO : String;
    FDISCRIMINADOS : Integer;
    FCODIGO_USUARIO : String;
    Function Total_Reporte : Integer;
    Function Total_Discriminados : Integer;
    Procedure Calcular_Nro_Detalles;
    Function Calcular_Comanda_Detalle(Const pDet : Integer) : Integer;
    Function Calcular_Comanda_Observacion(Const pObservacion : Integer) : Integer;
    Function Resumir_Receta(Const pTable : Integer) : Boolean;
    Procedure Execute_Printer(Sender: TCustomQuickRep);
  public
    { Public declarations }
  end;

var
  FrPrint_Documento_Adm: TFrPrint_Documento_Adm;
Function Execute_Print_Documento_Adm(pId_Enc, pId_Det, pId_Res : Integer; Const pOrigen, pTipo_Documento, pDatakey, pFileName, pId_Salida, pConsecutivo : String; pOpcion, pCopias : Integer) : Boolean; Overload;
Function Execute_Print_Documento_Adm(pId_Enc, pId_Det, pId_Res : Integer; Const pTipo_Documento, pDatakey, pConsecutivo, pTemplate, pTipo_Salida : String; Var pError : String) : Boolean; Overload;
Function Execute_Print_Resumen(Const pFileName, pId_Salida, pCodigo_Usuario, pFecha : String) : Boolean;
Function Execute_Print_Barcode(Const pFileName  : String) : Boolean;
Function Execute_Print_Reporte(Const pFileName, pId_Salida, pDatakey  : String) : Boolean;
Procedure Form_Print_Documento_Adm_Generar_PDF(Const pNumero_Documento, pRuta_Salida : String);
Function Execute_Print_Comanda(pId_Enc, pId_Det, pId_Res : Integer; pTipo_Documento, pDatakey, pConsecutivo, pFileName, pId_Salida : String) : Boolean;

implementation
{$R *.dfm}

Uses
  Math,
  QRPrntr,
  Printers,
  UtConexion,
  Form_Opcion,
  UtFunciones,
  Form_Splash,
  qrdQuickrep,
  UtConstantes,
  UtInfoTablas,
  UtFast_Print,
  thsdRuntimeLoader,
  UtVariablesGlobales,
  Tablename_Documento_Adm;

Function TFrPrint_Documento_Adm.Resumir_Receta(Const pTable : Integer) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(pTable).Name);
    lSQL.SQL.Add(' WHERE ID_RECETA = ' + QuotedStr('A') + ' OR ID_RECETA = ' + QuotedStr('E'));
    lSQL.Active := True;
    Result := lSQL.Active And (lSQL.RecordCount > 0);
    lSQL.Active := False;
    lSQL.DisposeOf;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrPrint_Documento_Adm.Resumir_Receta']);
  End;
End;

Function TFrPrint_Documento_Adm.Total_Discriminados : Integer;
Var
  lText : TStringList;
Begin
  Result := 0;
  Try
    lText := TStringList.Create;
    lText.Text := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(FID_ENC).Name, ['DATAKEY'], [FDATAKEY], ['DISCRIMINADOS'], 'TFrPrint_Documento_Adm.Total_Discriminados');
    Result := lText.Count + 1;
    lText.Clear;
    FreeAndNil(lText);
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrPrint_Documento_Adm.Total_Discriminados']);
  End;
End;

Function TFrPrint_Documento_Adm.Total_Reporte : Integer;
Var
  lText : TStringList;
Begin
  Result := 0;
  Try
    lText := TStringList.Create;
//  lText.Text := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Reporte).Name, ['DATAKEY'], [FDATAKEY], ['DETALLE'], 'TFrPrint_Documento_Adm.Total_Reporte');
    Result := lText.Count + 1;
    lText.Clear;
    FreeAndNil(lText);
    FREPORTE := Result;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrPrint_Documento_Adm.Total_Reporte']);
  End;
End;

Function TFrPrint_Documento_Adm.Calcular_Comanda_Detalle(Const pDet : Integer) : Integer;
Var
  lSQL : TQuery;
Begin
  Result := 0;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(pDet).Name + '  ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(FDATAKEY)));
    lSQL.Active := True;
    If lSQL.Active Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        If gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Producto).Name, ['CODIGO_PRODUCTO'], [lSQL.FieldByName('CODIGO_PRODUCTO').AsString], ['ID_PREPARACION'], 'TFrPrint_Documento_Adm.Calcular_Comanda_Detalle') = 'S' Then
          Inc(Result);
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    lSQL.DisposeOf;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrPrint_Documento_Adm.Calcular_Comanda_Detalle']);
  End;
End;

Function TFrPrint_Documento_Adm.Calcular_Comanda_Observacion(Const pObservacion : Integer) : Integer;
Var
  lSQL : TQuery;
Begin
  Result := 0;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Connection := gVariableGlobal.CNX;
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(pObservacion).Name + '  ');
    lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(FDATAKEY)));
    lSQL.Active := True;
    If lSQL.Active Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        Inc(Result);
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    lSQL.DisposeOf;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrPrint_Documento_Adm.Calcular_Comanda_Observacion']);
  End;
End;

Procedure TFrPrint_Documento_Adm.Calcular_Nro_Detalles;
Var
  lSQL : String;
Begin
  If FID_SALIDA = 'FOR' Then
  Begin
    Try
      lSQL := ' SELECT COUNT(*) AS RESULTADO FROM ' + Retornar_Info_Tabla(FID_DET).Name ;
      lSQL :=  lSQL + ' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(FDATAKEY));
      If Not Vacio(FCONSECUTIVO) Then
        lSQL :=  lSQL + ' AND ' + gVariableGlobal.CNX.Trim_Sentence('CONSECUTIVO') + ' = ' + QuotedStr(Trim(FCONSECUTIVO));
      FDETALLES := gVariableGlobal.CNX.SQL_Integer(lSQL, 'RESULTADO', 'TFrPrint_Documento_Adm.Calcular_Nro_Detalles') ;
      FDISCRIMINADOS := Total_Discriminados;
    Except
      On E : Exception Do
        gVariableGlobal.Add_Log(E, ['Origen', 'TFrPrint_Documento_Adm.Calcular_Nro_Detalles']);
    End;
  End;
End;

procedure TFrPrint_Documento_Adm.FormCreate(Sender: TObject);
begin
  FFECHA := '';
  FID_ENC := 0;
  FID_DET := 0;
  FDATAKEY := '';
  FREPORTE := 0;
  FDETALLES := 0;
  FID_SALIDA := '';
  FPAGE_LENGTH := 0;
  FCONSECUTIVO := '';
  FDISCRIMINADOS := 0;
  FCODIGO_USUARIO := '';
end;

procedure TFrPrint_Documento_Adm.ReportDesignerDialog1AfterReportLoaded(Form: TForm; QRD: TComponent);
Var
  lI : Extended;
begin
  Try
    If Assigned(QRD) Then
      FPAGE_LENGTH := TQuickrep(TRuntimeComponentLoader(QRD).ParentControl).Page.Length;
  Except
    On E : Exception Do
    Begin
      FPAGE_LENGTH := 0;
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrPrint_Documento_Adm.ReportDesignerDialog1AfterReportLoaded']);
    End;
  End;
end;

procedure TFrPrint_Documento_Adm.ReportDesignerDialog1BeforeOpenDataset(DataSet: TDataSet);
begin
  TQuery(DataSet).Connection := gVariableGlobal.CNX;
  If (TQuery(DataSet).Name = 'PRODUCTO') Then
  Begin
    TQuery(DataSet).SQL.Clear;
    TQuery(DataSet).SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Producto).Name + ' ');
    TQuery(DataSet).SQL.Add(' WHERE ID_IMPRIMIR_BARCODE = ' + QuotedStr('S'));
  End;

  If (TQuery(DataSet).Name = 'PARAMETRO') Then
  Begin
    TQuery(DataSet).SQL.Clear;
    TQuery(DataSet).SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Parametro).Name + ' ');
  End;

  If (TQuery(DataSet).Name = 'MASTER') Then
  Begin
    TQuery(DataSet).SQL.Clear;
    TQuery(DataSet).SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(FID_ENC).Name + ' ');
    TQuery(DataSet).SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + #39 + Trim(FDATAKEY) + #39);
  End;
  If (TQuery(DataSet).Name = 'DETAIL') Then
  Begin
    TQuery(DataSet).SQL.Clear;
    TQuery(DataSet).SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(FID_DET).Name + ' ');
    TQuery(DataSet).SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY'       ) + ' = ' + #39 + Trim(FDATAKEY       ) + #39);
  End;

  If (TQuery(DataSet).Name = 'COMANDA_RESUMIDA') Then
  Begin
    TQuery(DataSet).SQL.Clear;
    TQuery(DataSet).SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(FID_ENC).Name + ' ');
    TQuery(DataSet).SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + #39 + Trim(FDATAKEY) + #39);
  End;

  If (TQuery(DataSet).Name = 'COMANDA_DETALLADA') Then
  Begin
    TQuery(DataSet).SQL.Clear;
    TQuery(DataSet).SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(FID_DET).Name + ' ');
    TQuery(DataSet).SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + #39 + Trim(FDATAKEY) + #39);
    If Not Vacio(FCONSECUTIVO) Then
      TQuery(DataSet).SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence('CONSECUTIVO') + ' = ' + #39 + Trim(FCONSECUTIVO) + #39);
  End;

  If (TQuery(DataSet).Name = 'CAJA') Then
  Begin
    TQuery(DataSet).SQL.Clear;
    TQuery(DataSet).SQL.Add(' SELECT * FROM ' + TQuery(DataSet).Name + ' ');
    TQuery(DataSet).SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(FCODIGO_USUARIO)));
    TQuery(DataSet).SQL.Add(' AND ' + gVariableGlobal.CNX.Trim_Sentence('FECHA') + ' = ' + QuotedStr(Trim(FFECHA)));
  End;

  If (TQuery(DataSet).Name = 'REPORTE') Then
  Begin
//    TQuery(DataSet).SQL.Clear;
//    TQuery(DataSet).SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Reporte).Name + ' ');
//    TQuery(DataSet).SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + #39 + Trim(FDATAKEY) + #39);
  End;

end;

procedure TFrPrint_Documento_Adm.ReportDesignerDialog1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  Execute_Printer(Sender);
end;

procedure TFrPrint_Documento_Adm.ReportDesignerDialog1CalcFields(DataSet: TDataSet);
Var
  ltmp : String;
begin
  If (DataSet.Fields.FindField('NOMBRE_ESPACIO') <> Nil) And
     (DataSet.Fields.FindField('CODIGO_ESPACIO') <> Nil)  Then
    DataSet.Fields.FindField('NOMBRE_ESPACIO').AsString := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Espacio).Name, ['CODIGO_ESPACIO'], [DataSet.FieldByName('CODIGO_ESPACIO').AsString], ['NOMBRE'], 'TFrPrint_Documento_Adm.ReportDesignerDialog1CalcFields');
  If DataSet.Fields.FindField('NOMBRE_VENDEDOR') <> Nil Then
    DataSet.Fields.FindField('NOMBRE_VENDEDOR').AsString := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero).Name, ['CODIGO_TERCERO'], [DataSet.FieldByName('CODIGO_VENDEDOR').AsString], ['NOMBRE'], 'TFrPrint_Documento_Adm.ReportDesignerDialog1CalcFields');
  If DataSet.Fields.FindField('EMPRESA_ACTUAL') <> Nil Then
    DataSet.Fields.FindField('EMPRESA_ACTUAL').AsString := gVariableGlobal.EMPRESA_ACTUAL;
  If DataSet.Fields.FindField('NOMBRE_TERCERO') <> Nil Then
    DataSet.Fields.FindField('NOMBRE_TERCERO').AsString := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [DataSet.FieldByName('CODIGO_TERCERO').AsString, DataSet.FieldByName('CODIGO_SINONIMO').AsString], ['NOMBRE'], 'TFrPrint_Documento_Adm.ReportDesignerDialog1CalcFields');
  If DataSet.Fields.FindField('DIRECCION_TERCERO') <> Nil Then
    DataSet.Fields.FindField('DIRECCION_TERCERO').AsString := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [DataSet.FieldByName('CODIGO_TERCERO').AsString, DataSet.FieldByName('CODIGO_SINONIMO').AsString], ['DIRECCION'], 'TFrPrint_Documento_Adm.ReportDesignerDialog1CalcFields');
  If DataSet.Fields.FindField('TELEFONO_TERCERO') <> Nil Then
    DataSet.Fields.FindField('TELEFONO_TERCERO').AsString := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [DataSet.FieldByName('CODIGO_TERCERO').AsString, DataSet.FieldByName('CODIGO_SINONIMO').AsString], ['TELEFONO'], 'TFrPrint_Documento_Adm.ReportDesignerDialog1CalcFields');
  If DataSet.Fields.FindField('MUNICIPIO_TERCERO') <> Nil Then
  Begin
    ltmp := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, ['CODIGO_TERCERO', 'CODIGO_SINONIMO'], [DataSet.FieldByName('CODIGO_TERCERO').AsString, DataSet.FieldByName('CODIGO_SINONIMO').AsString], ['CODIGO_MUNICIPIO'], 'TFrPrint_Documento_Adm.ReportDesignerDialog1CalcFields');
    DataSet.Fields.FindField('MUNICIPIO_TERCERO').AsString := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Municipio).Name, ['CODIGO_MUNICIPIO'], [ltmp], ['NOMBRE_MUNICIPIO', 'NOMBRE_ESTADO', 'NOMBRE_PAIS'], 'TFrPrint_Documento_Adm.ReportDesignerDialog1CalcFields');
  End;
end;

Procedure TFrPrint_Documento_Adm.Execute_Printer(Sender: TCustomQuickRep);
Var
  lI : Integer;
  lOtros : Integer;
  lReporte : Integer;
  lDetalle : Integer;
  lDiscriminado : Integer;
begin
  Sender.PagesInPreview := 1;
  If FID_SALIDA = 'FOR' Then
  Begin
    Sender.Page.Continuous := True;
    lOtros := 0;
    lReporte := 0;
    lDetalle := 0;
    lDiscriminado := 0;
    For lI := 0 To Sender.BandList.Count-1 Do
    Begin
      If TQRCustomBand(Sender.BandList[lI]).Name = 'DETALLE' Then
      Begin
        lReporte := TQRBand(Sender.BandList[lI]).Height;
      End
      Else
        If TQRCustomBand(Sender.BandList[lI]).Name = 'DISCRIMINADOS' Then
        Begin
          lDiscriminado := TQRBand(Sender.BandList[lI]).Height;
        End
        Else
          If TQRCustomBand(Sender.BandList[lI]).BandType = rbDetail Then
          Begin
            lDetalle := TQRBand(Sender.BandList[lI]).Height;
          End
          Else
            lOtros := lOtros + TQRBand(Sender.BandList[lI]).Height;
    End;
    If FPAGE_LENGTH <= 0 Then
      FPAGE_LENGTH := Sender.Page.Length;
    Sender.Page.Length := FPAGE_LENGTH + lOtros - lDetalle - lDiscriminado - lReporte + (lDetalle * FDETALLES) + (lDiscriminado * FDISCRIMINADOS) + (lReporte * FREPORTE);
    Sender.UserPrinterSettings.OutputBin := TQRBin.Tractor;
    Sender.PreviewHeight := Round(Sender.Page.Length);
  End;
End;

//Function Hay_Destino_Impresion(Const pTipo, pDatakey, pProceso, pConsecutivo : String) : Boolean;
//Var
//  lI : Integer;
//  lSQL : TQUERY;
//  lAux : String;
//  lDestino : TStringList;
//Begin
//  Result := False;
//  lAux := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Documento_Adm).Name, ['TIPO_DOCUMENTO'], [pTipo], ['IMPRESORA'], 'Form_Print_Documento_Adm, Hay_Destino_Impresion');
//  If Not Vacio(lAux) Then
//  Begin
//    Try
//      lDestino := TStringList.Create;
//      Desglosar_Texto_Caracter(lAux, ',', lDestino);
//      lSQL := TQUERY.Create(Nil);
//      lSQL.Connection := gVariableGlobal.CNX;
//      For lI := 0 To lDestino.Count-1 Do
//      Begin
//        Result := True;
//        lSQL.Active := False;
//        lSQL.SQL.Clear;
//        lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Destino).Name                           + ' ');
//        lSQL.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('ESTACION') + ' = ' + QuotedStr(Trim(AnsiUpperCase(lDestino[lI]))) + ' ');
//        lSQL.Active := True;
//        If lSQL.Active Then
//        Begin
//          lSQL.Append;
//          lSQL.FieldByName('TIPO_DOCUMENTO'  ).AsString := pTipo;
//          lSQL.FieldByName('ESTACION'        ).AsString := lDestino[lI];
//          lSQL.FieldByName('NOMBRE_PROCESO'  ).AsString := pProceso    ;
//          lSQL.FieldByName('NUMERO_DOCUMENTO').AsString := pDatakey    ;
//          lSQL.FieldByName('CONSECUTIVO'     ).AsString := pConsecutivo;
//          lSQL.FieldByName('FECHA'           ).AsString := FormatDateTime('YYYY-MM-DD', Now);
//          lSQL.FieldByName('HORA'            ).AsString := FormatDateTime('HH:NN:SS.ZZZ', Now);
//          lSQL.FieldByName('NOMBRE'          ).AsString := 'ENVIADO DESDE ' + Retornar_Maquina;
//          lSQL.Post;
//          Sleep(100);
//        End;
//        lSQL.Active := False;
//      End;
//      FreeAndNil(lSQL);
//      lDestino.Clear;
//      FreeAndNil(lDestino);
//    Except
//      On E: Exception Do
//      Begin
//        gVariableGlobal.Add_Log(E, ['Origen', 'Form_Print_Documento_Adm, Hay_Destino_Impresion']);
//      End;
//    End;
//  End;
//End;

Function Execute_Print_Documento_Adm(pId_Enc, pId_Det, pId_Res : Integer; Const pOrigen, pTipo_Documento, pDatakey, pFileName, pId_Salida, pConsecutivo : String; pOpcion, pCopias : Integer) : Boolean;
Var
  lI : Integer;
  lCopias : Integer;
  lOpcion : Integer;
Begin
  lOpcion := 1;
  If pOpcion <> -1 Then
    lOpcion := pOpcion;
  FrPrint_Documento_Adm := TFrPrint_Documento_Adm.Create(Nil);
  FrPrint_Documento_Adm.FID_ENC := pId_Enc;
  FrPrint_Documento_Adm.FID_DET := pId_Det;
  FrPrint_Documento_Adm.FDATAKEY := pDatakey;
  FrPrint_Documento_Adm.FID_SALIDA := pId_Salida;
  FrPrint_Documento_Adm.FCONSECUTIVO := pConsecutivo;
  If (pOpcion <> -1) Or Show_FrOpcion(['Vista Preliminar', 'Imprimir Formato'], lOpcion, lOpcion) Then
  Begin
    FrPrint_Documento_Adm.Calcular_Nro_Detalles;
    Case lOpcion Of
      1 : FrPrint_Documento_Adm.ReportDesignerDialog1.PreviewReport(pFileName);
      2 : Begin
            lCopias := pCopias;
            If lCopias <= 0 Then
              lCopias := 1;
            Try
              If gVariableGlobal.ID_ELEGIR_IMPRESORA = 'S' Then
              Begin
                FrPrint_Documento_Adm.ReportDesignerDialog1.PrinterSetup;
              End;
            Except
              On E: Exception Do
                gVariableGlobal.Add_Log(E, ['Origen', 'Execute_Print_Documento_Adm 1']);
            End;
            For lI := 1 To lCopias Do
            Begin
              Try
//                If Not Hay_Destino_Impresion(pOrigen, pDatakey, Const_Proceso_Imprimir_Comanda, pConsecutivo) Then
//                Begin
                  If (pId_Salida = 'FOR') Or (pId_Salida = 'COMANDA') Then
                    FrPrint_Documento_Adm.ReportDesignerDialog1.PrintReport(pFileName)
                  Else
                    Imprimir_Factura_Fast_Print(pId_Enc, pId_Det, pId_Res, pTipo_Documento, pDatakey);
//                End;
              Except
                On E: Exception Do
                  gVariableGlobal.Add_Log(E, ['Origen', 'Execute_Print_Documento_Adm 2']);
              End;
            End;
          End;
    End;
  End;
  FrPrint_Documento_Adm.Free;
End;

Function Execute_Print_Documento_Adm(pId_Enc, pId_Det, pId_Res : Integer; Const pTipo_Documento, pDatakey, pConsecutivo, pTemplate, pTipo_Salida : String; Var pError : String) : Boolean;
Begin
  pError := '';
  Result := FALSE;
  If pTipo_Salida = 'FAST' Then
    Result := Imprimir_Factura_Fast_Print(pId_Enc, pId_Det, pId_Res, pTipo_Documento, pDatakey)
  Else
  Begin
    Try
      FrPrint_Documento_Adm := TFrPrint_Documento_Adm.Create(Nil);
      FrPrint_Documento_Adm.FID_ENC := pId_Enc;
      FrPrint_Documento_Adm.FID_DET := pId_Det;
      FrPrint_Documento_Adm.FDATAKEY := pDatakey;
      FrPrint_Documento_Adm.FCONSECUTIVO := pConsecutivo;
      FrPrint_Documento_Adm.Calcular_Nro_Detalles;
      FrPrint_Documento_Adm.ReportDesignerDialog1.PrintReport(pTemplate);
      FrPrint_Documento_Adm.Free;
      Result := True;
    Except
      On E: Exception Do
      Begin
        gVariableGlobal.Add_Log(E, ['Origen', 'Execute_Print_Documento_Adm']);
      End;
    End;
  End;
End;

Function Execute_Print_Comanda(pId_Enc, pId_Det, pId_Res : Integer; pTipo_Documento, pDatakey, pConsecutivo, pFileName, pId_Salida : String) : Boolean;
Begin
  Result := False;
  Try
    FrPrint_Documento_Adm := TFrPrint_Documento_Adm.Create(Nil);
    FrPrint_Documento_Adm.FID_ENC := pId_Enc;
    FrPrint_Documento_Adm.FID_DET := pId_Det;
    FrPrint_Documento_Adm.FDATAKEY := pDatakey;
    FrPrint_Documento_Adm.FID_SALIDA := pId_Salida;
    FrPrint_Documento_Adm.FCONSECUTIVO := pConsecutivo;
    FrPrint_Documento_Adm.Calcular_Nro_Detalles;
    If (pId_Salida = 'FOR') Then
      FrPrint_Documento_Adm.ReportDesignerDialog1.PrintReport  (pFileName)
    Else
      Imprimir_Factura_Fast_Print(pId_Enc, pId_Det, pId_Res, pTipo_Documento, pDatakey);
    FrPrint_Documento_Adm.Free;
    Result := True;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'Execute_Print_Comanda']);
  End;
End;

Function Execute_Print_Resumen(Const pFileName, pId_Salida, pCodigo_Usuario, pFecha : String) : Boolean;
Var
  lOpcion : Integer;
Begin
  lOpcion := 0;
  If Vacio(pFileName) Then
  Begin
    Mensajes('Debe definir el formato para realizar esta operación');
    Exit;
  End;
  If Not FileExists(pFileName) Then
  Begin
    Mensajes('No existe el formato ' + pFileName);
    Exit;
  End;
  Try
    FrPrint_Documento_Adm := TFrPrint_Documento_Adm.Create(Nil);
    FrPrint_Documento_Adm.FCODIGO_USUARIO := pCodigo_Usuario;
    FrPrint_Documento_Adm.FFECHA := pFecha;
    If (lOpcion >= 2) Or Show_FrOpcion(['Vista Preliminar', 'Imprimir Formato', 'Tirilla'], lOpcion) Then
    Begin
//      gQrPrint_Online := lOpcion = 1;
      FrPrint_Documento_Adm.Calcular_Nro_Detalles;
      Case lOpcion Of
        1 : FrPrint_Documento_Adm.ReportDesignerDialog1.PreviewReport(pFileName);
        2 : FrPrint_Documento_Adm.ReportDesignerDialog1.PrintReport  (pFileName);
        3 : Imprimir_Resumen_Fast_Print(gVariableGlobal.FECHA_ACTUAL.yyyy_mm_dd, gVariableGlobal.USUARIO_ACTUAL);
      End;
    End;
    FrPrint_Documento_Adm.Free;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'Execute_Print_Resumen']);
  End;
End;

Function Execute_Print_Barcode(Const pFileName  : String) : Boolean;
Var
  lOpcion : Integer;
Begin
  lOpcion := 0;
  If Vacio(pFileName) Then
  Begin
    Mensajes('Debe definir el formato para realizar esta operación');
    Exit;
  End;
  If Not FileExists(pFileName) Then
  Begin
    Mensajes('No existe el formato ' + pFileName);
    Exit;
  End;
  Try
    FrPrint_Documento_Adm := TFrPrint_Documento_Adm.Create(Nil);
    If (lOpcion >= 2) Or Show_FrOpcion(['Vista Preliminar', 'Imprimir Formato'], lOpcion) Then
    Begin
//      gQrPrint_Online := lOpcion = 1;
      Case lOpcion Of
        1 : FrPrint_Documento_Adm.ReportDesignerDialog1.PreviewReport(pFileName);
        2 : FrPrint_Documento_Adm.ReportDesignerDialog1.PrintReport  (pFileName);
      End;
    End;
    FrPrint_Documento_Adm.Free;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'Execute_Print_Barcode']);
  End;
End;

Function Execute_Print_Reporte(Const pFileName, pId_Salida, pDatakey  : String) : Boolean;
Var
  lOpcion : Integer;
Begin
  lOpcion := 0;
  If Vacio(pFileName) Then
  Begin
    Mensajes('Debe definir el formato para realizar esta operación');
    Exit;
  End;
  If Not FileExists(pFileName) Then
  Begin
    Mensajes('No existe el formato ' + pFileName);
    Exit;
  End;
  Try
    FrPrint_Documento_Adm := TFrPrint_Documento_Adm.Create(Nil);
    FrPrint_Documento_Adm.FDATAKEY := pDatakey;
    FrPrint_Documento_Adm.FID_SALIDA := pId_Salida;
    FrPrint_Documento_Adm.Total_Reporte;
    If Show_FrOpcion(['Vista Preliminar', 'Imprimir Formato'], lOpcion) Then
    Begin
      Case lOpcion Of
        1 : FrPrint_Documento_Adm.ReportDesignerDialog1.PreviewReport(pFileName);
        2 : FrPrint_Documento_Adm.ReportDesignerDialog1.PrintReport  (pFileName);
      End;
    End;
    FrPrint_Documento_Adm.Free;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'Execute_Print_Reporte']);
  End;
End;

Procedure Execute_Print_Lupe_GeneratePDF(Const pTemplate, pFileName : String; pReport : TReportDesignerDialog);
Var
  lExt : String;
  aExportFilter : TQRExportFilter;
  filtLibEntry : TQRExportFilterLibraryEntry;
Begin
  lExt := ExtractFileExt(pFileName);
  lExt := Trim(StringReplace(lExt, '.', '', [rfReplaceAll]));
  filtLibEntry := QRExportFilterLibrary.GetFilterByExtension(lExt);
  if filtLibEntry=nil then
    exit;
  try
    aExportFilter := filtLibEntry.ExportFilterClass.Create(pFileName);
    if pReport <> nil then
       pReport.ExportReport(pTemplate, aExportFilter)
  finally
//    aExportFilter.Free
  end
End;

Function Execute_Print_Lupe_To_PDF(pId_Enc, pId_Det, pId_Res : Integer; pTipo_Documento, pDatakey, pNumero_Documento, pTemplate,  pSalida : String; pTirilla, pForced : Boolean) : Boolean;
Var
  lFileName : String;
Begin
  FrPrint_Documento_Adm := TFrPrint_Documento_Adm.Create(Nil);
  FrPrint_Documento_Adm.FID_ENC := pId_Enc;
  FrPrint_Documento_Adm.FID_DET := pId_Det;
  FrPrint_Documento_Adm.FID_SALIDA := pSalida;
  FrPrint_Documento_Adm.FDATAKEY := pDatakey;
  If pTirilla Then
    FrPrint_Documento_Adm.Calcular_Nro_Detalles;
  FrPrint_Documento_Adm.ReportDesignerDialog1.PrinterSettings.Copies := 1;
  FrPrint_Documento_Adm.ReportDesignerDialog1.PrepareAutomatically := True;
  TCustomQuickrep(FrPrint_Documento_Adm.ReportDesignerDialog1).Prepare;
  TCustomQuickrep(FrPrint_Documento_Adm.ReportDesignerDialog1).PreviewModal;
  lFileName := IncludeTrailingBackslash(Trim(pSalida)) + ChangeFileExt('FACTURA_' + pNumero_Documento, '.PDF');
  Execute_Print_Lupe_GeneratePDF(pTemplate, lFileName, FrPrint_Documento_Adm.ReportDesignerDialog1);
  FreeAndNil(FrPrint_Documento_Adm);
End;

Procedure Form_Print_Documento_Adm_Generar_PDF(Const pNumero_Documento, pRuta_Salida : String);
Var
  lCopias : Integer;
  lFormato : String;
  lKeyData : String;
  lId_Salida : String;
  lNombre_Formato : String;
Begin
  lKeyData := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Documento_Enc).Name, ['NUMERO_DOCUMENTO'], [pNumero_Documento], ['DATAKEY'], 'Form_Print_Documento_Adm_Generar_PDF');
  Tablename_Documento_Adm_Formato(Const_Documento_Factura, lNombre_Formato, lId_Salida, lCopias);
  Execute_Print_Lupe_To_PDF(Id_Documento_Enc, Id_Documento_Det, Id_Documento_Rec, Const_Documento_Factura, lKeyData, pNumero_Documento, lNombre_Formato, pRuta_Salida, gVariableGlobal.ID_FORMATO_TIRILLA = 'S', True);
End;

end.

