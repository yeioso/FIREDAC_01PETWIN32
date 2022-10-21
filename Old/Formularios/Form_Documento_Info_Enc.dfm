object FrDocumento_Info_Enc: TFrDocumento_Info_Enc
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrDocumento_Info_Enc'
  ClientHeight = 411
  ClientWidth = 676
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  TextHeight = 14
  object gbInfo_Enc: TGroupBox
    Left = 0
    Top = 0
    Width = 676
    Height = 369
    Align = alTop
    Caption = ' Informaci'#243'n del Encabezado del Documento '
    TabOrder = 0
    ExplicitWidth = 680
    object Label1: TLabel
      Left = 10
      Top = 26
      Width = 39
      Height = 14
      Caption = 'Datakey'
      FocusControl = DATAKEY
    end
    object Label2: TLabel
      Left = 10
      Top = 50
      Width = 92
      Height = 14
      Caption = 'Nro. de Documento'
      FocusControl = NUMERO_DOCUMENTO
    end
    object Label3: TLabel
      Left = 10
      Top = 99
      Width = 43
      Height = 14
      Caption = 'Sinonimo'
      FocusControl = CODIGO_SINONIMO
    end
    object Label4: TLabel
      Left = 10
      Top = 74
      Width = 37
      Height = 14
      Caption = 'Tercero'
      FocusControl = CODIGO_TERCERO
    end
    object Label5: TLabel
      Left = 10
      Top = 270
      Width = 132
      Height = 14
      Caption = 'Vencimiento del Documento'
      FocusControl = FECHA_VENCIMIENTO
    end
    object Label6: TLabel
      Left = 10
      Top = 221
      Width = 104
      Height = 14
      Caption = 'Fecha del Documento'
      FocusControl = FECHA_DOCUMENTO
    end
    object Label9: TLabel
      Left = 10
      Top = 148
      Width = 47
      Height = 14
      Caption = 'Vendedor'
      FocusControl = CODIGO_VENDEDOR
    end
    object Label11: TLabel
      Left = 10
      Top = 319
      Width = 88
      Height = 14
      Caption = 'Fecha del Sistema'
      FocusControl = FECHA
    end
    object Label12: TLabel
      Left = 10
      Top = 197
      Width = 37
      Height = 14
      Caption = 'Usuario'
      FocusControl = CODIGO_USUARIO
    end
    object Label13: TLabel
      Left = 10
      Top = 344
      Width = 81
      Height = 14
      Caption = 'Hora del Sistema'
      FocusControl = HORA
    end
    object lbNombre_Tercero: TLabel
      Left = 368
      Top = 74
      Width = 88
      Height = 14
      Caption = 'lbNombre_Tercero'
    end
    object lbNombre_Sinonimo: TLabel
      Left = 368
      Top = 100
      Width = 94
      Height = 14
      Caption = 'lbNombre_Sinonimo'
    end
    object lbNombre_Vendedor: TLabel
      Left = 368
      Top = 149
      Width = 98
      Height = 14
      Caption = 'lbNombre_Vendedor'
    end
    object lbNombre_Usuario: TLabel
      Left = 343
      Top = 196
      Width = 88
      Height = 14
      Caption = 'lbNombre_Usuario'
    end
    object BtnTercero: TSpeedButton
      Left = 343
      Top = 72
      Width = 23
      Height = 22
      Cursor = crHandPoint
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
      OnClick = BtnTerceroClick
    end
    object BtnSinonimo: TSpeedButton
      Left = 343
      Top = 94
      Width = 23
      Height = 22
      Cursor = crHandPoint
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
      OnClick = BtnSinonimoClick
    end
    object BtnVendedor: TSpeedButton
      Left = 343
      Top = 142
      Width = 23
      Height = 22
      Cursor = crHandPoint
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
      OnClick = BtnVendedorClick
    end
    object Label14: TLabel
      Left = 10
      Top = 246
      Width = 26
      Height = 14
      Caption = 'Plazo'
      FocusControl = PLAZO
    end
    object BtnFechaDocumento: TSpeedButton
      Left = 343
      Top = 216
      Width = 23
      Height = 22
      Cursor = crHandPoint
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
      OnClick = BtnFechaDocumentoClick
    end
    object Label10: TLabel
      Left = 10
      Top = 123
      Width = 71
      Height = 14
      Caption = 'Lista de Precio'
      FocusControl = CODIGO_TERCERO_LP
    end
    object lbNombre_LP: TLabel
      Left = 369
      Top = 125
      Width = 63
      Height = 14
      Caption = 'lbNombre_LP'
    end
    object BtnLP: TSpeedButton
      Left = 343
      Top = 118
      Width = 23
      Height = 22
      Cursor = crHandPoint
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
      OnClick = BtnLPClick
    end
    object Label15: TLabel
      Left = 10
      Top = 172
      Width = 25
      Height = 14
      Caption = 'Base'
      FocusControl = CODIGO_BASE
    end
    object lbNombre_Base: TLabel
      Left = 369
      Top = 174
      Width = 76
      Height = 14
      Caption = 'lbNombre_Base'
    end
    object BtnBase: TSpeedButton
      Left = 343
      Top = 168
      Width = 23
      Height = 22
      Cursor = crHandPoint
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
      OnClick = BtnBaseClick
    end
    object Label16: TLabel
      Left = 10
      Top = 295
      Width = 101
      Height = 14
      Caption = 'N'#250'mero de Personas'
      FocusControl = NUMERO_PERSONAS
    end
    object DATAKEY: TOvcDbPictureField
      Left = 143
      Top = 20
      Width = 197
      Height = 22
      DataField = 'DATAKEY'
      CaretOvr.Shape = csBlock
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 30
      Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation, efoTrimBlanks]
      PictureMask = '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
      TabOrder = 0
    end
    object NUMERO_DOCUMENTO: TOvcDbPictureField
      Left = 143
      Top = 44
      Width = 197
      Height = 22
      DataField = 'NUMERO_DOCUMENTO'
      CaretOvr.Shape = csBlock
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 20
      Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
      PictureMask = '!!!!!!!!!!!!!!!!!!!!'
      TabOrder = 1
    end
    object CODIGO_SINONIMO: TOvcDbPictureField
      Left = 143
      Top = 93
      Width = 197
      Height = 22
      DataField = 'CODIGO_SINONIMO'
      CaretOvr.Shape = csBlock
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 20
      Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
      PictureMask = '!!!!!!!!!!!!!!!!!!!!'
      TabOrder = 3
      OnExit = CODIGO_SINONIMOExit
      OnKeyDown = CODIGO_SINONIMOKeyDown
      OnUserValidation = CODIGO_SINONIMOUserValidation
    end
    object CODIGO_TERCERO: TOvcDbPictureField
      Left = 143
      Top = 69
      Width = 197
      Height = 22
      DataField = 'CODIGO_TERCERO'
      CaretOvr.Shape = csBlock
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 20
      Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
      PictureMask = '!!!!!!!!!!!!!!!!!!!!'
      TabOrder = 2
      OnChange = CODIGO_TERCEROChange
      OnExit = CODIGO_TERCEROExit
      OnKeyDown = CODIGO_TERCEROKeyDown
      OnUserValidation = CODIGO_TERCEROUserValidation
    end
    object FECHA_DOCUMENTO: TOvcDbPictureField
      Left = 143
      Top = 216
      Width = 197
      Height = 22
      DataField = 'FECHA_DOCUMENTO'
      CaretOvr.Shape = csBlock
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 10
      Options = [efoCaretToEnd, efoSoftValidation]
      PictureMask = 'XXXXXXXXXX'
      TabOrder = 8
      OnChange = FECHA_DOCUMENTOChange
      OnKeyDown = FECHA_DOCUMENTOKeyDown
      OnUserValidation = FECHA_DOCUMENTOUserValidation
    end
    object FECHA_VENCIMIENTO: TOvcDbPictureField
      Left = 143
      Top = 265
      Width = 197
      Height = 22
      DataField = 'FECHA_VENCIMIENTO'
      CaretOvr.Shape = csBlock
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 10
      Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation]
      PictureMask = 'XXXXXXXXXX'
      TabOrder = 10
    end
    object CODIGO_VENDEDOR: TOvcDbPictureField
      Left = 143
      Top = 142
      Width = 197
      Height = 22
      DataField = 'CODIGO_VENDEDOR'
      CaretOvr.Shape = csBlock
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 20
      Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
      PictureMask = '!!!!!!!!!!!!!!!!!!!!'
      TabOrder = 5
      OnExit = CODIGO_VENDEDORExit
      OnKeyDown = CODIGO_VENDEDORKeyDown
      OnUserValidation = CODIGO_VENDEDORUserValidation
    end
    object FECHA: TOvcDbPictureField
      Left = 143
      Top = 314
      Width = 197
      Height = 22
      DataField = 'FECHA'
      CaretOvr.Shape = csBlock
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 10
      Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation]
      PictureMask = 'XXXXXXXXXX'
      TabOrder = 12
    end
    object CODIGO_USUARIO: TOvcDbPictureField
      Left = 143
      Top = 191
      Width = 197
      Height = 22
      DataField = 'CODIGO_USUARIO'
      CaretOvr.Shape = csBlock
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 20
      Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
      PictureMask = '!!!!!!!!!!!!!!!!!!!!'
      TabOrder = 7
    end
    object HORA: TOvcDbPictureField
      Left = 143
      Top = 339
      Width = 197
      Height = 22
      DataField = 'HORA'
      CaretOvr.Shape = csBlock
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 5
      Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation]
      PictureMask = 'hh:mm'
      TabOrder = 13
    end
    object PLAZO: TOvcDbPictureField
      Left = 143
      Top = 240
      Width = 197
      Height = 22
      DataField = 'PLAZO'
      FieldType = ftFloat
      CaretOvr.Shape = csBlock
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 3
      Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
      PictureMask = '###'
      TabOrder = 9
      OnChange = PLAZOChange
      RangeHigh = {E175587FED2AB1ECFE7F}
      RangeLow = {E175587FED2AB1ECFEFF}
    end
    object Paginas: TPageControl
      Left = 346
      Top = 244
      Width = 331
      Height = 118
      ActivePage = Pag00
      TabOrder = 14
      object TabSheet1: TTabSheet
        Caption = 'Otros'
        ImageIndex = 3
        object Label17: TLabel
          Left = 3
          Top = 15
          Width = 110
          Height = 14
          Caption = 'Documento Referencia'
          FocusControl = DOCUMENTO_REFERENCIA
        end
        object DOCUMENTO_REFERENCIA: TOvcDbPictureField
          Left = 10
          Top = 35
          Width = 197
          Height = 22
          DataField = 'DOCUMENTO_REFERENCIA'
          CaretOvr.Shape = csBlock
          EFColors.Disabled.BackColor = clWindow
          EFColors.Disabled.TextColor = clGrayText
          EFColors.Error.BackColor = clRed
          EFColors.Error.TextColor = clBlack
          EFColors.Highlight.BackColor = clHighlight
          EFColors.Highlight.TextColor = clHighlightText
          MaxLength = 20
          Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
          PictureMask = '!!!!!!!!!!!!!!!!!!!!'
          TabOrder = 0
        end
      end
      object Pag00: TTabSheet
        Caption = 'Descripci'#243'n / Garant'#237'a'
        object Label7: TLabel
          Left = 3
          Top = 3
          Width = 57
          Height = 14
          Caption = 'Descripci'#243'n'
          FocusControl = NOMBRE
        end
        object Label8: TLabel
          Left = 3
          Top = 48
          Width = 41
          Height = 14
          Caption = 'Garant'#237'a'
          FocusControl = GARANTIA
        end
        object NOMBRE: TOvcDbPictureField
          Left = 5
          Top = 20
          Width = 290
          Height = 22
          DataField = 'NOMBRE'
          CaretOvr.Shape = csBlock
          EFColors.Disabled.BackColor = clWindow
          EFColors.Disabled.TextColor = clGrayText
          EFColors.Error.BackColor = clRed
          EFColors.Error.TextColor = clBlack
          EFColors.Highlight.BackColor = clHighlight
          EFColors.Highlight.TextColor = clHighlightText
          MaxLength = 60
          Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
          PictureMask = '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
          TabOrder = 0
        end
        object GARANTIA: TOvcDbPictureField
          Left = 3
          Top = 63
          Width = 290
          Height = 22
          DataField = 'GARANTIA'
          CaretOvr.Shape = csBlock
          EFColors.Disabled.BackColor = clWindow
          EFColors.Disabled.TextColor = clGrayText
          EFColors.Error.BackColor = clRed
          EFColors.Error.TextColor = clBlack
          EFColors.Highlight.BackColor = clHighlight
          EFColors.Highlight.TextColor = clHighlightText
          MaxLength = 60
          Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
          PictureMask = '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
          TabOrder = 1
        end
      end
      object Pag01: TTabSheet
        Caption = 'Direcci'#243'n'
        ImageIndex = 1
        object DIRECCION: TDBMemo
          Left = 0
          Top = 0
          Width = 323
          Height = 89
          Align = alClient
          DataField = 'DIRECCION'
          TabOrder = 0
        end
      end
      object Pag02: TTabSheet
        Caption = 'Observaci'#243'n'
        ImageIndex = 2
        object OBSERVACION: TDBMemo
          Left = 0
          Top = 0
          Width = 323
          Height = 89
          Align = alClient
          DataField = 'OBSERVACION'
          TabOrder = 0
        end
      end
    end
    object CODIGO_TERCERO_LP: TOvcDbPictureField
      Left = 143
      Top = 118
      Width = 197
      Height = 22
      DataField = 'CODIGO_TERCERO_LP'
      CaretOvr.Shape = csBlock
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 2
      Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
      PictureMask = '!!'
      TabOrder = 4
      OnChange = CODIGO_TERCERO_LPChange
      OnExit = CODIGO_TERCERO_LPExit
      OnKeyDown = CODIGO_TERCERO_LPKeyDown
      OnUserValidation = CODIGO_TERCERO_LPUserValidation
    end
    object CODIGO_BASE: TOvcDbPictureField
      Left = 143
      Top = 167
      Width = 197
      Height = 22
      DataField = 'CODIGO_BASE'
      CaretOvr.Shape = csBlock
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 4
      Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
      PictureMask = '!!!!'
      TabOrder = 6
      OnChange = CODIGO_BASEChange
      OnExit = CODIGO_BASEExit
      OnKeyDown = CODIGO_BASEKeyDown
      OnUserValidation = CODIGO_BASEUserValidation
    end
    object NUMERO_PERSONAS: TOvcDbPictureField
      Left = 143
      Top = 289
      Width = 197
      Height = 22
      DataField = 'NUMERO_PERSONAS'
      FieldType = ftFloat
      CaretOvr.Shape = csBlock
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 7
      Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
      PictureMask = '###,###'
      TabOrder = 11
      OnChange = PLAZOChange
      RangeHigh = {E175587FED2AB1ECFE7F}
      RangeLow = {E175587FED2AB1ECFEFF}
    end
  end
  object pnlBotones: TPanel
    Left = 0
    Top = 370
    Width = 676
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 371
    ExplicitWidth = 680
    object BtnAceptar: TBitBtn
      Left = 1
      Top = 1
      Width = 168
      Height = 39
      Cursor = crHandPoint
      Align = alLeft
      Caption = '&ACEPTAR'
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
      Left = 511
      Top = 1
      Width = 168
      Height = 39
      Cursor = crHandPoint
      Align = alRight
      Caption = '&CANCELAR'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
end
