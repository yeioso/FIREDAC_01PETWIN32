object FrCaja: TFrCaja
  Left = 0
  Top = 0
  Caption = 'FrCaja'
  ClientHeight = 382
  ClientWidth = 1209
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
    Width = 1209
    Height = 203
    Align = alTop
    TabOrder = 0
    object Paginas: TPageControl
      Left = 1
      Top = 1
      Width = 1207
      Height = 201
      ActivePage = Pag00
      Align = alClient
      TabOrder = 0
      object Pag00: TTabSheet
        Caption = 'Datos B'#225'sicos'
        object Label2: TLabel
          Left = 10
          Top = 62
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
        object Label3: TLabel
          Left = 10
          Top = 35
          Width = 36
          Height = 16
          Caption = '&Fecha'
          FocusControl = FECHA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lbNombreUsuario: TLabel
          Left = 251
          Top = 10
          Width = 99
          Height = 16
          Caption = 'lbNombreUsuario'
        end
        object Label1: TLabel
          Left = 10
          Top = 8
          Width = 44
          Height = 16
          Caption = '&Usuario'
          FocusControl = FECHA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 10
          Top = 90
          Width = 30
          Height = 16
          Caption = '&Base'
          FocusControl = VALOR_BASE
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label39: TLabel
          Left = 10
          Top = 117
          Width = 71
          Height = 16
          Caption = '&Valor T.R.M.'
          FocusControl = VALOR_TRM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label58: TLabel
          Left = 10
          Top = 145
          Width = 72
          Height = 16
          Caption = '&Base T.R.M.'
          FocusControl = VALOR_BASE_TRM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object BtnFormato: TSpeedButton
          Left = 228
          Top = 91
          Width = 122
          Height = 45
          Caption = 'Imprimir'
          Glyph.Data = {
            E6040000424DE604000000000000360000002800000014000000140000000100
            180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            B8BEBDAAB5B3B5C3C1A2B5B2A7BEBA809995A6C1BD95AAABA3B7B896A8A7A6B4
            B2A5B2B0B3BEBBA6B0AABDC4BFA8AEA9DCE2DDFFFFFFFFFFFFDDE2E1A4AFADAE
            BFBCECFFFFB9D7D2C8ECE6CFF5EFA1CBC4B7DFDDC7EFEDBADFDBB6D6D1B9D4D0
            CBE1DCEAFAF3C0CCC6989E99CBCFCAFFFFFFC5C7C7A3A9A884918F7B908DDFFD
            F8ABCFC99AC4BDB7E3DC6CA19891CFC993D3CD78B3AB65989081ABA4A7C8C1E9
            FFF893A19B919590B9B6B2C7BDBDA1A3A3C5CBCAC2CFCD889B98B5CECAC5E7E1
            83A9A38CB6AF80B1A989C1BC82BAB56699925C888188ACA6B2CEC8CEE0D9919B
            95C2C3BFD2CDCAB8AEAEA09E9EDDDFDFE6ECEBA4AFAD6F807DADC4C06E898569
            898485A39E798E8F8092937A88877E89879CA2A1ABB0AE80817D969591E7E6E2
            E6E5E1ABAEACA8A2A3CDC8C9D0CECEB5B5B5505655707B79616F6D6275725C6A
            685F62666F6E727572747670717E7677837979514845AFA6A3DCD7D4DCDBD7A1
            A4A2A69B9DE3D6D8EDE0E2E1D6D8A7A1A2A2A0A0A7A7A7A9ABAB9499989E9FA3
            A4A3A7A9A6A89F999AABA0A2ADA1A1A49795EADDDBDACDCBE1D8D5ACA7A69D95
            96CABFC1E8DCDCCCC1C3DCD2D2D5CDCDCDC8C7C5C1C0D6D4D4C7C8CCC4C5C9CB
            CACEC3BEC0D9D3D4D0C6C6DACECED1C5C5D3C7C7DDD3D3ACA4A4999796C3C1C0
            D8D7D3CDC9C8C7C4C0C6C3BFC8C5C1C8C7C3C0C1BFCBCED2C1C4C8B6B7BBD2D3
            D7C5C4C6C4C3C5C2BFC1BEBCBCC9C7C7CBC9C9ABA9A99DA09ECED2CDCBCCC8CE
            CFCBD4D5D1DADAD4DBDBD5D7D7D1D9DAD6C8CACBD3D6DAD0D2D3D7D9DAC4C6C7
            D6D8D9DEE0E1DEE0E1D4D6D7D0D2D3A0A0A0A6A7A5FDFEFAF9F8F4FFFFFCE7E6
            E2D2CFCADAD7D2D4D1CCD5D4D0D4D5D3D8D8D8D2D2D2DCDCDCCECECEDCDCDCD9
            D9D9E2E2E2F6F6F6F9F9F9C3C3C3AFADACF4F3EFAEADA9BEBDB9B7B4B0BEBBB6
            BDBAB5B0ACA7C7C4BFC2BFBBB3B0ACAEABA7C4C1BDB7B4B0B3B2AEB3B1B0E8E6
            E5FBF9F9EEEEEEB5B5B5C3BFBEDAD7D3C9C6C2DCD9D58F8A877F7B768985807E
            78737B7570807A737A746D7E78718A847D7975707975707C7774C6C3BFFFFFFE
            E2E0DFA7A7A7DFDBDAB4B1ADDED9D6FCF7F4B0ABA8C6C0BBE6E0DBEEE8E3E2DA
            D3E4DBD2E8DFD5EAE1D7E5DED5E8E1D8EFE9E2B9B3ACC7C3BED9D6D2D0CECDCD
            CBCBFFFFFFD0CBC8A7A09D97908DA49D9AFFFFFBF5ECE8ECE3DFFAF0E9FDF4E7
            FFF4E6FAF1E4F1E8DBFEF5EBFFFEF5AFA9A2A7A39EA29F9BC0BEBDFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFBAB3B0FFF9F5F8EFEBFFF7F3FAF1E8FDF1E5FFF2E2FF
            F4E6F1E8DAEEE4DAF5EFE4CDC5BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFB7B0ADFAF1EDFFFFFBF8EFEBFFFAF1FFF6EAFFFFEFE9DED0D4CB
            BDD9CFC5B2ACA1B5ADA6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFBDB6B3FCF3EFFFFFFBFFFBF7FFFFF9FFFFF5FFFFF4F0E7DAD1C8BBD7CEC4
            D0C9C0D9D3CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C1
            BEF7F1ECFFFFFBFFF9F4FFFFF9FFFFF7FFFFF5E8DFD5C8C1B8D2CBC2E8E2DBFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDB8B5CCC8C3
            C5C1BCB8B2ADBDB7B2BEB8B1C0BAB3C0BAB3C0BAB3D2CEC9FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF}
          Margin = 0
          OnClick = BtnFormatoClick
        end
        object NOMBRE: TOvcDbPictureField
          Left = 85
          Top = 61
          Width = 330
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
          OnUserValidation = NOMBREUserValidation
        end
        object FECHA: TOvcDbPictureField
          Left = 85
          Top = 34
          Width = 100
          Height = 24
          DataField = 'FECHA'
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
          MaxLength = 10
          Options = [efoCaretToEnd, efoSoftValidation]
          ParentFont = False
          PictureMask = 'XXXXXXXXXX'
          TabOrder = 0
        end
        object ID_ABIERTA: TDBCheckBox
          Left = 190
          Top = 38
          Width = 60
          Height = 17
          Caption = 'Abierta'
          DataField = 'ID_ABIERTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object ID_CERRADA: TDBCheckBox
          Left = 277
          Top = 38
          Width = 67
          Height = 17
          Caption = 'Cerrada'
          DataField = 'ID_CERRADA'
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object CODIGO_USUARIO: TOvcDbPictureField
          Left = 85
          Top = 7
          Width = 159
          Height = 24
          DataField = 'CODIGO_USUARIO'
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
          Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
          ParentFont = False
          PictureMask = '!!!!!!!!!!!!!!!!!!!!'
          TabOrder = 3
        end
        object VALOR_BASE: TOvcDbPictureField
          Left = 85
          Top = 88
          Width = 122
          Height = 24
          DataField = 'VALOR_BASE'
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
          MaxLength = 16
          Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
          ParentFont = False
          PictureMask = '#,###,###,###.##'
          TabOrder = 5
          RangeHigh = {E175587FED2AB1ECFE7F}
          RangeLow = {E175587FED2AB1ECFEFF}
        end
        object VALOR_TRM: TOvcDbPictureField
          Left = 85
          Top = 115
          Width = 122
          Height = 24
          DataField = 'VALOR_TRM'
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
          MaxLength = 16
          Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
          ParentFont = False
          PictureMask = '#,###,###,###.##'
          TabOrder = 6
          RangeHigh = {E175587FED2AB1ECFE7F}
          RangeLow = {E175587FED2AB1ECFEFF}
        end
        object VALOR_BASE_TRM: TOvcDbPictureField
          Left = 85
          Top = 143
          Width = 122
          Height = 24
          DataField = 'VALOR_BASE_TRM'
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
          MaxLength = 16
          Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
          ParentFont = False
          PictureMask = '#,###,###,###.##'
          TabOrder = 7
          RangeHigh = {E175587FED2AB1ECFE7F}
          RangeLow = {E175587FED2AB1ECFEFF}
        end
        object CheckBox_TI_Totales: TCheckBox
          Left = 421
          Top = 85
          Width = 129
          Height = 17
          Caption = 'Mostrar Totales'
          Checked = True
          State = cbChecked
          TabOrder = 9
        end
        object CheckBox_TI_Compras: TCheckBox
          Left = 421
          Top = 102
          Width = 129
          Height = 17
          Caption = 'Mostrar Compras'
          TabOrder = 10
        end
        object CheckBox_TI_Factura: TCheckBox
          Left = 421
          Top = 120
          Width = 129
          Height = 17
          Caption = 'Mostrar Factura'
          TabOrder = 11
        end
        object RGORDEN: TRadioGroup
          Left = 615
          Top = 61
          Width = 198
          Height = 78
          Caption = 'Ordenamiento de los productos'
          ItemIndex = 0
          Items.Strings = (
            'Descripci'#243'n'
            'Valor'
            'Cantidad')
          TabOrder = 12
        end
        object CheckBox_TI_Usuario: TCheckBox
          Left = 421
          Top = 66
          Width = 152
          Height = 17
          Caption = 'Calcular por Usuario'
          Checked = True
          State = cbChecked
          TabOrder = 8
        end
      end
      object Pag01: TTabSheet
        Caption = 'Detalle'
        ImageIndex = 1
        object DETALLE: TDBMemo
          Left = 0
          Top = 0
          Width = 1199
          Height = 170
          Align = alClient
          DataField = 'DETALLE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
      object Pag02: TTabSheet
        Caption = 'Observaciones'
        ImageIndex = 2
        object OBSERVACIONES: TDBMemo
          Left = 0
          Top = 0
          Width = 1199
          Height = 170
          Align = alClient
          BiDiMode = bdLeftToRight
          DataField = 'OBSERVACIONES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
      object Pag03: TTabSheet
        Caption = 'Auditorias'
        ImageIndex = 3
        object Label4: TLabel
          Left = 10
          Top = 4
          Width = 103
          Height = 16
          Caption = '&Estaci'#243'n Apertura'
          FocusControl = ESTACION_APERTURA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 10
          Top = 29
          Width = 88
          Height = 16
          Caption = '&Fecha Apertura'
          FocusControl = FECHA_APERTURA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 10
          Top = 55
          Width = 79
          Height = 16
          Caption = '&Hora Apertura'
          FocusControl = HORA_APERTURA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 10
          Top = 81
          Width = 89
          Height = 16
          Caption = 'E&staci'#243'n Cierre'
          FocusControl = ESTACION_CIERRE
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 10
          Top = 107
          Width = 74
          Height = 16
          Caption = 'Fe&cha Cierre'
          FocusControl = FECHA_CIERRE
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 10
          Top = 133
          Width = 65
          Height = 16
          Caption = 'Ho&ra Cierre'
          FocusControl = HORA_CIERRE
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object ESTACION_APERTURA: TOvcDbPictureField
          Left = 125
          Top = 3
          Width = 400
          Height = 24
          DataField = 'ESTACION_APERTURA'
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
          MaxLength = 50
          Options = [efoCaretToEnd, efoSoftValidation]
          ParentFont = False
          PictureMask = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          TabOrder = 0
        end
        object FECHA_APERTURA: TOvcDbPictureField
          Left = 125
          Top = 29
          Width = 100
          Height = 24
          DataField = 'FECHA_APERTURA'
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
          MaxLength = 10
          Options = [efoCaretToEnd, efoSoftValidation]
          ParentFont = False
          PictureMask = 'XXXXXXXXXX'
          TabOrder = 1
        end
        object HORA_APERTURA: TOvcDbPictureField
          Left = 125
          Top = 55
          Width = 100
          Height = 24
          DataField = 'HORA_APERTURA'
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
          MaxLength = 10
          Options = [efoCaretToEnd, efoSoftValidation]
          ParentFont = False
          PictureMask = 'XXXXXXXXXX'
          TabOrder = 2
        end
        object ESTACION_CIERRE: TOvcDbPictureField
          Left = 125
          Top = 82
          Width = 400
          Height = 24
          DataField = 'ESTACION_CIERRE'
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
          MaxLength = 50
          Options = [efoCaretToEnd, efoSoftValidation]
          ParentFont = False
          PictureMask = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          TabOrder = 3
        end
        object FECHA_CIERRE: TOvcDbPictureField
          Left = 125
          Top = 108
          Width = 100
          Height = 24
          DataField = 'FECHA_CIERRE'
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
          MaxLength = 10
          Options = [efoCaretToEnd, efoSoftValidation]
          ParentFont = False
          PictureMask = 'XXXXXXXXXX'
          TabOrder = 4
        end
        object HORA_CIERRE: TOvcDbPictureField
          Left = 125
          Top = 135
          Width = 100
          Height = 24
          DataField = 'HORA_CIERRE'
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
          MaxLength = 10
          Options = [efoCaretToEnd, efoSoftValidation]
          ParentFont = False
          PictureMask = 'XXXXXXXXXX'
          TabOrder = 5
        end
      end
    end
  end
  object PnlBotones: TPanel
    Left = 0
    Top = 203
    Width = 1209
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
      Width = 1207
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
    Top = 267
    Width = 1209
    Height = 75
    Align = alClient
    TabOrder = 2
    object Registros: TDBGrid
      Left = 1
      Top = 1
      Width = 1207
      Height = 73
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
    Top = 362
    Width = 1209
    Height = 20
    Panels = <
      item
        Width = 600
      end>
  end
  object Barra_Ayuda02: TStatusBar
    Left = 0
    Top = 342
    Width = 1209
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
    Left = 872
    Top = 56
  end
end
