object FrDetalle_Comentario: TFrDetalle_Comentario
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrDetalle_Comentario'
  ClientHeight = 389
  ClientWidth = 723
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
    Width = 417
    Height = 348
    Align = alLeft
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 415
      Height = 346
      Align = alClient
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Title.Caption = 'Descripci'#243'n'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 383
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 417
    Top = 0
    Width = 306
    Height = 348
    Align = alClient
    TabOrder = 1
    object DBMemo1: TDBMemo
      Left = 1
      Top = 1
      Width = 304
      Height = 346
      Align = alClient
      DataField = 'OBSERVACION'
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 348
    Width = 723
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BtnAceptar: TBitBtn
      Left = 1
      Top = 1
      Width = 150
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
    end
    object BtnCancelar: TBitBtn
      Left = 572
      Top = 1
      Width = 150
      Height = 39
      Align = alRight
      Caption = '&SALIR'
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 1
    end
  end
end
