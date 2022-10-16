unit Form_Ajuste_Kardex;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,
  UtConexion, UtFormularios;

type
  TFrAjuste_Kardex = class(TObjForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BtnCargar: TSpeedButton;
    BtnCerrarDocumento: TSpeedButton;
    BtnSalir: TSpeedButton;
    BtnPrecalcular: TSpeedButton;
    Panel3: TPanel;
    Label1: TLabel;
    NOMBRE_PRODUCTO: TEdit;
    CHECK_CALCULADAS: TCheckBox;
    procedure DsKardexDataChange(Sender: TObject; Field: TField);
    procedure BtnCargarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QrKardexNewRecord(DataSet: TDataSet);
    procedure BtnSalirClick(Sender: TObject);
    procedure BtnCerrarDocumentoClick(Sender: TObject);
    procedure BtnPrecalcularClick(Sender: TObject);
    procedure NOMBRE_PRODUCTOChange(Sender: TObject);
    procedure CHECK_CALCULADASClick(Sender: TObject);
  private
    { Private declarations }
    FDATA : TMANAGER_DATA;
    Function Update_Count : Boolean;
    Function Delete_Count : Boolean;
    Procedure Abrir_Ajuste_Kardex;
    Function Execute_Load : Boolean;
    Function Delete_Records : Boolean;
    Function Update_Records : Boolean;
    Function Establecer_Tercero(Const pTipo_Doc : String; Var pCodigo_Tercero, pCodigo_Sinonimo, pCodigo_Tercero_LP, pCodigo_Documento_Adm : String) : Boolean;
    Function Establecer_Encabezado(pCodigo_Tercero, pCodigo_Sinonimo, pCodigo_Tercero_LP, pCodigo_Documento_Adm : String; Var pNumero_Documento, pDatakey : String) : Boolean;
    Function Establecer_Detalle(Const pDatakey, pNumero_Documento : String) : Boolean;
    Function Cerrar_Ajuste_Kardex : Boolean;
    Function Retornar_Siguiente(Const pDataKey : String) : String;
  public
    { Public declarations }
  end;

var
  FrAjuste_Kardex: TFrAjuste_Kardex;
  Procedure Show_Form_Ajuste_Kardex;

implementation
{$R *.dfm}
Uses
  StrUtils,
  UtTercero,
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  Form_Busqueda,
  UtVariablesGlobales,
  Tablename_Documento_Adm;

Function TFrAjuste_Kardex.Establecer_Tercero(Const pTipo_Doc : String; Var pCodigo_Tercero, pCodigo_Sinonimo, pCodigo_Tercero_LP, pCodigo_Documento_Adm : String) : Boolean;
Var
  lFiltro : String;
  lResult01 : String;
  lResult02 : String;
  lResult03 : String;
begin
  Result := Show_FrBusqueda(['NOMBRE', 'CODIGO_TERCERO'], ['CODIGO_TERCERO'], Retornar_Info_Tabla(Id_Tercero).Name, '', Retornar_Info_Tabla(Id_Tercero).Caption, pCodigo_Tercero, lResult02, lResult03, False, CNX);
  Begin
    Result := Definir_Datos_Tercero(pCodigo_Tercero, pTipo_Doc, pCodigo_Sinonimo, pCodigo_Tercero_LP, pCodigo_Documento_Adm);
    If Result Then
    Begin
      lFiltro := gVariableGlobal.CNX.Trim_Sentence('CODIGO_TERCERO') + ' = ' + QuotedStr(Trim(pCodigo_Tercero));
      Result := Show_FrBusqueda(['NOMBRE', 'CODIGO_SINONIMO', 'CODIGO_TERCERO'], ['CODIGO_SINONIMO'], Retornar_Info_Tabla(Id_Tercero_Sinonimo).Name, lFiltro, Retornar_Info_Tabla(Id_Tercero_Sinonimo).Caption, pCodigo_Sinonimo, lResult02, lResult03, False, CNX);
    End;
  End;
end;

Function TFrAjuste_Kardex.Establecer_Encabezado(pCodigo_Tercero, pCodigo_Sinonimo, pCodigo_Tercero_LP, pCodigo_Documento_Adm : String; Var pNumero_Documento, pDatakey : String) : Boolean;
Var
  lId_Salida : String;
  lCodigo_Documento_Adm : String;
Begin
  Result := Tablename_Documento_Adm_Codigo_Numero_Documento(Const_Documento_Compra, lCodigo_Documento_Adm, pNumero_Documento, lId_Salida);
  If Not Result Then
  Begin
    Mensajes('No existe documento administrado');
    Exit;
  End;
  Result := Const_Documento_SIN_DOCTO <> pNumero_Documento;
  If Result Then
  Begin
    Result := Documento_Disponible(Const_Documento_Compra, pNumero_Documento);
  End
  Else
  Begin
    Mensajes('No se ha establecido información necesaria en la administración de documentos');
    Exit;
  End;

  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE NUMERO_DOCUMENTO = ' + QuotedStr(pNumero_Documento));
    CNX.TMP.Active := True;
    If CNX.TMP.Active Then
    Begin
      pDatakey := FormatDateTime('YYYYMMDDHHNNSSZZ', Now);
      CNX.TMP.Append;
      CNX.TMP.FieldByName('DATAKEY'          ).AsString := pDatakey;
      CNX.TMP.FieldByName('NUMERO_DOCUMENTO' ).AsString := pNumero_Documento;
      CNX.TMP.FieldByName('NOMBRE'           ).AsString := 'AJUSTE DE KARDEX';
      CNX.TMP.FieldByName('TIPO_DOCUMENTO'   ).AsString := Const_Documento_Compra;
      CNX.TMP.FieldByName('FECHA_DOCUMENTO'  ).AsString := gVariableGlobal.Fecha_Actual.yyyy_mm_dd;
      CNX.TMP.FieldByName('FECHA_VENCIMIENTO').AsString := FormatDateTime('YYYY-MM-DD', Now);
      CNX.TMP.FieldByName('CODIGO_USUARIO'   ).AsString := gVariableGlobal.Usuario_Actual;
      CNX.TMP.FieldByName('CODIGO_ESTACION'  ).AsString := Trim(Retornar_Maquina);

//      CNX.TMP.FieldByName('CODIGO_VENDEDOR'  ).AsString := gUsuario_Actual;
      CNX.TMP.FieldByName('CODIGO_TERCERO'   ).AsString := pCodigo_Tercero;
      CNX.TMP.FieldByName('CODIGO_TERCERO_LP').AsString := pCodigo_Tercero_LP;
      CNX.TMP.FieldByName('CODIGO_SINONIMO'  ).AsString := pCodigo_Sinonimo;
      CNX.TMP.FieldByName('CODIGO_BASE'      ).AsString := '0001';

      CNX.TMP.FieldByName('FECHA'            ).AsString := gVariableGlobal.Fecha_Actual.yyyy_mm_dd;
      CNX.TMP.FieldByName('HORA'             ).AsString := FormatDateTime('HH:NN:SS', Now);
      CNX.TMP.FieldByName('OBSERVACION'      ).AsString := ' ';
      CNX.TMP.FieldByName('DIRECCION'        ).AsString := ' ';
      CNX.TMP.FieldByName('ID_PREIMPRESO'    ).AsString := 'N';
      CNX.TMP.FieldByName('ID_IMPRESO'       ).AsString := 'N';
      CNX.TMP.FieldByName('ID_ANULADO'       ).AsString := 'N';
      CNX.TMP.FieldByName('ID_ACTUALIZADO'   ).AsString := 'N';
      CNX.TMP.FieldByName('VALOR_TRM'        ).AsFloat  := gVariableGlobal.Valor_TRM;
      CNX.TMP.FieldByName('NUMERO_PERSONAS'  ).AsFloat  := 1;
      CNX.TMP.FieldByName('TIPO_CAPTURA'     ).AsString := 'AJU';
      CNX.TMP.FieldByName('CAR_FECHAINI').AsString := CNX.TMP.FieldByName('FECHA_DOCUMENTO').AsString;
      CNX.TMP.FieldByName('CAR_PLAZO'   ).AsFloat  := CNX.TMP.FieldByName('PLAZO').AsFloat;
      CNX.TMP.FieldByName('CAR_FECHAFIN').AsString := CNX.TMP.FieldByName('FECHA_VENCIMIENTO').AsString;
      CNX.TMP.Post;
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    Result := Actualizar_Numero_Documento_Adm(lCodigo_Documento_Adm, pNumero_Documento);
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrAjuste_Kardex.Establecer_Encabezado']);
  End;
End;

Function TFrAjuste_Kardex.Retornar_Siguiente(Const pDataKey : String) : String;
Var
  lVlr : Integer;
  lErr : Integer;
Begin
  Result := '00000';
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT MAX(CONSECUTIVO) AS RESULTADO FROM ' + Retornar_Info_Tabla(Id_Documento_Det).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(pDataKey)));
    CNX.TMP.Active := True;
    If CNX.TMP.Active Then
      Result := CNX.TMP.FieldByName('RESULTADO').AsString;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    Result := Justificar(Result, '0', 3);
    Next_Value(Result);
  Except
     On E: Exception Do
       gVariableGlobal.Add_Log(E, ['Origen', 'TFrAjuste_Kardex.Retornar_Siguiente']);
  End;
End;

Function TFrAjuste_Kardex.Establecer_Detalle(Const pDatakey, pNumero_Documento : String) : Boolean;
Begin
  Result := False;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    FDATA.QR.First;
    While Not FDATA.QR.Eof Do
    Begin
      If FDATA.QR.FieldByname('CANTIDAD_FISICA').AsFloat <>  0 Then
      Begin
        CNX.TMP.Active := False;
        CNX.TMP.SQL.Clear;
        CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det).Name + ' ');
        CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY'        ) + ' = ' + QuotedStr(Trim(pDatakey                        )));
        CNX.TMP.SQL.Add(' AND '   + gVariableGlobal.CNX.Trim_Sentence('CODIGO_PRODUCTO') + ' = ' + QuotedStr(Trim(FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString)));
        CNX.TMP.Active := True;
        If CNX.TMP.RecordCount <= 0 Then
        Begin
          CNX.TMP.Append;
          CNX.TMP.FieldByName('DATAKEY'          ).AsString := pDatakey;
          CNX.TMP.FieldByName('FECHA_TRM'        ).AsString := FormatDateTime('YYYY-MM-DD', Now);
          CNX.TMP.FieldByName('NUMERO_DOCUMENTO' ).AsString := pNumero_Documento;
          CNX.TMP.FieldByName('CONSECUTIVO'      ).AsString := Retornar_Siguiente(pDatakey);
          CNX.TMP.FieldByName('TIPO_DOCUMENTO'   ).AsString := Const_Documento_Compra;
          CNX.TMP.FieldByName('CODIGO_PRODUCTO'  ).AsString := FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString;
          CNX.TMP.FieldByName('NOMBRE'           ).AsString := FDATA.QR.FieldByName('NOMBRE').AsString;
          CNX.TMP.FieldByName('VALOR_ORIGINAL'   ).AsFloat  := 0;
          CNX.TMP.FieldByName('VALOR_UNITARIO'   ).AsFloat  := 0;
          CNX.TMP.FieldByName('ID_ACTUALIZADO'   ).AsString := 'N';
          CNX.TMP.FieldByName('ID_ENLAZADO'      ).AsString := 'N';
          CNX.TMP.FieldByName('ID_IMPRESO'       ).AsString := 'N';
          CNX.TMP.FieldByName('ID_ANULADO'       ).AsString := 'N';
          CNX.TMP.FieldByName('ID_ESTADO'        ).AsString := 'N';
          CNX.TMP.FieldByName('ID_CAMBIO'        ).AsString := 'N';
          CNX.TMP.FieldByName('CODIGO_USUARIO'   ).AsString := gVariableGlobal.Usuario_Actual;
          CNX.TMP.FieldByName('FECHA'            ).AsString := gVariableGlobal.Fecha_Actual.yyyy_mm_dd;
          CNX.TMP.FieldByName('HORA'             ).AsString := FormatDateTime('HH:NN:SS'  , Now);
          CNX.TMP.FieldByName('VALOR_TRM'        ).AsFloat  := gVariableGlobal.Valor_TRM;
        End
        Else
          CNX.TMP.Edit;
        CNX.TMP.FieldByName('CANTIDAD').AsFloat := CNX.TMP.FieldByName('CANTIDAD').AsFloat + FDATA.QR.FieldByName('CANTIDAD_FISICA').AsFloat;
        CNX.TMP.Post;
//        UtKardex_Execute_Update(Const_Documento_Compra, FDATA.QR.FieldByName('CODIGO_PRODUCTO').AsString);
        Result := True;
      End;
      FDATA.QR.Edit;
      FDATA.QR.FieldByName('NUMERO_DOCUMENTO').AsString := pNumero_Documento;
      FDATA.QR.FieldByName('ID_ESTADO').AsString := 'C';
      FDATA.QR.Post;
      FDATA.QR.Next;
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E: Exception Do
    Begin
      Result := False;
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrAjuste_Kardex.Establecer_Detalle']);
    End;
  End;
End;


Function TFrAjuste_Kardex.Cerrar_Ajuste_Kardex : Boolean;
Var
  lDatakey : String;
  lCodigo_Tercero : String;
  lCodigo_Sinonimo : String;
  lNumero_Documento : String;
  lCodigo_Tercero_LP : String;
  lCodigo_Documento_Adm : String;
Begin
  gVariableGlobal.CNX.BeginTrans;
  Result := Establecer_Tercero(Const_Documento_Compra, lCodigo_Tercero, lCodigo_Sinonimo, lCodigo_Tercero_LP, lCodigo_Documento_Adm);
  If Result Then
    Result := Establecer_Encabezado(lCodigo_Tercero, lCodigo_Sinonimo, lCodigo_Tercero_LP, lCodigo_Documento_Adm, lNumero_Documento, lDatakey);
  If Result Then
    Result := Establecer_Detalle(lDatakey, lNumero_Documento);

  If Result Then
    Result := Delete_Count;
   If Result Then
   Begin
     gVariableGlobal.CNX.CommitTrans;
     Mensajes('Proceso terminado exitosamente, numero de documento ' + lNumero_Documento);
   End
   Else
   Begin
     gVariableGlobal.CNX.RollbackTrans;
     Mensajes('Proceso no terminado exitosamente');
   End;

End;

procedure TFrAjuste_Kardex.CHECK_CALCULADASClick(Sender: TObject);
begin
  Abrir_Ajuste_Kardex;
end;

procedure TFrAjuste_Kardex.BtnCargarClick(Sender: TObject);
begin
  If Delete_Records Then
  Begin
    Execute_Load;
    Update_Count;
  End;
  Abrir_Ajuste_Kardex;
end;

procedure TFrAjuste_Kardex.BtnCerrarDocumentoClick(Sender: TObject);
begin
  If SiNo('Está seguro(a) de cerrar este ajuste?')  Then
  Begin
    Update_Records;
    Cerrar_Ajuste_Kardex;
    Abrir_Ajuste_Kardex;
  End;
end;

procedure TFrAjuste_Kardex.BtnPrecalcularClick(Sender: TObject);
begin
  If SiNo('Está seguro(a) de calcular los ajustes?')  Then
  Begin
    Update_Records;
  End;
end;

procedure TFrAjuste_Kardex.BtnSalirClick(Sender: TObject);
begin
  Close;
end;

Function TFrAjuste_Kardex.Delete_Records : Boolean;
Begin
  Result := False;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' DELETE FROM ' + Retornar_Info_Tabla(Id_Ajuste_Kardex).Name + ' ');
//    CNX.TMP.SQL.Add(' WHERE ID_ESTADO = ' + QuotedStr('A'));
    CNX.TMP.ExecSQL;
    Result := CNX.TMP.RowsAffected > 0;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    Result := True;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrAjuste_Kardex.Delete_Records']);
  End;
End;

Function TFrAjuste_Kardex.Update_Records : Boolean;
Begin
  Result := False;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' UPDATE ' + Retornar_Info_Tabla(Id_Ajuste_Kardex).Name + ' ');
    CNX.TMP.SQL.Add(' SET CANTIDAD_CALCULADA = IIF(CANTIDAD_CALCULADA IS NULL, 0, CANTIDAD_CALCULADA), ');
    CNX.TMP.SQL.Add('     CANTIDAD_FISICA    = IIF(CANTIDAD_FISICA IS NULL   , 0, CANTIDAD_FISICA), '   );
    CNX.TMP.SQL.Add('     DIFERENCIA = IIF(CANTIDAD_CALCULADA IS NULL, 0, CANTIDAD_CALCULADA) - IIF(CANTIDAD_FISICA IS NULL   , 0, CANTIDAD_FISICA) ');
    CNX.TMP.ExecSQL;
    Result := CNX.TMP.RowsAffected > 0;

    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' UPDATE ' + Retornar_Info_Tabla(Id_Ajuste_Kardex).Name + ' ');
    CNX.TMP.SQL.Add(' SET DIFERENCIA =  CASE ');
	  CNX.TMP.SQL.Add('                     WHEN (CANTIDAD_CALCULADA = 0) AND (CANTIDAD_FISICA > 0)  THEN CANTIDAD_FISICA ');
	  CNX.TMP.SQL.Add('                     WHEN (CANTIDAD_CALCULADA > 0) AND (CANTIDAD_FISICA < 0)  THEN CANTIDAD_CALCULADA ');
	  CNX.TMP.SQL.Add('                     WHEN (CANTIDAD_CALCULADA = 0) AND (CANTIDAD_FISICA = 0)  THEN 0 ');
	  CNX.TMP.SQL.Add('                     ELSE ABS(CANTIDAD_FISICA - CANTIDAD_CALCULADA) ');
	  CNX.TMP.SQL.Add('                   END ');
    CNX.TMP.ExecSQL;
    Result := CNX.TMP.RowsAffected > 0;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    Result := True;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrAjuste_Kardex.Update_Records']);
  End;
  Abrir_Ajuste_Kardex;
End;

Function TFrAjuste_Kardex.Delete_Count : Boolean;
Begin
  Result := False;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' DELETE FROM ' + Retornar_Info_Tabla(Id_Ajuste_Kardex).Name + ' ');
    CNX.TMP.ExecSQL;
    Result := CNX.TMP.RowsAffected > 0;

//    lSQL.SQL.Clear;
//    lSQL.SQL.Add(' DELETE FROM ' + Retornar_Info_Tabla(Id_Conteo_Kardex).Name + ' ');
//    lSQL.ExecSQL;
//    Result := Result Or (lSQL.RowsAffected > 0);
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    Result := True;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrAjuste_Kardex.Delete_Count']);
  End;
  Abrir_Ajuste_Kardex;
End;


Function TFrAjuste_Kardex.Update_Count : Boolean;
Begin
  Result := False;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
//    CNX.TMP.SQL.Clear;
//    CNX.TMP.SQL.Add('   INSERT INTO ' + Retornar_Info_Tabla(Id_Ajuste_Kardex).Name + ' ');
//    CNX.TMP.SQL.Add('   (  ');
//    CNX.TMP.SQL.Add('     CODIGO_PRODUCTO, ');
//    CNX.TMP.SQL.Add('     CANTIDAD_FISICA ');
//    CNX.TMP.SQL.Add('   ) ');
//    CNX.TMP.SQL.Add('   SELECT CODIGO_PRODUCTO, SUM(CANTIDAD) AS CANTIDAD ');
//    CNX.TMP.SQL.Add('   FROM  ' + Retornar_Info_Tabla(Id_Conteo_Kardex).Name + ' AS A ');
//    CNX.TMP.SQL.Add('   WHERE NOT EXISTS ');
//    CNX.TMP.SQL.Add('   ( ');
//    CNX.TMP.SQL.Add('     SELECT CODIGO_PRODUCTO FROM ' + Retornar_Info_Tabla(Id_Ajuste_Kardex).Name + ' AS B ');
//    CNX.TMP.SQL.Add('     WHERE A.CODIGO_PRODUCTO = B.CODIGO_PRODUCTO ');
//    CNX.TMP.SQL.Add(' ');
//    CNX.TMP.SQL.Add('   ) ');
//    CNX.TMP.SQL.Add('   GROUP BY CODIGO_PRODUCTO ');
//    CNX.TMP.ExecSQL;
//
//    CNX.TMP.SQL.Clear;
//    CNX.TMP.SQL.Add('   UPDATE T1 ');
//    CNX.TMP.SQL.Add('   SET T1.CANTIDAD_FISICA = T2.CANTIDAD ');
//    CNX.TMP.SQL.Add('   FROM ' + Retornar_Info_Tabla(Id_Ajuste_Kardex).Name + ' T1 ');
//    CNX.TMP.SQL.Add('   INNER JOIN ');
//    CNX.TMP.SQL.Add('     ( ');
//    CNX.TMP.SQL.Add('       SELECT ' + Retornar_Info_Tabla(Id_Conteo_Kardex).Name + '.CODIGO_PRODUCTO, SUM(' + Retornar_Info_Tabla(Id_Conteo_Kardex).Name + '.CANTIDAD) AS CANTIDAD ');
//    CNX.TMP.SQL.Add('       FROM ' + Retornar_Info_Tabla(Id_Conteo_Kardex).Name + ' ');
//    CNX.TMP.SQL.Add('       INNER JOIN ' + Retornar_Info_Tabla(Id_Ajuste_Kardex).Name + ' ON ' + Retornar_Info_Tabla(Id_Ajuste_Kardex).Name + '.CODIGO_PRODUCTO = ' + Retornar_Info_Tabla(Id_Conteo_Kardex).Name + '.CODIGO_PRODUCTO ');
//    CNX.TMP.SQL.Add('       GROUP BY ' + Retornar_Info_Tabla(Id_Conteo_Kardex).Name + '.CODIGO_PRODUCTO ');
//    CNX.TMP.SQL.Add('     ) AS T2 ');
//    CNX.TMP.SQL.Add('   ON T2.CODIGO_PRODUCTO = T1.CODIGO_PRODUCTO ');
//    CNX.TMP.ExecSQL;
//    Result := CNX.TMP.RowsAffected > 0;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
//    Result := True;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrAjuste_Kardex.Update_Count']);
  End;
End;

Function TFrAjuste_Kardex.Execute_Load : Boolean;
Begin
  Result := False;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' INSERT INTO ' + Retornar_Info_Tabla(Id_Ajuste_Kardex).Name + ' ');
    CNX.TMP.SQL.Add(' ( ');
    CNX.TMP.SQL.Add(' DATAKEY, ');
    CNX.TMP.SQL.Add(' CODIGO_PRODUCTO, ');
    CNX.TMP.SQL.Add(' NOMBRE, ');
    CNX.TMP.SQL.Add(' CANTIDAD_CALCULADA ');
//    CNX.TMP.SQL.Add(' ID_ESTADO ');
    CNX.TMP.SQL.Add(' ) ');
    CNX.TMP.SQL.Add(' SELECT ');
    CNX.TMP.SQL.Add(' ' + QuotedStr(FormatDateTime('YYYYMMDDHHNNSSZZZZZZ', Now)) + ', ');
    CNX.TMP.SQL.Add(' ' + Retornar_Info_Tabla(Id_Producto).Name + '.CODIGO_PRODUCTO, ' );
    CNX.TMP.SQL.Add(' ' + Retornar_Info_Tabla(Id_Producto).Name + '.NOMBRE, ' );
    CNX.TMP.SQL.Add(' ' + Retornar_Info_Tabla(Id_Producto).Name + '.CANTIDAD ' );
//    CNX.TMP.SQL.Add(' :ID_ESTADO ');
    CNX.TMP.SQL.Add(' FROM ' + Retornar_Info_Tabla(Id_Producto).Name + ' ');
//    CNX.TMP.SQL.Add(' WHERE ID_INSUMO = ' + QuotedStr('S'));
//    CNX.TMP.Parameters[0].Value := FormatDateTime('YYYYMMDDHHNNSSZZZZZZ', Now);
//    CNX.TMP.Parameters[1].Value := 'A';
    CNX.TMP.ExecSQL;
    Result := CNX.TMP.RowsAffected > 0;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    Result := True;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrAjuste_Kardex.Execute_Load']);
  End;
End;

Procedure TFrAjuste_Kardex.Abrir_Ajuste_Kardex;
Begin
  Try
    FDATA.QR.Active := False;
    FDATA.QR.SQL.Clear;
    FDATA.QR.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Ajuste_Kardex).Name + ' ');
//    FDATA.QR.SQL.Add(' WHERE ID_ESTADO = ' + QuotedStr('A'));
    If Not Vacio(NOMBRE_PRODUCTO.Text) Then
      FDATA.QR.SQL.Add(IfThen(POS('WHERE', FDATA.QR.SQL.Text) <= 0, ' WHERE ', ' AND ') + ' NOMBRE LIKE ' + QuotedStr('%' + Trim(NOMBRE_PRODUCTO.Text) + '%'));

    If CHECK_CALCULADAS.Checked Then
      FDATA.QR.SQL.Add(IfThen(POS('WHERE', FDATA.QR.SQL.Text) <= 0, ' WHERE ', ' AND ') + ' ( CANTIDAD_CALCULADA <> 0 OR  CANTIDAD_FISICA <> 0 ) ');

    FDATA.QR.Active := True;
    If FDATA.QR.Active Then
    Begin
      FDATA.SetFormatNumber('CANTIDAD_CALCULADA');
      FDATA.SetFormatNumber('CANTIDAD_FISICA'   );
      FDATA.SetFormatNumber('DIFERENCIA'        );
    End;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrAjuste_Kardex.FormCreate']);
  End;
End;

procedure TFrAjuste_Kardex.FormCreate(Sender: TObject);
begin
  Self.Caption := Retornar_Info_Tabla(Id_Ajuste_Kardex).Caption;
  gVariableGlobal.SetSetting(Self);
  FDATA := TMANAGER_DATA.Create(Retornar_Info_Tabla(Id_Ajuste_Kardex).Name, Retornar_Info_Tabla(Id_Ajuste_Kardex).Caption);
  DBGrid1.DataSource := FDATA.DS;
  Abrir_Ajuste_Kardex;
end;

procedure TFrAjuste_Kardex.FormDestroy(Sender: TObject);
begin
  If FDATA.QR.Active Then
    FDATA.QR.Active := False;
end;

procedure TFrAjuste_Kardex.NOMBRE_PRODUCTOChange(Sender: TObject);
begin
  Abrir_Ajuste_Kardex;
end;

procedure TFrAjuste_Kardex.DsKardexDataChange(Sender: TObject; Field: TField);
begin
   If FDATA.QR.Active And (FDATA.DS.State In [dsInsert, dsEdit]) Then
     If Assigned(Field) Then
       If (Field.FullName = FDATA.QR.FieldByName('CANTIDAD_FISICA').FullName   ) Or
          (Field.FullName = FDATA.QR.FieldByName('CANTIDAD_CALCULADA').FullName) Then
         FDATA.QR.FieldByName('DIFERENCIA').AsFloat := FDATA.QR.FieldByName('CANTIDAD_CALCULADA').AsFloat - FDATA.QR.FieldByName('CANTIDAD_FISICA').AsFloat;
end;

procedure TFrAjuste_Kardex.QrKardexNewRecord(DataSet: TDataSet);
begin
  Abort;
end;

Procedure Show_Form_Ajuste_Kardex;
Begin
  FrAjuste_Kardex := TFrAjuste_Kardex.Create(Nil);
  FrAjuste_Kardex.ShowModal;
  FrAjuste_Kardex.DisposeOf;
End;

end.
