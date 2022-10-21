object FrNotificacion: TFrNotificacion
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'FrNotificacion'
  ClientHeight = 267
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 724
    Height = 226
    Align = alClient
    DataSource = DsNotificacion
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOTIFICACION'
        Title.Caption = 'Notificaci'#243'n'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 446
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 226
    Width = 724
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 272
    ExplicitTop = 128
    ExplicitWidth = 185
    object SpeedButton1: TSpeedButton
      Left = 1
      Top = 1
      Width = 152
      Height = 39
      Align = alLeft
      Caption = '&No mostrar mas'
      OnClick = SpeedButton1Click
    end
  end
  object DsNotificacion: TDataSource
    DataSet = QrNotificacion
    Left = 64
    Top = 128
  end
  object QrNotificacion: TADOQuery
    Parameters = <>
    Left = 72
    Top = 56
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 312
    Top = 16
  end
end
