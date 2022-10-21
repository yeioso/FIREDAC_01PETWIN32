object FrForm_Wizard_Init: TFrForm_Wizard_Init
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrForm_Wizard_Init'
  ClientHeight = 237
  ClientWidth = 457
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
    Width = 457
    Height = 189
    Align = alClient
    TabOrder = 0
    object Usuario: TGroupBox
      Left = 1
      Top = 1
      Width = 455
      Height = 187
      Align = alClient
      Caption = 'Usuario'
      TabOrder = 0
      object Label6: TLabel
        Left = 10
        Top = 20
        Width = 75
        Height = 16
        Caption = 'Identificaci'#243'n'
        FocusControl = CODIGO_USUARIO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 10
        Top = 124
        Width = 66
        Height = 16
        Caption = 'Contrase'#241'a'
        FocusControl = CONTRASENA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 10
        Top = 70
        Width = 111
        Height = 16
        Caption = 'Nombre de Usuario'
        FocusControl = NOMBRE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object CONTRASENA: TOvcPictureField
        Left = 10
        Top = 138
        Width = 445
        Height = 24
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
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 100
        Options = [efoCaretToEnd, efoPasswordMode, efoSoftValidation, efoTrimBlanks]
        ParentFont = False
        PictureMask = 
          '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!' +
          '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
        TabOrder = 2
        OnUserValidation = CONTRASENAUserValidation
      end
      object CODIGO_USUARIO: TOvcPictureField
        Left = 10
        Top = 35
        Width = 167
        Height = 24
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
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 20
        Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
        ParentFont = False
        PictureMask = '!!!!!!!!!!!!!!!!!!!!'
        TabOrder = 0
        OnExit = CODIGO_USUARIOExit
        OnUserValidation = CODIGO_USUARIOUserValidation
      end
      object NOMBRE: TOvcPictureField
        Left = 10
        Top = 85
        Width = 445
        Height = 24
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
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 100
        Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
        ParentFont = False
        PictureMask = 
          '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!' +
          '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
        TabOrder = 1
        OnUserValidation = NOMBREUserValidation
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 189
    Width = 457
    Height = 48
    Align = alBottom
    TabOrder = 1
    object BtnAceptar: TBitBtn
      Left = 20
      Top = 8
      Width = 137
      Height = 33
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 0
    end
    object BtnCancelar: TBitBtn
      Left = 299
      Top = 8
      Width = 137
      Height = 33
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
    end
  end
end
