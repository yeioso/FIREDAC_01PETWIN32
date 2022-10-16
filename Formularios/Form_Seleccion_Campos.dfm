object FrSeleccion_Campos: TFrSeleccion_Campos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrSeleccion_Campos'
  ClientHeight = 362
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlData: TPanel
    Left = 0
    Top = 64
    Width = 645
    Height = 257
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Paginas: TPageControl
      Left = 1
      Top = 1
      Width = 643
      Height = 255
      ActivePage = Pag00
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      object Pag00: TTabSheet
        Caption = 'Campos Pivotes'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object GridPivotes: TDBGrid
          Left = 0
          Top = 33
          Width = 635
          Height = 190
          Align = alClient
          DataSource = DsPivotes
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnDrawColumnCell = GridPivotesDrawColumnCell
          OnDblClick = GridPivotesDblClick
          OnKeyDown = GridPivotesKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'NOMBRE_CAMPO'
              ReadOnly = True
              Title.Caption = 'Campo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 236
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Title.Caption = 'Nombre'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 266
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SELECCIONADO'
              ReadOnly = True
              Title.Caption = 'Seleccionado'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end>
        end
        object pnlPivotes: TPanel
          Left = 0
          Top = 0
          Width = 635
          Height = 33
          Align = alTop
          TabOrder = 1
          object Label1: TLabel
            Left = 12
            Top = 9
            Width = 49
            Height = 14
            Caption = 'Busqueda'
          end
          object BtnPivotes: TSpeedButton
            Left = 359
            Top = 6
            Width = 23
            Height = 22
            OnClick = BtnPivotesClick
          end
          object txtPivote: TEdit
            Left = 67
            Top = 6
            Width = 286
            Height = 22
            TabOrder = 0
            OnChange = txtPivoteChange
          end
        end
      end
      object Pag01: TTabSheet
        Caption = 'Campos Valores'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 287
        object pnlValores: TPanel
          Left = 0
          Top = 0
          Width = 635
          Height = 33
          Align = alTop
          TabOrder = 0
          object Label2: TLabel
            Left = 12
            Top = 9
            Width = 49
            Height = 14
            Caption = 'Busqueda'
          end
          object BtnValores: TSpeedButton
            Left = 359
            Top = 6
            Width = 23
            Height = 22
            OnClick = BtnValoresClick
          end
          object txtValores: TEdit
            Left = 67
            Top = 6
            Width = 286
            Height = 22
            TabOrder = 0
            OnChange = txtValoresChange
          end
        end
        object GridValores: TDBGrid
          Left = 0
          Top = 33
          Width = 635
          Height = 190
          Align = alClient
          DataSource = DsValores
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnDrawColumnCell = GridValoresDrawColumnCell
          OnDblClick = GridValoresDblClick
          OnKeyDown = GridValoresKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'NOMBRE_CAMPO'
              ReadOnly = True
              Title.Caption = 'Campo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 236
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Title.Caption = 'Nombre'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 266
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SELECCIONADO'
              ReadOnly = True
              Title.Caption = 'Seleccionado'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end>
        end
      end
    end
  end
  object pnlBotones: TPanel
    Left = 0
    Top = 321
    Width = 645
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
      Left = 476
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
  object pnlInfo: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 64
    Align = alTop
    TabOrder = 2
    object ListBox1: TListBox
      Left = 1
      Top = 1
      Width = 643
      Height = 62
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 19
      Items.Strings = (
        
          '<F10> '#243' Doble click en la columna "Seleccionado" para selecciona' +
          'r'
        ''
        'Cambiar el texto del campo en la columna "Nombre"')
      ParentColor = True
      ParentFont = False
      TabOrder = 0
    end
  end
  object QrPivotes: TADOQuery
    BeforeInsert = QrPivotesBeforeInsert
    BeforeDelete = QrPivotesBeforeDelete
    Parameters = <>
    Left = 48
    Top = 224
  end
  object QrValores: TADOQuery
    BeforeInsert = QrValoresBeforeInsert
    BeforeDelete = QrValoresBeforeDelete
    Parameters = <>
    Left = 120
    Top = 224
  end
  object DsPivotes: TDataSource
    DataSet = QrPivotes
    Left = 48
    Top = 256
  end
  object DsValores: TDataSource
    DataSet = QrValores
    Left = 120
    Top = 256
  end
end
