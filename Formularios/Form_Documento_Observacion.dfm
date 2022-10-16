object FrDocumento_Observacion: TFrDocumento_Observacion
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrDocumento_Observacion'
  ClientHeight = 416
  ClientWidth = 945
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
  object BtnAceptar: TSpeedButton
    Left = 753
    Top = 359
    Width = 177
    Height = 39
    Caption = 'ACEPTAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = BtnAceptarClick
  end
  object BtnAdd: TSpeedButton
    Left = 24
    Top = 359
    Width = 177
    Height = 39
    Caption = 'AGREGAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = BtnAddClick
  end
  object GRID_ORIGEN: TDBGrid
    Left = 24
    Top = 8
    Width = 450
    Height = 345
    DataSource = DSORIGEN
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = GRID_ORIGENDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 400
        Visible = True
      end>
  end
  object GRID_DESTINO: TDBGrid
    Left = 480
    Top = 8
    Width = 450
    Height = 345
    DataSource = DSDESTINO
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = GRID_DESTINODblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 400
        Visible = True
      end>
  end
  object DSORIGEN: TDataSource
    Left = 192
    Top = 168
  end
  object DSDESTINO: TDataSource
    Left = 672
    Top = 168
  end
end
