object DrillThroughForm: TDrillThroughForm
  Left = 194
  Top = 239
  Width = 684
  Height = 450
  Caption = 'My own editor of the fact table '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 73
    Width = 676
    Height = 295
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 368
    Width = 676
    Height = 55
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      676
      55)
    object lbRecordCount: TLabel
      Left = 575
      Top = 19
      Width = 90
      Height = 16
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = 'lbRecordCount'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 16
      Width = 90
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 112
      Top = 16
      Width = 90
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 676
    Height = 73
    Align = alTop
    Alignment = taCenter
    Color = clInfoBk
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Lines.Strings = (
      ''
      
        'This is an example of how to make use of the DrillThrough method' +
        '.'
      
        'The table below contains all records from the fact table corresp' +
        'onding to the cell value. ')
    ParentFont = False
    TabOrder = 2
  end
  object DataSource1: TDataSource
    Left = 520
    Top = 128
  end
end
