object FrDocumento_Info_Det: TFrDocumento_Info_Det
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrDocumento_Info_Det'
  ClientHeight = 383
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  TextHeight = 14
  object gnInfo_Detalle: TGroupBox
    Left = 0
    Top = 0
    Width = 621
    Height = 342
    Align = alClient
    Caption = ' Informaci'#243'n del Detalle del Documento '
    TabOrder = 0
    object Paginas: TPageControl
      Left = 2
      Top = 16
      Width = 617
      Height = 324
      ActivePage = Pag01
      Align = alClient
      TabOrder = 0
      object Pag00: TTabSheet
        Caption = 'Datos B'#225'sicos'
        object Label1: TLabel
          Left = 10
          Top = 11
          Width = 39
          Height = 14
          Caption = 'Datakey'
        end
        object Label4: TLabel
          Left = 10
          Top = 85
          Width = 37
          Height = 14
          Caption = 'Nombre'
          FocusControl = NOMBRE
        end
        object Label3: TLabel
          Left = 10
          Top = 60
          Width = 60
          Height = 14
          Caption = 'Consecutivo'
          FocusControl = CONSECUTIVO
        end
        object Label2: TLabel
          Left = 10
          Top = 35
          Width = 43
          Height = 14
          Caption = 'Producto'
          FocusControl = CODIGO_PRODUCTO
        end
        object Label7: TLabel
          Left = 10
          Top = 144
          Width = 62
          Height = 14
          Caption = 'Observaci'#243'n'
          FocusControl = OBSERVACION
        end
        object lbFecha_Documento: TLabel
          Left = 10
          Top = 245
          Width = 104
          Height = 14
          Caption = 'Fecha del Documento'
          FocusControl = FECHA_VENCIMIENTO
        end
        object BtnFechaVencimiento: TSpeedButton
          Left = 223
          Top = 243
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
          OnClick = BtnFechaVencimientoClick
        end
        object Label28: TLabel
          Left = 10
          Top = 115
          Width = 47
          Height = 14
          Caption = 'Vendedor'
          FocusControl = CODIGO_VENDEDOR
        end
        object BtnVendedor: TSpeedButton
          Left = 275
          Top = 109
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
        object lbNombre_Vendedor: TLabel
          Left = 305
          Top = 113
          Width = 98
          Height = 14
          Caption = 'lbNombre_Vendedor'
        end
        object DATAKEY: TOvcDbPictureField
          Left = 74
          Top = 9
          Width = 234
          Height = 22
          DataField = 'DATAKEY'
          FieldType = ftWideString
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
        object CODIGO_PRODUCTO: TOvcDbPictureField
          Left = 74
          Top = 33
          Width = 150
          Height = 22
          DataField = 'CODIGO_PRODUCTO'
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
        object NOMBRE: TOvcDbPictureField
          Left = 74
          Top = 82
          Width = 527
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
          Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation, efoTrimBlanks]
          PictureMask = '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
          TabOrder = 3
        end
        object CONSECUTIVO: TOvcDbPictureField
          Left = 74
          Top = 57
          Width = 150
          Height = 22
          DataField = 'CONSECUTIVO'
          CaretOvr.Shape = csBlock
          EFColors.Disabled.BackColor = clWindow
          EFColors.Disabled.TextColor = clGrayText
          EFColors.Error.BackColor = clRed
          EFColors.Error.TextColor = clBlack
          EFColors.Highlight.BackColor = clHighlight
          EFColors.Highlight.TextColor = clHighlightText
          MaxLength = 5
          Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
          PictureMask = '!!!!!'
          TabOrder = 2
        end
        object OBSERVACION: TDBMemo
          Left = 74
          Top = 141
          Width = 523
          Height = 92
          DataField = 'OBSERVACION'
          TabOrder = 4
        end
        object FECHA_VENCIMIENTO: TOvcDbPictureField
          Left = 119
          Top = 243
          Width = 98
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
          Options = [efoCaretToEnd, efoSoftValidation]
          PictureMask = 'XXXXXXXXXX'
          TabOrder = 5
          OnKeyDown = FECHA_VENCIMIENTOKeyDown
          OnUserValidation = FECHA_VENCIMIENTOUserValidation
        end
        object CODIGO_VENDEDOR: TOvcDbPictureField
          Left = 74
          Top = 109
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
          TabOrder = 6
        end
      end
      object Pag01: TTabSheet
        Caption = 'Valores'
        ImageIndex = 1
        object gbResultados: TGroupBox
          Left = 0
          Top = 0
          Width = 266
          Height = 295
          Align = alLeft
          Caption = 'Resultados'
          TabOrder = 0
          object Label5: TLabel
            Left = 10
            Top = 79
            Width = 42
            Height = 14
            Caption = 'Cantidad'
            FocusControl = CANTIDAD
          end
          object Label6: TLabel
            Left = 10
            Top = 103
            Width = 64
            Height = 14
            Caption = 'Valor Original'
            FocusControl = VALOR_ORIGINAL
          end
          object Label8: TLabel
            Left = 10
            Top = 199
            Width = 64
            Height = 14
            Caption = 'Valor Unitario'
            FocusControl = VALOR_UNITARIO
          end
          object Label9: TLabel
            Left = 10
            Top = 223
            Width = 39
            Height = 14
            Caption = 'Subtotal'
            FocusControl = VALOR_SUBTOTAL
          end
          object Label10: TLabel
            Left = 10
            Top = 270
            Width = 22
            Height = 14
            Caption = 'Total'
            FocusControl = VALOR_TOTAL
          end
          object Label21: TLabel
            Left = 10
            Top = 127
            Width = 60
            Height = 14
            Caption = 'L.P.  Tercero'
            FocusControl = VALOR_LP_ENC
          end
          object Label22: TLabel
            Left = 10
            Top = 151
            Width = 63
            Height = 14
            Caption = 'L.P. Producto'
            FocusControl = VALOR_LP_DET
          end
          object Label23: TLabel
            Left = 10
            Top = 175
            Width = 75
            Height = 14
            Caption = 'Valor Calculado'
            FocusControl = VALOR_CALCULADO
          end
          object Label24: TLabel
            Left = 10
            Top = 246
            Width = 22
            Height = 14
            Caption = 'Neto'
            FocusControl = VALOR_NETO
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Neto'
            Font.Style = []
            ParentFont = False
          end
          object BtnImpuesto: TSpeedButton
            Left = 106
            Top = 20
            Width = 23
            Height = 22
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
            OnClick = BtnImpuestoClick
          end
          object lbNombre_Impuesto: TLabel
            Left = 12
            Top = 48
            Width = 94
            Height = 14
            Caption = 'lbNombre_Impuesto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label29: TLabel
            Left = 12
            Top = 22
            Width = 43
            Height = 14
            Caption = '&Impuesto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object CANTIDAD: TOvcDbPictureField
            Left = 90
            Top = 76
            Width = 132
            Height = 22
            DataField = 'CANTIDAD'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            MaxLength = 18
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 1
            AfterExit = Calcular_Campos
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_ORIGINAL: TOvcDbPictureField
            Left = 90
            Top = 100
            Width = 132
            Height = 22
            DataField = 'VALOR_ORIGINAL'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            MaxLength = 18
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 2
            AfterExit = Calcular_Campos
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_UNITARIO: TOvcDbPictureField
            Left = 90
            Top = 196
            Width = 132
            Height = 22
            DataField = 'VALOR_UNITARIO'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            MaxLength = 18
            Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 6
            AfterExit = Calcular_Campos
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_SUBTOTAL: TOvcDbPictureField
            Left = 90
            Top = 220
            Width = 132
            Height = 22
            DataField = 'VALOR_SUBTOTAL'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Enabled = False
            MaxLength = 18
            Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 7
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_TOTAL: TOvcDbPictureField
            Left = 90
            Top = 268
            Width = 132
            Height = 22
            DataField = 'VALOR_TOTAL'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Enabled = False
            MaxLength = 18
            Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 9
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_LP_ENC: TOvcDbPictureField
            Left = 90
            Top = 124
            Width = 132
            Height = 22
            DataField = 'VALOR_LP_ENC'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            MaxLength = 18
            Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 3
            AfterExit = Calcular_Campos
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_LP_DET: TOvcDbPictureField
            Left = 90
            Top = 148
            Width = 132
            Height = 22
            DataField = 'VALOR_LP_DET'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            MaxLength = 18
            Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 4
            AfterExit = Calcular_Campos
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_CALCULADO: TOvcDbPictureField
            Left = 90
            Top = 172
            Width = 132
            Height = 22
            DataField = 'VALOR_CALCULADO'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            MaxLength = 18
            Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 5
            AfterExit = Calcular_Campos
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_NETO: TOvcDbPictureField
            Left = 90
            Top = 244
            Width = 132
            Height = 22
            DataField = 'VALOR_NETO'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Enabled = False
            MaxLength = 18
            Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 8
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object CODIGO_IMPUESTO: TOvcDbPictureField
            Left = 61
            Top = 20
            Width = 40
            Height = 22
            DataField = 'CODIGO_IMPUESTO'
            FieldType = ftString
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 4
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            ParentFont = False
            PictureMask = '!!!!'
            TabOrder = 0
            AfterExit = Calcular_Campos
            OnExit = CODIGO_IMPUESTOExit
            OnKeyDown = CODIGO_IMPUESTOKeyDown
            OnUserValidation = CODIGO_IMPUESTOUserValidation
          end
        end
        object gbImpuestos: TGroupBox
          Left = 266
          Top = 0
          Width = 294
          Height = 295
          Align = alLeft
          Caption = 'Impuestos'
          TabOrder = 1
          object Label11: TLabel
            Left = 10
            Top = 55
            Width = 52
            Height = 14
            Caption = 'Descuento'
            FocusControl = PORC_DESCUENTO
          end
          object Label12: TLabel
            Left = 79
            Top = 14
            Width = 51
            Height = 14
            Caption = 'Porcentaje'
            FocusControl = PORC_DESCUENTO
          end
          object Label13: TLabel
            Left = 262
            Top = 14
            Width = 25
            Height = 14
            Caption = 'Valor'
            FocusControl = PORC_DESCUENTO
          end
          object Label14: TLabel
            Left = 10
            Top = 79
            Width = 39
            Height = 14
            Caption = 'Servicio'
            FocusControl = PORC_SERVICIO
          end
          object Label15: TLabel
            Left = 10
            Top = 103
            Width = 26
            Height = 14
            Caption = 'I.V.A.'
            FocusControl = PORC_IVA
          end
          object Label16: TLabel
            Left = 10
            Top = 151
            Width = 36
            Height = 14
            Caption = 'Reteiva'
            FocusControl = PORC_RETEIVA
          end
          object Label17: TLabel
            Left = 10
            Top = 175
            Width = 53
            Height = 14
            Caption = 'Retefuente'
            FocusControl = PORC_RETEFUENTE
          end
          object Label18: TLabel
            Left = 10
            Top = 199
            Width = 26
            Height = 14
            Caption = 'I.C.A.'
            FocusControl = PORC_ICA
          end
          object Label19: TLabel
            Left = 10
            Top = 247
            Width = 26
            Height = 14
            Caption = 'CREE'
            FocusControl = PORC_CREE
          end
          object Label20: TLabel
            Left = 10
            Top = 127
            Width = 67
            Height = 14
            Caption = 'Imp. Consumo'
            FocusControl = PORC_IMPCONSUMO
          end
          object Label25: TLabel
            Left = 10
            Top = 223
            Width = 33
            Height = 14
            Caption = 'Interes'
            FocusControl = PORC_INTERES
          end
          object Label26: TLabel
            Left = 10
            Top = 31
            Width = 25
            Height = 14
            Caption = 'Base'
            FocusControl = PORC_DESCUENTO
          end
          object BTNSERVICIO_VALOR: TSpeedButton
            Left = 51
            Top = 76
            Width = 23
            Height = 22
            Cursor = crHandPoint
            Caption = '$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            OnClick = BTNSERVICIO_VALORClick
          end
          object PORC_DESCUENTO: TOvcDbPictureField
            Left = 78
            Top = 53
            Width = 63
            Height = 22
            DataField = 'PORC_DESCUENTO'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            MaxLength = 9
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###.#####'
            TabOrder = 2
            AfterExit = Calcular_Campos
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_DESCUENTO: TOvcDbPictureField
            Left = 159
            Top = 53
            Width = 128
            Height = 22
            DataField = 'VALOR_DESCUENTO'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Enabled = False
            MaxLength = 18
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 3
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_SERVICIO: TOvcDbPictureField
            Left = 78
            Top = 77
            Width = 63
            Height = 22
            DataField = 'PORC_SERVICIO'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            MaxLength = 9
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###.#####'
            TabOrder = 4
            AfterExit = Calcular_Campos
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_SERVICIO: TOvcDbPictureField
            Left = 159
            Top = 77
            Width = 128
            Height = 22
            DataField = 'VALOR_SERVICIO'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Enabled = False
            MaxLength = 18
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 5
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_IVA: TOvcDbPictureField
            Left = 78
            Top = 101
            Width = 63
            Height = 22
            DataField = 'PORC_IVA'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            MaxLength = 9
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###.#####'
            TabOrder = 6
            AfterExit = Calcular_Campos
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_IVA: TOvcDbPictureField
            Left = 159
            Top = 101
            Width = 128
            Height = 22
            DataField = 'VALOR_IVA'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Enabled = False
            MaxLength = 18
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 7
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_RETEIVA: TOvcDbPictureField
            Left = 78
            Top = 149
            Width = 63
            Height = 22
            DataField = 'PORC_RETEIVA'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            MaxLength = 9
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###.#####'
            TabOrder = 10
            AfterExit = Calcular_Campos
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_RETEIVA: TOvcDbPictureField
            Left = 159
            Top = 149
            Width = 128
            Height = 22
            DataField = 'VALOR_RETEIVA'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Enabled = False
            MaxLength = 18
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 11
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_RETEFUENTE: TOvcDbPictureField
            Left = 78
            Top = 173
            Width = 63
            Height = 22
            DataField = 'PORC_RETEFUENTE'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            MaxLength = 9
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###.#####'
            TabOrder = 12
            AfterExit = Calcular_Campos
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_RETEFUENTE: TOvcDbPictureField
            Left = 159
            Top = 173
            Width = 128
            Height = 22
            DataField = 'VALOR_RETEFUENTE'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Enabled = False
            MaxLength = 18
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 13
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_ICA: TOvcDbPictureField
            Left = 78
            Top = 197
            Width = 63
            Height = 22
            DataField = 'PORC_ICA'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            MaxLength = 9
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###.#####'
            TabOrder = 14
            AfterExit = Calcular_Campos
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_ICA: TOvcDbPictureField
            Left = 159
            Top = 197
            Width = 128
            Height = 22
            DataField = 'VALOR_ICA'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Enabled = False
            MaxLength = 18
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 15
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_CREE: TOvcDbPictureField
            Left = 78
            Top = 245
            Width = 63
            Height = 22
            DataField = 'PORC_CREE'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            MaxLength = 9
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###.#####'
            TabOrder = 18
            AfterExit = Calcular_Campos
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_CREE: TOvcDbPictureField
            Left = 159
            Top = 245
            Width = 128
            Height = 22
            DataField = 'VALOR_CREE'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Enabled = False
            MaxLength = 18
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 19
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_IMPCONSUMO: TOvcDbPictureField
            Left = 78
            Top = 125
            Width = 63
            Height = 22
            DataField = 'PORC_IMPCONSUMO'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            MaxLength = 9
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###.#####'
            TabOrder = 8
            AfterExit = Calcular_Campos
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_IMPCONSUMO: TOvcDbPictureField
            Left = 159
            Top = 125
            Width = 128
            Height = 22
            DataField = 'VALOR_IMPCONSUMO'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Enabled = False
            MaxLength = 18
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 9
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_INTERES: TOvcDbPictureField
            Left = 78
            Top = 221
            Width = 63
            Height = 22
            DataField = 'PORC_INTERES'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            MaxLength = 9
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###.#####'
            TabOrder = 16
            AfterExit = Calcular_Campos
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_INTERES: TOvcDbPictureField
            Left = 159
            Top = 220
            Width = 128
            Height = 22
            DataField = 'VALOR_INTERES'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Enabled = False
            MaxLength = 18
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 17
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_BASE: TOvcDbPictureField
            Left = 78
            Top = 29
            Width = 63
            Height = 22
            DataField = 'PORC_BASE'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            MaxLength = 9
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###.#####'
            TabOrder = 0
            AfterExit = Calcular_Campos
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object VALOR_BASE: TOvcDbPictureField
            Left = 159
            Top = 29
            Width = 128
            Height = 22
            DataField = 'VALOR_BASE'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Enabled = False
            MaxLength = 18
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            PictureMask = '###,###,###,###.##'
            TabOrder = 1
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
        end
      end
    end
  end
  object pnlBotones: TPanel
    Left = 0
    Top = 342
    Width = 621
    Height = 41
    Align = alBottom
    TabOrder = 1
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
      Left = 452
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
    object APLICAR_TODOS: TCheckBox
      Left = 189
      Top = 13
      Width = 244
      Height = 17
      Caption = 'Aplicar estos cambios a todos  los detalles'
      TabOrder = 2
    end
  end
end
