object FrTercero_Resumen: TFrTercero_Resumen
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrTercero_Resumen'
  ClientHeight = 336
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object Paginas: TPageControl
    Left = 0
    Top = 0
    Width = 723
    Height = 336
    ActivePage = Pag00
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 727
    ExplicitHeight = 337
    object Pag00: TTabSheet
      Caption = 'General'
      object GRID_GENERAL: TDBGrid
        Left = 0
        Top = 0
        Width = 719
        Height = 309
        Align = alClient
        DataSource = DsGeneral
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
            FieldName = 'TIPO_DOCUMENTO'
            Title.Caption = 'Documento'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO_DOCUMENTO'
            Title.Caption = 'Numero'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 138
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_DOCUMENTO'
            Title.Caption = 'Fecha del Documento'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 127
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'SALDO_PENDIENTE'
            Title.Alignment = taRightJustify
            Title.Caption = 'Pendiente'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_ANULADO'
            Title.Alignment = taCenter
            Title.Caption = 'Anulado'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
    end
  end
  object DsGeneral: TDataSource
    AutoEdit = False
    Left = 276
    Top = 192
  end
end
