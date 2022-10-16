unit Form_Documento_Comanda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBCtrls, UtConexion, DB;

Type
  TTipo_Comanda = (TC_None, TC_Detallada, TC_Resumida, TC_Ambas);

  TFrDocumento_Comanda = class(TForm)
    BTNOK: TBitBtn;
    BTNCANCEL: TBitBtn;
    TIPO_ENVIO: TDBRadioGroup;
    TIPO_COMANDA: TDBRadioGroup;
    TIPO_IMPRESION: TDBRadioGroup;
    TIPO_GENERACION: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FDATA : TMANAGER_DATA;
    procedure BeforeEdit(DataSet: TDataSet);
    procedure AfterPost(DataSet: TDataSet);
  public
    { Public declarations }
  end;

Var
  FrDocumento_Comanda: TFrDocumento_Comanda;
Function Form_Documento_Comanda_Put : Boolean;
Function Form_Documento_Comanda_Get(Var pLocal, pTodo, pImprimir : Boolean; Var pTipo_Comanda : TTipo_Comanda) : Boolean;

implementation
{$R *.dfm}

Uses
  StrUtils,
  UtFunciones,
  UtInfoTablas,
  UtVariablesGlobales;

procedure TFrDocumento_Comanda.BeforeEdit(DataSet: TDataSet);
Var
  lS : String;
  lI : Integer;
begin
  Try
    lS := '';
    For lI := 0 To FDATA.QR.Fields.Count-1 Do
      lS := lS + IfThen(Not Vacio(lS), ', ') + FDATA.QR.Fields[lI].FullName + '=' + Trim(FDATA.QR.Fields[lI].AsString);
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Comanda.BeforeEdit= ' + lS]);
  End;
end;

procedure TFrDocumento_Comanda.AfterPost(DataSet: TDataSet);
Var
  lS : String;
  lI : Integer;
begin
  Try
    lS := '';
    For lI := 0 To FDATA.QR.Fields.Count-1 Do
      lS := lS + IfThen(Not Vacio(lS), ', ') + FDATA.QR.Fields[lI].FullName + '=' + Trim(FDATA.QR.Fields[lI].AsString);
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Comanda.AfterPost= ' + lS]);
  End;
end;

procedure TFrDocumento_Comanda.FormCreate(Sender: TObject);
begin
  Self.Caption := 'Generación de comanda';
  FDATA := TMANAGER_DATA.Create(Retornar_Info_Tabla(Id_Usuario_Comanda).Name, Retornar_Info_Tabla(Id_Usuario_Comanda).Caption);
  FDATA.QR.BeforeEdit := BeforeEdit;
  FDATA.QR.AfterPost  := AfterPost ;
  TIPO_ENVIO.DataSource      := FDATA.DS;
  TIPO_COMANDA.DataSource    := FDATA.DS;
  TIPO_IMPRESION.DataSource  := FDATA.DS;
  TIPO_GENERACION.DataSource := FDATA.DS;
  FDATA.QR.Connection := gVariableGlobal.CNX;
  Try
    FDATA.QR.SQL.Clear;
    FDATA.QR.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Usuario_Comanda).Name + ' ');
    FDATA.QR.SQL.Add(' WHERE ' + gVariableGlobal.CNX.Trim_Sentence('CODIGO_USUARIO') + ' = ' + QuotedStr(Trim(gVariableGlobal.USUARIO_ACTUAL)) + ' ');
    FDATA.QR.Active := True;
    If FDATA.QR.Active And (FDATA.QR.RecordCount <= 0) Then
    Begin
      FDATA.QR.Append;
      FDATA.QR.FieldByName('CODIGO_USUARIO').AsString := gVariableGlobal.USUARIO_ACTUAL;
      FDATA.QR.Post;
    End;
  Except
    On E: Exception Do
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDocumento_Comanda.FormCreate']);
  End;
end;

procedure TFrDocumento_Comanda.FormDestroy(Sender: TObject);
begin
  If Assigned(FDATA) Then
  Begin
    FDATA.Active := False;
    FreeAndNil(FDATA);
  End;
end;

Function Form_Documento_Comanda_Put : Boolean;
Begin
  Result := False;
  FrDocumento_Comanda := TFrDocumento_Comanda.Create(Nil);
  Result := FrDocumento_Comanda.ShowModal = mrOk;
  If Result Then
  Begin
    Try
      If FrDocumento_Comanda.FDATA.Mode_Edition Then
      FrDocumento_Comanda.FDATA.QR.Post;
    Except
      On E: Exception Do
        gVariableGlobal.Add_Log(E, ['Origen', 'Form_Documento_Comanda_Put']);
    End;
  End;
  FreeAndNil(FrDocumento_Comanda);
End;

Function Form_Documento_Comanda_Get(Var pLocal, pTodo, pImprimir : Boolean; Var pTipo_Comanda : TTipo_Comanda) : Boolean;
Begin
  Result := False;
  pTipo_Comanda := TTipo_Comanda.TC_None;
  FrDocumento_Comanda := TFrDocumento_Comanda.Create(Nil);
  If FrDocumento_Comanda.FDATA.Active Then
  Begin
    pLocal := FrDocumento_Comanda.TIPO_ENVIO.Field.AsString = 'L';
    pTodo  := FrDocumento_Comanda.TIPO_IMPRESION.Field.AsString = 'T';
    Case (FrDocumento_Comanda.TIPO_COMANDA.Field.AsString + ' ')[1] Of
      'D' : pTipo_Comanda := TTipo_Comanda.TC_Detallada;
      'R' : pTipo_Comanda := TTipo_Comanda.TC_Resumida ;
      'A' : pTipo_Comanda := TTipo_Comanda.TC_Ambas    ;
    End;
    pImprimir := FrDocumento_Comanda.TIPO_GENERACION.Field.AsString = 'I';
    Result := True;
  End;
  FreeAndNil(FrDocumento_Comanda);
End;

end.
