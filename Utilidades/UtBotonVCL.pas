unit UtBotonVCL;

interface
Uses
  Vcl.Forms,
  Vcl.ExtCtrls,
  Vcl.Graphics,
  Vcl.StdCtrls,
  System.Classes;

Type
  TArray_Str = Array Of String;
  TNivel = (TN_None, TN_Linea, TN_Grupo, TN_Subgrupo, TN_Producto);
  TDireccion = (TD_None, TD_Inicio, TD_Anterior, TD_Avanzar);
  TUtBotonVCL = Class(TPanel)
    Private
      FNIVEL : TNivel;
      FNOMBRE : String;
      FIMAGEN : TImage;
      FETIQUETA : TLabel;
      FDIRECCION : TDireccion;
      FCODIGO_LINEA : String;
      FCODIGO_GRUPO : String;
      FCODIGO_SUBGRUPO : String;
      FCODIGO_PRODUCTO : String;
      FVALOR_UNITARIO : Double;
      FCANTIDAD_PROPUESTA : Double;
      FID_FECHA_VENCIMIENTO : String;
    Public
      Property NIVEL                : TNivel     Read FNIVEL                 Write FNIVEL               ;
      Property NOMBRE               : String     Read FNOMBRE                Write FNOMBRE              ;
      Property IMAGEN               : TImage     Read FIMAGEN                Write FIMAGEN              ;
      Property ETIQUETA             : TLabel     Read FETIQUETA              Write FETIQUETA            ;
      Property DIRECCION            : TDireccion Read FDIRECCION             Write FDIRECCION           ;
      Property CODIGO_LINEA         : String     Read FCODIGO_LINEA          Write FCODIGO_LINEA        ;
      Property CODIGO_GRUPO         : String     Read FCODIGO_GRUPO          Write FCODIGO_GRUPO        ;
      Property CODIGO_SUBGRUPO      : String     Read FCODIGO_SUBGRUPO       Write FCODIGO_SUBGRUPO     ;
      Property CODIGO_PRODUCTO      : String     Read FCODIGO_PRODUCTO       Write FCODIGO_PRODUCTO     ;
      Property VALOR_UNITARIO       : Double     Read FVALOR_UNITARIO        Write FVALOR_UNITARIO      ;
      Property CANTIDAD_PROPUESTA   : Double     Read FCANTIDAD_PROPUESTA    Write FCANTIDAD_PROPUESTA  ;
      Property ID_FECHA_VENCIMIENTO : String     Read FID_FECHA_VENCIMIENTO  Write FID_FECHA_VENCIMIENTO;
      Constructor Create(AOwner: TComponent); Override;
      Destructor Destroy; Override;
  End;


implementation
{ TPanelBoton }
Uses
  Vcl.Dialogs,
  Vcl.Controls,
  System.UITypes,
  System.SysUtils;

constructor TUtBotonVCL.Create(AOwner: TComponent);
begin
  inherited;
  FNIVEL              := TNivel.TN_None;
  FDIRECCION          := TDireccion.TD_None;
  Self.Caption        := '';
  Self.BevelInner     := bvRaised;
  Self.BevelKind      := bkSoft  ;
  Self.BevelOuter     := bvRaised;
  Self.BorderStyle    := bsSingle;
//Self.OnClick        := OnClickPanelBoton;

  FIMAGEN             := TImage.Create(Self);
  FETIQUETA           := TLabel.Create(Self);
  FIMAGEN.Parent      := Self;
  FETIQUETA.Parent    := Self;

  FETIQUETA.Cursor    := crHandPoint;
  FETIQUETA.OnClick   := Self.OnClick;
  FETIQUETA.AutoSize  := False;
  FETIQUETA.Align     := TAlign.alBottom;
  FETIQUETA.Alignment := TAlignment.taCenter;
  FETIQUETA.Layout    := tlCenter;
  FETIQUETA.Height    := 30;
  FETIQUETA.Font.Size := 7;
  FETIQUETA.WordWrap  := True;

  FIMAGEN.Cursor       := crHandPoint;
  FIMAGEN.OnClick      := Self.OnClick;
  FIMAGEN.Stretch      := True;
  FIMAGEN.Proportional := True;
  FIMAGEN.Transparent  := True;
  FIMAGEN.Center       := True;
  FIMAGEN.Align        := TAlign.alClient;
end;

destructor TUtBotonVCL.Destroy;
begin
  If Assigned(FETIQUETA) Then
    FreeAndNil(FETIQUETA);

  If Assigned(FIMAGEN) Then
    FreeAndNil(FIMAGEN);
  inherited;
end;

end.
