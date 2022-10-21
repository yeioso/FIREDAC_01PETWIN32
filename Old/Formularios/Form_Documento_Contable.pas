unit Form_Documento_Contable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ovcbase, ovctcmmn, ovctable, Type_Documento_Contable_Enc,
  ovctchdr, ovctcell, ovctcstr, ovctcbef, ovctcpic, ovctcedt, StdCtrls, ovcef,
  ovcpb, ovcpf, Buttons;

type
  TFrDocumento_Contable = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    Detalle: TOvcTable;
    HEAD: TOvcTCColHead;
    ROW: TOvcTCRowHead;
    FECHA_DOCUMENTO: TOvcTCPictureField;
    NOMBRE_DET: TOvcTCPictureField;
    NOMBRE_PUC: TOvcTCPictureField;
    CODIGO_PUC: TOvcTCPictureField;
    CODIGO_TERCERO: TOvcTCPictureField;
    CODIGO_CCOSTO: TOvcTCPictureField;
    NOMBRE_CCOSTO: TOvcTCPictureField;
    DOCUMENTO_REFERENCIA: TOvcTCPictureField;
    NOMBRE_TERCERO: TOvcTCPictureField;
    DEBITO_DET: TOvcTCPictureField;
    CREDITO_DET: TOvcTCPictureField;
    SALDO_DET: TOvcTCPictureField;
    PORCENTAJE_DET: TOvcTCPictureField;
    BASE_DET: TOvcTCPictureField;
    ACTIVO_DET: TOvcTCPictureField;
    PASIVO_DET: TOvcTCPictureField;
    PATRIMONIO_DET: TOvcTCPictureField;
    VALOR_TRM_DET: TOvcTCPictureField;
    PATRIMONIO_TRM_DET: TOvcTCPictureField;
    PASIVO_TRM_DET: TOvcTCPictureField;
    ACTIVO_TRM_DET: TOvcTCPictureField;
    BASE_TRM_DET: TOvcTCPictureField;
    SALDO_TRM_DET: TOvcTCPictureField;
    CREDITO_TRM_DET: TOvcTCPictureField;
    DEBITO_TRM_DET: TOvcTCPictureField;
    OvcController1: TOvcController;
    KEY: TOvcTCString;
    gbSALDOS: TGroupBox;
    gb1: TGroupBox;
    lb1: TLabel;
    lb2: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    NUMERO_DOCUMENTO: TOvcPictureField;
    NOMBRE_ENC: TOvcPictureField;
    CODIGO_COMPROBANTE: TOvcPictureField;
    FECHA: TOvcPictureField;
    BtnComprobante: TSpeedButton;
    BtnFecha: TSpeedButton;
    lbNombre_Comprobante: TLabel;
    DEBITO_ENC: TOvcPictureField;
    CREDITO_ENC: TOvcPictureField;
    SALDO_ENC: TOvcPictureField;
    ACTIVO_ENC: TOvcPictureField;
    PASIVO_ENC: TOvcPictureField;
    PATRIMONIO_ENC: TOvcPictureField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    gbTRM: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DEBITO_TRM_ENC: TOvcPictureField;
    CREDITO_TRM_ENC: TOvcPictureField;
    SALDO_TRM_ENC: TOvcPictureField;
    ACTIVO_TRM_ENC: TOvcPictureField;
    PASIVO_TRM_ENC: TOvcPictureField;
    PATRIMONIO_TRM_ENC: TOvcPictureField;
    BtnSalir: TSpeedButton;
    BtnCancelar: TSpeedButton;
    BtnGuardar: TSpeedButton;
    gbColumnas: TGroupBox;
    CHECK_BASE: TCheckBox;
    CHECK_BALANCE: TCheckBox;
    CHECK_TRM: TCheckBox;
    CHECK_NOMBRE: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DetalleGetCellData(Sender: TObject; RowNum, ColNum: Integer;
      var Data: Pointer; Purpose: TOvcCellDataPurpose);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DetalleActiveCellChanged(Sender: TObject; RowNum,
      ColNum: Integer);
    procedure DetalleActiveCellMoving(Sender: TObject; Command: Word;
      var RowNum, ColNum: Integer);
    procedure BtnGuardarClick(Sender: TObject);
    procedure CHECK_BASEClick(Sender: TObject);
    procedure CHECK_BALANCEClick(Sender: TObject);
    procedure CHECK_TRMClick(Sender: TObject);
    procedure CHECK_NOMBREClick(Sender: TObject);
  private
    { Private declarations }
    FDOCUMENTO : TClass_Documento_Contable_Enc;
    Procedure Visualizar_Columna;
    Procedure Cargar_Valores_Campos;
    Procedure Guardar_Valores_Campos;
    Procedure Definir_Row_Limit;
    Procedure Actualizar_Calculo_Detalles;
  public
    { Public declarations }
  end;

Procedure Show_Form_Documento_Contable;  

implementation
{$R *.dfm}
Uses
  Type_Documento_Contable_Det;

Procedure TFrDocumento_Contable.Visualizar_Columna;
Var
  lI : Integer;
Begin
  For lI := 0 To Detalle.ColCount-1  Do
    Case lI Of
      02, 04 ,
      07, 09 : Detalle.Columns.Hidden[lI] := Not CHECK_NOMBRE.Checked ;
      13..14 : Detalle.Columns.Hidden[lI] := Not CHECK_BASE.Checked   ;
      15..17 : Detalle.Columns.Hidden[lI] := Not CHECK_BALANCE.Checked;
      18..25 : Detalle.Columns.Hidden[lI] := Not CHECK_TRM.Checked    ;
    End;
End;

procedure TFrDocumento_Contable.BtnGuardarClick(Sender: TObject);
begin
  Guardar_Valores_Campos;
  If FDOCUMENTO.Guardar_Info_Enc Then
    FDOCUMENTO.Guardar_Info_Det; 
end;

Procedure TFrDocumento_Contable.Cargar_Valores_Campos;
Begin
  NUMERO_DOCUMENTO.AsString   := FDOCUMENTO.FData.NUMERO_DOCUMENTO  ;
  CODIGO_COMPROBANTE.AsString := FDOCUMENTO.FData.CODIGO_COMPROBANTE;
  FECHA.AsString              := FDOCUMENTO.FData.FECHA             ;
  NOMBRE_ENC.AsString         := FDOCUMENTO.FData.NOMBRE            ;    
  DEBITO_ENC.AsFloat          := FDOCUMENTO.FData.DEBITO            ;
  CREDITO_ENC.AsFloat         := FDOCUMENTO.FData.CREDITO           ;
  SALDO_ENC.AsFloat           := FDOCUMENTO.FData.SALDO             ;
  ACTIVO_ENC.AsFloat          := FDOCUMENTO.FData.ACTIVO            ;
  PASIVO_ENC.AsFloat          := FDOCUMENTO.FData.PASIVO            ;
  PATRIMONIO_ENC.AsFloat      := FDOCUMENTO.FData.PATRIMONIO        ;
  DEBITO_TRM_ENC.AsFloat      := FDOCUMENTO.FData.DEBITO_TRM        ;
  CREDITO_TRM_ENC.AsFloat     := FDOCUMENTO.FData.CREDITO_TRM       ;
  SALDO_TRM_ENC.AsFloat       := FDOCUMENTO.FData.SALDO_TRM         ;
  ACTIVO_TRM_ENC.AsFloat      := FDOCUMENTO.FData.ACTIVO_TRM        ;
  PASIVO_TRM_ENC.AsFloat      := FDOCUMENTO.FData.PASIVO_TRM        ;
  PATRIMONIO_TRM_ENC.AsFloat  := FDOCUMENTO.FData.PATRIMONIO_TRM    ;
End;

procedure TFrDocumento_Contable.CHECK_BALANCEClick(Sender: TObject);
begin
  Visualizar_Columna;
end;

procedure TFrDocumento_Contable.CHECK_BASEClick(Sender: TObject);
begin
  Visualizar_Columna;
end;

procedure TFrDocumento_Contable.CHECK_NOMBREClick(Sender: TObject);
begin
  Visualizar_Columna;
end;

procedure TFrDocumento_Contable.CHECK_TRMClick(Sender: TObject);
begin
  Visualizar_Columna;
end;

Procedure TFrDocumento_Contable.Guardar_Valores_Campos;
Begin
  FDOCUMENTO.FData.NUMERO_DOCUMENTO   :=  NUMERO_DOCUMENTO.EditString  ;
  FDOCUMENTO.FData.CODIGO_COMPROBANTE :=  CODIGO_COMPROBANTE.EditString;
  FDOCUMENTO.FData.FECHA              :=  FECHA.EditString             ;
  FDOCUMENTO.FData.NOMBRE             :=  NOMBRE_ENC.EditString        ;
  FDOCUMENTO.FData.DEBITO             :=  DEBITO_ENC.AsFloat           ;
  FDOCUMENTO.FData.CREDITO            :=  CREDITO_ENC.AsFloat          ;
  FDOCUMENTO.FData.SALDO              :=  SALDO_ENC.AsFloat            ;
  FDOCUMENTO.FData.ACTIVO             :=  ACTIVO_ENC.AsFloat           ;
  FDOCUMENTO.FData.PASIVO             :=  PASIVO_ENC.AsFloat           ;
  FDOCUMENTO.FData.PATRIMONIO         :=  PATRIMONIO_ENC.AsFloat       ;
  FDOCUMENTO.FData.DEBITO_TRM         :=  DEBITO_TRM_ENC.AsFloat       ;
  FDOCUMENTO.FData.CREDITO_TRM        :=  CREDITO_TRM_ENC.AsFloat      ;
  FDOCUMENTO.FData.SALDO_TRM          :=  SALDO_TRM_ENC.AsFloat        ;
  FDOCUMENTO.FData.ACTIVO_TRM         :=  ACTIVO_TRM_ENC.AsFloat       ;
  FDOCUMENTO.FData.PASIVO_TRM         :=  PASIVO_TRM_ENC.AsFloat       ;
  FDOCUMENTO.FData.PATRIMONIO_TRM     :=  PATRIMONIO_TRM_ENC.AsFloat   ;
End;

Procedure TFrDocumento_Contable.Actualizar_Calculo_Detalles;
Begin
  FDOCUMENTO.Calcular_Detalles;
  Cargar_Valores_Campos;
End;

Procedure TFrDocumento_Contable.Definir_Row_Limit;
Begin
  Detalle.RowLimit := FDOCUMENTO.FInfo.Count + Detalle.LockedRows;
End;

procedure TFrDocumento_Contable.DetalleActiveCellChanged(Sender: TObject;
  RowNum, ColNum: Integer);
begin
  If RowNum > 0 Then
  Begin
    TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Calcular_Detalle;
    Detalle.InvalidateRow(RowNum);
    Actualizar_Calculo_Detalles;
  End;
end;

procedure TFrDocumento_Contable.DetalleActiveCellMoving(Sender: TObject;
  Command: Word; var RowNum, ColNum: Integer);
begin
  If ColNum >= (Detalle.ColCount-1) Then
  Begin
    If RowNum >= (Detalle.RowLimit-1) Then
    Begin
      FDOCUMENTO.Add_Item;
      Definir_Row_Limit;
    End;
    Inc(RowNum);
    ColNum := 1;
  End;

end;

procedure TFrDocumento_Contable.DetalleGetCellData(Sender: TObject; RowNum,
  ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
begin
  If (RowNum > 0) And (RowNum <= FDOCUMENTO.FInfo.Count) Then
  Begin
    Case ColNum Of
      00 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.KEY                 ;
      01 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.FECHA_DOCUMENTO     ;
      02 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.NOMBRE              ;
      03 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.CODIGO_PUC          ;
      04 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.NOMBRE_PUC          ;
      05 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.DOCUMENTO_REFERENCIA;
      06 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.CODIGO_CCOSTO       ;
      07 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.NOMBRE_CCOSTO       ;
      08 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.CODIGO_TERCERO      ;
      09 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.NOMBRE_TERCERO      ;
      10 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.DEBITO              ;
      11 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.CREDITO             ;
      12 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.SALDO               ;
      13 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.PORCENTAJE          ;
      14 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.BASE                ;
      15 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.ACTIVO              ;
      16 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.PASIVO              ;
      17 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.PATRIMONIO          ;
      18 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.VALOR_TRM           ;
      19 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.DEBITO_TRM          ;
      20 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.CREDITO_TRM         ;
      21 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.SALDO_TRM           ;
      22 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.BASE_TRM            ;
      23 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.ACTIVO_TRM          ;
      24 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.PASIVO_TRM          ;
      25 : Data := @TClass_Documento_Contable_Det(FDOCUMENTO.FInfo.Items[RowNum-1]).Data.PATRIMONIO_TRM      ;
    End;
  End;
end;

procedure TFrDocumento_Contable.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrDocumento_Contable.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TFrDocumento_Contable.FormCreate(Sender: TObject);
begin
  FDOCUMENTO := TClass_Documento_Contable_Enc.Create;
  FDOCUMENTO.Add_Item;
  Definir_Row_Limit;
end;

procedure TFrDocumento_Contable.FormDestroy(Sender: TObject);
begin
  FDOCUMENTO.Free;
end;

Procedure Show_Form_Documento_Contable;
var
  lDocumento: TFrDocumento_Contable;
Begin
  lDocumento := TFrDocumento_Contable.Create(Nil);
  If lDocumento.FDOCUMENTO.Cargar_Info_Enc Then
    lDocumento.FDOCUMENTO.Cargar_Info_Det;
  lDocumento.Cargar_Valores_Campos;
  lDocumento.Visualizar_Columna;
  lDocumento.Show;
End;


end.
