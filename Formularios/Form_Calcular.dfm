object FrCalcular: TFrCalcular
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Calcular'
  ClientHeight = 263
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 279
    Height = 189
    Align = alClient
    TabOrder = 0
    object pfValor01: TOvcPictureField
      Left = 2
      Top = 9
      Width = 272
      Height = 41
      Cursor = crIBeam
      DataType = pftDouble
      CaretOvr.Shape = csBlock
      Controller = OvcController1
      ControlCharColor = clRed
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      Epoch = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      InitDateTime = False
      MaxLength = 14
      Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
      ParentFont = False
      PictureMask = '###,###,###.##'
      TabOrder = 0
      OnChange = pfValor01Change
      OnKeyDown = pfValor01KeyDown
      RangeHigh = {73B2DBB9838916F2FE43}
      RangeLow = {73B2DBB9838916F2FEC3}
    end
    object pfValor02: TOvcPictureField
      Left = 2
      Top = 56
      Width = 272
      Height = 41
      Cursor = crIBeam
      DataType = pftDouble
      BorderStyle = bsNone
      CaretOvr.Shape = csBlock
      Controller = OvcController1
      ControlCharColor = clRed
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      Enabled = False
      Epoch = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      InitDateTime = False
      MaxLength = 14
      Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
      ParentFont = False
      PictureMask = '###,###,###.##'
      TabOrder = 1
      RangeHigh = {73B2DBB9838916F2FE43}
      RangeLow = {73B2DBB9838916F2FEC3}
    end
    object pfResultado: TOvcPictureField
      Left = 2
      Top = 117
      Width = 272
      Height = 41
      Cursor = crIBeam
      DataType = pftDouble
      BorderStyle = bsNone
      CaretOvr.Shape = csBlock
      Controller = OvcController1
      ControlCharColor = clRed
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      Enabled = False
      Epoch = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      InitDateTime = False
      MaxLength = 14
      Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
      ParentFont = False
      PictureMask = '###,###,###.##'
      TabOrder = 2
      RangeHigh = {73B2DBB9838916F2FE43}
      RangeLow = {73B2DBB9838916F2FEC3}
    end
    object Panel3: TPanel
      Left = 2
      Top = 103
      Width = 271
      Height = 9
      Color = clBtnText
      ParentBackground = False
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 222
    Width = 279
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BtnAceptar: TBitBtn
      Left = 42
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Aceptar'
      ModalResult = 1
      TabOrder = 0
    end
    object BtnCancelar: TBitBtn
      Left = 162
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object pnlDocumento: TPanel
    Left = 0
    Top = 0
    Width = 279
    Height = 33
    Align = alTop
    TabOrder = 2
    object lbInfo: TLabel
      Left = 1
      Top = 1
      Width = 37
      Height = 16
      Align = alClient
      Alignment = taCenter
      Caption = 'lbInfo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
  end
  object OvcController1: TOvcController
    EntryCommands.TableList = (
      'Default'
      True
      ()
      'WordStar'
      False
      ()
      'Grid'
      False
      ())
    Epoch = 2000
    Left = 232
    Top = 16
  end
end
