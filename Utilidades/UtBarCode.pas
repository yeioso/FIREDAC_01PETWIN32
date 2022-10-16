unit UtBarCode;

interface

Uses
  Classes,
  JvComponentBase,
  JvHidControllerClass;
Type
  TInfo_Barcode = Class
    Private
      FValue : String;
      FActive : Boolean;
      HidCtl: TJvHidDeviceController;
      MyDevice: TJvHidDevice;
      VendorID : Integer;
      ProductID : Integer;
      procedure CtlDeviceChange(Sender: TObject);
      procedure DeviceRemoval(HidDev: TJvHidDevice);
      procedure DeviceArrival(HidDev: TJvHidDevice);
      Function Enumerate(HidDev: TJvHidDevice; const Idx: Integer): Boolean;
      Procedure Get_Info_Barcode(HidDev: TJvHidDevice; ReportID: Byte; const Data: Pointer; Size: Word);
    Public
      Constructor Create;
      Destructor Destroy;
      Property Value : String Read FValue;
      Procedure Set_Active(pValue : Boolean);
      Procedure Set_Instance_Barcode(pVendorId, pProductId : Integer);
  End;

Var
  gInfo_Barcode : TInfo_Barcode;

implementation
Uses
  UtConexion,
  SysUtils,
  
  UtFunciones,
  UtConstantes,
  UtInfoTablas,
  UtVariablesGlobales;

Type
  TReport = packed record
    ReportID: byte;
    Data: array [0..64] of byte;
  End;

Constructor TInfo_Barcode.Create;
Begin
  HidCtl := TJvHidDeviceController.Create(Nil);
End;

Destructor TInfo_Barcode.Destroy;
Begin
  HidCtl.Free;
End;

procedure TInfo_Barcode.CtlDeviceChange(Sender: TObject);
Begin
  HidCtl.Enumerate;
End;

procedure TInfo_Barcode.DeviceRemoval(HidDev: TJvHidDevice);
begin
  if ((Assigned(MyDevice)) and (NOT MyDevice.IsPluggedIn)) then
  begin
    HidCtl.CheckIn(MyDevice);
  end;
end;

procedure TInfo_Barcode.DeviceArrival(HidDev: TJvHidDevice);
begin
//  if ((HidDev.Attributes.VendorID = 3118) AND (HidDev.Attributes.ProductID = 28237) AND (HidDev.Caps.OutputReportByteLength = SizeOf(TReport)) ) then
  if ((HidDev.Attributes.VendorID = VendorID) AND (HidDev.Attributes.ProductID = ProductID) AND (HidDev.Caps.OutputReportByteLength = SizeOf(TReport)) ) then
  begin
    if HidDev.CheckOut then
    begin
      MyDevice := HidDev;
    end;
  end;
end;

Function TInfo_Barcode.Enumerate(HidDev: TJvHidDevice; const Idx: Integer): Boolean;
Begin
  Result := True;
//If (HidDev.Attributes.VendorID = 3118) and (HidDev.Attributes.ProductID = 2823) Then
  If (HidDev.Attributes.VendorID = VendorID) and (HidDev.Attributes.ProductID = ProductID) Then
  Begin
    MyDevice := HidDev;
    HidCtl.CheckOutByIndex(MyDevice, Idx);
  End;
End;


procedure TInfo_Barcode.Get_Info_Barcode(HidDev: TJvHidDevice; ReportID: Byte; const Data: Pointer; Size: Word);
Var
  lI : Integer;
  lChar : Char;
  lString : String;
begin
  If Not Self.FActive Then
    Exit;
  lI := 0;
  FValue := '';
  If Data <> Nil Then
    While (lI < Size) Do
    Begin
      If lI > 3 Then
      Begin
        lChar := Char(PAnsiChar(Data)[lI]);
        If Not (lChar = #0) Then
           FValue := FValue + lChar
        Else
          lI := Size;
      End;
      Inc(lI);
    End;
  FValue := Trim(FValue);
//  Self.Execute_Read_Barcode(FValue);
end;

Procedure TInfo_Barcode.Set_Active(pValue : Boolean);
Begin
  Self.FActive := pValue;
End;

Procedure TInfo_Barcode.Set_Instance_Barcode(pVendorId, pProductId : Integer);
Begin
  If gCodigo_Barras = 'S' Then
  Begin
    Self.VendorID := pVendorId;
    Self.ProductId := pProductId;
    HidCtl.OnArrival := DeviceArrival;
    HidCtl.OnRemoval := DeviceRemoval;
    HidCtl.OnEnumerate := Enumerate;
    HidCtl.OnDeviceData := Get_Info_Barcode;
    HidCtl.OnDeviceChange := CtlDeviceChange;
  End;
End;

end.
