unit Form_Administrar_Espacio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, CheckLst, Buttons, Generics.Collections,
  UtConexion, UtFormularios;

type
  TEspacio = Class
    Codigo_Zona    : String;
    Codigo_Espacio : String;
    Nombre_Zona    : String;
    Nombre_Espacio : String;
  End;

  TFrAdministrar_Espacio = class(TObjForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pnlInfo: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ORIGEN: TCheckListBox;
    DESTINO: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Function Ha_Seleccionado(pSender : TObject) : Boolean;
    Procedure Cargar_Espacios;
    Function Recibir_Espacios(pIndex : Integer; pDataKey : String; pSQL : TQuery) : Boolean;
    Function Trasladar_Espacios_Origen : Boolean;
  public
    { Public declarations }
  end;

var
  FrAdministrar_Espacio: TFrAdministrar_Espacio;
  Function Show_Form_Administrar_Espacio : Boolean;

implementation
{$R *.dfm}
Uses
  DB,
  UtBoton,
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtEspacioBoton,
  UtCentral_Ventas,
  UtCerrar_Documento,
  UtVariablesGlobales,
  UtCalculo_Impuestos;

procedure TFrAdministrar_Espacio.BitBtn1Click(Sender: TObject);
begin
  If Not Ha_Seleccionado(ORIGEN) Then
  Begin
    Mensajes('Debe seleccionar un espacio de origen');
    Exit;
  End;

  If Not Ha_Seleccionado(DESTINO) Then
  Begin
    Mensajes('Debe seleccionar un espacio de destino');
    Exit;
  End;
  gVariableGlobal.CNX.BeginTrans;
  If Trasladar_Espacios_Origen Then
  Begin
    gVariableGlobal.CNX.CommitTrans;
    Mensajes('Proceso terminado exitosamente');
  End
  Else
  Begin
    gVariableGlobal.CNX.RollbackTrans;
    Mensajes('Proceso no terminado exitosamente');
  End;
end;


Procedure TFrAdministrar_Espacio.Cargar_Espacios;
Var
  lO : TEspacio;
  lD : TEspacio;
Begin
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    CNX.TMP.SQL.Add(' SELECT * FROM  ' + Retornar_Info_Tabla(Id_Espacio).Name + ' ');
    CNX.TMP.SQL.Add(' ORDER BY CODIGO_ZONA, CODIGO_ESPACIO ');
    CNX.TMP.Active := True ;
    If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
    Begin
      CNX.TMP.First;
      While Not CNX.TMP.Eof Do
      Begin
        lO := TEspacio.Create;
        lD := TEspacio.Create;

        lO.Codigo_Zona    := CNX.TMP.FieldByName('CODIGO_ZONA'   ).AsString;
        lO.Codigo_Espacio := CNX.TMP.FieldByName('CODIGO_ESPACIO').AsString;
        lO.Nombre_Zona    := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Zona).Name, ['CODIGO_ZONA'], [lO.Codigo_Zona], ['NOMBRE'], 'TFrAdministrar_Espacio.Cargar_Espacios') + ', ' +
                             FormatFloat('###,###,###,##0.#0', CNX.TMP.FieldByName('TOTAL').AsFloat) ;
        lO.Nombre_Espacio := CNX.TMP.FieldByName('NOMBRE'        ).AsString;

        lD.Codigo_Zona    := CNX.TMP.FieldByName('CODIGO_ZONA'   ).AsString;
        lD.Codigo_Espacio := CNX.TMP.FieldByName('CODIGO_ESPACIO').AsString;
        lD.Nombre_Zona    := lO.Nombre_Zona                             ;
        lD.Nombre_Espacio := CNX.TMP.FieldByName('NOMBRE'        ).AsString;

        ORIGEN.Items.AddObject (Trim(lO.Nombre_Zona) + ',' + Trim(lO.Nombre_Espacio), lO);
        DESTINO.Items.AddObject(Trim(lD.Nombre_Zona) + ',' + Trim(lD.Nombre_Espacio), lD);

        CNX.TMP.Next;
      End;
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E : Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrAdministrar_Espacio.Cargar_Espacios']);
  End;
End;

Function TFrAdministrar_Espacio.Recibir_Espacios(pIndex : Integer; pDataKey : String; pSQL : TQuery) : Boolean;
Var
  lI : Integer;
  lNext : String;
  lDatakey : String;
Begin
  Result := True;
  If TEspacio(DESTINO.Items.Objects[DESTINO.ItemIndex]).Codigo_Espacio = TEspacio(ORIGEN.Items.Objects[pIndex]).Codigo_Espacio Then
    Exit;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    lDatakey := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, ['CODIGO_ESPACIO'], [TEspacio(DESTINO.Items.Objects[DESTINO.ItemIndex]).Codigo_Espacio], ['DATAKEY'], 'TFrAdministrar_Espacio.Recibir_Espacios');
    If Vacio(lDatakey) Then
    Begin
      UtCentral_Ventas_Abrir_Archivo_Maestro(CNX.TMP, Const_Documento_Factura, TEspacio(DESTINO.Items.Objects[DESTINO.ItemIndex]).Codigo_Espacio, lDatakey, False);
    End;

    If Not Vacio(lDatakey) Then
    Begin
      CNX.TMP.Active := False;
      CNX.TMP.SQL.Clear;
      CNX.TMP.SQL.Add(' SELECT * FROM  ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
      CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(lDatakey)));
      CNX.TMP.Active := True ;
      If CNX.TMP.Active Then
      Begin
        CNX.TMP.Append;
        For lI := 0 To CNX.TMP.Fields.Count-1 Do
          CNX.TMP.FieldByName(CNX.TMP.Fields[lI].FullName).AsVariant := pSQL.FieldByName(CNX.TMP.Fields[lI].FullName).AsVariant;
        CNX.TMP.FieldByName('DATAKEY').AsString := lDatakey;
        lNext := gVariableGlobal.CNX.Next(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, '0', ['CONSECUTIVO'], ['DATAKEY'], [lDatakey], CNX.TMP.FieldByName('CONSECUTIVO').Size);
        CNX.TMP.FieldByName('CONSECUTIVO').AsString := lNext;
        CNX.TMP.Post;
      End;
      CNX.TMP.Active := False;
      CNX.TMP.SQL.Clear;
      Result := Calcular_Detalles_Documento(Id_Documento_Enc_Aux, Id_Documento_Det_Aux, lDatakey);
      If Result Then
        Result := Actualizar_Estado_Espacio(TEspacio(ORIGEN.Items.Objects[pIndex]).Codigo_Espacio, Const_Abrev_Disponible);
      If Result Then
        Result := Actualizar_Estado_Espacio(TEspacio(DESTINO.Items.Objects[DESTINO.ItemIndex]).Codigo_Espacio, Const_Abrev_Ocupado);
      If Result Then
        Result := Inicializar_Documento(Id_Documento_Enc_Aux, Id_Documento_Det_Aux, Id_Documento_Rec_Aux, Id_Documento_Obs_Aux, pDataKey);
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E : Exception Do
    Begin
      Result := False;
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrAdministrar_Espacio.Recibir_Espacios']);
    End;
  End;
End;

Function TFrAdministrar_Espacio.Ha_Seleccionado(pSender : TObject) : Boolean;
Var
  lI : Integer;
Begin
  Result := False;
  If pSender Is TCheckListBox Then
  Begin
    lI := 0;
    While (lI < (pSender As TCheckListBox).Items.Count) And (Not Result) Do
    Begin
      Result := (pSender As TCheckListBox).Checked[lI];
      Inc(lI);
    End;
  End
  Else
    If pSender Is TListBox Then
    Begin
      Result := (pSender As TListBox).ItemIndex > -1;
    End;
End;


Function TFrAdministrar_Espacio.Trasladar_Espacios_Origen : Boolean;
Var
  lI : Integer;
  lO : TQuery;
  lDatakey : String;
Begin
  Result := True;
  Try
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
    For lI := 0 To ORIGEN.Items.Count-1 Do
    Begin
      If ORIGEN.Checked[lI] Then
      Begin
        lDatakey := gVariableGlobal.CNX.Retornar_String(Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name, ['CODIGO_ESPACIO'], [TEspacio(ORIGEN.Items.Objects[lI]).Codigo_Espacio], ['DATAKEY'], 'TFrAdministrar_Espacio.Trasladar_Espacios_Origen');
        If Not Vacio(lDatakey) Then
        Begin
          CNX.TMP.SQL.Clear;
          CNX.TMP.SQL.Add(' SELECT * FROM  ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
          CNX.TMP.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('DATAKEY') + ' = ' + QuotedStr(Trim(lDatakey)));
          CNX.TMP.Active := True ;
          If CNX.TMP.Active And (CNX.TMP.RecordCount > 0) Then
          Begin
            CNX.TMP.First;
            While (Not CNX.TMP.Eof) And Result Do
            Begin
              Result := Recibir_Espacios(lI, lDatakey, lO);
              CNX.TMP.Next;
            End;
          End;
          CNX.TMP.Active := False;
          CNX.TMP.SQL.Clear;
        End;
      End;
    End;
    CNX.TMP.Active := False;
    CNX.TMP.SQL.Clear;
  Except
    On E : Exception Do
    Begin
      Result := False;
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrAdministrar_Espacio.Trasladar_Espacios_Origen']);
    End;
  End;
End;

procedure TFrAdministrar_Espacio.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If (ModalResult = MrOk) And CanClose Then
  Begin
//    If Not Valida_Mesas_Seleccionadas Then
//    Begin
//      Mensajes('No Hay Mesas Seleccionadas Para Realizar La Operación' + #13 + 'Por Favor Seleccione Una Mesa');
//      CanClose := False;
//    End
//    Else
//    Begin
//      CanClose := Confirma_Mesas_Seleccionadas;
//      If CanClose Then
//        Trasladar_Servicios;
//    End;
  End;
end;

procedure TFrAdministrar_Espacio.FormCreate(Sender: TObject);
begin
  Caption := 'Traslado y unión entre mesas';
  pnlInfo.Caption := '';
  gVariableGlobal.SetSetting(Self);
end;

procedure TFrAdministrar_Espacio.FormDestroy(Sender: TObject);
Var
  lI : Integer;
begin
  For lI := 0 To ORIGEN.Items.Count-1 Do
    If ORIGEN.Items.Objects[lI] <> Nil Then
       TEspacio(ORIGEN.Items.Objects[lI]).Free;

  For lI := 0 To DESTINO.Items.Count-1 Do
    If DESTINO.Items.Objects[lI] <> Nil Then
       TEspacio(DESTINO.Items.Objects[lI]).Free;
  DESTINO.Items.Clear;
  ORIGEN.Items.Clear;
end;

Function Show_Form_Administrar_Espacio : Boolean;
Begin
  Result := False;
  FrAdministrar_Espacio := TFrAdministrar_Espacio.Create(Nil);
  FrAdministrar_Espacio.Cargar_Espacios;
  Result := FrAdministrar_Espacio.ShowModal = mrOk;
  FrAdministrar_Espacio.Free;
End;

end.

