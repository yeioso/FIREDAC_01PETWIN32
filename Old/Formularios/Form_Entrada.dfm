object FrEntrada: TFrEntrada
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Acceso al programa'
  ClientHeight = 150
  ClientWidth = 409
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
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 109
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 10
      Width = 44
      Height = 16
      Caption = '&Usuario'
      FocusControl = CODIGO_USUARIO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 61
      Width = 66
      Height = 16
      BiDiMode = bdLeftToRight
      Caption = '&Contrase'#241'a'
      FocusControl = CONTRASENA
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
    end
    object BtnUsuario: TSpeedButton
      Left = 176
      Top = 28
      Width = 23
      Height = 24
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE7E6E5999792807E7AA2A09AF4F4F4FFFFFFFF
        FFFFFFFFFFFFFFFFE2E2E08F8E897F7C79ABAAA5F8F8F7FFFFFFE0DFDD36322C
        3442555D6C872B38515C584EF7F7F6FFFFFFFFFFFFD8D7D533322C45526D6874
        87272D3A5C584FFBFBFB7675731F47A55B91FF5188FF4F83FF142777B5B3AAFF
        FFFFFFFFFF7E7C79294BB96D9FFF679CFF679FFF15336CB5B1AC6F72760838D0
        1C4BFF2C53F91A42FF051A95ACAA9EFFFFFFFFFFFF7878792045DA2A5EFF3B6B
        FF2D6BFF00329EAEAAA2C6C3BD1E24421B27A22734B815208E1F1E20B7B7B3FF
        FFFFFFFFFF84837C292A3D364ABA3D52CE0C2192333645F0EFEAF5F5F57F7D77
        56554C64636037352C050500D6D6D6FFFFFFFFFFFF95959503010044433B6664
        6156544B9C9B97FFFFFFF1F1F16060605858587A7A791F201F0A0A0ADADBDBFF
        FFFFFFFFFFA4A5A500000040403F7878775151507D7E7EFFFFFFFFFFFF656464
        474747929191515151000000000000D4D4D49191910000000000006B6C6C6D6D
        6D3F3F3F8D8C8CFFFFFFFFFFFFAEAEAE3636365C5C5C40404010101000000094
        94944545450000001616164B4A4A4A4B4B3C3C3CD7D8D8FFFFFFFFFFFFEAEAEA
        5F5F5F5352524949493939392020207272723434342A2A2A3E3E3E4C4C4C5655
        55757575FEFEFEFFFFFFFFFFFFFFFFFFB0B0B07A7A7A7576765F5F5F58585843
        43434040405B5B5B6061617474747C7C7CD1D1D1FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA5A5A59696968989897979796464645858587E7E7E8888888C8D8DBCBC
        BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C43938384E4E4EA1A2A27E
        7F7F787878959595414141484848EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFCECECEBABABAFCFCFCDEDEDEE6E6E6EFEFEFB2B2B2DFDFDFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      OnClick = BtnUsuarioClick
    end
    object CODIGO_USUARIO: TOvcPictureField
      Left = 10
      Top = 28
      Width = 165
      Height = 24
      Cursor = crIBeam
      DataType = pftString
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
      OnKeyDown = CODIGO_USUARIOKeyDown
      OnUserValidation = CODIGO_USUARIOUserValidation
    end
    object CONTRASENA: TOvcPictureField
      Left = 10
      Top = 79
      Width = 400
      Height = 24
      Cursor = crIBeam
      DataType = pftString
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
      TabOrder = 1
      OnUserValidation = CONTRASENAUserValidation
    end
  end
  object pnlBotones: TPanel
    Left = 0
    Top = 109
    Width = 409
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn2: TBitBtn
      Left = 291
      Top = 4
      Width = 91
      Height = 29
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
    object BitBtn1: TBitBtn
      Left = 35
      Top = 4
      Width = 91
      Height = 29
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
    Left = 264
    Top = 8
  end
end
