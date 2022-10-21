object FrAbrir_Caja: TFrAbrir_Caja
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrAbrir_Caja'
  ClientHeight = 307
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  TextHeight = 13
  object pnlDatos: TPanel
    Left = 0
    Top = 0
    Width = 562
    Height = 266
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 566
    ExplicitHeight = 267
    object Label1: TLabel
      Left = 368
      Top = 8
      Width = 37
      Height = 18
      Caption = 'Base'
    end
    object Label2: TLabel
      Left = 368
      Top = 72
      Width = 43
      Height = 18
      Caption = 'T.R.M.'
    end
    object Label3: TLabel
      Left = 368
      Top = 141
      Width = 84
      Height = 18
      Caption = 'Base T.R.M.'
    end
    object VALOR_BASE: TOvcPictureField
      Left = 368
      Top = 27
      Width = 161
      Height = 26
      Cursor = crIBeam
      DataType = pftDouble
      CaretOvr.Shape = csBlock
      ControlCharColor = clRed
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      Epoch = 0
      InitDateTime = False
      MaxLength = 18
      Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
      PictureMask = '###,###,###,###.##'
      TabOrder = 1
      OnUserValidation = VALOR_BASEUserValidation
      RangeHigh = {73B2DBB9838916F2FE43}
      RangeLow = {73B2DBB9838916F2FEC3}
    end
    object VALOR_TRM: TOvcPictureField
      Left = 368
      Top = 94
      Width = 161
      Height = 26
      Cursor = crIBeam
      DataType = pftDouble
      CaretOvr.Shape = csBlock
      ControlCharColor = clRed
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      Epoch = 0
      InitDateTime = False
      MaxLength = 18
      Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
      PictureMask = '###,###,###,###.##'
      TabOrder = 2
      OnUserValidation = VALOR_TRMUserValidation
      RangeHigh = {73B2DBB9838916F2FE43}
      RangeLow = {73B2DBB9838916F2FEC3}
    end
    object FECHA: TMonthCalendar
      Left = 1
      Top = 1
      Width = 352
      Height = 215
      Align = alLeft
      Date = 44850.000000000000000000
      TabOrder = 0
      WeekNumbers = True
      OnClick = FECHAClick
    end
    object gbDescripcion: TGroupBox
      Left = 1
      Top = 216
      Width = 564
      Height = 50
      Align = alBottom
      Caption = 'Descripci'#243'n'
      TabOrder = 4
      object NOMBRE: TOvcPictureField
        Left = 3
        Top = 19
        Width = 521
        Height = 26
        Cursor = crIBeam
        DataType = pftString
        CaretOvr.Shape = csBlock
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
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 100
        Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation, efoTrimBlanks]
        ParentFont = False
        PictureMask = 
          '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!' +
          '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
        TabOrder = 0
        OnUserValidation = NOMBREUserValidation
      end
    end
    object VALOR_BASE_TRM: TOvcPictureField
      Left = 368
      Top = 163
      Width = 161
      Height = 26
      Cursor = crIBeam
      DataType = pftDouble
      CaretOvr.Shape = csBlock
      ControlCharColor = clRed
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      Epoch = 0
      InitDateTime = False
      MaxLength = 18
      Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
      PictureMask = '###,###,###,###.##'
      TabOrder = 3
      OnUserValidation = VALOR_TRMUserValidation
      RangeHigh = {73B2DBB9838916F2FE43}
      RangeLow = {73B2DBB9838916F2FEC3}
    end
  end
  object pnlBotones: TPanel
    Left = 0
    Top = 266
    Width = 562
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 267
    ExplicitWidth = 566
    object BtnAceptar: TBitBtn
      Left = 1
      Top = 1
      Width = 100
      Height = 39
      Align = alLeft
      Caption = 'ACEPTAR'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = BtnAceptarClick
    end
    object BtnCancelar: TBitBtn
      Left = 465
      Top = 1
      Width = 100
      Height = 39
      Align = alRight
      Caption = 'CANCELAR'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
end
