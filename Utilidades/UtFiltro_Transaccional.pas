unit UtFiltro_Transaccional;

interface
Function UtFiltro_Transaccional_Base(Const pTipo_Documento : String) : Boolean;

implementation
Uses
  UtConstantes;

Function UtFiltro_Transaccional_Base(Const pTipo_Documento : String) : Boolean;
Begin
  Result := (pTipo_Documento = Const_Documento_Pedido    ) Or
            (pTipo_Documento = Const_Documento_Compra    ) Or
            (pTipo_Documento = Const_Documento_Cotizacion) Or
            (pTipo_Documento = Const_Documento_Factura   ) Or
            (pTipo_Documento = Const_Documento_Mesa      ) Or
            (pTipo_Documento = Const_Documento_Baja      );
End;

end.
