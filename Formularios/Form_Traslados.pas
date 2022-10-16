unit Form_Traslados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, CheckLst, Buttons, Gauges;

type
  TFrTraslados = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pnlInfo: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ORIGEN: TCheckListBox;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure pfZona_DestinoChange(Sender: TObject);
  private
    { Private declarations }
    Function Valida_Mesas_Seleccionadas : Boolean;
    Function Confirma_Mesas_Seleccionadas : Boolean;
    Procedure Inicializar_Origen(pOperacion : Char);
    Function Trasladar_Servicios : Boolean;
    Procedure Cargar_Zonas_Disponibles;
    Procedure Cargar_Informacion_Destino;
    Function Cargar_Informacion_Mesas(pZona : String; pOperacion : Char) : Boolean;
  public
    { Public declarations }
  end;

var
  FrTraslados: TFrTraslados;
  Function Show_Form_Traslados(pZona : String; pOperacion : Char) : Boolean;

implementation
{$R *.dfm}
Uses
  DB,
  UtConexion,
  UtBoton,
  UtConexion,
  
  UtFunciones,
  UtException,
  UtConstantes,
  UtInfoTablas,
  UtHomologacion,
  UtVariablesGlobales;

Procedure TFrTraslados.Inicializar_Origen(pOperacion : Char);
Var
  lI : Integer;
  lJ : Integer;
  lMesa_OrigenSQL : TQuery;
  lMesa_DestinoSQL : TQuery;
  lServicio : TQuery;
  lMesa_Origen : String;
  lMesa_Destino : String;
Begin
  Try
    lServicio := TQuery.Create(Nil);
    lMesa_OrigenSQL := TQuery.Create(Nil);
    lMesa_DestinoSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lServicio);
    Configurar_Conexion_Segura(lMesa_OrigenSQL);
    Configurar_Conexion_Segura(lMesa_DestinoSQL);
    lMesa_Destino := Retornar_Texto_Intermedio(pfMesa_Destino.Items[pfMesa_Destino.ItemIndex], '[', ']');
    For lI := 0 To pfMesas_Disponibles.Items.Count-1 Do
    Begin
      pfProgreso.Progress := lI;
      pnlInfo.Caption := pfMesas_Disponibles.Items[lI];
      lMesa_Origen := Retornar_Texto_Intermedio(pfMesas_Disponibles.Items[lI], '[', ']');
      If pfMesas_Disponibles.Checked[lI] And (lMesa_Origen <> lMesa_Destino) Then
      Begin
        lServicio.Active := False;
        lServicio.SQL.Clear;
        lServicio.SQL.Add(' DELETE FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name  + ' ');
        lServicio.SQL.Add(' WHERE CODIGO_MESA = '  + #39 + lMesa_Origen + #39 + ' ');
        lServicio.ExecSQL;
        lServicio.Active := False;

        lServicio.Active := False;
        lServicio.SQL.Clear;
        lServicio.SQL.Add(' DELETE FROM ' + Retornar_Info_Tabla(Id_Documento_Enc_Aux).Name + ' ');
        lServicio.SQL.Add(' WHERE CODIGO_MESA = '  + #39 + lZona_Origen + #39 + ' ');
        lServicio.ExecSQL;
        lServicio.Active := False;

        lMesa_OrigenSQL.Active := False;
        lMesa_OrigenSQL.SQL.Clear;
        lMesa_OrigenSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Espacio).Name + ' ');
        lMesa_OrigenSQL.SQL.Add(' WHERE CODIGO_MESA = '  + #39 + lMesa_Origen + #39 + ' ');
        lMesa_OrigenSQL.Active := True;

        If pOperacion = 'P' Then
        Begin
          lMesa_DestinoSQL.Active := False;
          lMesa_DestinoSQL.SQL.Clear;
          lMesa_DestinoSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Espacio).Name + ' ');
          lMesa_DestinoSQL.SQL.Add(' WHERE CODIGO_MESA = '  + #39 + lMesa_Destino + #39 + ' ');
          lMesa_DestinoSQL.Active := True;
          If lMesa_OrigenSQL.Active And lMesa_DestinoSQL.Active Then
          Begin
            lMesa_DestinoSQL.Edit;
            For lJ := 0 To lMesa_DestinoSQL.FieldCount-1 Do
            Begin
              If (Pos(AnsiUpperCase(Trim('CODIGO_ESTACION')), AnsiUpperCase(Trim(lMesa_OrigenSQL.Fields[lJ].FullName ))) <= 0) And
                 (Pos(AnsiUpperCase(Trim('CODIGO_ZONA'    )), AnsiUpperCase(Trim(lMesa_DestinoSQL.Fields[lJ].FullName))) <= 0) And
                 (Pos(AnsiUpperCase(Trim('CODIGO_MESA'    )), AnsiUpperCase(Trim(lMesa_DestinoSQL.Fields[lJ].FullName))) <= 0) And
                 (Pos(AnsiUpperCase(Trim('NOMBRE     '    )), AnsiUpperCase(Trim(lMesa_DestinoSQL.Fields[lJ].FullName))) <= 0) And
                 (Pos(AnsiUpperCase(Trim('POSICION_X '    )), AnsiUpperCase(Trim(lMesa_DestinoSQL.Fields[lJ].FullName))) <= 0) And
                 (Pos(AnsiUpperCase(Trim('POSICION_Y '    )), AnsiUpperCase(Trim(lMesa_DestinoSQL.Fields[lJ].FullName))) <= 0) Then
                lMesa_DestinoSQL.FieldByName(lMesa_DestinoSQL.Fields[lJ].FullName).AsString := lMesa_OrigenSQL.FieldByName(lMesa_DestinoSQL.Fields[lJ].FullName).AsString;
            End;
            lMesa_DestinoSQL.FieldByName('ESTADO').AsString := Const_Abrev_Ocupado;
            lMesa_DestinoSQL.Post;
          End;
        End;

        If lMesa_OrigenSQL.Active Then
        Begin
          lMesa_OrigenSQL.Edit;
          For lJ := 0 To lMesa_OrigenSQL.FieldCount-1 Do
          Begin
            If (Pos(AnsiUpperCase(Trim('CODIGO_ESTACION')),  AnsiUpperCase(Trim(lMesa_OrigenSQL.Fields[lJ].FullName))) <= 0) And
               (Pos(AnsiUpperCase(Trim('CODIGO_ZONA'    )),  AnsiUpperCase(Trim(lMesa_OrigenSQL.Fields[lJ].FullName))) <= 0) And
               (Pos(AnsiUpperCase(Trim('CODIGO_MESA'    )),  AnsiUpperCase(Trim(lMesa_OrigenSQL.Fields[lJ].FullName))) <= 0) And
               (Pos(AnsiUpperCase(Trim('NOMBRE     '    )),  AnsiUpperCase(Trim(lMesa_OrigenSQL.Fields[lJ].FullName))) <= 0) And
               (Pos(AnsiUpperCase(Trim('ESTADO     '    )),  AnsiUpperCase(Trim(lMesa_OrigenSQL.Fields[lJ].FullName))) <= 0) And
               (Pos(AnsiUpperCase(Trim('POSICION_X '    )),  AnsiUpperCase(Trim(lMesa_OrigenSQL.Fields[lJ].FullName))) <= 0) And
               (Pos(AnsiUpperCase(Trim('POSICION_Y '    )),  AnsiUpperCase(Trim(lMesa_OrigenSQL.Fields[lJ].FullName))) <= 0) Then
              lMesa_OrigenSQL.Fields[lJ].AsString := EmptyStr;
          End;
         lMesa_OrigenSQL.FieldByName('ESTADO').AsString := Const_Abrev_Disponible;
         lMesa_OrigenSQL.Post;
        End;
        lMesa_OrigenSQL.Active := False;
        lMesa_OrigenSQL.SQL.Clear;
      End;
    End;
    lServicio.Active := False;
    lServicio.Free;
    lServicio := Nil;
    lMesa_DestinoSQL.Active := False;
    lMesa_DestinoSQL.Free;
    lMesa_DestinoSQL := Nil;
    lMesa_OrigenSQL.Active := False;
    lMesa_OrigenSQL.Free;
    lMesa_OrigenSQL := Nil;
  Except
    On E : Exception Do
      Ingresar_Inconsistencias(E, 'TFrTraslados.Inicializar_Origen', ''); 
  End;
End;

procedure TFrTraslados.pfZona_DestinoChange(Sender: TObject);
begin
  Cargar_Informacion_Destino;
end;

Function TFrTraslados.Trasladar_Servicios : Boolean;
Var
  lI : Integer;
  lJ : Integer;
  lOrigenSQL : TQuery;
  lDestinoSQL : TQuery;
  lMesa_Origen : String;
  lConsecutivo : String;
  lMesa_Destino : String;
Begin
  Try
    Result := False;
    lMesa_Destino := Retornar_Texto_Intermedio(pfMesa_Destino.Items[pfMesa_Destino.ItemIndex], '[', ']');
    If Vacio(lZona_Destino) Then
      lZona_Destino := Retornar_Texto_Intermedio(pfZona_Destino.Items[pfZona_Destino.ItemIndex], '[', ']');
    lOrigenSQL := TQuery.Create(Nil);
    lDestinoSQL := TQuery.Create(Nil);
    Configurar_Conexion_Segura(lOrigenSQL);
    Configurar_Conexion_Segura(lDestinoSQL);
    lDestinoSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
    lDestinoSQL.SQL.Add(' WHERE CODIGO_ZONA = '  + #39 + lZona_Destino + #39 + ' ');
    lDestinoSQL.SQL.Add(' AND   CODIGO_MESA = '  + #39 + lMesa_Destino + #39 + ' ');
    lDestinoSQL.Active := True;
    If lDestinoSQL.Active Then
    Begin
      pfProgreso.MinValue := 0;
      pfProgreso.MaxValue :=  pfMesas_Disponibles.Items.Count-1;
      For lI := 0 To pfMesas_Disponibles.Items.Count-1 Do
      Begin
        pfProgreso.Progress := lI;
        pnlInfo.Caption := pfMesas_Disponibles.Items[lI];
        lMesa_Origen := Retornar_Texto_Intermedio(pfMesas_Disponibles.Items[lI], '[', ']');
        If pfMesas_Disponibles.Checked[lI] And (lMesa_Origen <> lMesa_Destino) Then
        Begin
          lOrigenSQL.Active := False;
          lOrigenSQL.SQL.Clear;
          lOrigenSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det_Aux).Name + ' ');
          lOrigenSQL.SQL.Add(' WHERE DATAKEY = '  + #39 + lZona_Origen + #39 + ' ');
          lOrigenSQL.Active := True;
          If lOrigenSQL.Active Then
          Begin
            lOrigenSQL.First;
            While Not lOrigenSQL.Eof Do
            Begin
              lConsecutivo := Retornar_Siguiente(Retornar_Info_Tabla(Id_Documento_Det_Aux).Name, ['DATAKEY'],  lZona_Destino, lMesa_Destino, '', Retornar_Info_Tabla(Id_Factura_Det).Name);
              lDestinoSQL.Append;
              For lJ := 0 To lOrigenSQL.FieldCount-1 Do
                Case lOrigenSQL.Fields[lJ].DataType Of
                  ftString     ,
                  ftWideString : Begin
                                   lDestinoSQL.FieldByName(lOrigenSQL.Fields[lJ].FullName).AsString := lOrigenSQL.Fields[lJ].AsString;
                                 End;
                  ftWord        ,
                  ftInteger     : Begin
                                    lDestinoSQL.FieldByName(lOrigenSQL.Fields[lJ].FullName).AsInteger := lOrigenSQL.Fields[lJ].AsInteger;
                                  End;
                  ftFloat       ,
                  ftCurrency    : Begin
                                    lDestinoSQL.FieldByName(lOrigenSQL.Fields[lJ].FullName).AsFloat := lOrigenSQL.Fields[lJ].AsFloat;
                                  End;
                  Else
                  Begin
                    lDestinoSQL.FieldByName(lOrigenSQL.Fields[lJ].FullName).AsVariant := lOrigenSQL.Fields[lJ].AsVariant;
                  End;
                End;


              lDestinoSQL.FieldByName('CODIGO_ESTACION').AsString := gCodigo_Estacion;
              lDestinoSQL.FieldByName('CONSECUTIVO'    ).AsString := lConsecutivo;
              lDestinoSQL.FieldByName('CODIGO_ZONA'    ).AsString := lZona_Destino;
              lDestinoSQL.FieldByName('CODIGO_MESA'    ).AsString := lMesa_Destino;
              lDestinoSQL.Post;
              lOrigenSQL.Next;
              Result := True;
            End;
          End;
          lOrigenSQL.Active := False;
        End;
      End;
      pfProgreso.Progress := 0;
    End;

    lDestinoSQL.Active := False;
    lOrigenSQL.Active := False;

    lDestinoSQL.Free;
    lOrigenSQL.Free;

    lDestinoSQL := Nil;
    lOrigenSQL := Nil;

    If Result Then
      Inicializar_Origen(lOperacion);

    Mensajes('Proceso terminado');
  Except
    On E : Exception Do
      Ingresar_Inconsistencias(E, 'TFrTraslados.Trasladar_Servicios', '');
  End;
End;

Function TFrTraslados.Valida_Mesas_Seleccionadas : Boolean;
Var
  lI : Integer;
Begin
  lI := 0;
  Result := False;
  While (lI < pfMesas_Disponibles.Items.Count) And (Not Result) Do
  Begin
    Result := pfMesas_Disponibles.Checked[lI];
    Inc(lI);
  End;
End;

Function TFrTraslados.Confirma_Mesas_Seleccionadas : Boolean;
Var
  lI : Integer;
  lOrigen : String;
  lDestino : String;
Begin
  lI := 0;
  lOrigen := '';
  lDestino := '';
  Result := False;
  While (lI < pfMesas_Disponibles.Items.Count) Do
  Begin
    If pfMesas_Disponibles.Checked[lI] Then
      If Vacio(lOrigen) Then
        lOrigen := Retornar_Texto_Intermedio(pfMesas_Disponibles.Items[lI], '[')
      Else
        lOrigen := lOrigen + ', ' + Retornar_Texto_Intermedio(pfMesas_Disponibles.Items[lI], '[');
    Inc(lI);
  End;
  lDestino := 'Zona ' + Retornar_Texto_Intermedio(pfZona_Destino.Text, '[') + ' - ' +
              'Mesa ' + Retornar_Texto_Intermedio(pfMesa_Destino.Text, '[') ;
  Result := SiNo('Mesa(s) de Origen: ' + lOrigen + #13 +
                 'Datos de Destino: ' + lDestino + #13 + #13 +
                 'Está Seguro(a) de Esta Información?');

End;

procedure TFrTraslados.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If (ModalResult = MrOk) And CanClose Then
  Begin
    If Not Valida_Mesas_Seleccionadas Then
    Begin
      Mensajes('No Hay Mesas Seleccionadas Para Realizar La Operación' + #13 + 'Por Favor Seleccione Una Mesa');
      CanClose := False;
    End
    Else
    Begin
      CanClose := Confirma_Mesas_Seleccionadas;
      If CanClose Then
        Trasladar_Servicios;
    End;
  End;
end;

procedure TFrTraslados.FormCreate(Sender: TObject);
begin
  Caption := 'Traslado y unión entre mesas';
  pnlInfo.Caption := '';
end;

Procedure TFrTraslados.Cargar_Zonas_Disponibles;
Var
  lSQL : TQuery;
Begin
  Try
    pfZona_Destino.Items.Clear;
    pfZona_Destino.Items.Clear;
    pfZona_Destino.Sorted := False;
    pfZona_Destino.Sorted := False;
    lSQL := TQuery.Create(Nil);
    lSQL.SQL.Clear;
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT * FROM  ' + Retornar_Info_Tabla(Id_Zona).Name  + ' ');
    lSQL.Active := True ;
    If lSQL.Active And (lSQL.RecordCount > 0) Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        pfZona_Destino.Items.Add(Trim(lSQL.FieldByName('NOMBRE').AsString) + '[' + Trim(lSQL.FieldByName('CODIGO_ZONA').AsString)+ ']');
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    lSQL.SQL.Clear;
    lSQL.Free;
    lSQL := Nil;
    If pfZona_Destino.Items.Count > 0 Then
      pfZona_Destino.ItemIndex := 0;
  Except
    On E : Exception Do
      Ingresar_Inconsistencias(E, 'TFrTraslados.Cargar_Zonas_Disponibles', '');
  End;

End;

Procedure TFrTraslados.Cargar_Informacion_Destino;
Var
  lSQL : TQuery;
Begin
  If pfZona_Destino.ItemIndex <= -1 Then
    Exit;
  Try
    lZona_Destino := Retornar_Texto_Intermedio(pfZona_Destino.Items[pfZona_Destino.ItemIndex], '[', ']');
    pfMesa_Destino.Items.Clear;
    pfMesa_Destino.Sorted := False;
    lSQL := TQuery.Create(Nil);
    lSQL.SQL.Clear;
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT * FROM  ' + Retornar_Info_Tabla(Id_Espacio).Name + ' ');
    lSQL.SQL.Add(' WHERE CODIGO_ZONA = ' + #39 + lZona_Destino + #39 + ' ');
    lSQL.Active := True ;
    If lSQL.Active And (lSQL.RecordCount > 1) Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        Case lOperacion Of
          'P' : Begin
                  If (Trim(lSQL.FieldByName('ESTADO').AsString) = 'D') Then
                    pfMesa_Destino.Items.Add(Trim(lSQL.FieldByName('NOMBRE').AsString) + '[' + Trim(lSQL.FieldByName('CODIGO_MESA').AsString)+ ']');
                End;
          'U' : Begin
                  If (Trim(lSQL.FieldByName('ESTADO').AsString) = 'O') Then
                    pfMesa_Destino.Items.Add(Trim(lSQL.FieldByName('NOMBRE').AsString) + '[' + Trim(lSQL.FieldByName('CODIGO_MESA').AsString)+ ']');
                End;
        End;
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    lSQL.SQL.Clear;
    lSQL.Free;
    lSQL := Nil;
    If pfMesa_Destino.Items.Count > 0 Then
      pfMesa_Destino.ItemIndex := 0;
  Except
    On E : Exception Do
      Ingresar_Inconsistencias(E, 'TFrTraslados.Cargar_Informacion_Destino', '');
  End;
End;

Function TFrTraslados.Cargar_Informacion_Mesas(pZona : String; pOperacion : Char) : Boolean;
Var
  lSQL : TQuery;
Begin
  Cargar_Zonas_Disponibles;
  Result := False;
  lZona_Origen := pZona;
  lOperacion := pOperacion;
  Try
    pfMesa_Destino.Items.Clear;
    pfMesas_Disponibles.Items.Clear;
    pfMesa_Destino.Sorted := False;
    pfMesas_Disponibles.Sorted := False;
    lSQL := TQuery.Create(Nil);
    lSQL.SQL.Clear;
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Add(' SELECT * FROM  ' + Retornar_Info_Tabla(Id_Espacio).Name + ' ');
    lSQL.SQL.Add(' WHERE CODIGO_ZONA = ' + #39 + pZona + #39 + ' ');
    lSQL.Active := True ;
    If lSQL.Active And (lSQL.RecordCount > 1) Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        Result := True;
        Case pOperacion Of
          'P' : Begin
                  If (Trim(lSQL.FieldByName('ESTADO').AsString) = 'O') Then
                    pfMesas_Disponibles.Items.Add(Trim(lSQL.FieldByName('NOMBRE').AsString) + '[' + Trim(lSQL.FieldByName('CODIGO_MESA').AsString)+ ']');

                  If (Trim(lSQL.FieldByName('ESTADO').AsString) = 'D') Then
                    pfMesa_Destino.Items.Add(Trim(lSQL.FieldByName('NOMBRE').AsString) + '[' + Trim(lSQL.FieldByName('CODIGO_MESA').AsString)+ ']');

                End;
          'U' : Begin
                  If (Trim(lSQL.FieldByName('ESTADO').AsString) = 'O') Then
                    pfMesa_Destino.Items.Add(Trim(lSQL.FieldByName('NOMBRE').AsString) + '[' + Trim(lSQL.FieldByName('CODIGO_MESA').AsString)+ ']');
                  If (Trim(lSQL.FieldByName('ESTADO').AsString) = 'O') Then
                    pfMesas_Disponibles.Items.Add(Trim(lSQL.FieldByName('NOMBRE').AsString) + '[' + Trim(lSQL.FieldByName('CODIGO_MESA').AsString)+ ']');
                End;
        End;
        lSQL.Next;
      End;
    End;
    lSQL.Active := False;
    lSQL.SQL.Clear;
    lSQL.Free;
    lSQL := Nil;

    If pfMesa_Destino.Items.Count > 0 Then
      pfMesa_Destino.ItemIndex := 0;

    If pfMesas_Disponibles.Items.Count > 0 Then
      pfMesas_Disponibles.ItemIndex := 0;
  Except
    On E : Exception Do
      Ingresar_Inconsistencias(E, 'Cargar_Informacion_Mesas', '');
  End;
End;

Function Show_Form_Traslados(pZona : String; pOperacion : Char) : Boolean;
Begin
  Result := False;
  FrTraslados := TFrTraslados.Create(Nil);
  If FrTraslados.Cargar_Informacion_Mesas(pZona, pOperacion) Then
    Result := FrTraslados.ShowModal = mrOk;
  FrTraslados.Free;
End;

end.

