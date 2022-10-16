object FrImpuesto: TFrImpuesto
  Left = 0
  Top = 0
  Caption = 'FrImpuesto'
  ClientHeight = 497
  ClientWidth = 1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 16
  object PnlRegistros: TPanel
    Left = 0
    Top = 0
    Width = 1077
    Height = 253
    Align = alTop
    TabOrder = 0
    object Pagina: TPageControl
      Left = 1
      Top = 1
      Width = 1075
      Height = 251
      ActivePage = Pag00
      Align = alClient
      TabOrder = 0
      object Pag00: TTabSheet
        Caption = 'Datos '
        object Label1: TLabel
          Left = 10
          Top = 8
          Width = 40
          Height = 16
          Caption = '&Codigo'
          FocusControl = CODIGO_IMPUESTO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 10
          Top = 34
          Width = 45
          Height = 16
          Caption = '&Nombre'
          FocusControl = NOMBRE
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object gbTOPE: TGroupBox
          Left = 10
          Top = 60
          Width = 408
          Height = 153
          Caption = 'Porcentajes'
          TabOrder = 2
          object Label12: TLabel
            Left = 10
            Top = 46
            Width = 32
            Height = 16
            Caption = '&I.V.A.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 218
            Top = 20
            Width = 96
            Height = 16
            Caption = 'IMP. CONSUMO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label16: TLabel
            Left = 218
            Top = 46
            Width = 61
            Height = 16
            Caption = 'SERVICIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label19: TLabel
            Left = 10
            Top = 71
            Width = 70
            Height = 16
            Caption = 'RETE I.V.A.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label22: TLabel
            Left = 10
            Top = 99
            Width = 89
            Height = 16
            Caption = 'RETE FUENTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label24: TLabel
            Left = 10
            Top = 124
            Width = 33
            Height = 16
            Caption = 'I.C.A.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label36: TLabel
            Left = 218
            Top = 71
            Width = 36
            Height = 16
            Caption = 'CREE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 218
            Top = 99
            Width = 80
            Height = 16
            Caption = '&DESCUENTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 218
            Top = 124
            Width = 55
            Height = 16
            Caption = '&INTERES'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label53: TLabel
            Left = 10
            Top = 20
            Width = 36
            Height = 16
            Caption = '&BASE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object PORC_IVA: TOvcDbPictureField
            Left = 104
            Top = 42
            Width = 80
            Height = 24
            DataField = 'PORC_IVA'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            Controller = OvcController1
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 10
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            ParentFont = False
            PictureMask = '###.######'
            TabOrder = 1
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_IMPCONSUMO: TOvcDbPictureField
            Left = 318
            Top = 16
            Width = 80
            Height = 24
            DataField = 'PORC_IMPCONSUMO'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            Controller = OvcController1
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 10
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            ParentFont = False
            PictureMask = '###.######'
            TabOrder = 5
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_SERVICIO: TOvcDbPictureField
            Left = 318
            Top = 42
            Width = 80
            Height = 24
            DataField = 'PORC_SERVICIO'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            Controller = OvcController1
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 10
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            ParentFont = False
            PictureMask = '###.######'
            TabOrder = 6
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_RETEIVA: TOvcDbPictureField
            Left = 104
            Top = 68
            Width = 80
            Height = 24
            DataField = 'PORC_RETEIVA'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            Controller = OvcController1
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 10
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            ParentFont = False
            PictureMask = '###.######'
            TabOrder = 2
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_RETEFUENTE: TOvcDbPictureField
            Left = 104
            Top = 94
            Width = 80
            Height = 24
            DataField = 'PORC_RETEFUENTE'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            Controller = OvcController1
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 10
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            ParentFont = False
            PictureMask = '###.######'
            TabOrder = 3
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_ICA: TOvcDbPictureField
            Left = 104
            Top = 120
            Width = 80
            Height = 24
            DataField = 'PORC_ICA'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            Controller = OvcController1
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 10
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            ParentFont = False
            PictureMask = '###.######'
            TabOrder = 4
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_CREE: TOvcDbPictureField
            Left = 318
            Top = 68
            Width = 80
            Height = 24
            DataField = 'PORC_CREE'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            Controller = OvcController1
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 10
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            ParentFont = False
            PictureMask = '###.######'
            TabOrder = 7
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_DESCUENTO: TOvcDbPictureField
            Left = 318
            Top = 94
            Width = 80
            Height = 24
            DataField = 'PORC_DESCUENTO'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            Controller = OvcController1
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 10
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            ParentFont = False
            PictureMask = '###.######'
            TabOrder = 8
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_INTERES: TOvcDbPictureField
            Left = 318
            Top = 120
            Width = 80
            Height = 24
            DataField = 'PORC_INTERES'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            Controller = OvcController1
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 10
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            ParentFont = False
            PictureMask = '###.######'
            TabOrder = 9
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
          object PORC_BASE: TOvcDbPictureField
            Left = 104
            Top = 16
            Width = 80
            Height = 24
            DataField = 'PORC_BASE'
            FieldType = ftFloat
            CaretOvr.Shape = csBlock
            Controller = OvcController1
            EFColors.Disabled.BackColor = clWindow
            EFColors.Disabled.TextColor = clGrayText
            EFColors.Error.BackColor = clRed
            EFColors.Error.TextColor = clBlack
            EFColors.Highlight.BackColor = clHighlight
            EFColors.Highlight.TextColor = clHighlightText
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 10
            Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
            ParentFont = False
            PictureMask = '###.######'
            TabOrder = 0
            RangeHigh = {E175587FED2AB1ECFE7F}
            RangeLow = {E175587FED2AB1ECFEFF}
          end
        end
        object CODIGO_IMPUESTO: TOvcDbPictureField
          Left = 77
          Top = 8
          Width = 44
          Height = 24
          DataField = 'CODIGO_IMPUESTO'
          FieldType = ftString
          CaretOvr.Shape = csBlock
          Controller = OvcController1
          EFColors.Disabled.BackColor = clWindow
          EFColors.Disabled.TextColor = clGrayText
          EFColors.Error.BackColor = clRed
          EFColors.Error.TextColor = clBlack
          EFColors.Highlight.BackColor = clHighlight
          EFColors.Highlight.TextColor = clHighlightText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 4
          Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
          ParentFont = False
          PictureMask = '!!!!'
          TabOrder = 0
        end
        object NOMBRE: TOvcDbPictureField
          Left = 77
          Top = 36
          Width = 341
          Height = 24
          DataField = 'NOMBRE'
          FieldType = ftString
          CaretOvr.Shape = csBlock
          Controller = OvcController1
          EFColors.Disabled.BackColor = clWindow
          EFColors.Disabled.TextColor = clGrayText
          EFColors.Error.BackColor = clRed
          EFColors.Error.TextColor = clBlack
          EFColors.Highlight.BackColor = clHighlight
          EFColors.Highlight.TextColor = clHighlightText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 100
          Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
          ParentFont = False
          PictureMask = 
            '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!' +
            '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
          TabOrder = 1
        end
      end
      object Pag01: TTabSheet
        Caption = 'P.U.C.'
        ImageIndex = 2
        object PaginasPUC: TPageControl
          Left = 0
          Top = 0
          Width = 1067
          Height = 220
          ActivePage = PagSubtotal
          Align = alClient
          TabOrder = 0
          object PagSubtotal: TTabSheet
            Caption = 'SUBTOTAL'
            ImageIndex = 8
            object lbNombre_PUC_SUBTOTAL_DB: TLabel
              Left = 326
              Top = 12
              Width = 187
              Height = 16
              Caption = 'lbNombre_PUC_SUBTOTAL_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_SUBTOTAL_DB: TSpeedButton
              Left = 296
              Top = 11
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
            end
            object Label15: TLabel
              Left = 10
              Top = 10
              Width = 59
              Height = 16
              Caption = 'P.U.C. DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_PUC_SUBTOTAL_CR: TLabel
              Left = 326
              Top = 40
              Width = 187
              Height = 16
              Caption = 'lbNombre_PUC_SUBTOTAL_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_SUBTOTAL_CR: TSpeedButton
              Left = 296
              Top = 37
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
            end
            object Label37: TLabel
              Left = 10
              Top = 36
              Width = 59
              Height = 16
              Caption = 'P.U.C. CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_SUBTOTAL_DB: TLabel
              Left = 326
              Top = 66
              Width = 214
              Height = 16
              Caption = 'lbNombre_CCOSTO_SUBTOTAL_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_SUBTOTAL_DB: TSpeedButton
              Left = 296
              Top = 63
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
            end
            object Label41: TLabel
              Left = 10
              Top = 62
              Width = 85
              Height = 16
              Caption = 'CCOSTOS DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_SUBTOTAL_CR: TLabel
              Left = 326
              Top = 93
              Width = 214
              Height = 16
              Caption = 'lbNombre_CCOSTO_SUBTOTAL_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_SUBTOTAL_CR: TSpeedButton
              Left = 296
              Top = 90
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
            end
            object Label45: TLabel
              Left = 10
              Top = 89
              Width = 85
              Height = 16
              Caption = 'CCOSTOS CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_SUBTOTAL_DB: TLabel
              Left = 326
              Top = 119
              Width = 205
              Height = 16
              Caption = 'lbNombre_CPMTE_SUBTOTAL_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_SUBTOTAL_DB: TSpeedButton
              Left = 296
              Top = 116
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
            end
            object Label39: TLabel
              Left = 10
              Top = 115
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_SUBTOTAL_CR: TLabel
              Left = 326
              Top = 146
              Width = 205
              Height = 16
              Caption = 'lbNombre_CPMTE_SUBTOTAL_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_SUBTOTAL_CR: TSpeedButton
              Left = 296
              Top = 143
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
            end
            object Label49: TLabel
              Left = 10
              Top = 142
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object PUC_SUBTOTAL_DB: TOvcDbPictureField
              Left = 138
              Top = 10
              Width = 156
              Height = 24
              DataField = 'PUC_SUBTOTAL_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 0
            end
            object PUC_SUBTOTAL_CR: TOvcDbPictureField
              Left = 138
              Top = 36
              Width = 156
              Height = 24
              DataField = 'PUC_SUBTOTAL_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 1
            end
            object CCOSTO_SUBTOTAL_DB: TOvcDbPictureField
              Left = 138
              Top = 62
              Width = 156
              Height = 24
              DataField = 'CCOSTO_SUBTOTAL_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 2
            end
            object CCOSTO_SUBTOTAL_CR: TOvcDbPictureField
              Left = 138
              Top = 88
              Width = 156
              Height = 24
              DataField = 'CCOSTO_SUBTOTAL_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 3
            end
            object CPMTE_SUBTOTAL_DB: TOvcDbPictureField
              Left = 138
              Top = 114
              Width = 156
              Height = 24
              DataField = 'CPMTE_SUBTOTAL_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 4
            end
            object CPMTE_SUBTOTAL_CR: TOvcDbPictureField
              Left = 138
              Top = 140
              Width = 156
              Height = 24
              DataField = 'CPMTE_SUBTOTAL_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 5
            end
          end
          object PagSERVICIO: TTabSheet
            Caption = 'SERVICIO'
            object lbNombre_PUC_SERVICIO_DB: TLabel
              Left = 326
              Top = 14
              Width = 182
              Height = 16
              Caption = 'lbNombre_PUC_SERVICIO_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_Servicio_DB: TSpeedButton
              Left = 297
              Top = 10
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
            end
            object Label25: TLabel
              Left = 10
              Top = 10
              Width = 59
              Height = 16
              Caption = 'P.U.C. DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_PUC_SERVICIO_CR: TLabel
              Left = 326
              Top = 40
              Width = 182
              Height = 16
              Caption = 'lbNombre_PUC_SERVICIO_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_Servicio_CR: TSpeedButton
              Left = 297
              Top = 36
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
            end
            object Label32: TLabel
              Left = 10
              Top = 36
              Width = 59
              Height = 16
              Caption = 'P.U.C. CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_SERVICIO_DB: TLabel
              Left = 326
              Top = 66
              Width = 209
              Height = 16
              Caption = 'lbNombre_CCOSTO_SERVICIO_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_Servicio_DB: TSpeedButton
              Left = 297
              Top = 62
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
            end
            object Label11: TLabel
              Left = 10
              Top = 62
              Width = 85
              Height = 16
              Caption = 'CCOSTOS DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_SERVICIO_CR: TLabel
              Left = 326
              Top = 93
              Width = 209
              Height = 16
              Caption = 'lbNombre_CCOSTO_SERVICIO_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_Servicio_CR: TSpeedButton
              Left = 297
              Top = 88
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
            end
            object Label17: TLabel
              Left = 10
              Top = 89
              Width = 85
              Height = 16
              Caption = 'CCOSTOS CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_SERVICIO_DB: TLabel
              Left = 326
              Top = 119
              Width = 200
              Height = 16
              Caption = 'lbNombre_CPMTE_SERVICIO_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_SERVICIO_DB: TSpeedButton
              Left = 297
              Top = 114
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
            end
            object Label43: TLabel
              Left = 10
              Top = 115
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_SERVICIO_CR: TLabel
              Left = 326
              Top = 146
              Width = 200
              Height = 16
              Caption = 'lbNombre_CPMTE_SERVICIO_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_SERVICIO_CR: TSpeedButton
              Left = 297
              Top = 141
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
            end
            object Label56: TLabel
              Left = 10
              Top = 142
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object PUC_SERVICIO_DB: TOvcDbPictureField
              Left = 138
              Top = 10
              Width = 156
              Height = 24
              DataField = 'PUC_SERVICIO_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 0
            end
            object PUC_SERVICIO_CR: TOvcDbPictureField
              Left = 138
              Top = 36
              Width = 156
              Height = 24
              DataField = 'PUC_SERVICIO_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 1
            end
            object CCOSTO_SERVICIO_DB: TOvcDbPictureField
              Left = 138
              Top = 62
              Width = 156
              Height = 24
              DataField = 'CCOSTO_SERVICIO_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 2
            end
            object CCOSTO_SERVICIO_CR: TOvcDbPictureField
              Left = 138
              Top = 88
              Width = 156
              Height = 24
              DataField = 'CCOSTO_SERVICIO_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 3
            end
            object CPMTE_SERVICIO_DB: TOvcDbPictureField
              Left = 138
              Top = 114
              Width = 156
              Height = 24
              DataField = 'CPMTE_SERVICIO_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 4
            end
            object CPMTE_SERVICIO_CR: TOvcDbPictureField
              Left = 138
              Top = 140
              Width = 156
              Height = 24
              DataField = 'CPMTE_SERVICIO_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 5
            end
          end
          object PagDESCUENTO: TTabSheet
            Caption = 'DESCUENTO'
            ImageIndex = 1
            object lbNombre_PUC_DESCUENTO_CR: TLabel
              Left = 326
              Top = 40
              Width = 201
              Height = 16
              Caption = 'lbNombre_PUC_DESCUENTO_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_Descuento_CR: TSpeedButton
              Left = 297
              Top = 36
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
            end
            object Label7: TLabel
              Left = 10
              Top = 36
              Width = 59
              Height = 16
              Caption = 'P.U.C. CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_PUC_DESCUENTO_DB: TLabel
              Left = 326
              Top = 14
              Width = 201
              Height = 16
              Caption = 'lbNombre_PUC_DESCUENTO_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_Descuento_DB: TSpeedButton
              Left = 297
              Top = 10
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
            end
            object Label5: TLabel
              Left = 10
              Top = 10
              Width = 59
              Height = 16
              Caption = 'P.U.C. DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_DESCUENTO_CR: TLabel
              Left = 326
              Top = 93
              Width = 228
              Height = 16
              Caption = 'lbNombre_CCOSTO_DESCUENTO_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_Descuento_CR: TSpeedButton
              Left = 297
              Top = 88
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
            end
            object Label35: TLabel
              Left = 10
              Top = 89
              Width = 85
              Height = 16
              Caption = 'CCOSTOS CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_DESCUENTO_DB: TLabel
              Left = 326
              Top = 66
              Width = 228
              Height = 16
              Caption = 'lbNombre_CCOSTO_DESCUENTO_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_Descuento_DB: TSpeedButton
              Left = 297
              Top = 62
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
            end
            object Label38: TLabel
              Left = 10
              Top = 62
              Width = 85
              Height = 16
              Caption = 'CCOSTOS DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_DESCUENTO_DB: TLabel
              Left = 326
              Top = 119
              Width = 219
              Height = 16
              Caption = 'lbNombre_CPMTE_DESCUENTO_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_DESCUENTO_DB: TSpeedButton
              Left = 297
              Top = 114
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
            end
            object Label58: TLabel
              Left = 10
              Top = 115
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_DESCUENTO_CR: TLabel
              Left = 326
              Top = 146
              Width = 219
              Height = 16
              Caption = 'lbNombre_CPMTE_DESCUENTO_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_DESCUENTO_CR: TSpeedButton
              Left = 297
              Top = 141
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
            end
            object Label60: TLabel
              Left = 10
              Top = 142
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object PUC_DESCUENTO_CR: TOvcDbPictureField
              Left = 138
              Top = 36
              Width = 156
              Height = 24
              DataField = 'PUC_DESCUENTO_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 1
            end
            object PUC_DESCUENTO_DB: TOvcDbPictureField
              Left = 138
              Top = 10
              Width = 156
              Height = 24
              DataField = 'PUC_DESCUENTO_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 0
            end
            object CCOSTO_DESCUENTO_CR: TOvcDbPictureField
              Left = 138
              Top = 88
              Width = 156
              Height = 24
              DataField = 'CCOSTO_DESCUENTO_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 3
            end
            object CCOSTO_DESCUENTO_DB: TOvcDbPictureField
              Left = 138
              Top = 62
              Width = 156
              Height = 24
              DataField = 'CCOSTO_DESCUENTO_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 2
            end
            object CPMTE_DESCUENTO_DB: TOvcDbPictureField
              Left = 138
              Top = 114
              Width = 156
              Height = 24
              DataField = 'CPMTE_DESCUENTO_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 4
            end
            object CPMTE_DESCUENTO_CR: TOvcDbPictureField
              Left = 138
              Top = 140
              Width = 156
              Height = 24
              DataField = 'CPMTE_DESCUENTO_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 5
            end
          end
          object PagIVA: TTabSheet
            Caption = 'I.V.A.'
            ImageIndex = 2
            object lbNombre_PUC_IVA_DB: TLabel
              Left = 326
              Top = 14
              Width = 141
              Height = 16
              Caption = 'lbNombre_PUC_IVA_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_IVA_DB: TSpeedButton
              Left = 297
              Top = 12
              Width = 23
              Height = 23
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
            end
            object Label4: TLabel
              Left = 10
              Top = 10
              Width = 59
              Height = 16
              Caption = '&P.U.C. DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_PUC_IVA_CR: TLabel
              Left = 327
              Top = 40
              Width = 141
              Height = 16
              Caption = 'lbNombre_PUC_IVA_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_IVA_CR: TSpeedButton
              Left = 297
              Top = 37
              Width = 23
              Height = 23
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
            end
            object Label27: TLabel
              Left = 10
              Top = 36
              Width = 59
              Height = 16
              Caption = '&P.U.C. CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_IVA_DB: TLabel
              Left = 326
              Top = 66
              Width = 168
              Height = 16
              Caption = 'lbNombre_CCOSTO_IVA_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_IVA_DB: TSpeedButton
              Left = 297
              Top = 63
              Width = 23
              Height = 23
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
            end
            object Label8: TLabel
              Left = 10
              Top = 62
              Width = 85
              Height = 16
              Caption = '&CCOSTOS DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_IVA_CR: TLabel
              Left = 326
              Top = 93
              Width = 177
              Height = 16
              Caption = 'lbNombre_CCOSTOS_IVA_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_IVA_CR: TSpeedButton
              Left = 297
              Top = 89
              Width = 23
              Height = 23
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
            end
            object Label10: TLabel
              Left = 10
              Top = 89
              Width = 85
              Height = 16
              Caption = '&CCOSTOS CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_IVA_DB: TLabel
              Left = 326
              Top = 119
              Width = 159
              Height = 16
              Caption = 'lbNombre_CPMTE_IVA_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_IVA_DB: TSpeedButton
              Left = 297
              Top = 115
              Width = 23
              Height = 23
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
            end
            object Label62: TLabel
              Left = 10
              Top = 115
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_IVA_CR: TLabel
              Left = 326
              Top = 146
              Width = 159
              Height = 16
              Caption = 'lbNombre_CPMTE_IVA_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_IVA_CR: TSpeedButton
              Left = 297
              Top = 141
              Width = 23
              Height = 23
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
            end
            object Label64: TLabel
              Left = 10
              Top = 142
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object PUC_IVA_DB: TOvcDbPictureField
              Left = 138
              Top = 10
              Width = 156
              Height = 24
              DataField = 'PUC_IVA_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              Ctl3D = True
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentCtl3D = False
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 0
            end
            object PUC_IVA_CR: TOvcDbPictureField
              Left = 138
              Top = 36
              Width = 156
              Height = 24
              DataField = 'PUC_IVA_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              Ctl3D = True
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentCtl3D = False
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 1
            end
            object CCOSTO_IVA_DB: TOvcDbPictureField
              Left = 138
              Top = 62
              Width = 156
              Height = 24
              DataField = 'CCOSTO_IVA_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              Ctl3D = True
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentCtl3D = False
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 2
            end
            object CCOSTO_IVA_CR: TOvcDbPictureField
              Left = 138
              Top = 88
              Width = 156
              Height = 24
              DataField = 'CCOSTO_IVA_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              Ctl3D = True
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentCtl3D = False
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 3
            end
            object CPMTE_IVA_DB: TOvcDbPictureField
              Left = 138
              Top = 114
              Width = 156
              Height = 24
              DataField = 'CPMTE_IVA_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 4
            end
            object CPMTE_IVA_CR: TOvcDbPictureField
              Left = 138
              Top = 140
              Width = 156
              Height = 24
              DataField = 'CPMTE_IVA_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 5
            end
          end
          object PagRETEIVA: TTabSheet
            Caption = 'RETEIVA'
            ImageIndex = 3
            object lbNombre_PUC_RETEIVA_DB: TLabel
              Left = 325
              Top = 14
              Width = 175
              Height = 16
              Caption = 'lbNombre_PUC_RETEIVA_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_RETEIVA_DB: TSpeedButton
              Left = 297
              Top = 11
              Width = 23
              Height = 23
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
            end
            object Label18: TLabel
              Left = 10
              Top = 10
              Width = 59
              Height = 16
              Caption = 'P.U.C. DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_PUC_RETEIVA_CR: TLabel
              Left = 325
              Top = 40
              Width = 175
              Height = 16
              Caption = 'lbNombre_PUC_RETEIVA_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_RETEIVA_CR: TSpeedButton
              Left = 297
              Top = 37
              Width = 23
              Height = 23
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
            end
            object Label28: TLabel
              Left = 10
              Top = 36
              Width = 59
              Height = 16
              Caption = 'P.U.C. CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_RETEIVA_DB: TLabel
              Left = 325
              Top = 66
              Width = 202
              Height = 16
              Caption = 'lbNombre_CCOSTO_RETEIVA_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_RETEIVA_DB: TSpeedButton
              Left = 297
              Top = 63
              Width = 23
              Height = 23
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
            end
            object Label9: TLabel
              Left = 10
              Top = 62
              Width = 85
              Height = 16
              Caption = 'CCOSTOS DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_RETEIVA_CR: TLabel
              Left = 325
              Top = 93
              Width = 202
              Height = 16
              Caption = 'lbNombre_CCOSTO_RETEIVA_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_RETEIVA_CR: TSpeedButton
              Left = 297
              Top = 89
              Width = 23
              Height = 23
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
            end
            object Label13: TLabel
              Left = 10
              Top = 89
              Width = 85
              Height = 16
              Caption = 'CCOSTOS CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_RETEIVA_DB: TLabel
              Left = 326
              Top = 119
              Width = 193
              Height = 16
              Caption = 'lbNombre_CPMTE_RETEIVA_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_RETEIVA_DB: TSpeedButton
              Left = 297
              Top = 115
              Width = 23
              Height = 23
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
            end
            object Label66: TLabel
              Left = 10
              Top = 115
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_RETEIVA_CR: TLabel
              Left = 326
              Top = 146
              Width = 193
              Height = 16
              Caption = 'lbNombre_CPMTE_RETEIVA_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_RETEIVA_CR: TSpeedButton
              Left = 298
              Top = 141
              Width = 23
              Height = 23
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
            end
            object Label68: TLabel
              Left = 10
              Top = 142
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object PUC_RETEIVA_DB: TOvcDbPictureField
              Left = 138
              Top = 10
              Width = 156
              Height = 24
              DataField = 'PUC_RETEIVA_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 0
            end
            object PUC_RETEIVA_CR: TOvcDbPictureField
              Left = 138
              Top = 36
              Width = 156
              Height = 24
              DataField = 'PUC_RETEIVA_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 1
            end
            object CCOSTO_RETEIVA_DB: TOvcDbPictureField
              Left = 138
              Top = 62
              Width = 156
              Height = 24
              DataField = 'CCOSTO_RETEIVA_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 2
            end
            object CCOSTO_RETEIVA_CR: TOvcDbPictureField
              Left = 138
              Top = 88
              Width = 156
              Height = 24
              DataField = 'CCOSTO_RETEIVA_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 3
            end
            object CPMTE_RETEIVA_DB: TOvcDbPictureField
              Left = 138
              Top = 114
              Width = 156
              Height = 24
              DataField = 'CPMTE_RETEIVA_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 4
            end
            object CPMTE_RETEIVA_CR: TOvcDbPictureField
              Left = 138
              Top = 140
              Width = 156
              Height = 24
              DataField = 'CPMTE_RETEIVA_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 5
            end
          end
          object PagRETEFUENTE: TTabSheet
            Caption = 'RETEFUENTE'
            ImageIndex = 4
            object lbNombre_PUC_RETEFUENTE_DB: TLabel
              Left = 326
              Top = 14
              Width = 206
              Height = 16
              Caption = 'lbNombre_PUC_RETEFUENTE_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_ReteFuente_DB: TSpeedButton
              Left = 297
              Top = 11
              Width = 23
              Height = 23
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
            end
            object Label20: TLabel
              Left = 10
              Top = 10
              Width = 59
              Height = 16
              Caption = 'P.U.C. DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_PUC_RETEFUENTE_CR: TLabel
              Left = 326
              Top = 40
              Width = 206
              Height = 16
              Caption = 'lbNombre_PUC_RETEFUENTE_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_ReteFuente_CR: TSpeedButton
              Left = 297
              Top = 37
              Width = 23
              Height = 23
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
            end
            object Label29: TLabel
              Left = 10
              Top = 36
              Width = 59
              Height = 16
              Caption = 'P.U.C. CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_RETEFUENTE_DB: TLabel
              Left = 326
              Top = 66
              Width = 233
              Height = 16
              Caption = 'lbNombre_CCOSTO_RETEFUENTE_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_ReteFuente_DB: TSpeedButton
              Left = 297
              Top = 63
              Width = 23
              Height = 23
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
            end
            object Label40: TLabel
              Left = 10
              Top = 62
              Width = 85
              Height = 16
              Caption = 'CCOSTOS DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_RETEFUENTE_CR: TLabel
              Left = 326
              Top = 92
              Width = 233
              Height = 16
              Caption = 'lbNombre_CCOSTO_RETEFUENTE_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_ReteFuente_CR: TSpeedButton
              Left = 297
              Top = 89
              Width = 23
              Height = 23
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
            end
            object Label42: TLabel
              Left = 10
              Top = 89
              Width = 85
              Height = 16
              Caption = 'CCOSTOS CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_RETEFUENTE_DB: TLabel
              Left = 326
              Top = 119
              Width = 224
              Height = 16
              Caption = 'lbNombre_CPMTE_RETEFUENTE_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_RETEFUENTE_DB: TSpeedButton
              Left = 297
              Top = 115
              Width = 23
              Height = 23
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
            end
            object Label70: TLabel
              Left = 10
              Top = 115
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_RETEFUENTE_CR: TLabel
              Left = 326
              Top = 146
              Width = 224
              Height = 16
              Caption = 'lbNombre_CPMTE_RETEFUENTE_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_RETEFUENTE_CR: TSpeedButton
              Left = 297
              Top = 141
              Width = 23
              Height = 23
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
            end
            object Label72: TLabel
              Left = 10
              Top = 142
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object PUC_RETEFUENTE_DB: TOvcDbPictureField
              Left = 138
              Top = 10
              Width = 156
              Height = 24
              DataField = 'PUC_RETEFUENTE_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 0
            end
            object PUC_RETEFUENTE_CR: TOvcDbPictureField
              Left = 138
              Top = 36
              Width = 156
              Height = 24
              DataField = 'PUC_RETEFUENTE_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 1
            end
            object CCOSTO_RETEFUENTE_DB: TOvcDbPictureField
              Left = 138
              Top = 62
              Width = 156
              Height = 24
              DataField = 'CCOSTO_RETEFUENTE_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 2
            end
            object CCOSTO_RETEFUENTE_CR: TOvcDbPictureField
              Left = 138
              Top = 88
              Width = 156
              Height = 24
              DataField = 'CCOSTO_RETEFUENTE_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 3
            end
            object CPMTE_RETEFUENTE_DB: TOvcDbPictureField
              Left = 138
              Top = 114
              Width = 156
              Height = 24
              DataField = 'CPMTE_RETEFUENTE_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 4
            end
            object CPMTE_RETEFUENTE_CR: TOvcDbPictureField
              Left = 138
              Top = 140
              Width = 156
              Height = 24
              DataField = 'CPMTE_RETEFUENTE_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 5
            end
          end
          object PagICA: TTabSheet
            Caption = 'I.C.A.'
            ImageIndex = 5
            object lbNombre_PUC_ICA_DB: TLabel
              Left = 326
              Top = 13
              Width = 142
              Height = 16
              Caption = 'lbNombre_PUC_ICA_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_ICA_DB: TSpeedButton
              Left = 297
              Top = 11
              Width = 23
              Height = 23
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
            end
            object Label21: TLabel
              Left = 10
              Top = 10
              Width = 59
              Height = 16
              Caption = 'P.U.C. DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_PUC_ICA_CR: TLabel
              Left = 326
              Top = 39
              Width = 142
              Height = 16
              Caption = 'lbNombre_PUC_ICA_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_ICA_CR: TSpeedButton
              Left = 297
              Top = 37
              Width = 23
              Height = 23
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
            end
            object Label30: TLabel
              Left = 10
              Top = 36
              Width = 59
              Height = 16
              Caption = 'P.U.C. CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_ICA_DB: TLabel
              Left = 326
              Top = 66
              Width = 169
              Height = 16
              Caption = 'lbNombre_CCOSTO_ICA_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_ICA_DB: TSpeedButton
              Left = 297
              Top = 63
              Width = 23
              Height = 23
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
            end
            object Label44: TLabel
              Left = 10
              Top = 62
              Width = 85
              Height = 16
              Caption = 'CCOSTOS DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_ICA_CR: TLabel
              Left = 327
              Top = 93
              Width = 169
              Height = 16
              Caption = 'lbNombre_CCOSTO_ICA_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_ICA_CR: TSpeedButton
              Left = 298
              Top = 89
              Width = 23
              Height = 23
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
            end
            object Label46: TLabel
              Left = 10
              Top = 89
              Width = 85
              Height = 16
              Caption = 'CCOSTOS CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_ICA_DB: TLabel
              Left = 326
              Top = 120
              Width = 160
              Height = 16
              Caption = 'lbNombre_CPMTE_ICA_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_ICA_DB: TSpeedButton
              Left = 297
              Top = 115
              Width = 23
              Height = 23
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
            end
            object Label74: TLabel
              Left = 10
              Top = 115
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_ICA_CR: TLabel
              Left = 326
              Top = 147
              Width = 160
              Height = 16
              Caption = 'lbNombre_CPMTE_ICA_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_ICA_CR: TSpeedButton
              Left = 297
              Top = 142
              Width = 23
              Height = 23
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
            end
            object Label76: TLabel
              Left = 10
              Top = 142
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object PUC_ICA_DB: TOvcDbPictureField
              Left = 138
              Top = 10
              Width = 156
              Height = 24
              DataField = 'PUC_ICA_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 0
            end
            object PUC_ICA_CR: TOvcDbPictureField
              Left = 138
              Top = 36
              Width = 156
              Height = 24
              DataField = 'PUC_ICA_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 1
            end
            object CCOSTO_ICA_DB: TOvcDbPictureField
              Left = 138
              Top = 62
              Width = 156
              Height = 24
              DataField = 'CCOSTO_ICA_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 2
            end
            object CCOSTO_ICA_CR: TOvcDbPictureField
              Left = 138
              Top = 88
              Width = 156
              Height = 24
              DataField = 'CCOSTO_ICA_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 3
            end
            object CPMTE_ICA_DB: TOvcDbPictureField
              Left = 138
              Top = 114
              Width = 156
              Height = 24
              DataField = 'CPMTE_ICA_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 4
            end
            object CPMTE_ICA_CR: TOvcDbPictureField
              Left = 138
              Top = 140
              Width = 156
              Height = 24
              DataField = 'CPMTE_ICA_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 5
            end
          end
          object PagIMPOCONSUMO: TTabSheet
            Caption = 'IMPOCONSUMO'
            ImageIndex = 6
            object lbNombre_PUC_IMPCONSUMO_DB: TLabel
              Left = 326
              Top = 14
              Width = 211
              Height = 16
              Caption = 'lbNombre_PUC_IMPCONSUMO_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_ImpConsumo_DB: TSpeedButton
              Left = 297
              Top = 11
              Width = 23
              Height = 23
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
            end
            object Label23: TLabel
              Left = 10
              Top = 11
              Width = 59
              Height = 16
              Caption = 'P.U.C. DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_PUC_IMPCONSUMO_CR: TLabel
              Left = 326
              Top = 40
              Width = 211
              Height = 16
              Caption = 'lbNombre_PUC_IMPCONSUMO_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_ImpConsumo_CR: TSpeedButton
              Left = 297
              Top = 37
              Width = 23
              Height = 23
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
            end
            object Label31: TLabel
              Left = 10
              Top = 37
              Width = 59
              Height = 16
              Caption = 'P.U.C. CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_IMPCONSUMO_DB: TLabel
              Left = 326
              Top = 66
              Width = 238
              Height = 16
              Caption = 'lbNombre_CCOSTO_IMPCONSUMO_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_ImpConsumo_DB: TSpeedButton
              Left = 297
              Top = 63
              Width = 23
              Height = 23
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
            end
            object Label48: TLabel
              Left = 10
              Top = 63
              Width = 85
              Height = 16
              Caption = 'CCOSTOS DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_IMPCONSUMO_CR: TLabel
              Left = 326
              Top = 92
              Width = 238
              Height = 16
              Caption = 'lbNombre_CCOSTO_IMPCONSUMO_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_ImpConsumo_CR: TSpeedButton
              Left = 297
              Top = 90
              Width = 23
              Height = 23
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
            end
            object Label50: TLabel
              Left = 10
              Top = 89
              Width = 85
              Height = 16
              Caption = 'CCOSTOS CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_IMPCONSUMO_DB: TLabel
              Left = 326
              Top = 119
              Width = 229
              Height = 16
              Caption = 'lbNombre_CPMTE_IMPCONSUMO_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_IMPCONSUMO_DB: TSpeedButton
              Left = 297
              Top = 115
              Width = 23
              Height = 23
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
            end
            object Label78: TLabel
              Left = 10
              Top = 115
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_IMPCONSUMO_CR: TLabel
              Left = 326
              Top = 146
              Width = 229
              Height = 16
              Caption = 'lbNombre_CPMTE_IMPCONSUMO_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_IMPCONSUMO_CR: TSpeedButton
              Left = 297
              Top = 141
              Width = 23
              Height = 23
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
            end
            object Label80: TLabel
              Left = 10
              Top = 142
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object PUC_IMPCONSUMO_DB: TOvcDbPictureField
              Left = 138
              Top = 10
              Width = 156
              Height = 24
              DataField = 'PUC_IMPCONSUMO_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 0
            end
            object PUC_IMPCONSUMO_CR: TOvcDbPictureField
              Left = 138
              Top = 36
              Width = 156
              Height = 24
              DataField = 'PUC_IMPCONSUMO_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 1
            end
            object CCOSTO_IMPCONSUMO_DB: TOvcDbPictureField
              Left = 138
              Top = 62
              Width = 156
              Height = 24
              DataField = 'CCOSTO_IMPCONSUMO_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 2
            end
            object CCOSTO_IMPCONSUMO_CR: TOvcDbPictureField
              Left = 138
              Top = 88
              Width = 156
              Height = 24
              DataField = 'CCOSTO_IMPCONSUMO_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 3
            end
            object CPMTE_IMPCONSUMO_DB: TOvcDbPictureField
              Left = 138
              Top = 114
              Width = 156
              Height = 24
              DataField = 'CPMTE_IMPCONSUMO_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 4
            end
            object CPMTE_IMPCONSUMO_CR: TOvcDbPictureField
              Left = 138
              Top = 140
              Width = 156
              Height = 24
              DataField = 'CPMTE_IMPCONSUMO_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 5
            end
          end
          object PagCREE: TTabSheet
            Caption = 'CREE'
            ImageIndex = 7
            object lbNombre_PUC_CREE_DB: TLabel
              Left = 326
              Top = 14
              Width = 157
              Height = 16
              Caption = 'lbNombre_PUC_CREE_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_Cree_DB: TSpeedButton
              Left = 297
              Top = 11
              Width = 23
              Height = 23
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
            end
            object Label26: TLabel
              Left = 10
              Top = 10
              Width = 59
              Height = 16
              Caption = 'P.U.C. DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_PUC_CREE_CR: TLabel
              Left = 326
              Top = 40
              Width = 157
              Height = 16
              Caption = 'lbNombre_PUC_CREE_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_Cree_CR: TSpeedButton
              Left = 297
              Top = 38
              Width = 23
              Height = 23
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
            end
            object Label33: TLabel
              Left = 10
              Top = 36
              Width = 59
              Height = 16
              Caption = 'P.U.C. CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_CREE_DB: TLabel
              Left = 326
              Top = 66
              Width = 184
              Height = 16
              Caption = 'lbNombre_CCOSTO_CREE_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_Cree_DB: TSpeedButton
              Left = 297
              Top = 65
              Width = 23
              Height = 23
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
            end
            object Label52: TLabel
              Left = 10
              Top = 62
              Width = 85
              Height = 16
              Caption = 'CCOSTOS DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_CREE_CR: TLabel
              Left = 326
              Top = 93
              Width = 184
              Height = 16
              Caption = 'lbNombre_CCOSTO_CREE_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_Cree_CR: TSpeedButton
              Left = 297
              Top = 92
              Width = 23
              Height = 23
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
            end
            object Label54: TLabel
              Left = 10
              Top = 89
              Width = 85
              Height = 16
              Caption = 'CCOSTOS CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_CREE_DB: TLabel
              Left = 326
              Top = 120
              Width = 175
              Height = 16
              Caption = 'lbNombre_CPMTE_CREE_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_CREE_DB: TSpeedButton
              Left = 297
              Top = 116
              Width = 23
              Height = 23
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
            end
            object Label82: TLabel
              Left = 9
              Top = 118
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_CREE_CR: TLabel
              Left = 326
              Top = 147
              Width = 175
              Height = 16
              Caption = 'lbNombre_CPMTE_CREE_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_CREE_CR: TSpeedButton
              Left = 297
              Top = 142
              Width = 23
              Height = 23
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
            end
            object Label84: TLabel
              Left = 10
              Top = 142
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object PUC_CREE_DB: TOvcDbPictureField
              Left = 138
              Top = 10
              Width = 156
              Height = 24
              DataField = 'PUC_CREE_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 0
            end
            object PUC_CREE_CR: TOvcDbPictureField
              Left = 138
              Top = 36
              Width = 156
              Height = 24
              DataField = 'PUC_CREE_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 1
            end
            object CCOSTO_CREE_DB: TOvcDbPictureField
              Left = 138
              Top = 62
              Width = 156
              Height = 24
              DataField = 'CCOSTO_CREE_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 2
            end
            object CCOSTO_CREE_CR: TOvcDbPictureField
              Left = 138
              Top = 88
              Width = 156
              Height = 24
              DataField = 'CCOSTO_CREE_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 3
            end
            object CPMTE_CREE_DB: TOvcDbPictureField
              Left = 138
              Top = 114
              Width = 156
              Height = 24
              DataField = 'CPMTE_CREE_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 4
            end
            object CPMTE_CREE_CR: TOvcDbPictureField
              Left = 138
              Top = 140
              Width = 156
              Height = 24
              DataField = 'CPMTE_CREE_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 5
            end
          end
          object Pag_Interes: TTabSheet
            Caption = 'INTERES'
            ImageIndex = 10
            object lbNombre_PUC_INTERES_DB: TLabel
              Left = 326
              Top = 13
              Width = 176
              Height = 16
              Caption = 'lbNombre_PUC_INTERES_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_INTERES_DB: TSpeedButton
              Left = 297
              Top = 11
              Width = 23
              Height = 23
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
            end
            object Label57: TLabel
              Left = 10
              Top = 10
              Width = 59
              Height = 16
              Caption = 'P.U.C. DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_PUC_INTERES_CR: TLabel
              Left = 326
              Top = 40
              Width = 176
              Height = 16
              Caption = 'lbNombre_PUC_INTERES_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_INTERES_CR: TSpeedButton
              Left = 297
              Top = 37
              Width = 23
              Height = 23
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
            end
            object Label61: TLabel
              Left = 10
              Top = 36
              Width = 59
              Height = 16
              Caption = 'P.U.C. CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_INTERES_DB: TLabel
              Left = 326
              Top = 68
              Width = 203
              Height = 16
              Caption = 'lbNombre_CCOSTO_INTERES_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_INTERES_DB: TSpeedButton
              Left = 297
              Top = 63
              Width = 23
              Height = 23
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
            end
            object Label65: TLabel
              Left = 10
              Top = 62
              Width = 85
              Height = 16
              Caption = 'CCOSTOS DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_INTERES_CR: TLabel
              Left = 326
              Top = 96
              Width = 203
              Height = 16
              Caption = 'lbNombre_CCOSTO_INTERES_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_INTERES_CR: TSpeedButton
              Left = 297
              Top = 89
              Width = 23
              Height = 23
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
            end
            object Label69: TLabel
              Left = 10
              Top = 89
              Width = 76
              Height = 16
              Caption = 'CCOSTO CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_INTERES_DB: TLabel
              Left = 326
              Top = 120
              Width = 194
              Height = 16
              Caption = 'lbNombre_CPMTE_INTERES_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_INTERES_DB: TSpeedButton
              Left = 297
              Top = 115
              Width = 23
              Height = 23
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
            end
            object Label73: TLabel
              Left = 10
              Top = 115
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_INTERES_CR: TLabel
              Left = 326
              Top = 147
              Width = 194
              Height = 16
              Caption = 'lbNombre_CPMTE_INTERES_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_INTERES_CR: TSpeedButton
              Left = 297
              Top = 142
              Width = 23
              Height = 23
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
            end
            object Label77: TLabel
              Left = 10
              Top = 142
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object PUC_INTERES_DB: TOvcDbPictureField
              Left = 138
              Top = 10
              Width = 156
              Height = 24
              DataField = 'PUC_INTERES_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 0
            end
            object PUC_INTERES_CR: TOvcDbPictureField
              Left = 138
              Top = 36
              Width = 156
              Height = 24
              DataField = 'PUC_INTERES_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 1
            end
            object CCOSTO_INTERES_DB: TOvcDbPictureField
              Left = 138
              Top = 62
              Width = 156
              Height = 24
              DataField = 'CCOSTO_INTERES_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 2
            end
            object CCOSTO_INTERES_CR: TOvcDbPictureField
              Left = 138
              Top = 88
              Width = 156
              Height = 24
              DataField = 'CCOSTO_INTERES_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 3
            end
            object CPMTE_INTERES_DB: TOvcDbPictureField
              Left = 138
              Top = 114
              Width = 156
              Height = 24
              DataField = 'CPMTE_INTERES_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 4
            end
            object CPMTE_INTERES_CR: TOvcDbPictureField
              Left = 138
              Top = 140
              Width = 156
              Height = 24
              DataField = 'CPMTE_INTERES_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 5
            end
          end
          object PagTotal: TTabSheet
            Caption = 'TOTAL'
            ImageIndex = 9
            object lbNombre_PUC_TOTAL_DB: TLabel
              Left = 326
              Top = 13
              Width = 160
              Height = 16
              Caption = 'lbNombre_PUC_TOTAL_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_TOTAL_DB: TSpeedButton
              Left = 297
              Top = 11
              Width = 23
              Height = 23
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
            end
            object Label34: TLabel
              Left = 10
              Top = 10
              Width = 59
              Height = 16
              Caption = 'P.U.C. DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_PUC_TOTAL_CR: TLabel
              Left = 326
              Top = 40
              Width = 160
              Height = 16
              Caption = 'lbNombre_PUC_TOTAL_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnPUC_TOTAL_CR: TSpeedButton
              Left = 297
              Top = 38
              Width = 23
              Height = 23
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
            end
            object Label47: TLabel
              Left = 10
              Top = 36
              Width = 59
              Height = 16
              Caption = 'P.U.C. CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_TOTAL_DB: TLabel
              Left = 326
              Top = 68
              Width = 187
              Height = 16
              Caption = 'lbNombre_CCOSTO_TOTAL_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_TOTAL_DB: TSpeedButton
              Left = 297
              Top = 65
              Width = 23
              Height = 23
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
            end
            object Label51: TLabel
              Left = 10
              Top = 62
              Width = 85
              Height = 16
              Caption = 'CCOSTOS DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CCOSTO_TOTAL_CR: TLabel
              Left = 326
              Top = 96
              Width = 187
              Height = 16
              Caption = 'lbNombre_CCOSTO_TOTAL_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCCOSTO_TOTAL_CR: TSpeedButton
              Left = 297
              Top = 93
              Width = 23
              Height = 23
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
            end
            object Label55: TLabel
              Left = 10
              Top = 89
              Width = 76
              Height = 16
              Caption = 'CCOSTO CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_TOTAL_DB: TLabel
              Left = 326
              Top = 120
              Width = 178
              Height = 16
              Caption = 'lbNombre_CPMTE_TOTAL_DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_TOTAL_DB: TSpeedButton
              Left = 297
              Top = 116
              Width = 23
              Height = 23
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
            end
            object Label86: TLabel
              Left = 10
              Top = 115
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE DB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lbNombre_CPMTE_TOTAL_CR: TLabel
              Left = 326
              Top = 147
              Width = 178
              Height = 16
              Caption = 'lbNombre_CPMTE_TOTAL_CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object BtnCPMTE_TOTAL_CR: TSpeedButton
              Left = 297
              Top = 142
              Width = 23
              Height = 23
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
            end
            object Label88: TLabel
              Left = 10
              Top = 142
              Width = 123
              Height = 16
              Caption = 'COMPROBANTE CR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object PUC_TOTAL_DB: TOvcDbPictureField
              Left = 138
              Top = 10
              Width = 156
              Height = 24
              DataField = 'PUC_TOTAL_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 0
            end
            object PUC_TOTAL_CR: TOvcDbPictureField
              Left = 138
              Top = 36
              Width = 156
              Height = 24
              DataField = 'PUC_TOTAL_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 1
            end
            object CCOSTO_TOTAL_DB: TOvcDbPictureField
              Left = 138
              Top = 62
              Width = 156
              Height = 24
              DataField = 'CCOSTO_TOTAL_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 2
            end
            object CCOSTO_TOTAL_CR: TOvcDbPictureField
              Left = 138
              Top = 88
              Width = 156
              Height = 24
              DataField = 'CCOSTO_TOTAL_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 20
              Options = [efoCaretToEnd, efoSoftValidation]
              ParentFont = False
              PictureMask = '!!!!!!!!!!!!!!!!!!!!'
              TabOrder = 3
            end
            object CPMTE_TOTAL_DB: TOvcDbPictureField
              Left = 138
              Top = 114
              Width = 156
              Height = 24
              DataField = 'CPMTE_TOTAL_DB'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 4
            end
            object CPMTE_TOTAL_CR: TOvcDbPictureField
              Left = 138
              Top = 140
              Width = 156
              Height = 24
              DataField = 'CPMTE_TOTAL_CR'
              FieldType = ftString
              CaretOvr.Shape = csBlock
              Controller = OvcController1
              EFColors.Disabled.BackColor = clWindow
              EFColors.Disabled.TextColor = clGrayText
              EFColors.Error.BackColor = clRed
              EFColors.Error.TextColor = clBlack
              EFColors.Highlight.BackColor = clHighlight
              EFColors.Highlight.TextColor = clHighlightText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 4
              Options = [efoCaretToEnd, efoRightAlign, efoRightJustify, efoSoftValidation, efoTrimBlanks]
              ParentFont = False
              PictureMask = '!!!!'
              TabOrder = 5
            end
          end
        end
      end
    end
  end
  object PnlBotones: TPanel
    Left = 0
    Top = 253
    Width = 1077
    Height = 64
    Align = alTop
    TabOrder = 1
    object PnlNavegador: TPanel
      Left = 1
      Top = 1
      Width = 340
      Height = 38
      Align = alLeft
      TabOrder = 0
      object DBNavigator1: TDBNavigator
        Left = 1
        Top = 1
        Width = 338
        Height = 36
        Align = alClient
        TabOrder = 0
      end
    end
    object Estado_Actual: TStatusBar
      Left = 1
      Top = 39
      Width = 1075
      Height = 24
      Panels = <
        item
          Width = 250
        end
        item
          Width = 50
        end>
    end
    object PnlOpcionales: TPanel
      Left = 341
      Top = 1
      Width = 122
      Height = 38
      Align = alLeft
      AutoSize = True
      TabOrder = 2
      object BtnExcel: TSpeedButton
        Left = 1
        Top = 1
        Width = 40
        Height = 36
        Cursor = crHandPoint
        Align = alLeft
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFF9F9F9EDEDEDE7E7E7E5E5E5E5E5E5E4E4E4E4E4E4E4E4E4E4E4E4E4E4
          E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4
          E4E4E4E4E4E5E5E5E6E6E6ECECECF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E5E5E5A9A9A97274715F635B5A5E56595D55585C54585C54585C54585C54585C
          54585C54585C54585C54585C54585C54585C54585C54585C54585C54585C5458
          5C54595D555A5E565E625A6E716DA4A4A4E2E2E2FEFEFEFFFFFFFFFFFFE5E5E5
          858684365A1930740E2E7B172C801F2A8626288B2E26913524963D229C4421A1
          4C1FA7541DAC5B1BB1631BB3641DAD5C1EA85520A24D229D4624973E26923728
          8C2F2A87282B81202D7C193075103558177F817EE2E2E2FFFFFFFAFAFAA8A8A8
          38591830730B2D7A152B811F28892926903323973D219E471EA6511CAD5B1AB4
          6517BC7015C37912CA8412CC8614C47B17BD7119B6671BAE5D1EA75320A04923
          993F259135288A2B2A83212D7C172F740D365715A4A4A4F9F9F9EDEDED727471
          336B0230740D328F36329945309E4C2EA3522DA7592BAC5F2AB16628B66C26BA
          7325BF7923C48022C88621C98823C58125C07B26BB7428B76D29B2672BAD602C
          A85A2EA453309F4D319A4632903730760F336C036E716DECECECE4E4E45E625A
          34720B2FBE761DDE9519E19719E19719E19719E19719E19719E19719E19719E1
          9719E19719E19719E19719E19719E19719E19719E19719E19719E19719E19719
          E19719E19719E19719E1971DDE952FBE7634730D5E625AE6E6E6E1E1E1575B53
          2FA34D13E28D12E38E12E38E12E38E12E38E12E38E12E38E12E38E12E38E12E3
          8E12E38E12E38E12E38E12E38E12E38E12E38E12E38E12E38E12E38E12E38E12
          E38E12E38E12E38E12E38E12E38E13E28D2FA44D5A5E56E5E5E5E0E0E0555951
          21BE6116DC7F16DC7F16DC7F16DC7F16DC7F16DC7F16DC7F16DC7F16DC7F16DC
          7F16DC7F16DC7F16DC7F16DC7F16DC7F16DC7F16DC7F16DC7F16DC7F16DC7F16
          DC7F16DC7F16DC7F16DC7F16DC7F16DC7F21BE61595D55E4E4E4E0E0E0545850
          21BE591BD6701BD6701BD6701DD67259E1996AE5A46AE5A46AE5A46AE5A46AE5
          A46AE5A46AE5A46AE5A46AE5A46AE5A46AE5A46AE5A46AE5A46AE5A46AE5A46A
          E5A459E1991DD6721BD6701BD6701BD67021BE59585C54E4E4E4E0E0E0545850
          24B94E1FCF621FCF621FCF62B1EECAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFB1EECA1FCF621FCF621FCF6224B94E585C54E4E4E4E0E0E0545850
          28B44224C85324C85335CD62FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFE35CD6224C85324C85328B442585C54E4E4E4E0E0E0545850
          2BAF3728C24528C24543C95CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAF6DCA1F3CFA1F3CFA1F3CFA1F3CFE3
          FBF1FFFFFFFFFFFF43C95C28C24528C2452BAF37585C54E4E4E4E0E0E0545850
          2FAA2C2CBB362CBB3647C44FFFFFFFFFFFFFEAFCF4C4F7E1C4F7E1C4F7E1C4F7
          E1D7F9EBFFFFFFFFFFFFFFFFFFBCF6DD16E18A14E18914E18914E18952E9A8FC
          FEFDFFFFFFFFFFFF47C44F2CBB362CBB362FAA2C585C54E4E4E4E0E0E0545850
          32A52031B52831B5284ABE43FFFFFFFFFFFFF7FEFB49E7A314E18914E18914E1
          891AE18CC5F7E2FFFFFFE0FAEF25E28F14E08714E08814E18830E497ECFCF5FF
          FFFFFFFFFFFFFFFF4ABE4331B52831B52832A520585C54E4E4E4E0E0E0545850
          359F1535AE1935AE194EB836FFFFFFFFFFFFFFFFFFECFCF535E59A14E18814E0
          8814E08725E28ED2F8E742E49915DE8315DF8514E0861BE18BCFF8E6FFFFFFFF
          FFFFFFFFFFFFFFFF4EB83635AE1935AE19359F15585C54E4E4E4E0E0E0545850
          399A0A39A80A39A80A52B229FFFFFFFFFFFFFFFFFFFFFFFFDDFAEE26E29114DF
          8615DF8515DE831ADD8317DB7D16DC7F16DD8215DE84A3F2CFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF52B22939A80A39A80A399A0A585C54E4E4E4E0E0E0545850
          3B96023CA2003CA20055AD20FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9F7E31DDF
          8716DD8117DC7E17DB7C18D97918DA7A17DB7D72EAB2FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF55AD203CA2003CA2003B9602585C54E4E4E4E0E0E0545850
          3B92013C9D003C9D0054A91FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2F3
          D419DB7D18D97919D8751AD6721BD57049E194F8FDFBFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF54A91F3C9D003C9D003B9201585C54E4E4E4E0E0E0545850
          3A8F013B99003B990053A61FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAFA
          EF2FD5731AD6721CD46E1DD2691ED0657AE2A1FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF53A61F3B99003B99003A8F01585C54E4E4E4E0E0E0545850
          398C013A95003A950053A21FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFB5BD3
          7724C7511FCE611ED06520CE6021CC5B23C9559FE6B2FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF53A21F3A95003A9500398C01585C54E4E4E4E0E0E0545850
          3989013A91003A9100529E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89DA9029BF
          3F28C24526C54C22CA5723CA5624C75026C44A2AC245BCEAC1FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF529E1F3A91003A9100398901585C54E4E4E4E0E0E0545850
          388501398D00398D00519B1FFFFFFFFFFFFFFFFFFFFFFFFFB8E4B330B72C2DBA
          322BBD3929BF406BD68151D06F28C1442ABE3D2CBB3636BB37D2EED0FFFFFFFF
          FFFFFFFFFFFFFFFF519B1F398D00398D00388501585C54E4E4E4E0E0E0545850
          38820138880038880051971FFFFFFFFFFFFFFFFFFFDCF0D43FB02034B01D31B3
          252FB72C4FC554F4FBF4EAF8EC45C44F2EB82F30B52833B12047B42CE4F3DEFF
          FFFFFFFFFFFFFFFF51971F388800388800388201585C54E4E4E4E0E0E0545850
          377F0137840037840050941FFFFFFFFFFFFFFFFFFFB9DEA49CD3849BD5889AD6
          8C98D890DFF3DEFFFFFFFFFFFFDDF3DC98D99199D78D9AD5899CD385BADFA7FF
          FFFFFFFFFFFFFFFF50941F378400378400377F01585C54E4E4E4E1E1E1555951
          367C013680003680004D8E1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF4D8E1C368000368000367C01595D55E5E5E5E2E2E2585C54
          367801367C00367C00377D01E0EAD7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFE0EAD7377D01367C00367C003678015A5E56E5E5E5E5E5E55F635B
          3575013578003578003578004D871EA9C592B8CFA5B8CFA5B8CFA5B8CFA5B8CF
          A5B8CFA5B8CFA5B8CFA5B8CFA5B8CFA5B8CFA5B8CFA5B8CFA5B8CFA5B8CFA5B8
          CFA5A9C5924D871E3578003578003578003575015F635BE7E7E7EEEEEE767875
          356F013473003473003473003473003473003473003473003473003473003473
          0034730034730034730034730034730034730034730034730034730034730034
          7300347300347300347300347300347300356F01727471EDEDEDFBFBFBAEAEAE
          3A5B1A346F00346F00346F00346F00346F00346F00346F00346F00346F00346F
          00346F00346F00346F00346F00346F00346F00346F00346F00346F00346F0034
          6F00346F00346F00346F00346F00346F00375917A9A9A9F9F9F9FFFFFFE9E9E9
          8E8F8D3B5B1B336A01336B00336B00336B00336B00336B00336B00336B01336C
          01336C01336C01336C01336C01336C01336C01336C01336B01336B01336B0033
          6B00336B00336B00336B00336A01385918858684E5E5E5FFFFFFFFFFFFFFFFFF
          E9E9E9AEAEAE7678755F635B585C545559515458505458505458505458505458
          5054585054585054585054585054585054585054585054585054585054585054
          5850555951575B535E625A727471A8A8A8E5E5E5FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFBFBFBEEEEEEE5E5E5E2E2E2E1E1E1E0E0E0E0E0E0E0E0E0E0E0E0E0E0
          E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
          E0E0E0E0E0E1E1E1E4E4E4EDEDEDFAFAFAFFFFFFFFFFFFFFFFFF}
        OnClick = BtnExcelClick
        ExplicitLeft = 5
        ExplicitTop = -4
        ExplicitHeight = 38
      end
      object BtnBuscar: TSpeedButton
        Left = 41
        Top = 1
        Width = 40
        Height = 36
        Cursor = crHandPoint
        Align = alLeft
        Glyph.Data = {
          0E060000424D0E06000000000000360000002800000016000000160000000100
          180000000000D8050000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F4FFFFFFFFFFFFFF7C8A9623394B0C293E203D523A5363FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF92A0A64E616E132B43102943384F658496A7FFFF
          FFFFFFFFFFFFFFFFFF4D596323355248608E6B87C37692CF465D8F1B2C4DFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF8B919E2F395B47578693A8DC7E94C8475A871F
          3156606D87FFFFFF79FF95A8AD15283D6C81B59DB4FF8399FF7A90FA7E91EC44
          5392505B76FFFFFFFFFFFFFFFFFFFFFFFF4F527853589DA0AAFE8090E3A9BDFF
          ABBBFF616FA924305AFFFFFF9CFF718B92485F797589CA5061C26876F45C69EB
          5661D05561AF3E4A6CFFFFFFFFFFFFFFFFFFFFFFFF2D2F5F7170C67F80E8828C
          F16978D48490E28893D730396BFFFFFF8CFF7D9DA239556D4657966168C9605F
          DD605BDE4E4DBB2A307D425171FFFFFFFFFFFFFFFFFFFFFFFF434777544DA272
          6BD36A70D37986E27782D44D569A2E3567FFFFFF09FFFFFFFF3A576618265A35
          3A894742AB4640AB2E298423286546546AFFFFFFFFFFFFFFFFFFFFFFFF3E4265
          3F36795B54A9656ABF5865B4313B81141C57606691FFFFFFFFFFFFFFFF7E9499
          62708C535C88454682494A87252659272E4F68747AFFFFFFFFFFFFFFFFFFFFFF
          FF4C525D2623433937653A467C3B4B804E5B896B769C9AA1BCFFFFFF64FFFFFF
          FF94A4A3707D85616B7C666C8373778F1A1E300000096F7875FFFFFFFFFFFFFF
          FFFFFFFFFF4F534E0504081417255B69807386A14A5A71697587FFFFFFFFFFFF
          FFFFFFFFFF8D95954D54515D645F7A82787C8479161C11020700666862FFFFFF
          FFFFFFFFFFFFFFFFFF5B594E0E0E003C40348A99955C7071516160596664929B
          98FFFFFF8AFFFFFFFFFFFFFF5C5D595D62537A826B91977E3C412C2121131814
          132F282DFFFFFFFFFFFF261C1C2B251A090600494D346E7D6862756466766541
          4E40FFFFFFFFFFFF94FFFFFFFFFFFFFF6562645051477175629C9E8A4F50400C
          08030D040E07000DFFFFFFAB98B10B0008241719241B1150513D869177516045
          535F49626B57FFFFFFFFFFFF5CFFFFFFFFFFFFFF88848A6C6B6755574B525546
          37352D332E2F2A1F2F2618308775947664812110252F212C4339394240354045
          305B634C5A614CA2A595FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6E708181
          81616260615E60514D5339323F4A4155574B61574B614F4458453C494C444E60
          5B5C65635B7B7B6F88877DFFFFFFFFFFFFFFFFFF99FFFFFFFFFFFFFFFFFFFF94
          98997B7C808E8F936B6B716060666B6B7156565C514E575350595350595F5B66
          6F6B76746F78938E8F898483A49E9FFFFFFFFFFFFFFFFFFF7BFFFFFFFFFFFFFF
          FFFFFFFFFFFFA9ADAE989B9F979B9C8D92907D857B5B63584B5447515A4D5C64
          5A74797786898D84838C9E96A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF94FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF62676899A09D8B938C929D8D8E9B857C8A727D
          8A7494A08E959E948C929195989D766F7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6469686B716C60685E8D9787A5B09C
          818E7877846EA0AC9A838D814F5651626667837D88FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F8181818580FFFF
          FFFFFFFFAFB8ABA4ADA0FFFFFFFFFFFF7B817C8A8F8EFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = BtnBuscarClick
        ExplicitHeight = 40
      end
      object BtnFiltrado: TSpeedButton
        Left = 81
        Top = 1
        Width = 40
        Height = 36
        Cursor = crHandPoint
        Align = alLeft
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5C9C8C8E6E4E5F8F7F7FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFB9BEC0CBCED0DDDFDFF3F3F4FEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAEAF898687D6D2D3E2DEDFFDFDFDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFDFDFDB4C4CFD4EDFECDE3F4BDD0DCB5C1C9BEC5CAC9CCCEDADCDCF1F1
          F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACAAAB898687D5D1D3E1DDDEFCFCFCFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF9FAFAB6C7D3D4EDFFD4EDFFD5EEFFD5EEFFD6EFFFD6EFFED2E9F8C2D5
          DFB8C5CDC0C8CCCBCFD1D9DBDCEEEEEFACABAC888586D5D1D2E1DDDFFCFCFCFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF6F7F7B9CBD7D4EEFFD5EEFFD5EEFFD6EFFFD6EFFFD7F0FFD8F0FFD8F1
          FFD9F1FFD9F2FFDAF2FFD7EEF9C7DBE38E9396888586D5D1D2E2DDDFEFEEEFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF3F3F4BCCEDAD5EEFFD6EFFFD6EFFFD7EFFFD7F0FFD8F0FFD8F1FFD9F1
          FFD9F2FFDAF2FFDAF3FFDBF3FFDCF4FF989FA3898687A9A6A7C6C2C3B4BEC1FD
          FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF0F0F1C0D2DED6EEFFBECDD7BECDD6C4D6E0D8F1FFD8F1FFD9F1FFD9F2
          FFDAF2FFDAF3FFDBF3FFDCF4FFBBCBD27F7C7E928E90A4A1A2B5B1B3B4B3B4F9
          F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFECECEDC3D6E2D6EFFFBECED6D7EFFDC0CFD7D2E8F4B9C5CCC5D5DED1E6
          F0DAF2FDDBF3FFDCF4FFBECFD77B797B878485969294A3A0A1B0ACADBAB6B7CE
          CBCCFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE9E9EAC6DAE6D7F0FFCCE1ECC0CFD8C5D7E0D8F0FCCADEE7C0CED5B4BE
          C3ACB3B7ABB3B6A7B0B4797879817E7F8D8A8B989596A29FA0ADA9AAB5B1B3BC
          B8BACECCCCFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE5E6E6C9DEEAD8F0FFC5D7E1C1D1D9D0E5F0DAF2FFDAF3FFDBF3FFDBF4
          FFDCF4FFC6D9E179787A7D7B7C898687959293A39FA1B3AFB1C3BFC1C7C4C5C5
          C1C2BFBBBCD1CECFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE1E2E2CCE2EED8F1FFC0D0D8D8EFFBC0CFD6D7EEF9CFE4EDD9F0FBDCF4
          FFCADEE57A7A7B7A7778868384969294A09D9EAAA6A8B5B1B3C4C0C2CFCCCDDC
          D8DAE5E1E3D9D5D6D9D6D7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFDDDEDFD0E6F2D9F1FFC1D1D8C0CFD6BFCED5D5EBF5B6C0C5ADB4B7A2A8
          AA7B7C7D8683859C999AADA9ABBDB9BBCBC8C9D2CED0BAB6B89D999B938F9198
          9496A7A3A5BBB7B9D3CFD0E7E4E5FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFD8D9D9D3EAF6D9F2FFD6EDF8DAF1FDDBF4FFDBF4FFDCF4FFDBF3FD8A8C
          8F9D9A9CAEAAACCECACCE1DDDEE5E1E3EBE9EAE9E6E7C6C2C49C989A83808178
          7576757273898688A5A1A3BDB9BBEDEAEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFD5D6D6D7EFFBDAF3FFBAC6CCA0BDB1C3D2D9DCF4FEDDF5FFCEE3EA9E9A
          9CAEA9ABD7D2D4E1DDDEE3DFE0E8E4E6ECEAEBE8E5E6C8C3C5A29E9F8A86887C
          797A7673747270717E7C7DA7A3A5CECCCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFD2D3D3DAF2FDDBF3FFA2C0B47BB28BB2CBC6CFE2EAAAB1B3ACB2B4A8A3
          A5C3BFC1E1DDDEE2DEDFE5E1E3EAE7E8ECEAEBE7E4E5C9C5C6A6A3A48F8C8D80
          7D7E787677757273716F70A19E9FC3C0C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFCED0D0DAF2FEDBF3FFD5EAF4CADCE2A9CCBDDEF6FFDDF5FDD8EDF4AEAD
          B0B5B1B3E0DCDDE3DEE0E7E4E5EBE8EAECE9EBE7E3E4CAC6C7AAA6A894919285
          82837B797A777475827F80A7A3A5DDDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFCCCDCEDBF3FEDCF4FFC0CFD4C1CFD5D0E5EBDAF2F9DEF6FFDFF7FFD5E8
          EFAFAFB2B4B0B2D6D2D3E9E5E7ECE9EBECE9EAE6E2E4CBC6C8ADA9AB98959689
          8687827F80918E8FA8A4A6D7D5D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFCACCCDDCF4FEDCF4FFC2D2D7DDF5FDC4D3D8D5EAF1C5D5DACFE1E7D9EE
          F4DFF6FBCAD6DAB4B6B9B0ADAFC1BDBFCBC8C9CDC9CBBEBABCACA8AAA29EA0A1
          9D9FB2AEAFD0CDCEF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFC8CCCDDCF4FEDDF5FFBFCED2C1CFD3C8D9DED8EEF5C3D1D5BAC6C8B1B9
          BBAAB1B2ABB1B2AFB6B7B3BCBDB3B9BAB5BBBDC9D4D6CAD5D7CEDADCCEDCDDDF
          DFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFC6C9CADDF5FFDEF5FFDAF0F8DFF7FEDFF7FFE0F8FFE0F8FFE1F9FFE1F9
          FFE2FAFFE3FAFFE0F6FAD8ECEFCFE0E2C6D3D5E2F8FAE6FDFFE7FEFFE1F7F7E2
          E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFC4C7C8DEF5FFDEF6FFB6C2C4A4BDB2CADBE0E0F8FEE1F9FFE1F9FFE2F9
          FFE2FAFFE3FAFFE4FBFFE4FBFFE5FCFFE5FCFFE6FDFFE6FEFFE7FEFEDFF5F5DF
          E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFC3C7C9DEF6FFDFF7FF96BAA577B084C5D9D9CCDDE1A9AEB0ABB2B3B3BC
          BDBCC8CAC5D3D5CFDFE1E0F6F9E1F7F9E6FDFEE6FDFFE7FEFEE2F9F9D1E7E8DA
          DCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFC2C7C9DFF7FFDFF7FFCFE1E7C3D6D7ACD0BEE1F9FFE2F9FEE0F7FBD9ED
          F1D1E3E5C9D8DAC1CDCEDAEEF0B3B5B5C4C5C5C2C5C5C0C6C6BAC2C2A7B1B2D5
          D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFC1C7C7DFF7FFE0F7FFE0F8FFE1F8FFDCF5F8E1F8FDE2FAFFE3FAFFE4FB
          FFE4FBFFE5FCFFE5FCFFE6FDFFC9CBCBF1F0F0EEEDEDEAE9E8DDDCDBB6B6B5FA
          FAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFBDC4C4E0F8FFE0F8FFE1F9FFE1F9FFE2F9FFE3FAFFE3FBFFE4FBFFE4FC
          FFE5FCFFE5FDFFE6FDFFE7FEFFC6C8C8EEEDEDEAE9E8DEDDDCB4B4B4FAFAFAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFBDC4C5E0F8FFE1F9FFE1F9FFE2F9FFE3FAFFE3FAFFE4FBFFE4FBFFE5FC
          FFE5FCFFE6FDFFE6FDFFE7FEFEC3C5C5EAE9E9DFDEDDB3B3B2F7F7F7FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFBCC4C6E1F9FFE1F9FFE2FAFFE2FAFFE3FAFFE4FBFFE4FCFFE5FCFFE5FC
          FFE6FDFFE7FEFFE7FEFEE3FAFBC0C2C2E1E0DFB3B2B2F6F5F5FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFB2B7B8C5D5D9CDE0E3D6EBEEDEF4F7E3FAFEE5FCFFE5FCFFE5FCFFE6FD
          FFE6FDFFE7FEFEE4FBFBD7EDEEBABDBCB3B2B2F3F3F3FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFAFAFAF0F1F1E7E8E8DFE0E1D6D7D7CFD1D1CACDCDC6CBCBC3C9CABFC7
          C7BEC7C7BBC6C6B8C6C6AEBDBE9C9D9DF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFCFCFCF3F3F3F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ExplicitHeight = 40
      end
    end
  end
  object PnlGrid: TPanel
    Left = 0
    Top = 317
    Width = 1077
    Height = 140
    Align = alClient
    TabOrder = 2
    object Registros: TDBGrid
      Left = 1
      Top = 1
      Width = 1075
      Height = 138
      Align = alClient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
    end
  end
  object Barra_Ayuda01: TStatusBar
    Left = 0
    Top = 457
    Width = 1077
    Height = 20
    Panels = <
      item
        Width = 600
      end>
  end
  object Barra_Ayuda02: TStatusBar
    Left = 0
    Top = 477
    Width = 1077
    Height = 20
    Panels = <
      item
        Width = 600
      end>
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
    Left = 528
    Top = 160
  end
end
