unit uGlobal;

interface
Uses
  uConexion,
  System.Classes;

Type
  TMGlobal = Class(TObject)
    Private
      FCNX : TConexion;
    Public
      Property CNX : TConexion Read FCNX Write FCNX;
      Procedure AfterConstruction; Override;
      Function Prepared : Boolean;
      Procedure BeforeDestruction; Override;
  End;

Var
  gMGlobal : TMGlobal;

implementation
Uses
  uLog,
  System.SysUtils;

Procedure TMGlobal.AfterConstruction;
Begin
  Inherited;
  Try
    FCNX := TConexion.Create(Nil);
    Prepared;
  Except
    On E: Exception Do
    Begin
      uLog_Execute('GLOBAL', ['Origen', 'TMGlobal.AfterConstruction', 'Error', E.Message]);
    End;
  End;
End;

Function TMGlobal.Prepared : Boolean;
Begin
  Try
    FCNX.SetConnection('MSSQL');
    FCNX.SetServer('127.0.0.1');
    FCNX.SetDatabase('PET2');
    FCNX.SetUser('sa');
    FCNX.SetPassword('0');
    FCNX.Connect(True);
  Except
    On E: Exception Do
    Begin
      uLog_Execute('GLOBAL', ['Origen', 'TMGlobal.Prepared', 'Error', E.Message]);
    End;
  End;
End;

Procedure TMGlobal.BeforeDestruction;
Begin
  Try
     If Assigned(FCNX) Then
     Begin
       FCNX.Disconnect;
       FreeAndNil(FCNX);
     End;
  Except
    On E: Exception Do
    Begin
      uLog_Execute('GLOBAL', ['Origen', 'TMGlobal.BeforeDestruction', 'Error', E.Message]);
    End;
  End;
  Inherited;
End;

Initialization
  gMGlobal := TMGlobal.Create;

Finalization
  If Assigned(gMGlobal) Then
    FreeAndNil(gMGlobal);

end.
