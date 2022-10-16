unit Form_Detalle_Comentario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Buttons, UtConexion;

type
  TFrDetalle_Comentario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FDATA : TMANAGER_DATA;
    FDATAKEY : String;
    Function Abrir_Archivo : Boolean;
    Function Validar_Comentario : Boolean;
  public
    { Public declarations }
  end;

var
  FrDetalle_Comentario: TFrDetalle_Comentario;
  Function Show_Form_Detalle_Comentario(pKey_Data : String) : Boolean;

implementation
{$R *.dfm}
Uses
  UtFunciones,
  UtInfoTablas,
  UtConstantes,
  UtVariablesGlobales;

Function TFrDetalle_Comentario.Validar_Comentario : Boolean;
Begin
  Result := False;
  If FDATA.DS.State In [dsEdit] Then
    FDATA.QR.Post;
  FDATA.QR.First;
  While (Not FDATA.QR.Eof) And (Not Result) Do
  Begin
    Result := Not Vacio(FDATA.QR.FieldByName('OBSERVACION').AsString);
    FDATA.QR.Next;
  End;
End;

procedure TFrDetalle_Comentario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If ModalResult = mrOk Then
  Begin
    CanClose := Validar_Comentario;
    If Not CanClose Then
      Mensajes('Debe ingresar algun comentario');
  End;
end;

procedure TFrDetalle_Comentario.FormCreate(Sender: TObject);
begin
  Self.Caption := 'Comentarios';
  FDATA := TMANAGER_DATA.Create(Retornar_Info_Tabla(Id_Documento_Det).Name, Retornar_Info_Tabla(Id_Documento_Det).Caption);
end;

Function TFrDetalle_Comentario.Abrir_Archivo : Boolean;
Begin
  Try
    FDATA.QR.Active := False;
    FDATA.QR.SQL.Clear;
    FDATA.QR.SQL.Add(' SELECT * FROM ' + Retornar_Info_Tabla(Id_Documento_Det).Name + ' ');
    FDATA.QR.SQL.Add(' WHERE DATAKEY = ' + #39 + FDATAKEY + #39);
    FDATA.QR.Active := True;
    Result := FDATA.QR.Active And (FDATA.QR.RecordCount > 0);
  Except
    On E: Exception Do
    Begin
      Result := False;
      gVariableGlobal.Add_Log(E, ['Origen', 'TFrDetalle_Comentario.Abrir_Archivo']);
    End;
  End;
End;

Function Show_Form_Detalle_Comentario(pKey_Data : String) : Boolean;
Begin
  Result := False;
  FrDetalle_Comentario := TFrDetalle_Comentario.Create(Nil);
  FrDetalle_Comentario.FDATAKEY := pKey_Data;
  Result := FrDetalle_Comentario.Abrir_Archivo;
  If Result Then
    Result := FrDetalle_Comentario.ShowModal = mrOk;
  FrDetalle_Comentario.FDATA.QR.Active := False;
  FrDetalle_Comentario.DisposeOf;
End;

end.
