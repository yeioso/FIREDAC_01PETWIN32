object FrForm_CambioClave: TFrForm_CambioClave
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrForm_CambioClave'
  ClientHeight = 210
  ClientWidth = 286
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 286
    Height = 173
    Align = alClient
    TabOrder = 0
    object lbLogin: TLabel
      Left = 10
      Top = 16
      Width = 45
      Height = 16
      Caption = 'lbLogin'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbNombre: TLabel
      Left = 10
      Top = 46
      Width = 64
      Height = 16
      Caption = 'LbNombre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 10
      Top = 76
      Width = 89
      Height = 13
      Caption = 'Contrase'#241'a Actual'
      FocusControl = pfClave_Anterior
    end
    object Label4: TLabel
      Left = 10
      Top = 106
      Width = 90
      Height = 13
      Caption = 'Contrase'#241'a Nueva'
      FocusControl = pfClave_Nueva
    end
    object Label5: TLabel
      Left = 10
      Top = 136
      Width = 106
      Height = 13
      Caption = 'Confirmar Contrase'#241'a'
      FocusControl = pfClave_Confirmacion
    end
    object pfClave_Anterior: TOvcPictureField
      Left = 136
      Top = 72
      Width = 130
      Height = 21
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
      InitDateTime = False
      MaxLength = 50
      Options = [efoCaretToEnd, efoPasswordMode, efoSoftValidation, efoTrimBlanks]
      PictureMask = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      TabOrder = 0
      OnUserValidation = pfClave_AnteriorUserValidation
    end
    object pfClave_Nueva: TOvcPictureField
      Left = 136
      Top = 104
      Width = 130
      Height = 21
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
      InitDateTime = False
      MaxLength = 50
      Options = [efoCaretToEnd, efoPasswordMode, efoSoftValidation, efoTrimBlanks]
      PictureMask = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      TabOrder = 1
      OnUserValidation = pfClave_NuevaUserValidation
    end
    object pfClave_Confirmacion: TOvcPictureField
      Left = 136
      Top = 135
      Width = 130
      Height = 21
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
      InitDateTime = False
      MaxLength = 50
      Options = [efoCaretToEnd, efoPasswordMode, efoSoftValidation, efoTrimBlanks]
      PictureMask = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      TabOrder = 2
      OnUserValidation = pfClave_ConfirmacionUserValidation
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 173
    Width = 286
    Height = 37
    Align = alBottom
    TabOrder = 1
    object BtnAceptar: TBitBtn
      Left = 41
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Aceptar'
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
    end
    object BtnCancelar: TBitBtn
      Left = 169
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
end
