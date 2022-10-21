object FrDocumento_Contable: TFrDocumento_Contable
  Left = 0
  Top = 0
  Caption = 'FrDocumento_Contable'
  ClientHeight = 553
  ClientWidth = 1354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1354
    Height = 124
    Align = alTop
    TabOrder = 0
    object gbSALDOS: TGroupBox
      Left = 417
      Top = 1
      Width = 415
      Height = 122
      Align = alLeft
      Caption = 'Saldos'
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 25
        Width = 37
        Height = 16
        Caption = 'D'#233'bito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 10
        Top = 52
        Width = 41
        Height = 16
        Caption = 'Cr'#233'dito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 10
        Top = 80
        Width = 33
        Height = 16
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 210
        Top = 25
        Width = 42
        Height = 16
        Caption = 'Activos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 210
        Top = 52
        Width = 45
        Height = 16
        Caption = 'Pasivos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 210
        Top = 80
        Width = 62
        Height = 16
        Caption = 'Patrimonio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object DEBITO_ENC: TOvcPictureField
        Left = 54
        Top = 24
        Width = 130
        Height = 24
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
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 16
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '#,###,###,###.##'
        TabOrder = 0
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
      object CREDITO_ENC: TOvcPictureField
        Left = 54
        Top = 52
        Width = 130
        Height = 24
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
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 16
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '#,###,###,###.##'
        TabOrder = 1
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
      object SALDO_ENC: TOvcPictureField
        Left = 54
        Top = 80
        Width = 130
        Height = 24
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
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 16
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '#,###,###,###.##'
        TabOrder = 2
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
      object ACTIVO_ENC: TOvcPictureField
        Left = 276
        Top = 24
        Width = 130
        Height = 24
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
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 16
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '#,###,###,###.##'
        TabOrder = 3
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
      object PASIVO_ENC: TOvcPictureField
        Left = 276
        Top = 52
        Width = 130
        Height = 24
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
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 16
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '#,###,###,###.##'
        TabOrder = 4
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
      object PATRIMONIO_ENC: TOvcPictureField
        Left = 276
        Top = 80
        Width = 130
        Height = 24
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
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 16
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '#,###,###,###.##'
        TabOrder = 5
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
    end
    object gb1: TGroupBox
      Left = 1
      Top = 1
      Width = 416
      Height = 122
      Align = alLeft
      Caption = 'Datos'
      TabOrder = 1
      object lb1: TLabel
        Left = 10
        Top = 14
        Width = 66
        Height = 16
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lb2: TLabel
        Left = 10
        Top = 87
        Width = 68
        Height = 16
        Caption = 'Descripci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 10
        Top = 38
        Width = 77
        Height = 16
        Caption = 'Comprobante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 10
        Top = 62
        Width = 36
        Height = 16
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object BtnComprobante: TSpeedButton
        Left = 227
        Top = 42
        Width = 23
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object BtnFecha: TSpeedButton
        Left = 227
        Top = 66
        Width = 23
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbNombre_Comprobante: TLabel
        Left = 258
        Top = 44
        Width = 139
        Height = 16
        Caption = 'lbNombre_Comprobante'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object NUMERO_DOCUMENTO: TOvcPictureField
        Left = 95
        Top = 14
        Width = 130
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
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 10
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation, efoTrimBlanks]
        ParentFont = False
        PictureMask = '!!!!!!!!!!'
        TabOrder = 0
      end
      object NOMBRE_ENC: TOvcPictureField
        Left = 95
        Top = 90
        Width = 313
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
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 50
        Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
        ParentFont = False
        PictureMask = '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
        TabOrder = 3
      end
      object CODIGO_COMPROBANTE: TOvcPictureField
        Left = 95
        Top = 39
        Width = 130
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
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 5
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation, efoTrimBlanks]
        ParentFont = False
        PictureMask = '!!!!!'
        TabOrder = 1
      end
      object FECHA: TOvcPictureField
        Left = 95
        Top = 64
        Width = 130
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
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 10
        Options = [efoCaretToEnd, efoSoftValidation]
        ParentFont = False
        PictureMask = 'yyyy-mm-dd'
        TabOrder = 2
      end
    end
    object gbTRM: TGroupBox
      Left = 832
      Top = 1
      Width = 415
      Height = 122
      Align = alLeft
      Caption = 'TRM'
      TabOrder = 2
      object Label7: TLabel
        Left = 10
        Top = 25
        Width = 37
        Height = 16
        Caption = 'D'#233'bito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 10
        Top = 52
        Width = 41
        Height = 16
        Caption = 'Cr'#233'dito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 10
        Top = 80
        Width = 33
        Height = 16
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 210
        Top = 25
        Width = 42
        Height = 16
        Caption = 'Activos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 210
        Top = 52
        Width = 45
        Height = 16
        Caption = 'Pasivos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 210
        Top = 80
        Width = 62
        Height = 16
        Caption = 'Patrimonio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object DEBITO_TRM_ENC: TOvcPictureField
        Left = 54
        Top = 24
        Width = 130
        Height = 24
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
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 16
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '#,###,###,###.##'
        TabOrder = 0
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
      object CREDITO_TRM_ENC: TOvcPictureField
        Left = 54
        Top = 52
        Width = 130
        Height = 24
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
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 16
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '#,###,###,###.##'
        TabOrder = 1
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
      object SALDO_TRM_ENC: TOvcPictureField
        Left = 54
        Top = 80
        Width = 130
        Height = 24
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
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 16
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '#,###,###,###.##'
        TabOrder = 2
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
      object ACTIVO_TRM_ENC: TOvcPictureField
        Left = 276
        Top = 24
        Width = 130
        Height = 24
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
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 16
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '#,###,###,###.##'
        TabOrder = 3
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
      object PASIVO_TRM_ENC: TOvcPictureField
        Left = 276
        Top = 52
        Width = 130
        Height = 24
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
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 16
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '#,###,###,###.##'
        TabOrder = 4
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
      object PATRIMONIO_TRM_ENC: TOvcPictureField
        Left = 276
        Top = 80
        Width = 130
        Height = 24
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
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        InitDateTime = False
        MaxLength = 16
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '#,###,###,###.##'
        TabOrder = 5
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
    end
    object gbColumnas: TGroupBox
      Left = 1247
      Top = 1
      Width = 114
      Height = 122
      Align = alLeft
      Caption = 'Visualizar Columnas'
      TabOrder = 3
      object CHECK_BASE: TCheckBox
        Left = 18
        Top = 21
        Width = 69
        Height = 17
        Caption = 'Base'
        TabOrder = 0
        OnClick = CHECK_BASEClick
      end
      object CHECK_BALANCE: TCheckBox
        Left = 18
        Top = 45
        Width = 69
        Height = 17
        Caption = 'Balance'
        TabOrder = 1
        OnClick = CHECK_BALANCEClick
      end
      object CHECK_TRM: TCheckBox
        Left = 18
        Top = 69
        Width = 69
        Height = 17
        Caption = 'T.R.M.'
        TabOrder = 2
        OnClick = CHECK_TRMClick
      end
      object CHECK_NOMBRE: TCheckBox
        Left = 18
        Top = 93
        Width = 69
        Height = 17
        Caption = 'Nombre'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = CHECK_NOMBREClick
      end
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 124
    Width = 1354
    Height = 372
    Align = alClient
    TabOrder = 1
    object Detalle: TOvcTable
      Left = 1
      Top = 1
      Width = 1352
      Height = 370
      Align = alClient
      Color = clWhite
      Controller = OvcController1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      GridPenSet.NormalGrid.NormalColor = clBtnShadow
      GridPenSet.NormalGrid.Style = psSolid
      GridPenSet.NormalGrid.Effect = geBoth
      GridPenSet.LockedGrid.NormalColor = clBtnShadow
      GridPenSet.LockedGrid.Style = psSolid
      GridPenSet.LockedGrid.Effect = ge3D
      GridPenSet.CellWhenFocused.NormalColor = clBlack
      GridPenSet.CellWhenFocused.Style = psSolid
      GridPenSet.CellWhenFocused.Effect = geBoth
      GridPenSet.CellWhenUnfocused.NormalColor = clBlack
      GridPenSet.CellWhenUnfocused.Style = psInsideFrame
      GridPenSet.CellWhenUnfocused.Effect = geBoth
      LockedRowsCell = HEAD
      Options = [otoNoRowResizing, otoNoColResizing, otoTabToArrow, otoEnterToArrow, otoAlwaysEditing, otoNoSelection, otoThumbTrack]
      ParentFont = False
      TabOrder = 0
      OnActiveCellChanged = DetalleActiveCellChanged
      OnActiveCellMoving = DetalleActiveCellMoving
      OnGetCellData = DetalleGetCellData
      CellData = (
        'FrDocumento_Contable.HEAD'
        'FrDocumento_Contable.KEY'
        'FrDocumento_Contable.PATRIMONIO_TRM_DET'
        'FrDocumento_Contable.PASIVO_TRM_DET'
        'FrDocumento_Contable.ACTIVO_TRM_DET'
        'FrDocumento_Contable.BASE_TRM_DET'
        'FrDocumento_Contable.SALDO_TRM_DET'
        'FrDocumento_Contable.CREDITO_TRM_DET'
        'FrDocumento_Contable.DEBITO_TRM_DET'
        'FrDocumento_Contable.VALOR_TRM_DET'
        'FrDocumento_Contable.PATRIMONIO_DET'
        'FrDocumento_Contable.PASIVO_DET'
        'FrDocumento_Contable.ACTIVO_DET'
        'FrDocumento_Contable.BASE_DET'
        'FrDocumento_Contable.PORCENTAJE_DET'
        'FrDocumento_Contable.SALDO_DET'
        'FrDocumento_Contable.CREDITO_DET'
        'FrDocumento_Contable.DEBITO_DET'
        'FrDocumento_Contable.NOMBRE_TERCERO'
        'FrDocumento_Contable.CODIGO_TERCERO'
        'FrDocumento_Contable.NOMBRE_CCOSTO'
        'FrDocumento_Contable.CODIGO_CCOSTO'
        'FrDocumento_Contable.DOCUMENTO_REFERENCIA'
        'FrDocumento_Contable.NOMBRE_PUC'
        'FrDocumento_Contable.CODIGO_PUC'
        'FrDocumento_Contable.NOMBRE_DET'
        'FrDocumento_Contable.FECHA_DOCUMENTO')
      RowData = (
        20)
      ColData = (
        64
        False
        True
        'FrDocumento_Contable.KEY'
        93
        False
        True
        'FrDocumento_Contable.FECHA_DOCUMENTO'
        100
        False
        True
        'FrDocumento_Contable.NOMBRE_DET'
        65
        False
        True
        'FrDocumento_Contable.CODIGO_PUC'
        100
        False
        True
        'FrDocumento_Contable.NOMBRE_PUC'
        116
        False
        True
        'FrDocumento_Contable.DOCUMENTO_REFERENCIA'
        82
        False
        True
        'FrDocumento_Contable.CODIGO_CCOSTO'
        100
        False
        True
        'FrDocumento_Contable.NOMBRE_CCOSTO'
        85
        False
        True
        'FrDocumento_Contable.CODIGO_TERCERO'
        100
        False
        True
        'FrDocumento_Contable.NOMBRE_TERCERO'
        80
        False
        True
        'FrDocumento_Contable.DEBITO_DET'
        80
        False
        True
        'FrDocumento_Contable.CREDITO_DET'
        80
        False
        True
        'FrDocumento_Contable.SALDO_DET'
        55
        False
        True
        'FrDocumento_Contable.PORCENTAJE_DET'
        80
        False
        True
        'FrDocumento_Contable.BASE_DET'
        80
        False
        True
        'FrDocumento_Contable.ACTIVO_DET'
        80
        False
        True
        'FrDocumento_Contable.PASIVO_DET'
        80
        False
        True
        'FrDocumento_Contable.PATRIMONIO_DET'
        60
        False
        True
        'FrDocumento_Contable.VALOR_TRM_DET'
        60
        False
        True
        'FrDocumento_Contable.DEBITO_TRM_DET'
        65
        False
        True
        'FrDocumento_Contable.CREDITO_TRM_DET'
        60
        False
        True
        'FrDocumento_Contable.SALDO_TRM_DET'
        60
        False
        True
        'FrDocumento_Contable.BASE_TRM_DET'
        60
        False
        True
        'FrDocumento_Contable.ACTIVO_TRM_DET'
        65
        False
        True
        'FrDocumento_Contable.PASIVO_TRM_DET'
        80
        False
        True
        'FrDocumento_Contable.PATRIMONIO_TRM_DET'
        5
        False
        False)
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 496
    Width = 1354
    Height = 57
    Align = alBottom
    TabOrder = 2
    object BtnSalir: TSpeedButton
      Left = 1209
      Top = 1
      Width = 144
      Height = 55
      Align = alRight
      ExplicitLeft = 1
      ExplicitHeight = 71
    end
    object BtnCancelar: TSpeedButton
      Left = 145
      Top = 1
      Width = 144
      Height = 55
      Align = alLeft
      ExplicitLeft = 1
      ExplicitHeight = 71
    end
    object BtnGuardar: TSpeedButton
      Left = 1
      Top = 1
      Width = 144
      Height = 55
      Align = alLeft
      OnClick = BtnGuardarClick
      ExplicitHeight = 71
    end
  end
  object HEAD: TOvcTCColHead
    ShowLetters = False
    Headings.Strings = (
      'Key            '
      'Fecha Documento'
      'Detalle'
      'C'#243'digo PUC'
      'Nombre PUC'
      'Documento Referencia'
      'C'#243'digo Ccostos'
      'Nombre Ccostos'
      'C'#243'digo Tercero'
      'Nombre Tercero'
      'D'#233'bito'
      'Cr'#233'dito'
      'Saldo'
      'Porcentaje'
      'Base'
      'Activos'
      'Pasivos'
      'Patrimonio'
      'Valor TRM'
      'D'#233'bito TRM'
      'Cr'#233'dito TRM'
      'Saldo TRM'
      'Base TRM'
      'Activos TRM'
      'Pasivos TRM'
      'Patrimonio TRM')
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Table = Detalle
    TableFont = False
    Left = 392
    Top = 392
  end
  object ROW: TOvcTCRowHead
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    Table = Detalle
    TableFont = False
    Left = 424
    Top = 392
  end
  object FECHA_DOCUMENTO: TOvcTCPictureField
    PictureMask = 'XXXXXXXXXX'
    MaxLength = 10
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
    Table = Detalle
    Left = 80
    Top = 392
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
  object NOMBRE_DET: TOvcTCPictureField
    PictureMask = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    MaxLength = 50
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
    Table = Detalle
    Left = 112
    Top = 392
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
  object NOMBRE_PUC: TOvcTCPictureField
    PictureMask = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    MaxLength = 50
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
    Table = Detalle
    Left = 176
    Top = 392
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
  object CODIGO_PUC: TOvcTCPictureField
    PictureMask = 'XXXXXXXXXXXXXXXXXXXX'
    MaxLength = 20
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
    Table = Detalle
    Left = 144
    Top = 392
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
  object CODIGO_TERCERO: TOvcTCPictureField
    PictureMask = 'XXXXXXXXXXXXXXXXXXXX'
    MaxLength = 20
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
    Table = Detalle
    Left = 304
    Top = 392
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
  object CODIGO_CCOSTO: TOvcTCPictureField
    PictureMask = 'XXXXXXXXXXXXXXXXXXXX'
    MaxLength = 20
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
    Table = Detalle
    Left = 240
    Top = 392
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
  object NOMBRE_CCOSTO: TOvcTCPictureField
    PictureMask = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    MaxLength = 50
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
    Table = Detalle
    Left = 272
    Top = 392
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
  object DOCUMENTO_REFERENCIA: TOvcTCPictureField
    PictureMask = 'XXXXXXXXXX'
    MaxLength = 10
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
    Table = Detalle
    Left = 208
    Top = 392
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
  object NOMBRE_TERCERO: TOvcTCPictureField
    PictureMask = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    MaxLength = 50
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
    Table = Detalle
    Left = 336
    Top = 392
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
  object DEBITO_DET: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###,###.##'
    MaxLength = 14
    Adjust = otaBottomRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoSoftValidation]
    Table = Detalle
    Left = 48
    Top = 432
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object CREDITO_DET: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###,###.##'
    MaxLength = 14
    Adjust = otaBottomRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoSoftValidation]
    Table = Detalle
    Left = 80
    Top = 432
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object SALDO_DET: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###,###.##'
    MaxLength = 14
    Adjust = otaBottomRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation]
    Table = Detalle
    Left = 112
    Top = 432
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object PORCENTAJE_DET: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###,###.##'
    MaxLength = 14
    Adjust = otaBottomRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoSoftValidation]
    Table = Detalle
    Left = 144
    Top = 432
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object BASE_DET: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###,###.##'
    MaxLength = 14
    Adjust = otaBottomRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation]
    Table = Detalle
    Left = 176
    Top = 432
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object ACTIVO_DET: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###,###.##'
    MaxLength = 14
    Adjust = otaBottomRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation]
    Table = Detalle
    Left = 208
    Top = 432
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object PASIVO_DET: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###,###.##'
    MaxLength = 14
    Adjust = otaBottomRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation]
    Table = Detalle
    Left = 240
    Top = 432
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object PATRIMONIO_DET: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###,###.##'
    MaxLength = 14
    Adjust = otaBottomRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation]
    Table = Detalle
    Left = 272
    Top = 432
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object VALOR_TRM_DET: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###,###.##'
    MaxLength = 14
    Adjust = otaBottomRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoSoftValidation]
    Table = Detalle
    Left = 304
    Top = 432
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object PATRIMONIO_TRM_DET: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###,###.##'
    MaxLength = 14
    Adjust = otaBottomRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation]
    Table = Detalle
    Left = 528
    Top = 432
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object PASIVO_TRM_DET: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###,###.##'
    MaxLength = 14
    Adjust = otaBottomRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation]
    Table = Detalle
    Left = 496
    Top = 432
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object ACTIVO_TRM_DET: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###,###.##'
    MaxLength = 14
    Adjust = otaBottomRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation]
    Table = Detalle
    Left = 464
    Top = 432
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object BASE_TRM_DET: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###,###.##'
    MaxLength = 14
    Adjust = otaBottomRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation]
    Table = Detalle
    Left = 432
    Top = 432
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object SALDO_TRM_DET: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###,###.##'
    MaxLength = 14
    Adjust = otaBottomRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation]
    Table = Detalle
    Left = 400
    Top = 432
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object CREDITO_TRM_DET: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###,###.##'
    MaxLength = 14
    Adjust = otaBottomRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation]
    Table = Detalle
    Left = 368
    Top = 432
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object DEBITO_TRM_DET: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###,###.##'
    MaxLength = 14
    Adjust = otaBottomRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 2000
    Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation]
    Table = Detalle
    Left = 336
    Top = 432
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
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
    Left = 456
    Top = 392
  end
  object KEY: TOvcTCString
    Table = Detalle
    Left = 48
    Top = 392
  end
end
