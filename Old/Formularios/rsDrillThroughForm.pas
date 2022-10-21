unit rsDrillThroughForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, Db;

type
  TDrillThroughForm = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    lbRecordCount: TLabel;
    procedure FormShow(Sender: TObject);
  private
    function GetDataset: TDataset;
    procedure SetDataset(const Value: TDataset);
    procedure UpdateRecordCount;
  public
    property Dataset: TDataset read GetDataset write SetDataset;
  end;

implementation

{$R *.DFM}


function TDrillThroughForm.GetDataset: TDataset;
begin
  Result := DataSource1.DataSet;
end;

procedure TDrillThroughForm.SetDataset(const Value: TDataset);
begin
  DataSource1.DataSet := Value;
end;

procedure TDrillThroughForm.FormShow(Sender: TObject);
begin
 UpdateRecordCount;
end;

procedure TDrillThroughForm.UpdateRecordCount;
begin
  if Dataset <> nil then
    lbRecordCount.Caption := Format('Record count = %d', [Dataset.RecordCount])
  else
    lbRecordCount.Caption := Format('Record count = %d', [0]);
end;

end.
