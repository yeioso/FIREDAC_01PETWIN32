unit UtVariablesGlobales;

interface

Uses
  Menus,
  UtType,
  UtFecha,
  ExtCtrls,
  UtConexion,
  System.Classes,
  System.SysUtils;

Type
  TVariableGlobal = Class(TObject)
    Public
      CNX                      : TConexion;
      VERSION                  : String ;
      VALOR_TAG                : Integer;
      Valor_TRM                : Double ;
      APLICACION               : String ;
      APLICACION_POS           : String ;

      PERFIL_ACTUAL            : String;
      USUARIO_ACTUAL           : String;
      USUARIO_NOMBRE           : String;
      CAJA_ABIERTA             : Boolean;

      FECHA_ACTUAL             : TFecha_Info;
      RUTAPROGRAMA             : String;
      RUTA_INFORMES            : String;
      VERSION_DEMO             : Boolean;

      EMPRESA_ACTUAL           : String;
      ID_EMPRESA               : String;
      NOMBRE_EMPRESA           : String;
      DIRECCION_EMPRESA        : String;
      TELEFONO_EMPRESA         : String;
      MUNICIPIO_EMPRESA        : String;
      DEPARTAMENTO_EMPRESA     : String;
      PAIS_EMPRESA             : String;

      NOMBRE_FUENTE            : String;
      TAMANO_FUENTE            : Integer;
      TAMANO_LINEA             : Integer;

      ENCABEZADO               : TStringList;
      PIE_PAGINA               : TStringList;

      ID_MONEDA                : String;
      ID_STOCK                 : String;
      ID_F_VENCIMIENTO         : String;
      ID_ABRIR_CAJA            : String;
      ID_AGRUPAR_PRODUCTO      : String;
      ID_CORTAR_TIRILLA        : String;
      ID_ORDEN_Z               : String;
      ID_CODIGO_PRODUCTO       : String;
      ID_CODIGO_BARRAS         : String;
      ID_COMANDA_FACTURA       : String;
      ID_CAMPO_DETALLE         : String;
      ID_PEDIR_VENDEDOR        : String;
      ID_ELEGIR_IMPRESORA      : String;
      ID_ORDEN_TOTALES         : String;

      IMAGEN_WIDTH             : Integer;
      IMAGEN_HEIGHT            : Integer;
      FONT_SIZE_A              : Integer;
      FONT_SIZE_B              : Integer;
      NUMEROS_COMANDAS         : Integer;

      ID_VENDEDOR              : Integer;
      ID_PRODUCTO              : Integer;
      ID_DECIMALES             : SmallInt;
      MARGEN_UTILIDAD          : Double;
      VALOR_DOMICILIO          : Double;
      ID_DECIMALES_TRM         : SmallInt;
      ID_FORMATO_TIRILLA       : String;
      ID_EDITAR_VALORES        : String;
      ID_USUARIO_ADMINISTRADOR : String;
      TIPO_CODIGO_BARRAS       : String;

      NO_CANCELAR_DOCUMENTO    : String;
      NO_ELIMINAR_DETALLE      : String;


      DIAS_PREAVISO            : Double;

      ID_CAPTURA_RAPIDA        : String;
      ID_CALCULAR_COMPRA_RC    : String;
      ID_BUSQUEDA_C_N          : String;
      ID_SINCRONIZAR_VISTAS    : String;
      ID_CONTROL_KARDEX        : String;

      ID_IMAGEN_VENTAS         : String;
      ID_IMAGEN_COMPRAS        : String;

      FILENAME_SETTING         : String;

      DOCUMENTO_FACTURA        : String;
      DOCUMENTO_COMPRA         : String;
      TIPO_IMPRESORA           : String;
      PUERTO_IMPRESORA         : String;
      NOMBRE_IMPRESORA         : String;

      USUARIO_ADMIN             : String;

      LOGOTIPO                 : TImage;
      SERVICIO_MANUAL          : String;

      PERMISOS_APP             : Array Of String;
      Procedure SetSetting(pSender : TObject);
      Procedure Add_Log(Const pSource : TArray_Str); Overload;
      Procedure Add_Log(Sender: TObject; E: Exception); Overload;
      Procedure Add_Log(pException : Exception; Const pSource : TArray_Str); Overload;
      procedure AfterConstruction; Override;
      procedure BeforeDestruction; Override;
      Procedure Cargar_Permiso_App;
      Procedure Validar_Menu_Item(pMenuItem : TMenuItem);
      Function UtVariablesGlobales_Retornar_Fecha : Boolean;
      Procedure Cargar_Configuracion_Avanzada;
      Procedure Estado_Caja;
      Procedure Validar_Opciones_Menu;
      Procedure Cargar_Informacion_Global;
      Procedure Cargar_Fecha_Global(pFecha : TDateTime);
      Function Retornar_Ruta_Programa : String;
      Procedure Cargar_Variables(pUsuario, pPerfil : String);
      Procedure UtVariablesGlobales_Actualizar_Valores;
  End;

Var
  gVariableGlobal : TVariableGlobal;

implementation
Uses
  DB,
  Forms,
  UtLog,
  Dialogs,
  StrUtils,
  UtFunciones,
  Form_Splash,
  UtConstantes,
  UtInfoTablas,
  UtFormularios,
  UtControl_Menu;

Procedure TVariableGlobal.SetSetting(pSender : TObject);
Var
  lF : TObjForm;
Begin
 If pSender Is TObjForm Then
   (pSender As TObjForm).CNX := Self.CNX;
End;

Procedure TVariableGlobal.Add_Log(Const pSource : TArray_Str);
Begin
  UtLog_Execute(CNX.APP_USERNAME, pSource);
End;

Procedure TVariableGlobal.Add_Log(Sender: TObject; E: Exception);
Var
  lA : TArray_Str;
Begin
  SetLength(lA, 0);
  lA := UtLog_Add(lA, 'Clase', Sender.ClassName);
  lA := UtLog_Add(lA, 'Unidad', Sender.UnitName);
  lA := UtLog_Add(lA, 'Error', E.Message);
  Add_Log(lA);
End;

Procedure TVariableGlobal.Add_Log(pException : Exception; Const pSource : TArray_Str);
Var
  lA : TArray_Str;
Begin
  lA := pSource;
  lA := UtLog_Add(lA, 'Error', pException.Message);
  Add_Log(lA);
End;

Procedure TVariableGlobal.Cargar_Permiso_App;
Begin
   ID_EDITAR_VALORES        := CNX.Retornar_String(Retornar_Info_Tabla(Id_Permiso_App).Name, ['CODIGO_PERFIL', 'NOMBRE'], [Perfil_Actual, 'EDITAR_VALORES'       ], ['HABILITA_OPCION'], 'Validar_Menu_Item');
   ID_USUARIO_ADMINISTRADOR := CNX.Retornar_String(Retornar_Info_Tabla(Id_Permiso_App).Name, ['CODIGO_PERFIL', 'NOMBRE'], [Perfil_Actual, 'USUARIO_ADMINISTRADOR'], ['HABILITA_OPCION'], 'Validar_Menu_Item');
   NO_CANCELAR_DOCUMENTO    := CNX.Retornar_String(Retornar_Info_Tabla(Id_Permiso_App).Name, ['CODIGO_PERFIL', 'NOMBRE'], [Perfil_Actual, 'NO_CANCELAR_DOCUMENTO'], ['HABILITA_OPCION'], 'Validar_Menu_Item');
   NO_ELIMINAR_DETALLE      := CNX.Retornar_String(Retornar_Info_Tabla(Id_Permiso_App).Name, ['CODIGO_PERFIL', 'NOMBRE'], [Perfil_Actual, 'NO_ELIMINAR_DETALLE'  ], ['HABILITA_OPCION'], 'Validar_Menu_Item');
   SERVICIO_MANUAL          := CNX.Retornar_String(Retornar_Info_Tabla(Id_Permiso_App).Name, ['CODIGO_PERFIL', 'NOMBRE'], [Perfil_Actual, 'SERVICIO_MANUAL'      ], ['HABILITA_OPCION'], 'Validar_Menu_Item');
End;

Procedure TVariableGlobal.Validar_Menu_Item(pMenuItem : TMenuItem);
Var
  lI : Integer;
  lStr : String;
Begin
  lStr := CNX.Retornar_String(Retornar_Info_Tabla(Id_Permiso_Menu).Name, ['CODIGO_PERFIL', 'OPCION'], [Perfil_Actual, IntToStr(pMenuItem.Tag)], ['HABILITA_OPCION'], 'Validar_Menu_Item');
  pMenuItem.Enabled := (Trim(lStr) = 'S') Or Vacio(lStr);
  For lI := 0 To pMenuItem.Count-1 Do
    Validar_Menu_Item(pMenuItem[lI]);
End;

Procedure TVariableGlobal.Validar_Opciones_Menu;
Var
  lI : Integer;
Begin
  If Not Vacio(Perfil_Actual) Then
    If Assigned(Application.MainForm) And Assigned(Application.MainForm.Menu) Then
      For lI := 0 To Application.MainForm.Menu.Items.Count-1 Do
        Validar_Menu_Item(Application.MainForm.Menu.Items[lI]);
End;

Procedure TVariableGlobal.Estado_Caja;
Begin
  Try
    Caja_Abierta := False;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Caja).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + CNX.Trim_Sentence('CODIGO_USUARIO') + ' = '+ #39 + Trim(Usuario_Actual) + #39);
    CNX.TMP.SQL.Add(' AND '   + CNX.Trim_Sentence('ID_ABIERTA'    ) + ' = '+ #39 + 'S' + #39);
    CNX.TMP.SQL.Add(' AND '   + CNX.Trim_Sentence('ID_CERRADA'    ) + ' = '+ #39 + 'N' + #39);
    CNX.TMP.Active := True;
    If CNX.TMP.Active Then
    Begin
      If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
      Begin
        CNX.TMP.First;
        Fecha_Actual := Return_Type_Year_Month_Day(CNX.TMP.FieldByName('FECHA').AsString);
        Valor_TRM    := CNX.TMP.FieldByName('VALOR_TRM').AsFloat;
        Caja_Abierta := True;
      End;
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E: Exception Do
      UtLog_Execute(CNX.APP_USERNAME, ['Origen', 'UtVariablesGlobales, Estado_Caja', 'Error', E.Message]);
  End;
End;


Function TVariableGlobal.UtVariablesGlobales_Retornar_Fecha : Boolean;
Begin
  Result := False;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Caja).Name + ' ');
    CNX.TMP.SQL.Add(' WHERE ' + CNX.Trim_Sentence('ID_ABIERTA'    ) + ' = '+ #39 + 'S' + #39);
    CNX.TMP.SQL.Add(' AND '   + CNX.Trim_Sentence('ID_CERRADA'    ) + ' = '+ #39 + 'N' + #39);
    CNX.TMP.Active := True;
    If CNX.TMP.Active Then
    Begin
      If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
      Begin
        CNX.TMP.First;
        Fecha_Actual := Return_Type_Year_Month_Day(CNX.TMP.FieldByName('FECHA').AsString);
        Valor_TRM    := CNX.TMP.FieldByName('VALOR_TRM').AsFloat;
        Result := True;
      End;
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E: Exception Do
      UtLog_Execute(CNX.APP_USERNAME, ['Origen', 'UtVariablesGlobales, UtVariablesGlobales_Retornar_Fecha', 'Error', E.Message]);
  End;
End;

Procedure TVariableGlobal.Cargar_Configuracion_Avanzada;
Begin
  If Not Assigned(LOGOTIPO) Then
    LOGOTIPO := TImage.Create(Application);

  If Not Assigned(ENCABEZADO) Then
    ENCABEZADO := TStringList.Create;
  ENCABEZADO.Clear;

  If Not Assigned(PIE_PAGINA) Then
    PIE_PAGINA := TStringList.Create;
  PIE_PAGINA.Clear;

 Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Parametro).Name          + ' ');
    CNX.TMP.SQL.Add(' ORDER BY CODIGO_PERIODO ');
    CNX.TMP.Active := True;
    If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
    Begin
      CNX.TMP.Last;
      ID_EMPRESA           := Trim(CNX.TMP.FieldByName('ID_EMPRESA'          ).AsString);
      NOMBRE_EMPRESA       := Trim(CNX.TMP.FieldByName('NOMBRE_EMPRESA'      ).AsString);
      DIRECCION_EMPRESA    := Trim(CNX.TMP.FieldByName('DIRECCION_EMPRESA'   ).AsString);
      TELEFONO_EMPRESA     := Trim(CNX.TMP.FieldByName('TELEFONO_EMPRESA'    ).AsString);
      MUNICIPIO_EMPRESA    := Trim(CNX.TMP.FieldByName('MUNICIPIO_EMPRESA'   ).AsString);
      DEPARTAMENTO_EMPRESA := Trim(CNX.TMP.FieldByName('DEPARTAMENTO_EMPRESA').AsString);
      PAIS_EMPRESA         := Trim(CNX.TMP.FieldByName('PAIS_EMPRESA'        ).AsString);
      Try
        If Not CNX.TMP.FieldByName('LOGOTIPO').IsNull Then
        Begin
          LOGOTIPO.Picture := Nil;
          LOGOTIPO.Picture.Bitmap.Assign(TBlobField(CNX.TMP.FieldByName('LOGOTIPO')));
        End;
      Except
        On E: Exception Do
           UtLog_Execute(CNX.APP_USERNAME, ['Origen', 'UtVariablesGlobales, Cargar_Configuracion_Avanzada', 'Error', E.Message]);
      End;
      ENCABEZADO.Text      := CNX.TMP.FieldByName('ENCABEZADO').AsString;
      PIE_PAGINA.Text      := CNX.TMP.FieldByName('PIE_PAGINA').AsString;
      ID_MONEDA            := Trim(CNX.TMP.FieldByName('ID_MONEDA'           ).AsString);
      ID_STOCK             := Trim(CNX.TMP.FieldByName('ID_STOCK'            ).AsString);
      ID_F_VENCIMIENTO     := Trim(CNX.TMP.FieldByName('ID_F_VENCIMIENTO'    ).AsString);
      ID_ABRIR_CAJA        := Trim(CNX.TMP.FieldByName('ID_ABRIR_CAJA'       ).AsString);
      ID_AGRUPAR_PRODUCTO  := Trim(CNX.TMP.FieldByName('ID_AGRUPAR_PRODUCTO' ).AsString);
      ID_CORTAR_TIRILLA    := Trim(CNX.TMP.FieldByName('ID_CORTAR_TIRILLA'   ).AsString);
      ID_CODIGO_PRODUCTO   := Trim(CNX.TMP.FieldByName('ID_CODIGO_PRODUCTO'  ).AsString);
      ID_CODIGO_BARRAS     := Trim(CNX.TMP.FieldByName('ID_CODIGO_BARRAS'    ).AsString);
      ID_COMANDA_FACTURA   := Trim(CNX.TMP.FieldByName('ID_COMANDA_FACTURA'  ).AsString);
      ID_FORMATO_TIRILLA   := Trim(CNX.TMP.FieldByName('ID_FORMATO_TIRILLA'  ).AsString);
      ID_PEDIR_VENDEDOR    := Trim(CNX.TMP.FieldByName('ID_PEDIR_VENDEDOR'   ).AsString);

      NOMBRE_FUENTE        := Trim(CNX.TMP.FieldByName('NOMBRE_FUENTE').AsString);
      TAMANO_FUENTE        := CNX.TMP.FieldByName('TAMANO_FUENTE'     ).AsInteger;
      TAMANO_LINEA         := CNX.TMP.FieldByName('TAMANO_LINEA'      ).AsInteger;

      ID_ORDEN_Z           := CNX.TMP.FieldByName('ID_ORDEN_Z'        ).AsString ;

      IMAGEN_WIDTH         := CNX.TMP.FieldByName('IMAGEN_WIDTH'      ).AsInteger;
      IMAGEN_HEIGHT        := CNX.TMP.FieldByName('IMAGEN_HEIGHT'     ).AsInteger;
      FONT_SIZE_A          := CNX.TMP.FieldByName('FONT_SIZE_A'       ).AsInteger;
      FONT_SIZE_B          := CNX.TMP.FieldByName('FONT_SIZE_B'       ).AsInteger;
      NUMEROS_COMANDAS     := CNX.TMP.FieldByName('NUMEROS_COMANDAS'  ).AsInteger;

      ID_VENDEDOR          := CNX.TMP.FieldByName('ID_VENDEDOR'       ).AsInteger;
      ID_PRODUCTO          := CNX.TMP.FieldByName('ID_PRODUCTO'       ).AsInteger;
      ID_DECIMALES         := CNX.TMP.FieldByName('ID_DECIMALES'      ).AsInteger;
      ID_DECIMALES_TRM     := CNX.TMP.FieldByName('ID_DECIMALES_TRM'  ).AsInteger;
      MARGEN_UTILIDAD      := CNX.TMP.FieldByName('MARGEN_UTILIDAD'   ).AsFloat  ;
      TIPO_CODIGO_BARRAS   := Trim(CNX.TMP.FieldByName('TIPO_CODIGO_BARRAS').AsString);

      DIAS_PREAVISO        := CNX.TMP.FieldByName('DIAS_PREAVISO'  ).AsFloat;
      VALOR_DOMICILIO      := CNX.TMP.FieldByName('VALOR_DOMICILIO').AsFloat;

      ID_IMAGEN_VENTAS     := Trim(CNX.TMP.FieldByName('ID_IMAGEN_VENTAS' ).AsString);
      ID_IMAGEN_COMPRAS    := Trim(CNX.TMP.FieldByName('ID_IMAGEN_COMPRAS').AsString);
      DOCUMENTO_FACTURA    := Trim(CNX.TMP.FieldByName('DOCUMENTO_FACTURA').AsString);
      DOCUMENTO_COMPRA     := Trim(CNX.TMP.FieldByName('DOCUMENTO_COMPRA' ).AsString);
      TIPO_IMPRESORA       := Trim(CNX.TMP.FieldByName('TIPO_IMPRESORA'   ).AsString);
      PUERTO_IMPRESORA     := Trim(CNX.TMP.FieldByName('PUERTO_IMPRESORA' ).AsString);
      NOMBRE_IMPRESORA     := Trim(CNX.TMP.FieldByName('PUERTO_IMPRESORA' ).AsString);
      ID_CAMPO_DETALLE     := Trim(CNX.TMP.FieldByName('NOMBRE_IMPRESORA' ).AsString);

      ID_CAPTURA_RAPIDA     := Trim(CNX.TMP.FieldByName('ID_CAPTURA_RAPIDA'    ).AsString);
      ID_CALCULAR_COMPRA_RC := Trim(CNX.TMP.FieldByName('ID_CALCULAR_COMPRA_RC').AsString);
      ID_BUSQUEDA_C_N       := Trim(CNX.TMP.FieldByName('ID_BUSQUEDA_C_N'      ).AsString);
      ID_SINCRONIZAR_VISTAS := Trim(CNX.TMP.FieldByName('ID_SINCRONIZAR_VISTAS').AsString);
      ID_CONTROL_KARDEX     := Trim(CNX.TMP.FieldByName('ID_CONTROL_KARDEX'    ).AsString);
      ID_ELEGIR_IMPRESORA   := Trim(CNX.TMP.FieldByName('ID_ELEGIR_IMPRESORA'  ).AsString);
      ID_ORDEN_TOTALES      := Trim(CNX.TMP.FieldByName('ID_ORDEN_TOTALES'     ).AsString);
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E: Exception Do
      UtLog_Execute(CNX.APP_USERNAME, ['Origen', 'UtVariablesGlobales, Cargar_Configuracion_Avanzada', 'Error', E.Message]);
  End;
End;

Procedure TVariableGlobal.Cargar_Informacion_Global;
Begin
  Cargar_Configuracion_Avanzada;
  VERSION_DEMO := False;
  If VERSION_DEMO Then
  Begin
    ID_EMPRESA := 'ID: DEMO';
    NOMBRE_EMPRESA := 'NOMBRE: DEMO';
  End;
End;

Procedure TVariableGlobal.Cargar_Fecha_Global(pFecha : TDateTime);
Begin
  Fecha_Actual := Return_Type_Date(pFecha);
End;

Function TVariableGlobal.Retornar_Ruta_Programa : String;
Begin
  Result := Trim(IncludeTrailingBackslash(Trim(ExtractFilePath(Application.ExeName))));
End;

Procedure TVariableGlobal.UtVariablesGlobales_Actualizar_Valores;
Begin
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' UPDATE T1 ');
    CNX.TMP.SQL.Add(' SET T1.VALOR_BASE = T2.VALOR_BASE, T1.VALOR_NETO = T2.VALOR_NETO  ');
    CNX.TMP.SQL.Add(' FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' T1 ');
    CNX.TMP.SQL.Add(' INNER JOIN ');
    CNX.TMP.SQL.Add(' ( ');
    CNX.TMP.SQL.Add('   SELECT T3.TIPO_DOCUMENTO, T3.NUMERO_DOCUMENTO, SUM(T3.VALOR_BASE) AS VALOR_BASE, SUM(T3.VALOR_NETO) AS VALOR_NETO FROM ' + Retornar_Info_Tabla(Id_Documento_Det).Name + ' T3 ');
    CNX.TMP.SQL.Add('   INNER JOIN ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' T4 ON T4.TIPO_DOCUMENTO = T3.TIPO_DOCUMENTO AND  T4.NUMERO_DOCUMENTO = T3.NUMERO_DOCUMENTO ');
    CNX.TMP.SQL.Add('   GROUP BY T3.TIPO_DOCUMENTO, T3.NUMERO_DOCUMENTO ');
//  CNX.TMP.SQL.Add('   ORDER BY T3.NUMERO_DOCUMENTO DESC ');
    CNX.TMP.SQL.Add(' ) AS T2 ');
    CNX.TMP.SQL.Add(' ON T1.TIPO_DOCUMENTO = T2.TIPO_DOCUMENTO AND T1.NUMERO_DOCUMENTO = T2.NUMERO_DOCUMENTO ');
    CNX.TMP.ExecSQL;
    CNX.TMP.Active := False;

    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' UPDATE T1 ');
    CNX.TMP.SQL.Add(' SET T1.ID_ANULADO = T2.ID_ANULADO  ');
    CNX.TMP.SQL.Add(' FROM ' + Retornar_Info_Tabla(Id_Documento_Det).Name + ' T1 ');
    CNX.TMP.SQL.Add(' INNER JOIN ');
    CNX.TMP.SQL.Add(' ( ');
    CNX.TMP.SQL.Add('   SELECT T3.TIPO_DOCUMENTO, T3.NUMERO_DOCUMENTO, T3.ID_ANULADO FROM ' + Retornar_Info_Tabla(Id_Documento_Enc).Name + ' T3 ');
    CNX.TMP.SQL.Add('   INNER JOIN ' + Retornar_Info_Tabla(Id_Documento_Det).Name + ' T4 ON T4.TIPO_DOCUMENTO = T3.TIPO_DOCUMENTO AND  T4.NUMERO_DOCUMENTO = T3.NUMERO_DOCUMENTO ');
//    CNX.TMP.SQL.Add('   GROUP BY T3.TIPO_DOCUMENTO, T3.NUMERO_DOCUMENTO ');
//  CNX.TMP.SQL.Add('   ORDER BY T3.NUMERO_DOCUMENTO DESC ');
    CNX.TMP.SQL.Add(' ) AS T2 ');
    CNX.TMP.SQL.Add(' ON T1.TIPO_DOCUMENTO = T2.TIPO_DOCUMENTO AND T1.NUMERO_DOCUMENTO = T2.NUMERO_DOCUMENTO ');
    CNX.TMP.ExecSQL;


    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E: Exception Do
      UtLog_Execute(CNX.APP_USERNAME, ['Origen', 'UtVariablesGlobales_Actualizar_Valores', 'Error', E.Message]);
  End;
End;

Procedure TVariableGlobal.Cargar_Variables(pUsuario, pPerfil : String);
Begin
  Show_Splash;
  Cargar_Fecha_Global(Now);
  Actualiza__Splash('Cargando variables de trabajo...');
  If Not Vacio(pPerfil) Then
    Perfil_Actual := pPerfil;
  Usuario_Actual := pUsuario;
  RUTAPROGRAMA := Retornar_Ruta_Programa;
  RUTA_INFORMES := RUTAPROGRAMA + 'Informes\';
  Actualiza__Splash('Cargando ruta de informes de trabajo...');
  ForceDirectories(RUTA_INFORMES);
  Actualiza__Splash('Cargando información global de trabajo...');
  Cargar_Informacion_Global;
  Actualiza__Splash('Cargando información de estado de la caja...');
  Estado_Caja;
  Actualiza__Splash('Estableciendo menu de la caja...');
  Validar_Opciones_Caja;
  Actualiza__Splash('Estableciendo perfil de usuario...');
  Cargar_Permiso_App;
  Actualiza__Splash('Actualizando valores...');
  UtVariablesGlobales_Actualizar_Valores;
  Free_Splash;
End;

{ TVariableGlobal }
procedure TVariableGlobal.AfterConstruction;
begin
  inherited;
  CNX                      := TConexion.Create(Nil);
  VERSION                  := '2022.09.27.0';
  VALOR_TAG                := 0;
  Valor_TRM                := 0;
  APLICACION               := 'L.U.P.E.';
  APLICACION_POS           := 'L.U.P.E. POS';

  PERFIL_ACTUAL            := '';
  USUARIO_ACTUAL           := '';
  USUARIO_NOMBRE           := '';
  CAJA_ABIERTA             := False;

//FECHA_ACTUAL             := TFecha_Info;
  RUTAPROGRAMA             := '' ;
  RUTA_INFORMES            := '' ;
  VERSION_DEMO             := True;

  EMPRESA_ACTUAL           := '';
  ID_EMPRESA               := '';
  NOMBRE_EMPRESA           := '';
  DIRECCION_EMPRESA        := '';
  TELEFONO_EMPRESA         := '';
  MUNICIPIO_EMPRESA        := '';
  DEPARTAMENTO_EMPRESA     := '';
  PAIS_EMPRESA             := '';

  NOMBRE_FUENTE            := '';
  TAMANO_FUENTE            := 00;
  TAMANO_LINEA             := 00;

  ENCABEZADO               := TStringList.Create;
  PIE_PAGINA               := TStringList.Create;

  ID_MONEDA                := '$';
  ID_STOCK                 := 'N';
  ID_F_VENCIMIENTO         := 'N';
  ID_ABRIR_CAJA            := 'N';
  ID_AGRUPAR_PRODUCTO      := 'N';
  ID_CORTAR_TIRILLA        := 'N';
  ID_ORDEN_Z               := 'N';
  ID_CODIGO_PRODUCTO       := 'N';
  ID_CODIGO_BARRAS         := 'N';
  ID_COMANDA_FACTURA       := 'N';
  ID_CAMPO_DETALLE         := 'N';
  ID_PEDIR_VENDEDOR        := 'N';
  ID_ELEGIR_IMPRESORA      := 'N';
  ID_ORDEN_TOTALES         := '';

  IMAGEN_WIDTH             := 00;
  IMAGEN_HEIGHT            := 00;
  FONT_SIZE_A              := 00;
  FONT_SIZE_B              := 00;
  NUMEROS_COMANDAS         := 00;

  ID_VENDEDOR              := 00;
  ID_PRODUCTO              := 00;
  ID_DECIMALES             := -2;
  MARGEN_UTILIDAD          := 00;
  VALOR_DOMICILIO          := 00;
  ID_DECIMALES_TRM         := -2;
  ID_FORMATO_TIRILLA       := 'N';
  ID_EDITAR_VALORES        := 'N';
  ID_USUARIO_ADMINISTRADOR := 'N';
  TIPO_CODIGO_BARRAS       := '' ;

  NO_CANCELAR_DOCUMENTO    := 'N';
  NO_ELIMINAR_DETALLE      := 'N';

  DIAS_PREAVISO            := 0;

  ID_CAPTURA_RAPIDA        := 'N';
  ID_CALCULAR_COMPRA_RC    := 'N';
  ID_BUSQUEDA_C_N          := 'N';
  ID_SINCRONIZAR_VISTAS    := 'N';
  ID_CONTROL_KARDEX        := 'N';

  ID_IMAGEN_VENTAS         := 'G';
  ID_IMAGEN_COMPRAS        := 'G';

  FILENAME_SETTING         := 'Lupe';

  DOCUMENTO_FACTURA        := '';
  DOCUMENTO_COMPRA         := '';
  TIPO_IMPRESORA           := '';
  PUERTO_IMPRESORA         := '';
  NOMBRE_IMPRESORA         := '';

  USUARIO_ADMIN            := '';

  LOGOTIPO                 := TImage.Create(Nil);
  SERVICIO_MANUAL          := 'N';

  PERMISOS_APP             := [
                                'EDITAR_VALORES',
                                'USUARIO_ADMINISTRADOR',
                                'NO_CANCELAR_DOCUMENTO',
                                'NO_ELIMINAR_DETALLE',
                                'SERVICIO_MANUAL'
                              ];
end;

procedure TVariableGlobal.BeforeDestruction;
begin
  If Assigned(LOGOTIPO) Then
    FreeAndNil(LOGOTIPO);
  If Assigned(PIE_PAGINA) Then
    FreeAndNil(PIE_PAGINA);
  If Assigned(ENCABEZADO) Then
    FreeAndNil(ENCABEZADO);
  If Assigned(CNX) Then
  Begin
    CNX.Disconnect;
    FreeAndNil(CNX);
  End;
  inherited;
end;

Initialization
  gVariableGlobal := TVariableGlobal.Create;

Finalization
  If Assigned(gVariableGlobal) Then
    FreeAndNil(gVariableGlobal);

end.

