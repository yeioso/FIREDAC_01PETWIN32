object FrDepurador: TFrDepurador
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrDepurador'
  ClientHeight = 321
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 705
    Height = 280
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 709
    ExplicitHeight = 281
    object DBGrid1: TDBGrid
      Left = 1
      Top = 29
      Width = 707
      Height = 251
      Align = alClient
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO_PRODUCTO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 186
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 395
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TAG_INFO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 707
      Height = 28
      Align = alTop
      BevelKind = bkFlat
      TabOrder = 1
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 88
        Height = 22
        Align = alLeft
        AutoSize = False
        Caption = 'Producto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 35
      end
      object Dato: TEdit
        Left = 89
        Top = 1
        Width = 613
        Height = 22
        Align = alClient
        TabOrder = 0
        OnChange = DatoChange
        ExplicitHeight = 21
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 280
    Width = 705
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 281
    ExplicitWidth = 709
    object BtnAceptar: TSpeedButton
      Left = 1
      Top = 1
      Width = 120
      Height = 39
      Align = alLeft
      Caption = 'Aceptar'
      OnClick = BtnAceptarClick
    end
    object BtnCancelar: TSpeedButton
      Left = 588
      Top = 1
      Width = 120
      Height = 39
      Align = alRight
      Caption = 'Cancelar'
      OnClick = BtnCancelarClick
      ExplicitTop = 5
    end
    object BtnInicializar: TSpeedButton
      Left = 121
      Top = 1
      Width = 120
      Height = 39
      Align = alLeft
      Caption = 'Inicializar'
      OnClick = BtnInicializarClick
      ExplicitLeft = 217
      ExplicitTop = -7
    end
  end
end
