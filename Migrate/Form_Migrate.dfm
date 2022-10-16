object FrMigrate: TFrMigrate
  Left = 0
  Top = 0
  Caption = 'FrMigrate'
  ClientHeight = 363
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 32
    Height = 13
    Caption = 'Origen'
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 36
    Height = 13
    Caption = 'Destino'
  end
  object BtnMigrar: TSpeedButton
    Left = 295
    Top = 67
    Width = 459
    Height = 41
    Caption = 'Migrar'
    OnClick = BtnMigrarClick
  end
  object TXTORIGEN: TEdit
    Left = 58
    Top = 13
    Width = 696
    Height = 21
    TabOrder = 0
    OnDblClick = TXTORIGENDblClick
  end
  object TXTDESTINO: TEdit
    Left = 58
    Top = 40
    Width = 696
    Height = 21
    TabOrder = 1
    OnDblClick = TXTDESTINODblClick
  end
  object LISTADO: TCheckListBox
    Left = 16
    Top = 67
    Width = 273
    Height = 270
    ItemHeight = 13
    TabOrder = 2
  end
  object INCIDENCIAS: TMemo
    Left = 295
    Top = 114
    Width = 450
    Height = 223
    Lines.Strings = (
      'INCIDENCIAS')
    ScrollBars = ssBoth
    TabOrder = 3
    WordWrap = False
  end
  object BDORIGEN: TADOConnection
    LoginPrompt = False
    Left = 128
    Top = 8
  end
  object BDDESTINO: TADOConnection
    LoginPrompt = False
    Left = 304
    Top = 8
  end
end
