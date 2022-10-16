object FrConsulta_Productos: TFrConsulta_Productos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrConsulta_Productos'
  ClientHeight = 413
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 769
    Height = 37
    Align = alTop
    TabOrder = 0
    object Dato: TEdit
      Left = 1
      Top = 15
      Width = 767
      Height = 21
      Align = alBottom
      TabOrder = 0
      OnChange = DatoChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 37
    Width = 769
    Height = 335
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 767
      Height = 333
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE_PRODUCTO'
          Title.Caption = 'Nombre'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 322
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'CANTIDAD'
          Title.Alignment = taRightJustify
          Title.Caption = 'Cantidad'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 83
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 372
    Width = 769
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BtnAceptar: TSpeedButton
      Left = 312
      Top = 2
      Width = 145
      Height = 35
      Caption = 'Aceptar'
      OnClick = BtnAceptarClick
    end
  end
end
