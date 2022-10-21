unit Form_Lista_Precio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Generics.Collections, ovcbase, ovctcmmn, ovctable, Buttons;

type
  TInfo_Lista_Precio = Class
    CODIGO_TERCERO_LP   : String;
    CODIGO_PRODUCTO     : String;
    RANGO_INI           : Double;
    RANGO_FIN           : Double;
    VALOR_ORIGINAL      : Double;
    PORCENTAJE_UTILIDAD : Double;
    VALOR_VENTA         : Double;
  End;

  TFrLista_Precio = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Detalle: TOvcTable;
    BtnSalir: TSpeedButton;
    BtnEliminar: TSpeedButton;
    BtnGrabar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnGrabarClick(Sender: TObject);
  private
    { Private declarations }
    FCODIGO_PRODUCTO : String;
    FLISTA_PRECIO : TList<TInfo_Lista_Precio>;
    Procedure Inicializar_Lista_Precio(pLista : TList<TInfo_Lista_Precio>);
    Function Calcular_Detalle(pReg : TInfo_Lista_Precio) : Boolean;
    Function Fila_Valida_Detalle(pReg : TInfo_Lista_Precio) : Boolean;
    Function Validar_Registros(pLista : TList<TInfo_Lista_Precio>) : Boolean;
    Function Cargar_Registros_Lista_Precio(pLista : TList<TInfo_Lista_Precio>) : Boolean;
    Function Guardar_Registros_Lista_Precio(pLista : TList<TInfo_Lista_Precio>) : Boolean;
    Procedure Inicializar_Registro_Lista_Precio(pReg : TInfo_Lista_Precio);
    Function Adicionar_Fila_Lista_Precio(pLista : TList<TInfo_Lista_Precio>) : Boolean;
  public
    { Public declarations }
  end;

var
  FrLista_Precio: TFrLista_Precio;
Procedure Show_Form_Lista_Precio(pCodigo_Producto : String);

implementation
{$R *.dfm}
Uses
  UtConexion,
  
  UtConexion,
  UtException,
  UtFunciones,
  UtInfoTablas,
  UtHomologacion;

Procedure TFrLista_Precio.Inicializar_Registro_Lista_Precio(pReg : TInfo_Lista_Precio);
Begin
  FillChar(pReg, SizeOf(pReg), #0);
  pReg.CODIGO_PRODUCTO := FCODIGO_PRODUCTO;
End;

Function TFrLista_Precio.Adicionar_Fila_Lista_Precio(pLista : TList<TInfo_Lista_Precio>) : Boolean;
Var
  lReg : TInfo_Lista_Precio;
Begin
  lReg := TInfo_Lista_Precio.Create;
  pLista.Add(lReg);
  Inicializar_Registro_Lista_Precio(lReg);
  Detalle.RowLimit := Detalle.LockedRows + pLista.Count;
End;


Procedure TFrLista_Precio.Inicializar_Lista_Precio(pLista : TList<TInfo_Lista_Precio>);
Var
  lI : Integer;
Begin
  For lI := 0 To pLista.Count-1 Do
    pLista[lI].Free;
  pLista.Clear;
End;

procedure TFrLista_Precio.FormCreate(Sender: TObject);
begin
  FLISTA_PRECIO := TList<TInfo_Lista_Precio>.Create;
  Adicionar_Fila_Lista_Precio(FLISTA_PRECIO);
end;

procedure TFrLista_Precio.FormDestroy(Sender: TObject);
begin
  Inicializar_Lista_Precio(FLISTA_PRECIO);
  FLISTA_PRECIO.Free;
end;

procedure TFrLista_Precio.BtnGrabarClick(Sender: TObject);
begin
  If SiNo('Está Seguro(a) de Grabar?') Then
    Guardar_Registros_Lista_Precio(FLISTA_PRECIO);
end;

Function TFrLista_Precio.Calcular_Detalle(pReg : TInfo_Lista_Precio) : Boolean;
Begin
  Result := True;
  pReg.VALOR_VENTA := pReg.VALOR_ORIGINAL * (1 + pReg.PORCENTAJE_UTILIDAD/100);
End;

Function TFrLista_Precio.Fila_Valida_Detalle(pReg : TInfo_Lista_Precio) : Boolean;
Var
  lError : Integer;
Begin
  lError := 0;
//  If (pReg.CANTIDAD <= 0) Or (pReg.VALOR_UNITARIO <= 0) Then
//    lError := IE_VALUE_INVALID;
  Result := lError = 0;
End;

Function TFrLista_Precio.Validar_Registros(pLista : TList<TInfo_Lista_Precio>) : Boolean;
Var
  lI : Integer;
Begin
  lI := 0;
  Result := True;
  While (lI < pLista.Count) And Result Do
  Begin
    Result := Fila_Valida_Detalle(pLista[lI]);
    Inc(lI);
  End;
End;

Function TFrLista_Precio.Cargar_Registros_Lista_Precio(pLista : TList<TInfo_Lista_Precio>) : Boolean;
Var
  lSQL : TQuery;
Begin
  Result := False;
  Try
    Inicializar_Lista_Precio(pLista);
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    Configurar_Conexion_Segura(lSQL);
    lSQL.SQL.Clear;
    lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Tercero_LP).Name + ' ');
    lSQL.SQL.Add(' WHERE '  + Trim_Sentence('CODIGO_PRODUCTO') + ' = ' + #39 + Trim(FCODIGO_PRODUCTO) + #39 + ' ');
    lSQL.Active := True;
    If lSQL.Active Then
    Begin
      lSQL.First;
      While Not lSQL.Eof Do
      Begin
        FLISTA_PRECIO[FLISTA_PRECIO.Count-1].CODIGO_TERCERO_LP   := lSQL.FieldByName('CODIGO_TERCERO_LP'  ).AsString;
        FLISTA_PRECIO[FLISTA_PRECIO.Count-1].CODIGO_PRODUCTO     := lSQL.FieldByName('CODIGO_PRODUCTO'    ).AsString;
        FLISTA_PRECIO[FLISTA_PRECIO.Count-1].RANGO_INI           := lSQL.FieldByName('RANGO_INI'          ).AsFloat ;
        FLISTA_PRECIO[FLISTA_PRECIO.Count-1].RANGO_FIN           := lSQL.FieldByName('RANGO_FIN'          ).AsFloat ;
        FLISTA_PRECIO[FLISTA_PRECIO.Count-1].VALOR_ORIGINAL      := lSQL.FieldByName('VALOR_ORIGINAL'     ).AsFloat ;
        FLISTA_PRECIO[FLISTA_PRECIO.Count-1].PORCENTAJE_UTILIDAD := lSQL.FieldByName('PORCENTAJE_UTILIDAD').AsFloat ;
        FLISTA_PRECIO[FLISTA_PRECIO.Count-1].VALOR_VENTA         := lSQL.FieldByName('VALOR_VENTA'        ).AsFloat ;
        lSQL.Next;
        If Not lSQL.Eof Then
          Adicionar_Fila_Lista_Precio(FLISTA_PRECIO);
      End;
    End;
    lSQL.Active := False;
    lSQL.Free;
    Result := True;
  Except
    On E : Exception Do
      Ingresar_Inconsistencias(E, ' ', 'TFrLista_Precio.Cargar_Registros_Lista_Precio');
  End;
End;

Function TFrLista_Precio.Guardar_Registros_Lista_Precio(pLista : TList<TInfo_Lista_Precio>) : Boolean;
Var
  lI : Integer;
  lSQL : TQuery;
Begin
  Result := False;
  Try
    lSQL := TQuery.Create(Nil);
    lSQL.Active := False;
    Configurar_Conexion_Segura(lSQL);
    For lI := 0 To FLISTA_PRECIO.Count-1 Do
    Begin
      lSQL.Active := False;
      lSQL.SQL.Clear;
      lSQL.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Tercero_LP).Name + ' ');
      If Not Vacio(FLISTA_PRECIO[lI].CODIGO_TERCERO_LP) Then
        lSQL.SQL.Add(' WHERE '  + Trim_Sentence('CODIGO_TERCERO_LP') + ' = ' + #39 + Trim(FLISTA_PRECIO[lI].CODIGO_TERCERO_LP) + #39 + ' ');
      lSQL.Active := True;
      If lSQL.Active Then
      Begin
        If lSQL.RecordCount <= 0 Then
          lSQL.Append
        Else
          lSQL.Edit;
        lSQL.First;
        lSQL.FieldByName('CODIGO_TERCERO_LP'  ).AsString := FLISTA_PRECIO[FLISTA_PRECIO.Count-1].CODIGO_TERCERO_LP  ;
        lSQL.FieldByName('CODIGO_PRODUCTO'    ).AsString := FLISTA_PRECIO[FLISTA_PRECIO.Count-1].CODIGO_PRODUCTO    ;
        lSQL.FieldByName('RANGO_INI'          ).AsFloat  := FLISTA_PRECIO[FLISTA_PRECIO.Count-1].RANGO_INI          ;
        lSQL.FieldByName('RANGO_FIN'          ).AsFloat  := FLISTA_PRECIO[FLISTA_PRECIO.Count-1].RANGO_FIN          ;
        lSQL.FieldByName('VALOR_ORIGINAL'     ).AsFloat  := FLISTA_PRECIO[FLISTA_PRECIO.Count-1].VALOR_ORIGINAL     ;
        lSQL.FieldByName('PORCENTAJE_UTILIDAD').AsFloat  := FLISTA_PRECIO[FLISTA_PRECIO.Count-1].PORCENTAJE_UTILIDAD;
        lSQL.FieldByName('VALOR_VENTA'        ).AsFloat  := FLISTA_PRECIO[FLISTA_PRECIO.Count-1].VALOR_VENTA        ;
        lSQL.Post;
      End;
    End;
    lSQL.Active := False;
    lSQL.Free;
    Result := True;
  Except
    On E : Exception Do
      Ingresar_Inconsistencias(E, ' ', 'TFrLista_Precio.Cargar_Registros_Lista_Precio');
  End;
End;

Procedure Show_Form_Lista_Precio(pCodigo_Producto : String);
Begin
  FrLista_Precio := TFrLista_Precio.Create(Nil);
  FrLista_Precio.FCODIGO_PRODUCTO := pCodigo_Producto;
  FrLista_Precio.Cargar_Registros_Lista_Precio(FrLista_Precio.FLISTA_PRECIO);
  FrLista_Precio.ShowModal;
  FrLista_Precio.Free;
End;


end.
