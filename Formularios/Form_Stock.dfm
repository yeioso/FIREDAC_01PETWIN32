object FrStock: TFrStock
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'FrStock'
  ClientHeight = 267
  ClientWidth = 428
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
    Width = 428
    Height = 267
    Align = alClient
    DataSource = DsStock
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Descripci'#243'n'
        Width = 163
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'STOCK_MINIMO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Stock M'#237'nimo'
        Width = 79
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'EXISTENCIA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Existencia'
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'STOCK_MAXIMO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Stock M'#225'ximo'
        Width = 79
        Visible = True
      end>
  end
  object Timer1: TTimer
    Left = 216
    Top = 40
  end
  object DsStock: TDataSource
    DataSet = QrStock
    Left = 160
    Top = 40
  end
  object QrStock: TADOQuery
    Parameters = <>
    Left = 112
    Top = 40
  end
end
