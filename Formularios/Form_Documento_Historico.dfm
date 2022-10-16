object FrDocumento_Historico: TFrDocumento_Historico
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrDocumento_Historico'
  ClientHeight = 167
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 16
  object TIPO_DOCUMENTO: TRadioGroup
    Left = 0
    Top = 0
    Width = 394
    Height = 73
    Align = alTop
    Caption = 'Tipo de Documento'
    Columns = 3
    Items.Strings = (
      'Pedido'
      'Compra'
      'Cotizaci'#243'n'
      'Factura'
      'Nota Cr'#233'dito'
      'Nota D'#233'bito')
    TabOrder = 0
  end
  object GBBusqueda: TGroupBox
    Left = 0
    Top = 73
    Width = 394
    Height = 48
    Align = alTop
    Caption = 'Busqueda de documento'
    TabOrder = 1
    object Label1: TLabel
      Left = 26
      Top = 19
      Width = 48
      Height = 16
      Caption = 'Datakey'
      FocusControl = DATAKEY
    end
    object BtnDatakey: TSpeedButton
      Left = 281
      Top = 18
      Width = 23
      Height = 23
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFE9E9E974777F40557E586680AFAFB0FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA8A8A953617B475F887E818AE9E9E957585C214688
        3465BE2954A221304EBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFBBBBBB2333512954
        A23465BE214588525458262D3B18366E284C8F2B4B8620365B656565AEADAEED
        EDEDEBEBEBAFAEAF69696A1D2F5025458030539326467E1D24327C7D7F213150
        34496F5967802E323C3B3A3C8A898B8180817A797B939294555456252B362234
        5646587B5D697D7A7B7CEAEAEB75757674767A50515316161729282A3C3B3D6B
        6A6C6261633D3C3E4140423433355F606377787D767677EBEBECFFFFFFBFBEBF
        7E7D7F3D3D3E2727283736383A393A8281828483843736383A393A3C3B3D7474
        76A8A7A9D3D2D4FFFFFFFFFFFFEDECEDA9A8AA5A595B3E3D3F46454736353754
        5353605E5E3837384645473E3D3F6E6D6FB9B8BAF0F0F0FFFFFFFFFFFFFFFFFF
        EDEDEDB2B2B3616062373637BFBFC0C1C1C1CBCBCBB8B8B8373638646466B9B9
        BAF1F0F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEA9A8AA5E5D5FF7F7F7FF
        FFFFFFFFFFF1F1F1616162B4B4B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = BtnDatakeyClick
    end
    object DATAKEY: TOvcPictureField
      Left = 93
      Top = 17
      Width = 182
      Height = 24
      Cursor = crIBeam
      DataType = pftString
      CaretOvr.Shape = csBlock
      ControlCharColor = clRed
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      Epoch = 0
      InitDateTime = False
      MaxLength = 20
      Options = [efoCaretToEnd, efoSoftValidation, efoTrimBlanks]
      PictureMask = '!!!!!!!!!!!!!!!!!!!!'
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 126
    Width = 394
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BtnGenerar: TSpeedButton
      Left = 1
      Top = 1
      Width = 137
      Height = 39
      Align = alLeft
      Caption = 'Generar'
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFCFC
        FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFD
        FDFDFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF6F6F6EAEAEAE2E2E2DDDDDDD8D8D8D4D4D4D0D0D0CECECEB6CAC0B3CA
        BEC8C8C8C7C7C7C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C7C7C7C9C9C9CACACACC
        CCCCCFCFCFD2D2D2D5D5D5D9D9D9DFDFDFE5E5E5EDEDEDFAFAFAFFFFFFFFFFFF
        FEFEFEE8E8E8D2D2D2C6C6C6C0C0C0BABABAB7B7B7B4B4B4B2B2B292B4A435C4
        7E7BB197AEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAFAFAFB0B0B0B1
        B1B1B3B3B3B5B5B5B8B8B8BCBCBCC1C1C1CACACAD7D7D7F2F2F2FFFFFFFFFFFF
        FFFFFFFEFEFEFDFDFDEBEBEBC9C9C9C4C5C5C3C4C4C2C3C3C2C2C2BDC1BF37C6
        8329C37A7EC3A2C0C1C0C0C1C1C0C1C1C0C1C1C0C1C1C0C1C1C0C1C1C1C1C1C1
        C2C2C2C3C3C3C4C4C4C4C4C4C5C5CECFCFF6F6F6FDFDFDFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFBFBFBC0C0C0BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC5DC7
        9627C67C27C67C5CC393B8BDBBBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
        BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCD0D0D0FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE9F0EDB8BEBC90C1AB6DC49D53C69241C78B36C88633C8852ECA
        8425C97F25C97F25C97F4AC68EADB9B4BCBCBCBEBEBEBEBEBEBEBEBEBEBEBEBE
        BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEC1C1C1FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEAFAF380DCB42BCA8424CB8124CB8124CB8124CB8124CB8124CB8124CB
        8124CB8124CB8124CB8124CB813ECC8DB0C7BDBDBDBDB6B6B6B3B4B4B8B9B9B9
        B9B9B9BABAB9BABABCBDBDBFC0C0BFC0C0C1C2C2FFFFFFFFFFFFFFFFFFFFFFFF
        C3F1DE31D08B22CD8322CD8322CD8322CD8322CD8322CD8322CD8322CD8324CE
        8523CD8422CD8322CD8322CD8322CD8338CF8EDADBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBC8C8C8C1C1C1C1C1C1C3C3C3FFFFFFFFFFFFFFFFFFD9F7EB
        2AD18B21CF8621CF8621CF8621CF8622CF8628D28C2CD38F2AD38E25D18921CF
        8621CF8621CF8621CF8621CF862AD28D4AD49BD4CDC5CFC3B8D5CDC5D5CDC5D5
        CDC5D5CDC5D5CFC8CFCFCFC2C3C3C2C3C3C4C5C5FFFFFFFFFFFFFFFFFF62DFAB
        20D18820D18820D18828D48F35D7985BD4A671CFAA78CDAB7BD3B077DCB433D3
        9320D18820D18821D18931D7976CD3A7D3DFDAE0E0E0D0C6BDE0E0E0E0E0E0E0
        E0E0E0E0E0D4CCC4D1D1D1C4C4C4C4C4C4C6C6C6FFFFFFFFFFFFEDFBF622D38B
        1FD28A1FD28A29D69360D2A6B6C8C1C6C7C7C6C7C7C6C7C7D8D8D8C9DBD021D2
        8A1FD28A27D5913FD599A1CFB1CDBFB1D8D2CCD8D2CCCCBEB1D8D2CCD8D2CCD8
        D2CCD8D2CCD3C9C0D3D3D3C6C6C6C6C7C7C8C9C9FFFFFFFFFFFFC2F3E01ED48C
        1ED48C1FD58D5CD9A9C7C8C8C8C8C8C8C8C8C8C8C8C8C8C8E2E2E27EDCB61ED4
        8C2EDA9A6FDEB0D9DECFE5DCD1D0C3B7DEDAD7DEDAD7CFC3B7DEDAD7DEDAD7DE
        DAD7DEDAD7D5CCC4D4D5D5C7C8C8C8C8C8CACACAFFFFFFFFFFFFBAF2DD1FD790
        1DD68E22D792B4E7D4C9C9C9C9C9C9C9C9C9C9C9C9CCCCCCE4E9E737DA9D3EDD
        A39ACEB0E5DCD3E5DCD3E5DCD3D1C4B8DFDCD8DFDCD8D0C4B8DFDCD8DFDCD8DF
        DCD8DFDCD8D6CDC5D6D6D6C9C9C9C9C9C9CBCBCBFFFFFFFFFFFFD6F8EB22D994
        1CD78F1CD790CBEEE0CACBCBCACBCBCACBCBCACBCBD5D6D6C5E5D86BDCADD6E4
        DDD7CDC2DED2C4DED2C4DED2C4CDBFB1DAD3CCDAD3CCCDBFB1DAD3CCDAD3CCDA
        D3CCDAD3CCD6CCC3D8D8D8CACACACACBCBCCCDCDFFFFFFFFFFFFFEFFFF43E0A7
        1BD8911BD891A9E6CFCCCCCCCCCCCCCCCCCCCCCCCCDFDFDFDDD6CFE3DAD0E8E7
        E6DAD1C8ECE6DFECE6DFECE6DFD6CBC1E8E8E8E8E8E8D5CBC1E8E8E8E8E8E8E8
        E8E8E8E8E8D9D1CAD9D9D9CBCBCBCCCCCCCECECEFFFFFFFFFFFFFFFFFFB7F3DD
        28DD9D1BD99253D9A6CDCDCDCDCDCDCDCDCDCCCDCDE8E8E8DAD0C6DCD0C2E5E3
        E0D7CCC2D8CABBD8CABBD8CABBCBBBABD6CCC2D6CCC2CBBBACD6CCC2D6CCC2D6
        CCC2D6CCC2D6CCC2DADADACCCDCDCDCDCDCFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        90EECC28DE9F41D7A0CECECECECECECECECED2D2D2EDEDEDDBD0C3EDE6DDEAE9
        E7DBD2C9ECE6DDECE6DDECE6DDD7CCC1EBEBEBEBEBEBD7CCC3EBEBEBEBEBEBEB
        EBEBEBEBEBDBD3CBDBDBDBCDCECECECECED0D0D0FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFADF2D954DCABCFCFCFCFCFCFCFCFCFDBDBDBEDEDEDDAD1C8DBD0C6E8E6
        E3D8CDC3D7CABCD7CABCD7CABCCBBBACD7CDC3D7CDC3CBBCACD7CDC3D7CDC3D7
        CDC3D7CDC3D7CDC3DCDCDCCFCFCFCFCFCFD1D1D1FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE2F3EDD0D0D0D0D0D0D0D0D0E3E3E3EDEDEDEDEDEDE5E1D8E8E7
        E3DCD3C9EDE6DDEDE6DDEDE6DDD8CDC2ECECECECECECD8CDC4ECECECECECECEC
        ECECECECECDCD4CCDDDDDDCFD0D0D0D0D0D1D1D1FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F4F3D1D1D1D1D1D1D0D1D1EBEBEBEDEDEDEDEDEDD6C095E3DB
        CDDBD2C9DCD0C4DCD0C4DCD0C4CEBFB1DCD4CCDCD4CCCEBFB2DCD4CCDCD4CCDC
        D4CCDCD4CCDAD2C9DDDDDDD0D0D0D1D1D1D2D2D2FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF4F4F4D2D2D2D2D2D2D6D6D6EDEDEDEDEDEDEDEDEDEBE7DFEBEA
        E6EDEDEDEDEDEDE3DED2DBD0B9E6E2D9E4E0D5DBD0B9E5E0D7E5E1D8DBD0B9E4
        DFD3EDEDEDEDEDEDDDDDDDD1D1D1D2D2D2D3D3D3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF4F4F4D2D3D3D2D3D3DBDBDBEFEFEFEEEEEEEDEDEDEDEDEDECEC
        ECEDEDEDEDEDEDD5C095BF9748DACBAAD7C5A0BF9748D9C8A5DACBAABF9748B9
        A783B4B4B4B3B3B3C0C0C0D2D2D2D2D3D3D3D4D4FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF4F4F4D3D3D3D3D3D3D3D3D3D7D7D7DFDFDFE7E7E7EDEDEDECEC
        ECEDEDEDEDEDEDEBE8E1EBE6D9EBE9E4EBE9E3EBE6D9EBE9E3ECE9E4EBE6D993
        918E707070818181CDCDCDD3D3D3D3D3D3D4D4D4FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF4F4F4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4E8E8
        E8EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED80
        8080767676CECECED4D4D4D4D4D4D4D4D4D5D5D5FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF5F5F5D6D6D6D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4E5E5
        E5EDEDEDEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE90
        9090CDCDCDD4D4D4D4D4D4D4D4D4D4D4D4D7D7D7FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF9F9F9DCDCDCD6D6D6D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D4D4
        D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4D4D5D5D5D5D5D5D5D5D5D5D5D5DADADADFDFDFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEBEBEBDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDEDFDFDFDEDEDEF5F5F5FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFCFCFCFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFCFCFCFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = BtnGenerarClick
      ExplicitLeft = 193
      ExplicitTop = -4
      ExplicitHeight = 37
    end
    object BtnSalir: TSpeedButton
      Left = 256
      Top = 1
      Width = 137
      Height = 39
      Align = alRight
      Caption = 'Salir'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFA2B8D6205BAC1947889E9E9EA2A2A2C8C8C8FAFAFAFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA8BDDA2059AA215DB0184583ADADADB0B0B0B4B4B4
        BCBCBCDEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDAE92B62AE215DB0225EB1184380BC
        BCBCC0C0C0C3C3C3C7C7C7CBCBCBD5D5D5F5F5F5FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4DFED2D62AD215DB0215D
        B02460B219437DCCCCCCD0D0D0D3D3D3D7D7D7DBDBDBDFDFDFE4E4E4F1F1F1FE
        FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF225FB225579E
        215EB1215EB1215EB12762B319427CBDBDBDC4C4C4CBCBCBD2D2D2DADADAE2E2
        E2ECECECF8F8F8225FB2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF2461B41C4E982462B52462B52462B52A67B71B437BC5C5C5CBCBCBD1D1D1
        D8D8D8DFDFDFE6E6E6EFEFEFF9F9F92461B4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF2664B71D519B2666B92666B92666B92E6CBB1C447BC5
        C5C5CBCBCBD1D1D1D8D8D8DFDFDFE6E6E6EFEFEFF9F9F92158A385CE85007300
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2766B91F549E296ABD296ABD296A
        BD3271C01B4176C5C5C5CBCBCBD1D1D1D8D8D8DFDFDFE6E6E6EFEFEFE8E9EA12
        7755009900007300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF54739C2158A1
        2B6EC12B6EC12B6EC13676C4465973C5C5C5CBCBCBD1D1D1D8D8D8DFDFDFE6E6
        E6EFEFEF78C37A00990066C76B007300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF7F7E7E225AA42D71C42D71C44A6D982F5D98586577C5C5C5CBCBCBD1D1D1
        D8D8D8DFDFDFE6E6E67CC57C0099005DC36262C5660073000073000073000073
        000073000073000073002B6CC0245DA72F74C82F74C85D738E427CC1768494C5
        C5C5CBCBCBD1D1D1D8D8D8DFDFDF78C27800990052BD5542B8465DC36262C566
        66C76B6AC9706FCB7473CE7977D07E0073002C6EC1265FAA3177CB3177CB3177
        CB4182CF416189C5C5C5CBCBCBD1D1D1D8D8D874BE7400990049B94C2DAF302A
        AE2E2FB13435B43A3BB64040B94645BC4C53C25A73CE790073002D6FC32761AC
        337ACD337ACD337ACD4486D2234B7FC5C5C5CBCBCBD1D1D170B97000990080CD
        815EC16030AF3325AC282AAE2E2FB13435B43A3BB64040B9464EBF556FCB7400
        73002E71C52863AE347CD0347CD0347CD0478AD5244C80C5C5C5CBCBCBD1D1D1
        D8D8D874BE740099007CCC7D64C36655BD574EBB514EBC5150BE5554BF595DC3
        616DCA7272CC770073002F72C62964B0367ED2367ED2367ED24A8DD7254D81C5
        C5C5CBCBCBD1D1D1D8D8D8DFDFDF78C2780099007BCC7D6CC66D7ECD807FCE82
        80CF8382D08583D18786D2896FCA730073002F73C72A66B23780D43780D43780
        D44D90DA264E82C5C5C5CBCBCBD1D1D1D8D8D8DFDFDFE6E6E67CC57C0099007E
        CC7F7FCD800099000099000099000099000099000099000073003074C82B68B3
        3882D63882D63882D65093DC274F82C5C5C5CBCBCBD1D1D1D8D8D8DFDFDFE6E6
        E6EFEFEF82CB820099007FCD7F007300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF587AA32C69B43984D73984D73984D777B1E8295285C5C5C5CBCBCBD1D1D1
        D8D8D8DFDFDFE6E6E6EFEFEFF9F9F91A8769009900007300FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF7F7E7E2C6AB63A85D93F88DA6CA9E65FA0E0639BD1C5
        C5C5CBCBCBD1D1D1D8D8D8DFDFDFE6E6E6EFEFEFF9F9F93176CA85CE85007300
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3176CA2C6BB73E88DA73AEE75195
        D8749FC9BEBEBEC5C5C5CBCBCBD1D1D1D8D8D8DFDFDFE6E6E6EFEFEFF9F9F931
        76CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3277CB3674BC
        64A4E24D91D28BA5BDB8B8B8BEBEBEC5C5C5CBCBCBD1D1D1D8D8D8DFDFDFE6E6
        E6EFEFEFF9F9F93277CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF3277CB4B8BCC528EC79AA6B2B2B2B2B8B8B8BEBEBEC5C5C5CBCBCBD1D1D1
        D8D8D8DFDFDFE6E6E6EFEFEFF9F9F93277CBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF3277CB3277CB3277CB3277CB3277CB3277CB3277CB32
        77CB3277CB3277CB3277CB3277CB3277CB3277CB3277CB3277CBFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = BtnSalirClick
      ExplicitLeft = 257
      ExplicitTop = -23
    end
  end
end