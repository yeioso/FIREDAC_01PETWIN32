unit UtBoton;

interface
Uses
  Buttons,
  Classes,
  Windows,  
  ExtCtrls,
  StdCtrls,
  Controls,
  Graphics,
  Messages;

Const
  Const_Abrev_Disponible = 'D';
  Const_Abrev_Ocupado    = 'O';
  Const_Abrev_Reservado  = 'R';

  Const_Texto_Disponible = 'Disponible';
  Const_Texto_Ocupado    = 'Ocupado';
  Const_Texto_Reservado  = 'Reservado';

Type
  TMesaButton = Class(TBitBtn)
    Private
    Protected
      FTop : Integer;
      FHora : String;
      FFecha : String;
      FEstado : Char;
      FNombre : String;
      FLabelTop : TLabel;      
      FEstacion : String;
      FCodigo_Mesa : String;
      FCodigo_Zona : String;
      FValor_Total : Double;
      FLabelBottom : TLabel;      
      FForma_de_Pago : Integer;
      FArea_Fumadores : String;
      FCodigo_Tercero : String;
      FCodigo_Usuario : String;
      FNumero_Personas : Integer;
      FNumero_Documento : String;
      FCodigo_Tipo_Cliente : String;
    Public
      Property Hora : String Read FHora Write FHora;
      Property Fecha : String Read FFecha Write FFecha;
      Property Estado : Char Read FEstado Write FEstado;
      Property Nombre : String Read FNombre Write FNombre;
      Property Estacion : String Read FEstacion Write FEstacion;
      property LabelTop : TLabel Read FLabelTop Write FLabelTop;      
      property LabelBottom : TLabel Read FLabelBottom Write FLabelBottom;      
      Property Codigo_Mesa : String Read FCodigo_Mesa Write FCodigo_Mesa;
      Property Codigo_Zona : String Read FCodigo_Zona Write FCodigo_Zona;
      Property Valor_Total : Double Read FValor_Total Write FValor_Total;
      Property Forma_de_Pago : Integer Read FForma_de_Pago Write FForma_de_Pago;
      Property Area_Fumadores : String Read FArea_Fumadores Write FArea_Fumadores;
      Property Codigo_Tercero : String Read FCodigo_Tercero Write FCodigo_Tercero;
      Property Codigo_Usuario : String Read FCodigo_Usuario Write FCodigo_Usuario;
      Property Numero_Personas : Integer Read FNumero_Personas Write FNumero_Personas;
      Property Numero_Documento : String Read FNumero_Documento Write FNumero_Documento;
      Property Codigo_Tipo_Cliente : String Read FCodigo_Tipo_Cliente Write FCodigo_Tipo_Cliente;
      Constructor Create(pOwner: TComponent); override;
      Destructor Destroy; override;
  End;

implementation
Uses
  Forms;

Constructor TMesaButton.Create(pOwner : TComponent);
Begin
  Inherited;
  Self.Layout      := blGlyphTop;
  Self.Width       := 080;
  Self.Height      := 070;
  Self.Cancel      := False;
  Self.Default     := False;
  Self.ModalResult := mrNone;
  Self.Font.Style  := Font.Style + [fsBold];
  Self.Cursor      := crHandPoint;
  Self.Valor_Total := 0;
  Self.Nombre      := '';
  Self.Color       := clGray;
  Self.TabStop     := False;

  FLabelTop := TLabel.Create(Self);
  FLabelTop.Parent := Self;
//  Self.InsertComponent(FLabelTop);
  FLabelTop.Align := alTop;
  FLabelTop.Transparent := False;
  FLabelTop.Color := clBlack;
  FLabelTop.Font.Size := 7;
  FLabelTop.Font.Color := clWhite;
  FLabelTop.Alignment := taRightJustify;

  FLabelBottom := TLabel.Create(Self);
//  Self.InsertComponent(FLabelBottom);
  FLabelBottom.Parent := Self;
  FLabelBottom.Align := alBottom;
  FLabelBottom.Transparent := False;
  FLabelBottom.Color := clBlack;
  FLabelBottom.Font.Size := 7;
  FLabelBottom.Font.Color := clWhite;
  FLabelBottom.Alignment := taCenter;
End;

Destructor TMesaButton.Destroy;
Begin
  If Assigned(FLabelBottom) Then
    FLabelBottom.Free;

  If Assigned(FLabelTop) Then
    FLabelTop.Free;

  Inherited Destroy;
End;

end.
