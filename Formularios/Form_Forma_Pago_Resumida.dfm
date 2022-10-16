object FrForma_Pago_Resumida: TFrForma_Pago_Resumida
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrForma_Pago_Resumida'
  ClientHeight = 519
  ClientWidth = 915
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  TextHeight = 18
  object Paginas: TPageControl
    Left = 0
    Top = 0
    Width = 915
    Height = 478
    ActivePage = Pag00
    Align = alClient
    TabOrder = 0
    object Pag00: TTabSheet
      Caption = 'TOTALES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object lb1: TLabel
        Left = 10
        Top = 9
        Width = 69
        Height = 22
        Caption = 'Efectivo'
        FocusControl = EFE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lb3: TLabel
        Left = 10
        Top = 84
        Width = 123
        Height = 22
        Caption = 'Tarjeta Cr'#233'dito'
        FocusControl = TDC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lb5: TLabel
        Left = 10
        Top = 235
        Width = 66
        Height = 22
        Caption = 'Sodexo'
        FocusControl = SDX
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lb6: TLabel
        Left = 10
        Top = 310
        Width = 62
        Height = 22
        Caption = 'Cartera'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lb2: TLabel
        Left = 10
        Top = 46
        Width = 117
        Height = 22
        Caption = 'Tarjeta D'#233'bito'
        FocusControl = TDD
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 12
        Top = 368
        Width = 46
        Height = 22
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 171
        Top = 368
        Width = 71
        Height = 22
        Caption = 'Pagado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 331
        Top = 368
        Width = 93
        Height = 22
        Caption = 'Pendiente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 10
        Top = 272
        Width = 73
        Height = 22
        Caption = 'Cortes'#237'a'
        FocusControl = COR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object BtnTDD: TSpeedButton
        Left = 584
        Top = 44
        Width = 36
        Height = 30
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
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
        ParentFont = False
        OnClick = BtnTDDClick
      end
      object BtnTDC: TSpeedButton
        Left = 584
        Top = 84
        Width = 36
        Height = 30
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
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
        ParentFont = False
        OnClick = BtnTDCClick
      end
      object lbCHE: TLabel
        Left = 10
        Top = 122
        Width = 67
        Height = 22
        Caption = 'Cheque'
        FocusControl = TDC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object BtnCHE: TSpeedButton
        Left = 584
        Top = 124
        Width = 36
        Height = 30
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
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
        ParentFont = False
        OnClick = BtnCHEClick
      end
      object Label15: TLabel
        Left = 650
        Top = 368
        Width = 71
        Height = 22
        Caption = 'Cambio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 490
        Top = 368
        Width = 81
        Height = 22
        Caption = 'Recibido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 10
        Top = 160
        Width = 115
        Height = 22
        Caption = 'Transferencia'
        FocusControl = TRANSF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object BtnTrans: TSpeedButton
        Left = 584
        Top = 160
        Width = 36
        Height = 30
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
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
        ParentFont = False
        OnClick = BtnTransClick
      end
      object Label22: TLabel
        Left = 10
        Top = 197
        Width = 136
        Height = 22
        Caption = 'Sistema Cr'#233'dito'
        FocusControl = SISTEMA_CREDITO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object EFE: TOvcDbPictureField
        Left = 150
        Top = 7
        Width = 154
        Height = 30
        DataField = 'EFE'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 0
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object TDC: TOvcDbPictureField
        Left = 150
        Top = 83
        Width = 154
        Height = 30
        DataField = 'TDC'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 4
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object CHE: TOvcDbPictureField
        Left = 150
        Top = 121
        Width = 154
        Height = 30
        DataField = 'CHE'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 7
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object SDX: TOvcDbPictureField
        Left = 150
        Top = 235
        Width = 154
        Height = 30
        DataField = 'SDX'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 13
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object CAR: TOvcDbPictureField
        Left = 150
        Top = 311
        Width = 154
        Height = 30
        DataField = 'CAR'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 15
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object TDD: TOvcDbPictureField
        Left = 150
        Top = 45
        Width = 154
        Height = 30
        DataField = 'TDD'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 1
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object TOTAL: TOvcPictureField
        Left = 12
        Top = 396
        Width = 153
        Height = 30
        Cursor = crIBeam
        DataType = pftDouble
        CaretOvr.Shape = csBlock
        Color = clBlack
        ControlCharColor = clRed
        DecimalPlaces = 0
        EFColors.Disabled.BackColor = clBlack
        EFColors.Disabled.TextColor = clLime
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        InitDateTime = False
        MaxLength = 14
        Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 16
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
      object PAGADO: TOvcPictureField
        Left = 171
        Top = 396
        Width = 153
        Height = 30
        Cursor = crIBeam
        DataType = pftDouble
        CaretOvr.Shape = csBlock
        Color = clBlack
        ControlCharColor = clRed
        DecimalPlaces = 0
        EFColors.Disabled.BackColor = clBlack
        EFColors.Disabled.TextColor = clLime
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        InitDateTime = False
        MaxLength = 14
        Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 17
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
      object PENDIENTE: TOvcPictureField
        Left = 331
        Top = 396
        Width = 153
        Height = 30
        Cursor = crIBeam
        DataType = pftDouble
        CaretOvr.Shape = csBlock
        Color = clBlack
        ControlCharColor = clRed
        DecimalPlaces = 0
        EFColors.Disabled.BackColor = clBlack
        EFColors.Disabled.TextColor = clLime
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        InitDateTime = False
        MaxLength = 14
        Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 18
        OnUserValidation = PENDIENTEUserValidation
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
      object COR: TOvcDbPictureField
        Left = 150
        Top = 273
        Width = 154
        Height = 30
        DataField = 'COR'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 14
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object TDD_ENTIDAD: TOvcDbPictureField
        Left = 306
        Top = 44
        Width = 275
        Height = 30
        DataField = 'TDD_ENTIDAD'
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 20
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation, efoTrimBlanks]
        ParentFont = False
        PictureMask = '!!!!!!!!!!!!!!!!!!!!'
        TabOrder = 2
        OnExit = TDD_ENTIDADExit
        OnKeyDown = TDD_ENTIDADKeyDown
        OnUserValidation = TDD_ENTIDADUserValidation
      end
      object TDD_VAUCHE: TOvcDbPictureField
        Left = 627
        Top = 44
        Width = 216
        Height = 30
        DataField = 'TDD_VAUCHE'
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 20
        Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
        ParentFont = False
        PictureMask = '!!!!!!!!!!!!!!!!!!!!'
        TabOrder = 3
      end
      object TDC_ENTIDAD: TOvcDbPictureField
        Left = 306
        Top = 84
        Width = 275
        Height = 30
        DataField = 'TDC_ENTIDAD'
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 20
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation, efoTrimBlanks]
        ParentFont = False
        PictureMask = '!!!!!!!!!!!!!!!!!!!!'
        TabOrder = 5
        OnExit = TDC_ENTIDADExit
        OnKeyDown = TDC_ENTIDADKeyDown
        OnUserValidation = TDC_ENTIDADUserValidation
      end
      object TDC_VAUCHE: TOvcDbPictureField
        Left = 627
        Top = 84
        Width = 216
        Height = 30
        DataField = 'TDC_VAUCHE'
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 20
        Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
        ParentFont = False
        PictureMask = '!!!!!!!!!!!!!!!!!!!!'
        TabOrder = 6
      end
      object CHE_ENTIDAD: TOvcDbPictureField
        Left = 306
        Top = 124
        Width = 275
        Height = 30
        DataField = 'CHE_ENTIDAD'
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 20
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation, efoTrimBlanks]
        ParentFont = False
        PictureMask = '!!!!!!!!!!!!!!!!!!!!'
        TabOrder = 8
        OnExit = CHE_ENTIDADExit
        OnKeyDown = CHE_ENTIDADKeyDown
        OnUserValidation = CHE_ENTIDADUserValidation
      end
      object TRANSF: TOvcDbPictureField
        Left = 150
        Top = 159
        Width = 154
        Height = 30
        DataField = 'TRANSF'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 9
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object TRANSF_ENTIDAD: TOvcDbPictureField
        Left = 306
        Top = 160
        Width = 275
        Height = 30
        DataField = 'TRANSF_ENTIDAD'
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 20
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation, efoTrimBlanks]
        ParentFont = False
        PictureMask = '!!!!!!!!!!!!!!!!!!!!'
        TabOrder = 10
        OnExit = TRANSF_ENTIDADExit
        OnKeyDown = TRANSF_ENTIDADKeyDown
        OnUserValidation = TRANSF_ENTIDADUserValidation
      end
      object TRANSF_VAUCHE: TOvcDbPictureField
        Left = 627
        Top = 160
        Width = 216
        Height = 30
        DataField = 'TRANSF_VAUCHE'
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 20
        Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
        ParentFont = False
        PictureMask = '!!!!!!!!!!!!!!!!!!!!'
        TabOrder = 11
      end
      object SISTEMA_CREDITO: TOvcDbPictureField
        Left = 150
        Top = 197
        Width = 154
        Height = 30
        DataField = 'SISTEMA_CREDITO'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 12
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object ENTIDADES: TMemo
        Left = 306
        Top = 197
        Width = 537
        Height = 144
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'ENTIDADES')
        ParentFont = False
        ReadOnly = True
        TabOrder = 21
      end
      object VALOR_PAGADO: TOvcDbPictureField
        Left = 486
        Top = 396
        Width = 154
        Height = 30
        DataField = 'VALOR_PAGADO'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        Color = clSilver
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 19
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object VALOR_VUELTO: TOvcDbPictureField
        Left = 650
        Top = 396
        Width = 154
        Height = 30
        DataField = 'VALOR_VUELTO'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        Color = clSilver
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 20
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
    end
    object Pag01: TTabSheet
      Caption = 'T.R.M.'
      ImageIndex = 1
      object Label4: TLabel
        Left = 10
        Top = 9
        Width = 69
        Height = 22
        Caption = 'Efectivo'
        FocusControl = EFE_TRM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 10
        Top = 69
        Width = 123
        Height = 22
        Caption = 'Tarjeta Cr'#233'dito'
        FocusControl = TDC_TRM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 10
        Top = 99
        Width = 67
        Height = 22
        Caption = 'Cheque'
        FocusControl = CHE_TRM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 10
        Top = 189
        Width = 66
        Height = 22
        Caption = 'Sodexo'
        FocusControl = SDX_TRM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 10
        Top = 249
        Width = 62
        Height = 22
        Caption = 'Cartera'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 10
        Top = 39
        Width = 117
        Height = 22
        Caption = 'Tarjeta D'#233'bito'
        FocusControl = TDD_TRM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 338
        Top = 12
        Width = 46
        Height = 22
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 338
        Top = 49
        Width = 71
        Height = 22
        Caption = 'Pagado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 338
        Top = 81
        Width = 93
        Height = 22
        Caption = 'Pendiente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 10
        Top = 219
        Width = 73
        Height = 22
        Caption = 'Cortes'#237'a'
        FocusControl = COR_TRM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 10
        Top = 129
        Width = 115
        Height = 22
        Caption = 'Transferencia'
        FocusControl = TRANSF_TRM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 10
        Top = 159
        Width = 136
        Height = 22
        Caption = 'Sistema Cr'#233'dito'
        FocusControl = SISTEMA_CREDITO_TRM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object EFE_TRM: TOvcDbPictureField
        Left = 149
        Top = 7
        Width = 150
        Height = 30
        DataField = 'EFE_TRM'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        Color = clBlack
        EFColors.Disabled.BackColor = clBlack
        EFColors.Disabled.TextColor = clLime
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 0
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object TDC_TRM: TOvcDbPictureField
        Left = 149
        Top = 68
        Width = 150
        Height = 30
        DataField = 'TDC_TRM'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        Color = clBlack
        EFColors.Disabled.BackColor = clBlack
        EFColors.Disabled.TextColor = clLime
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 2
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object CHE_TRM: TOvcDbPictureField
        Left = 149
        Top = 98
        Width = 150
        Height = 30
        DataField = 'CHE_TRM'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        Color = clBlack
        EFColors.Disabled.BackColor = clBlack
        EFColors.Disabled.TextColor = clLime
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 3
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object SDX_TRM: TOvcDbPictureField
        Left = 149
        Top = 190
        Width = 150
        Height = 30
        DataField = 'SDX_TRM'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        Color = clBlack
        EFColors.Disabled.BackColor = clBlack
        EFColors.Disabled.TextColor = clLime
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 6
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object CAR_TRM: TOvcDbPictureField
        Left = 149
        Top = 252
        Width = 150
        Height = 30
        DataField = 'CAR_TRM'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        Color = clBlack
        EFColors.Disabled.BackColor = clBlack
        EFColors.Disabled.TextColor = clLime
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 8
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object TDD_TRM: TOvcDbPictureField
        Left = 149
        Top = 37
        Width = 150
        Height = 30
        DataField = 'TDD_TRM'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        Color = clBlack
        EFColors.Disabled.BackColor = clBlack
        EFColors.Disabled.TextColor = clLime
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 1
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object TOTAL_TRM: TOvcPictureField
        Left = 434
        Top = 12
        Width = 153
        Height = 30
        Cursor = crIBeam
        DataType = pftDouble
        CaretOvr.Shape = csBlock
        Color = clBlack
        ControlCharColor = clRed
        DecimalPlaces = 0
        EFColors.Disabled.BackColor = clBlack
        EFColors.Disabled.TextColor = clWhite
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        InitDateTime = False
        MaxLength = 14
        Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 9
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
      object PAGADO_TRM: TOvcPictureField
        Left = 434
        Top = 48
        Width = 153
        Height = 30
        Cursor = crIBeam
        DataType = pftDouble
        CaretOvr.Shape = csBlock
        Color = clBlack
        ControlCharColor = clRed
        DecimalPlaces = 0
        EFColors.Disabled.BackColor = clBlack
        EFColors.Disabled.TextColor = clWhite
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        InitDateTime = False
        MaxLength = 14
        Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 10
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
      object PENDIENTE_TRM: TOvcPictureField
        Left = 434
        Top = 84
        Width = 153
        Height = 30
        Cursor = crIBeam
        DataType = pftDouble
        CaretOvr.Shape = csBlock
        Color = clBlack
        ControlCharColor = clRed
        DecimalPlaces = 0
        EFColors.Disabled.BackColor = clBlack
        EFColors.Disabled.TextColor = clWhite
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Enabled = False
        Epoch = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        InitDateTime = False
        MaxLength = 14
        Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 11
        RangeHigh = {73B2DBB9838916F2FE43}
        RangeLow = {73B2DBB9838916F2FEC3}
      end
      object COR_TRM: TOvcDbPictureField
        Left = 149
        Top = 221
        Width = 150
        Height = 30
        DataField = 'COR_TRM'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        Color = clBlack
        EFColors.Disabled.BackColor = clBlack
        EFColors.Disabled.TextColor = clLime
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 7
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object TRANSF_TRM: TOvcDbPictureField
        Left = 149
        Top = 129
        Width = 150
        Height = 30
        DataField = 'TRANSF_TRM'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        Color = clBlack
        EFColors.Disabled.BackColor = clBlack
        EFColors.Disabled.TextColor = clLime
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 4
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object SISTEMA_CREDITO_TRM: TOvcDbPictureField
        Left = 149
        Top = 160
        Width = 150
        Height = 30
        DataField = 'SISTEMA_CREDITO_TRM'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        Color = clBlack
        EFColors.Disabled.BackColor = clBlack
        EFColors.Disabled.TextColor = clLime
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 14
        Options = [efoCaretToEnd, efoReadOnly, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '###,###,###.##'
        TabOrder = 5
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
    end
    object Pag03: TTabSheet
      Caption = 'INFORMACION DE CARTERA'
      ImageIndex = 3
      object Label16: TLabel
        Left = 10
        Top = 43
        Width = 124
        Height = 22
        Caption = 'Plazo de Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 10
        Top = 7
        Width = 187
        Height = 22
        Caption = 'Fecha del Documento'
        FocusControl = TDC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 10
        Top = 79
        Width = 189
        Height = 22
        Caption = 'Fecha de Vencimiento'
        FocusControl = TDC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object CAR_PLAZO: TOvcDbPictureField
        Left = 203
        Top = 41
        Width = 150
        Height = 30
        DataField = 'CAR_PLAZO'
        FieldType = ftFloat
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 8
        Options = [efoCaretToEnd, efoRightAlign, efoSoftValidation]
        ParentFont = False
        PictureMask = '#,###.##'
        TabOrder = 1
        OnChange = CAR_PLAZOChange
        RangeHigh = {E175587FED2AB1ECFE7F}
        RangeLow = {E175587FED2AB1ECFEFF}
      end
      object CAR_FECHAINI: TOvcDbPictureField
        Left = 203
        Top = 7
        Width = 150
        Height = 30
        DataField = 'CAR_FECHAINI'
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 10
        Options = [efoCaretToEnd, efoSoftValidation]
        ParentFont = False
        PictureMask = 'XXXXXXXXXX'
        TabOrder = 0
        OnChange = CAR_FECHAINIChange
        OnUserValidation = CAR_FECHAINIUserValidation
      end
      object CAR_FECHAFIN: TOvcDbPictureField
        Left = 203
        Top = 76
        Width = 150
        Height = 30
        DataField = 'CAR_FECHAFIN'
        CaretOvr.Shape = csBlock
        EFColors.Disabled.BackColor = clWindow
        EFColors.Disabled.TextColor = clGrayText
        EFColors.Error.BackColor = clRed
        EFColors.Error.TextColor = clBlack
        EFColors.Highlight.BackColor = clHighlight
        EFColors.Highlight.TextColor = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 10
        Options = [efoCaretToEnd, efoReadOnly, efoSoftValidation]
        ParentFont = False
        PictureMask = 'XXXXXXXXXX'
        TabOrder = 2
      end
    end
  end
  object pnlBotones: TPanel
    Left = 0
    Top = 478
    Width = 915
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BtnAceptar: TBitBtn
      Left = 1
      Top = 1
      Width = 150
      Height = 39
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
      Left = 764
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
