object FrFrame: TFrFrame
  Left = 0
  Top = 0
  Width = 640
  Height = 57
  Align = alTop
  TabOrder = 0
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 34
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 0
    object BTNSALIR: TSpeedButton
      Left = 1
      Top = 1
      Width = 56
      Height = 28
      Align = alLeft
      Caption = 'SALIR'
      ExplicitHeight = 25
    end
  end
  object StatusBarInfo: TStatusBar
    Left = 0
    Top = 38
    Width = 640
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
    ExplicitLeft = 384
    ExplicitTop = 48
    ExplicitWidth = 0
  end
end
