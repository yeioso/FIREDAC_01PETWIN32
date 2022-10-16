program Migrate;

uses
  Vcl.Forms,
  SysUtils,
  Form_Migrate in 'Form_Migrate.pas' {FrMigrate};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrMigrate, FrMigrate);
  Application.Run;
end.
