unit UtImagen;

interface

Uses
  Forms,
  Buttons,
  Classes,
  Graphics,
  ExtCtrls,
  StdCtrls;

Type
  TUtImagen = Class(TSpeedButton)
  Protected
    FCode : String;
    FValor_Socio : Double;
    FValor_Mesero : Double;
    FValor_Cliente : Double;
    FValor_Venta : Double;
    FValor_Compra : Double;
    FScrollBox : TScrollBox;
    FEvento_Grupos : TNotifyEvent;
    FEvento_Productos : TNotifyEvent;
    Procedure OnClick_Grupos(pSender : TObject);
    Procedure OnClick_Productos(pSender : TObject);
  Public
    Property Code : String Read FCode Write FCode;
    Property Valor_Venta : Double Read FValor_Venta Write FValor_Venta;
    Property Valor_Compra : Double Read FValor_Compra Write FValor_Compra;
  End;


Procedure Load_Grupos_Images(pGrupos, pProductos : TScrollBox; pEventoGrupo, pEventoProductos : TNotifyEvent);

implementation
Uses
  UtConexion,
  SysUtils,
  Controls,
  UtConexion,
  
  UtFunciones,
  UtInfoTablas,
  UtConstantes;

Procedure Initialize_TUtImagen(pPanel : TScrollBox);
Begin
  While pPanel.ComponentCount > 0 Do
  Begin
    pPanel.Components[0].Free;
  End;
End;  

Procedure Setting_Images(pImage : TUtImagen; pPanel : TScrollBox; pPercentaje : Double);
Begin
  pImage.GroupIndex   := 99;
  pImage.AllowAllUp   := True;
  pImage.Parent       := pPanel;
  pImage.Height       := Round(pPanel.Width * (pPercentaje/100));
  pImage.Transparent  := False;
  pImage.Color        := clWhite;
  pImage.Color        := pPanel.Color;
  pImage.Align        := alTop;
  pImage.Flat         := True;
  pImage.Cursor       := crHandPoint;
  pImage.Layout       := blGlyphTop;
  pImage.Font.Size    := 7;
End;

Procedure Load_Grupos_Images(pGrupos, pProductos : TScrollBox; pEventoGrupo, pEventoProductos : TNotifyEvent);
Var
  lTabla : TQuery;
  lImagen : TUtImagen;
Begin
  Initialize_TUtImagen(pGrupos);
  lTabla := TQuery.Create(Nil);
  Configurar_Conexion_Segura(lTabla);
  lTabla.SQL.Clear;
  lTabla.SQL.Add(' SELECT  *  FROM ' + Retornar_Info_Tabla(Id_Grupo).Name + ' ');
  lTabla.SQL.Add(' WHERE   MOSTRAR '  + ' = ' + #39 + 'S'    + #39);
  lTabla.Active := True ;
  If lTabla.Active Then
  Begin
    lTabla.Last;
    While Not lTabla.Bof Do
    Begin
      lImagen := TUtImagen.Create(pGrupos);
      Setting_Images(lImagen, pGrupos, 80);
      lImagen.Caption           := lTabla.FieldByName('NOMBRE').AsString;
      lImagen.Code              := lTabla.FieldByName('CODIGO_GRUPO').AsString;
      lImagen.FScrollBox        := pProductos;
      lImagen.OnClick           := lImagen.OnClick_Grupos;
      lImagen.FEvento_Grupos    := pEventoGrupo;
      lImagen.FEvento_Productos := pEventoProductos;
      If Not lTabla.FieldByName('GRAFICO').IsNull then
        lImagen.Glyph.Assign(lTabla.FieldByName('GRAFICO'));
      lTabla.Prior;
    End;
  End;

  lTabla.Active := False;
  lTabla.Free;
End;

Procedure Load_Productos_Images(pValue : String; pPanel : TScrollBox; pEventoGrupo, pEventoProductos : TNotifyEvent);
Var
  lTabla : TQuery;
  lImagen : TUtImagen;
Begin
  Initialize_TUtImagen(pPanel);
  lTabla := TQuery.Create(Nil);
  Configurar_Conexion_Segura(lTabla);
  lTabla.SQL.Clear;
  lTabla.SQL.Add(' SELECT  *  FROM ' + Retornar_Info_Tabla(Id_Producto).Name + ' ');
  lTabla.SQL.Add(' WHERE  ' + 'CODIGO_GRUPO' + ' = ' + #39 + pValue + #39);
  lTabla.Active := True ;
  If lTabla.Active Then
  Begin
    lTabla.Last;
    While Not lTabla.Bof Do
    Begin
      lImagen := TUtImagen.Create(pPanel);
      Setting_Images(lImagen, pPanel, 50);
      lImagen.Caption           := lTabla.FieldByName('NOMBRE').AsString;
      lImagen.Code              := lTabla.FieldByName('CODIGO_PRODUCTO').AsString;
      lImagen.Valor_Venta       := lTabla.FieldByName('VALOR_VENTA').AsFloat;
      lImagen.Valor_Compra      := lTabla.FieldByName('VALOR_COMPRA').AsFloat;
      lImagen.OnClick           := pEventoProductos;
      lImagen.FEvento_Grupos    := pEventoGrupo;
      lImagen.FEvento_Productos := pEventoProductos;
      If Not lTabla.FieldByName('GRAFICO').IsNull then
        lImagen.Glyph.Assign(lTabla.FieldByName('GRAFICO'));
      lTabla.Prior;
    End;
  End;

  lTabla.Active := False;
  lTabla.Free;
End;

Procedure TUtImagen.OnClick_Grupos(pSender : TObject);
Begin
  If (Not (pSender Is TUtImagen)) Then
    Exit;
  With (pSender As TUtImagen) Do
    Load_Productos_Images(Code, FScrollBox, FEvento_Grupos, FEvento_Productos);
End;

Procedure TUtImagen.OnClick_Productos(pSender : TObject);
Begin

End;



end.
