object FrMain: TFrMain
  Left = 0
  Top = 0
  Caption = 'FrMain'
  ClientHeight = 484
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 24
    Top = 8
    object MAESTOS1: TMenuItem
      Caption = 'Maestos'
      object ipo1: TMenuItem
        Caption = 'Tipo'
        OnClick = ipo1Click
      end
    end
  end
end
