unit Form_Vendor_Product_Id;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvComponentBase, JvHidControllerClass, StdCtrls, Buttons;

type
  TFrVendor_Product_Id = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    HidCtl: TJvHidDeviceController;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnInfo: TSpeedButton;
    Listado: TListBox;
    procedure HidCtlDeviceChange(Sender: TObject);
    function HidCtlEnumerate(HidDev: TJvHidDevice; const Idx: Integer): Boolean;
    procedure BtnInfoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    MyDevice: TJvHidDevice;
    procedure DeviceRemoval(HidDev: TJvHidDevice);
    procedure DeviceArrival(HidDev: TJvHidDevice);
  public
    { Public declarations }
  end;

var
  FrVendor_Product_Id: TFrVendor_Product_Id;
  Function Show_Form_Vendor_Product_Id(Var pVendor_Id, pProduct_Id : Integer) : Boolean;

implementation
{$R *.dfm}
Uses
  Info_Vendor_Product_Id;

procedure TFrVendor_Product_Id.DeviceRemoval(HidDev: TJvHidDevice);
begin
  if ((Assigned(MyDevice)) and (NOT MyDevice.IsPluggedIn)) then
  begin
    HidCtl.CheckIn(MyDevice);
  end;
end;

procedure TFrVendor_Product_Id.DeviceArrival(HidDev: TJvHidDevice);
begin
//  if ((HidDev.Attributes.VendorID = 3118) AND (HidDev.Attributes.ProductID = 28237) AND (HidDev.Caps.OutputReportByteLength = SizeOf(TReport)) ) then
//  if ((HidDev.Attributes.VendorID = VendorID) AND (HidDev.Attributes.ProductID = ProductID) AND (HidDev.Caps.OutputReportByteLength = SizeOf(TReport)) ) then
  begin
    if HidDev.CheckOut then
    begin
      MyDevice := HidDev;
    end;
  end;
end;

procedure TFrVendor_Product_Id.FormCreate(Sender: TObject);
begin
  HidCtl.OnArrival := DeviceArrival;
  HidCtl.OnRemoval := DeviceRemoval;
end;

procedure TFrVendor_Product_Id.FormShow(Sender: TObject);
begin
  HidCtlDeviceChange(Self);
end;

procedure TFrVendor_Product_Id.BtnInfoClick(Sender: TObject);
begin
  If (Listado.Items.Count > 0) and (Listado.ItemIndex >= 0) Then
  with TFrInfo_Vendor_Product_Id.Create(Self) do
  Begin
    Dev := TJvHidDevice(Listado.Items.Objects[Listado.ItemIndex]);
    ShowModal;
    Free;
  End;
end;

procedure TFrVendor_Product_Id.HidCtlDeviceChange(Sender: TObject);
var
  I: Integer;
  Dev: TJvHidDevice;
begin
  // HidCtlDeviceChange happens before TUsagesForm.Create completed
  // DevListBox may have not been created yet
  if Assigned(Listado) then
  begin
    // hand back all the devices assigned to the list entries
    for I := 0 to Listado.Items.Count-1 do
    begin
      Dev := TJvHidDevice(Listado.Items.Objects[I]);
      HidCtl.CheckIn(Dev);
      Listado.Items.Objects[I] := nil;
    end;
    Listado.Items.Clear;
    HidCtl.Enumerate;
  end;
end;

function TFrVendor_Product_Id.HidCtlEnumerate(HidDev: TJvHidDevice;
  const Idx: Integer): Boolean;
var
  Dev: TJvHidDevice;
  N: Integer;
begin
  // add a descriptive entry to the listbox for the device
  if HidDev.ProductName <> '' then
    N := Listado.Items.Add(HidDev.ProductName)
  else
    N := Listado.Items.Add(Format('Device VID=%x PID=%x',
      [HidDev.Attributes.VendorID, HidDev.Attributes.ProductID]));
  // check out the device and assign it to the list entry
  Dev := HidDev;
  MyDevice := HidDev;
  HidCtl.CheckOutByIndex(Dev, Idx);
  Listado.Items.Objects[N] := HidDev;
  Result := True;
end;

Function Show_Form_Vendor_Product_Id(Var pVendor_Id, pProduct_Id : Integer) : Boolean;
Var
  Dev: TJvHidDevice;
Begin
  FrVendor_Product_Id := TFrVendor_Product_Id.Create(Nil);
  Result := FrVendor_Product_Id.ShowModal = mrOk;
  If Result Then
  Begin
    Dev := TJvHidDevice(FrVendor_Product_Id.Listado.Items.Objects[FrVendor_Product_Id.Listado.ItemIndex]);
    pVendor_Id := Dev.Attributes.VendorID;
    pProduct_Id := Dev.Attributes.ProductID;
  End;
  FrVendor_Product_Id.Free;
End;

end.
