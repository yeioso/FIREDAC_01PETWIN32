unit Form_Migrate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.UtConexion, Vcl.StdCtrls,
  Vcl.CheckLst, Vcl.Buttons;

type
  TFrMigrate = class(TForm)
    BDORIGEN: TADOConnection;
    BDDESTINO: TADOConnection;
    TXTORIGEN: TEdit;
    TXTDESTINO: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    LISTADO: TCheckListBox;
    BtnMigrar: TSpeedButton;
    INCIDENCIAS: TMemo;
    procedure TXTORIGENDblClick(Sender: TObject);
    procedure TXTDESTINODblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnMigrarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Cargar_Tablas;
    Procedure Ejecutar_UDL(pBD : TADOConnection; pEdit : TEdit);
    Procedure Migrar_Informacion;
  public
    { Public declarations }
  end;

var
  FrMigrate: TFrMigrate;

implementation
{$R *.dfm}
Uses
  UtFunciones,
  UtInfotablas;

Type
  TTabla = Class
    FTabla : TInfo_Tabla;
  End;

procedure TFrMigrate.BtnMigrarClick(Sender: TObject);
begin
  If SiNo('Está seguro(a)') Then
    Migrar_Informacion;
end;

Procedure TFrMigrate.Cargar_Tablas;
Var
  lI : Integer;
  lItem : TTabla;
Begin
  For lI := Id_MainIni To Id_MainFin Do
  Begin
    lItem := TTabla.Create;
    lItem.FTabla := Retornar_Info_Tabla(lI);
    LISTADO.Items.AddObject(lItem.FTabla.Caption, lItem);
  End;
  LISTADO.CheckAll(TCheckBoxState.cbChecked);
End;

Procedure TFrMigrate.Migrar_Informacion;
Var
  lI : Integer;
  lJ : Integer;
  lItem : TTabla;
  lORIGEN : TQuery;
  lDESTINO : TQuery;
  lINVENTARIO : TStringList;
Begin
  INCIDENCIAS.Lines.Clear;
  BDORIGEN.Connected := False;
  BDDESTINO.Connected := False;
  BDORIGEN.ConnectionString := TXTORIGEN.Text;
  BDDESTINO.ConnectionString := TXTDESTINO.Text;
  lINVENTARIO := TStringList.Create;
  BDDESTINO.GetTableNames(lINVENTARIO);

  Try
    lORIGEN := TQuery.Create(Nil);
    lDESTINO := TQuery.Create(Nil);

    lORIGEN.Connection := BDORIGEN;
    lDESTINO.Connection := BDDESTINO;

    For lI := LISTADO.Items.Count-1 DownTo 0 Do
    Begin
      If LISTADO.Checked[lI] Then
      Begin
        lItem := TTabla(LISTADO.Items.Objects[lI]);
        If lINVENTARIO.IndexOf(lItem.FTabla.Name) > -1 Then
        Begin
          lDESTINO.SQL.Clear;
          lDESTINO.SQL.Add(' DELETE FROM ' + lItem.FTabla.Name);
          lDESTINO.ExecSQL;
        End;
      End;
    End;

    For lI := 0 To LISTADO.Items.Count-1 Do
    Begin
      If LISTADO.Checked[lI] Then
      Begin
        lItem := TTabla(LISTADO.Items.Objects[lI]);
        If lINVENTARIO.IndexOf(lItem.FTabla.Name) > -1 Then
        Begin
          lORIGEN.Active := False;
          lORIGEN.SQL.Clear;
          lORIGEN.SQL.Add('SELECT * FROM ' + lItem.FTabla.Name + ' ');

          lDESTINO.Active := False;
          lDESTINO.SQL.Clear;
          lDESTINO.SQL.Add('SELECT * FROM ' + lItem.FTabla.Name + ' ');

          lORIGEN.Active := True;
          lDESTINO.Active := True;

          If lORIGEN.Active And lDESTINO.Active Then
          Begin
            lORIGEN.First;
            While Not lORIGEN.Eof Do
            Begin
              Try
                lDESTINO.Append;
                For lJ := 0 To lDESTINO.Fields.Count-1 Do
                  lDESTINO.FieldByName(lDESTINO.Fields[lJ].FullName).Value := lORIGEN.FieldByName(lDESTINO.Fields[lJ].FullName).Value;
                lDESTINO.Post;
              Except
                On E: Exception Do
                  INCIDENCIAS.Lines.Add(E.Message);
              End;
              lORIGEN.Next;
            End;
          End;
          lORIGEN.Active := False;
          lDESTINO.Active := False;
        End;
      End;
      LISTADO.Checked[lI] := False;
      Application.ProcessMessages;
    End;
    lDESTINO.Active := False;
    lORIGEN.Active := False;
    lDESTINO.DisposeOf;
    lORIGEN.DisposeOf;
    Mensajes('Proceso terminado');
  Except
    On E: Exception Do
      ShowMessage(E.Message);
  End;
End;

Procedure TFrMigrate.Ejecutar_UDL(pBD : TADOConnection; pEdit : TEdit);
Var
  CS : WideString;
begin
  pBD.Connected := False;
  pEdit.Text := '';
  CS := PromptDataSource(Self.Handle, pBD.ConnectionString);
  pBD.ConnectionString := CS;
  pEdit.Text := CS;
end;

procedure TFrMigrate.FormCreate(Sender: TObject);
Var
  lS : TStringList;
begin
  lS := TStringList.Create;
  If FileExists(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'ORIGEN.TXT') Then
  Begin
    lS.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'ORIGEN.TXT');
    TXTORIGEN.Text := Trim(lS.Text);
  End;
  lS.Clear;
  If FileExists(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'DESTINO.TXT') Then
  Begin
    lS.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'DESTINO.TXT');
    TXTDESTINO.Text := Trim(lS.Text);
  End;
  lS.Clear;
  lS.DisposeOf;
  Cargar_Tablas;
end;

procedure TFrMigrate.FormDestroy(Sender: TObject);
Var
  lS : TStringList;
begin
  lS := TStringList.Create;
  lS.Add(TXTORIGEN.Text);
  lS.SaveToFile(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'ORIGEN.TXT');
  lS.Clear;
  lS.Add(TXTDESTINO.Text);
  lS.SaveToFile(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'DESTINO.TXT');
  lS.Clear;
  lS.DisposeOf;
end;

procedure TFrMigrate.TXTDESTINODblClick(Sender: TObject);
begin
  Ejecutar_UDL(BDDESTINO, TXTDESTINO);
end;

procedure TFrMigrate.TXTORIGENDblClick(Sender: TObject);
begin
  Ejecutar_UDL(BDORIGEN, TXTORIGEN);
end;

end.
