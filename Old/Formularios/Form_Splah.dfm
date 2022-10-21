object FrSplah: TFrSplah
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrSplah'
  ClientHeight = 130
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSplash: TPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 130
    Align = alClient
    TabOrder = 0
    object Paginas: TPageControl
      Left = 1
      Top = 1
      Width = 192
      Height = 128
      ActivePage = Pag00
      Align = alLeft
      TabOrder = 0
      ExplicitHeight = 183
      object Pag00: TTabSheet
      end
      object Pag01: TTabSheet
        ImageIndex = 1
      end
    end
  end
  object cyAdvProgressionPanel1: TcyAdvProgressionPanel
    BorderWidth = 10
    Caption = 'Waiting blocking process ...'
    Degrade.AngleDegree = 0
    Degrade.BalanceMode = bmReverse
    Degrade.FromColor = clMaroon
    Degrade.SpeedPercent = 100
    Degrade.ToColor = 4419478
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    GaugeMax = 100.000000000000000000
    GaugeStepInterval = 1
    Left = 397
    Top = 48
  end
end
