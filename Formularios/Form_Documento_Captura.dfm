object FrDocumento_Captura: TFrDocumento_Captura
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'FrDocumento_Captura'
  ClientHeight = 653
  ClientWidth = 1188
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  TextHeight = 16
  object pnlBarcode: TPanel
    Left = 0
    Top = 255
    Width = 1188
    Height = 28
    Align = alTop
    TabOrder = 0
    object Label12: TLabel
      Left = 1
      Top = 1
      Width = 168
      Height = 26
      Align = alLeft
      AutoSize = False
      Caption = '   C'#243'digo de Barras   '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object BARCODE: TEdit
      Left = 169
      Top = 1
      Width = 564
      Height = 26
      Align = alLeft
      TabOrder = 0
      OnKeyDown = BARCODEKeyDown
      ExplicitHeight = 24
    end
  end
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 1188
    Height = 228
    Align = alTop
    TabOrder = 1
    object pnlBotones: TPanel
      Left = 1
      Top = 48
      Width = 1186
      Height = 179
      Align = alBottom
      BevelInner = bvLowered
      BevelKind = bkFlat
      TabOrder = 0
      object BtnAdmin: TSpeedButton
        Tag = 3006
        Left = 796
        Top = 132
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Hint = 'Ambiente no en modo admin'
        HelpContext = 3006
        Caption = 'No admin'
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFDFEFF
          FBFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFBFBFBFDFEFFFFFFFFFFFFFFFEFEFEFDFDFDFCFCFCFBFBFBFB
          FBFAFDFDFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFFFFFFFF
          FFFFFFDBE7FDAAD0F98EC4F873B6F669B2F66AB2F56EB4F57EBBF797C9F9B1D1
          F4C9CCDBF5F5F7FFFFFFFFFFFFFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEEDFD
          5CAAF41F8DF10D8AF20E8EF30E91F40F93F51094F40E93F40E90F20E94F90B7A
          DE0C135628276288A2CDE1F1FFFFFFFFFFFFFFFAFAFAE0DFDCBDB6B0A9A19BAE
          A6A1D2CECBF9F9F9FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFCFE6FB409BF2
          0C8AF10F95F5149FF716A4F817A7F918A8FA17A9FA18A9FA16A6F816ACFF0F88
          DE0108480900390A61BC209AFD7DB8F0F7F8FA8A786D4925163E2D2033211434
          21134C392A7C7066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89BEF61C8DF1
          1196F513A0F813A8FB13ABFC13ADFC13AEFD14AFFB14AFFB14ACFA16B6FE0F90
          DD040A421008391274C111A1FE0D88EF46A6FEA5B5C8658E8C241D19180E0820
          1814574D479B9592F0F1F3EFEDECFFFFFFFFFFFFFFFFFFFFFFFF93C3F72294F2
          0F9DF714A6F913ACFB16B2FA14B1F914B1F912B0F914B0F912AEF714B8FF0D94
          DC03063912123D1293D714AAFE1799F40D8DF561AFF5A3D7DD39312E1F130B2F
          1E125F4A3777593E48290E311F12FDFDFDFDFDFDFFFFFFFFFFFFA0C5F7299BF3
          0FA9F714AEF714AFF914B0FA14AFFC14AFFD14AFFD14B0FE14ADFB16B7FF0D95
          E006043016295112ADF213AEF914A1F20B9EFE297FB8A24200A6641DB86E1FC2
          7520C3751FD8811FD57E1D311F12FFFFFFFEFEFEFFFFFFFFFFFFC7E3FB3BA5F4
          0FB1F514AFFA13ABFD14AFFE14AFFD14B0FE14B0FD14B0FD13ADFB13B3FE0E9C
          E5080530174F7F13B9FF13AAF915A2F504A4FE4296BDDF831ED38125D37E20D1
          7E22CE7D22D98323D57E1D311F12B9B3AEF8F6F5FDFCFCFFFFFFFDFFFF5DB2F5
          10B4F716B8F913AAFB14AEFD14AFFC13AFFE12AEFD13AFFD11A8F81DC8FD0E98
          E402092C0F73A713BAFE13AAF914A0F601A9FE4B93A9D57614C77C23CB791FCC
          7C21CA7B20D58021D57E1D311F12544032E2DFDEFFFFFFFDFDFDFFFFFF9BC7F8
          0DB0F515C4F912A8FA15AEFC15B1FD14AEFD13B0FD12A9FB15ABF21AC6FE0F7A
          B906000D11608D16C1FF11A6F8159DF401B1FF668C8DDB770FC87C24CD7A1ECC
          7A1FCA771BD68121D57E1E311F12311F12311F12311F12FFFFFFFEFFFFEFFAFE
          2FAFF40ECFF917B4F913A6FA15AFFC13AFFC13AEFD14AAF415AFF50EB0FF0DA5
          E50D2A4D1791BE15BBFE10A1F7129CF302B3FC937D58D87912C97D26CE7E26D0
          8530D08938DF9946DE9039311F128A5926804D174A3629FFFFFFFAFDFFFFFFFF
          BBD1F912AFF40ED4FA14A2F812A5FA13AEFD13A9F815AEF10AA8F7168FE12A80
          D4286EBF139EED11ACFB1697F204A5FF29A9DAD38A44D59344D49349D5954BD6
          954CD49348E19947DE9038311F12E68A23D17D21311F12FEFEFEFFFFFFFEFEFF
          FFFFFFAEE2FB1EBFF60DC6F9159AF614A4FA14A2F009A5EF207FD14C78CB5789
          DC517AD2267CCC09A0FB008DFE069EEBB29C72ECA04CDD9D52DC9748DA9444D8
          9040D38B3ADF913ADE9038311F12D98323C2751E311F12FDFDFDFFFFFFFFFFFF
          FDFFFFFFFFFFD4ECFD52D0F80FB3F6138BF00993E91883D3507BCF5B97F05592
          EC4574CC2670C4198BE15B94BC555043955F25B87E3BB57934BC7D36BA7B34BF
          7D32C27C2FD3852ED2842D311F12DB8322C5741B311F12FBFBFBFFFFFFFFFFFF
          FFFFFFFDFFFFFFFFFFFEFFFF91DAFF1A99F80383DA4278C7538AE8437DE03667
          CA3667D2386EDA6379B3D08E4EC87D2B311F12311F12311F12311F12311F1231
          1F12311F12311F12311F12311F12D98528CB812D311F12FAFAFAFFFFFFFFFFFF
          FFFFFFFFFFFFFDFFFFFFFFFFFFFFFFF5E6F24F90D04A79CE3E76D72E5FC73B74
          E23A7AEC3273E7226AEF2D66D8CA9258CD842F9D928D311F12F0A852E28926D2
          8229D3832BCF8533CE8839D59142D79649D59447311F12F8F8F8FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFAFBFDFFFFFFCFDAED3769BF3061C53A78E6357B
          EA3579E63E7FE9457FE62B72F85F74B6B26A138C7F77311F12F0A852E2A155D4
          9851D6974FD6984ED7954BD39246D39041D18B3A311F12F7F7F7FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFCFDFEE6ECF53E65B8336FDF3981EC3C7E
          E8508CEF5890F25C90F15386F04375EB6C646DAFA9A6311F12F0A852F0A852E0
          9C4CE19947E29A45E29743DF9441E0953EDF9036311F12F7F7F9FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFE0E7F84A75D8357CEB3F82E9538D
          F0689BF477A6F67CA7F5749FF35985F0BCCFFDFFFFFF311F124C3724311F1231
          1F12311F12311F12311F12311F12311F12311F123D2818F3F4F6FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFFFFFFFFE5EBFB5E86EE356FE83273E54987ED6598
          F37FABF693B9F79CBDF792B5F56F96F0ACC0F4FFFFFFF9FAFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFFFFFFFF8DA7F03D71EB3270E63578E95089EE72A0
          F592B9F7AAC7F8B9D0F9B1C9F785A6F2ABC0F6FFFFFFFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFFFFFFFFE0E2F23C62D8457BF23470E3285BD84E83EF77A2
          F49CBEF8BBD2FAD0DFFACCDBF8A6BEF5B4C7F7FFFFFFFDFEFFFDFDFDFDFDFDFD
          FDFDFDFCFCFDFCFCFDFCFCFDFDFCFDFDFCFDFDFCFEFDFDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFDFDFEFFFFFF9EABDF1D45C64073E91C44C21B46C84B81F1729D
          F398BAF6BBD1F9D9E4FAE0E8F9B2C7F5B2C6F6FFFFFFFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFFFFFFFF5770CB0F32B41437B60C2CB0265FDC447BEE6491
          F28AB1F5AEC9F8C3D7F9C4D6F79FB9F4B8CBF8FFFFFFFDFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF9F9FC304EC00F31B41032B40724AD2158D83D7EEE598F
          EF7AA8F492B7F59CBCF7A0BDF688ABF4758EE2F4F6FDFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFBFBFD3453C2133CBC1235B90118A30D2FB63174EA498A
          F6568EF65F8FF3608CEF608AED6592F6112AB2BFBFDFFFFFFFFCFCFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFFFFFFFF6B7FCE0C29A51737B003149001037E061893112B
          A610249E0A17930815900A1B96102BAA041593C8C9E4FFFFFFFDFDFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFFFFFFFFCED6F1112EAE091F9B0D2099091B9404067B0406
          7D05138C0D239E1032AE1238B52D4DBAA8B2DCFAFBFDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFFFFFFFFA4B2E51C3EBC113FC21749CA153BB71131
          AB1133AD1033B11C3EBA748AD7E6EAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFD5DCF38096DD5475D34970D35479
          D56A88D89AAAE1DBE0F3FFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFBFEF8FAFDFCFDFEFFFFFFFDFE
          FFFBFBFEF9FAFDFAFBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnAdminClick
      end
      object BTNPROPINA: TSpeedButton
        Tag = 3006
        Left = 908
        Top = 132
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Hint = 'Aplicacion de la propina'
        HelpContext = 3006
        Caption = '$ Propina $'
        ParentShowHint = False
        ShowHint = True
        OnClick = BTNPROPINAClick
      end
      object BtnComanda: TPanel
        Left = 10
        Top = 5
        Width = 190
        Height = 40
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvSpace
        Color = clInfoBk
        ParentBackground = False
        TabOrder = 0
        OnClick = BtnComandaClick
        object LbComanda: TLabel
          Left = 2
          Top = 2
          Width = 142
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          Caption = '<F1>  COMANDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          OnClick = BtnComandaClick
          ExplicitWidth = 93
          ExplicitHeight = 15
        end
        object BtnSettingComanda: TSpeedButton
          Left = 144
          Top = 2
          Width = 40
          Height = 32
          Hint = 'Configurar generaci'#243'n de comandas'
          Align = alRight
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAEAEAEAE9E9E9E9E9
            E9EAEAEAFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5B3B0
            8D81698C81688A7F67776F5BB9B8B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF99958A9083688F82667A7058746A5495928AFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF9F9F98E85748F82667A6F58746A54746A547E786BFA
            FAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFC6C5C4BDBCBAEDEDEDF9F9F9DFDFDF938F868F82687C7159746A54746A
            54746A54746A548D8A83E2E1E1F9F9F9ECECECB8B7B6C8C8C7FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFEBEAEA8D836C9083688B826D8C877B8D826B9083687E735C
            867D688F85708E8470857C66766C56746A54756D5A7F7B71756D5C746A547770
            5FEFEFEFFFFFFFFFFFFFFFFFFFFEFEFE98948C91846891846891846891846891
            8468ACA492C1BAABB0A692B0A692B0A692B0A692ABA18D8D836D746A54746A54
            746A54746A54746A5495938DFEFEFEFFFFFFFFFFFFD2D2D19083699184689083
            68908368918468C1BAABDDD9D1DBD6CDA39985968C77968C78A29883AFA591B0
            A692978D7A756B55746A54746A54746A54746B56D8D8D8FFFFFFFFFFFFC2BFB7
            908368918468908368908368B2A996DDD9D1D4D0C78C8471746A54746A54746A
            54746A54837A65ABA18DAFA5918B816D746A54746A54746A54756B55C2C0BAFF
            FFFFFFFFFFFFFFFFC6C0B391846991846893866BD8D3C9DDD9D18E8572746A54
            A4A576D2DE97D1DD96A0A174746A54857B66AFA591A99F8B746A54746A54756B
            55BFBAB1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B3A7908368A59B84DEDAD2C7
            C1B6746A54A2A475ECFEAAECFFAAEBFEA9EBFEA99D9C72746A54A59B87AFA591
            817761746A54B4B1A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C4C19184
            68B0A793DEDAD2B4ADA0746A54CFDB95ECFFAAECFFAAECFFAAECFFAAC9D39174
            6A549A907BB0A6928A806A746A54CCCBCAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFC3C2C0908368B0A793DEDAD2B4AEA0746A54CEDA94EBFEA9ECFFAAEBFE
            A9EBFEA9C8D290746A54B8BC88DDE9A4999770746A54CBCAC8FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF8F8F8969289908368A49A83DEDAD2C8C3B8756B559F9F73
            EBFEA9ECFFAAEBFEA9EBFEA9999870746A54D9E79CEBFEA98D89667D725B9A96
            8EF9F9F9FFFFFFFFFFFFFFFFFFF4F4F494908790836890836892856BD7D2C8DD
            D9D1918877746A549E9E73CCD793CBD6929B9A71746A549A996FEBFEA9DDEC9F
            7E745B90836890836897938BF7F7F7FFFFFFFFFFFFB4B1AB9184689184689184
            68918468B0A692DEDAD2D6D2C9918976746A54746A54746A54746A5498976EE5
            F7A5EBFEA9A9A87A908367918468918468918468BBB9B3FFFFFFFFFFFFEAE9E7
            94886D918468908368908368918468BFB7A7DDD9D1E3E8C2D4E199BEC589BEC6
            89D6E39AEBFEA9EBFEAAC2C68B908368918468908368908368978A70EFEEECFF
            FFFFFFFFFFFFFFFFC4BEB1918468908368908368918468918469B0A791E2F1A6
            EBFEA9ECFFAAEBFEA9EBFEA9E2F1A2B2B1809184699083689184689083689083
            68C9C4B8FFFFFFFFFFFFFFFFFFFFFFFFF9F9F89E947C918469A79C86C0B9A99F
            947B918468928669A7A279B5B582B5B582A7A178928569918468A1957EC0B9A9
            A59A83918469A29881FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E6E4E8E7
            E5FFFFFFFFFFFFF9F9F9C6C0B4918468908368918468908368908368928569CA
            C5B9FBFBFBFFFFFFFFFFFFE6E5E2EAE9E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99907D9083689184689083
            689083689E9684FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A297
            918468918468918468918468AEA99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFCFCCC79E937A9F937B9E937A9E937BD5D3CEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnSettingComandaClick
        end
      end
      object BtnAddDet: TPanel
        Left = 10
        Top = 46
        Width = 190
        Height = 40
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvSpace
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        OnClick = BtnAddDetClick
        object lbAddDet: TLabel
          Left = 2
          Top = 2
          Width = 182
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          Caption = '<F2> INSERTAR DETALLE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          OnClick = BtnAddDetClick
          ExplicitWidth = 145
          ExplicitHeight = 15
        end
      end
      object BtnEditEnc: TPanel
        Left = 10
        Top = 89
        Width = 190
        Height = 40
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvSpace
        Color = clNavy
        ParentBackground = False
        TabOrder = 2
        OnClick = BtnEditEncClick
        object lbEditEnc: TLabel
          Left = 2
          Top = 2
          Width = 182
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          Caption = '<F3> EDITAR ENCABEZADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          OnClick = BtnEditEncClick
          ExplicitWidth = 157
          ExplicitHeight = 15
        end
      end
      object BtnEditDet: TPanel
        Left = 10
        Top = 131
        Width = 190
        Height = 41
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvSpace
        Color = clFuchsia
        ParentBackground = False
        TabOrder = 3
        OnClick = BtnEditDetClick
        object lbEditDet: TLabel
          Left = 2
          Top = 2
          Width = 182
          Height = 33
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          Caption = '<F4>  EDITAR DETALLE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          OnClick = BtnEditDetClick
          ExplicitWidth = 131
          ExplicitHeight = 15
        end
      end
      object BtnDelDet: TPanel
        Left = 203
        Top = 5
        Width = 190
        Height = 40
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvSpace
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
        OnClick = BtnDelDetClick
        object LbDelDet: TLabel
          Left = 2
          Top = 2
          Width = 182
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          Caption = '<F5> ELIMINAR DETALLE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          OnClick = BtnDelDetClick
          ExplicitWidth = 141
          ExplicitHeight = 15
        end
      end
      object BtnPreviewDoc: TPanel
        Left = 203
        Top = 47
        Width = 190
        Height = 40
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvSpace
        Color = clOlive
        ParentBackground = False
        TabOrder = 6
        OnClick = BtnPreviewDocClick
        object lbPreviewDoc: TLabel
          Left = 2
          Top = 2
          Width = 182
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          Caption = '<F6> VISUALIZAR DOCUMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          OnClick = BtnPreviewDocClick
          ExplicitWidth = 179
          ExplicitHeight = 15
        end
      end
      object BtnEditarDetalle: TPanel
        Left = 203
        Top = 89
        Width = 190
        Height = 40
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvSpace
        Color = clTeal
        ParentBackground = False
        TabOrder = 5
        OnClick = BtnEditarDetalleClick
        object lbEditarDetalle: TLabel
          Left = 2
          Top = 2
          Width = 182
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          Caption = '<F7>  EDITAR OBSERVACION DETALLE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          OnClick = BtnEditarDetalleClick
          ExplicitWidth = 167
          ExplicitHeight = 30
        end
      end
      object BtnInsertarTercero: TPanel
        Left = 203
        Top = 131
        Width = 190
        Height = 40
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvSpace
        Color = clLime
        ParentBackground = False
        TabOrder = 7
        OnClick = BtnInsertarTerceroClick
        object lbInsertarTercero: TLabel
          Left = 2
          Top = 2
          Width = 182
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          Caption = '<F8> INGRESAR TERCERO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          OnClick = BtnInsertarTerceroClick
          ExplicitWidth = 155
          ExplicitHeight = 15
        end
      end
      object BtnAcarreo: TPanel
        Left = 403
        Top = 5
        Width = 190
        Height = 40
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvSpace
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 8
        OnClick = BtnAcarreoClick
        object lbAcarreo: TLabel
          Left = 2
          Top = 2
          Width = 182
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          Caption = '<F9> ACARREO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          OnClick = BtnAcarreoClick
          ExplicitWidth = 88
          ExplicitHeight = 15
        end
      end
      object BtnAjustarReceta: TPanel
        Left = 403
        Top = 47
        Width = 190
        Height = 40
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvSpace
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 9
        OnClick = BtnAjustarRecetaClick
        object lbAjustarReceta: TLabel
          Left = 2
          Top = 2
          Width = 182
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          Caption = '<F10> AJUSTAR RECETA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          OnClick = BtnAjustarRecetaClick
          ExplicitWidth = 139
          ExplicitHeight = 15
        end
      end
      object BtnCancelDoc: TPanel
        Left = 403
        Top = 89
        Width = 190
        Height = 40
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvSpace
        Color = clMaroon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 10
        OnClick = BtnCancelDocClick
        object lbCancelDoc: TLabel
          Left = 2
          Top = 2
          Width = 182
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          Caption = '<F11> CANCELAR DOCUMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          OnClick = BtnCancelDocClick
          ExplicitWidth = 105
          ExplicitHeight = 30
        end
      end
      object BtnCerrarDoc: TPanel
        Left = 403
        Top = 131
        Width = 190
        Height = 40
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvSpace
        Color = clPurple
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 11
        OnClick = BtnCerrarDocClick
        object lbCerrarDoc: TLabel
          Left = 2
          Top = 2
          Width = 182
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          Caption = '<F12>  CERRAR DOCUMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          OnClick = BtnCerrarDocClick
          ExplicitWidth = 173
          ExplicitHeight = 15
        end
      end
      object BtnFormaPago: TPanel
        Left = 600
        Top = 5
        Width = 190
        Height = 40
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvSpace
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 12
        OnClick = BtnFormaPagoClick
        object lbFormaPago: TLabel
          Left = 2
          Top = 2
          Width = 182
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          Caption = '<ALT+F> FORMA PAGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          OnClick = BtnFormaPagoClick
          ExplicitWidth = 126
          ExplicitHeight = 15
        end
      end
      object BtnAbrirCajon: TPanel
        Left = 600
        Top = 47
        Width = 190
        Height = 40
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvSpace
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 13
        OnClick = BtnAbrirCajonClick
        object lbAbrirCajon: TLabel
          Left = 2
          Top = 2
          Width = 182
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          Caption = '< ALT+C> ABRIR CAJON'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          OnClick = BtnAbrirCajonClick
          ExplicitWidth = 133
          ExplicitHeight = 15
        end
      end
      object BtnSalir: TPanel
        Left = 600
        Top = 131
        Width = 190
        Height = 40
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvSpace
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 14
        OnClick = BtnSalirClick
        object lbSalir: TLabel
          Left = 2
          Top = 2
          Width = 182
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          Caption = '    < ESCAPE >     SALIR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          OnClick = BtnSalirClick
          ExplicitWidth = 129
          ExplicitHeight = 15
        end
      end
      object INFO_COMANDA: TDBMemo
        Left = 796
        Top = 6
        Width = 333
        Height = 123
        DataField = 'INFO_COMANDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 15
        WordWrap = False
      end
      object BtnDomicilio: TPanel
        Left = 600
        Top = 89
        Width = 190
        Height = 40
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvSpace
        Color = clMenuHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 16
        OnClick = BtnDomicilioClick
        object lbDomicilio: TLabel
          Left = 2
          Top = 2
          Width = 182
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          Caption = '< ALT+D> DOMICILIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
          OnClick = BtnDomicilioClick
          ExplicitWidth = 116
          ExplicitHeight = 15
        end
      end
    end
    object pnlResume: TPanel
      Left = 1
      Top = 1
      Width = 1186
      Height = 47
      Align = alClient
      TabOrder = 1
      object pnlTotales: TPanel
        Left = 665
        Top = 1
        Width = 520
        Height = 45
        Align = alRight
        Color = clBlack
        ParentBackground = False
        TabOrder = 0
        object lbTOTAL: TLCDLabel
          Left = 4
          Top = 4
          Width = 371
          Height = 38
          Caption = '$ 999,999,999.99'
          DotMatrix = mat5x8
          PixelSize = pix2x2
          PixelSpacing = 2
          PixelWidth = 2
          PixelHeight = 2
          CharSpacing = 5
          LineSpacing = 2
          BorderSpace = 3
          TextLines = 1
          NoOfChars = 16
          BackGround = clBlack
          BorderStyle = frNone
          PixelOn = clLime
          PixelOff = clBlack
        end
      end
      object pnlDocumento: TPanel
        Left = 1
        Top = 1
        Width = 664
        Height = 45
        Align = alClient
        BevelInner = bvLowered
        BevelKind = bkSoft
        Caption = '---'
        TabOrder = 1
        object lbDocumento: TLabel
          Left = 2
          Top = 2
          Width = 656
          Height = 37
          Align = alClient
          Alignment = taCenter
          Caption = 'lbDocumento'
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 76
          ExplicitHeight = 16
        end
      end
    end
  end
  object pnlDetalles: TPanel
    Left = 0
    Top = 283
    Width = 1188
    Height = 370
    Align = alClient
    Caption = 'pnlDetalles'
    TabOrder = 2
    object pnlItems: TPanel
      Left = 1
      Top = 1
      Width = 1186
      Height = 207
      Align = alTop
      Caption = 'pnlItems'
      TabOrder = 0
      object Paginas: TPageControl
        Left = 1
        Top = 1
        Width = 1184
        Height = 205
        ActivePage = Pag02
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpRight
        object Pag00: TTabSheet
          Caption = 'Productos'
          ImageIndex = 2
          object BACK: TImage
            Left = 123
            Top = 40
            Width = 62
            Height = 65
            Center = True
            Picture.Data = {
              07544269746D617042400000424D424000000000000042000000280000004000
              000040000000010020000300000000400000C40E0000C40E0000000000000000
              00000000FF0000FF0000FF000000FF00000000FF00000000FF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000004E4E4E034040
              40083D3D3D0B3D3D3D0C3D3D3D0C3D3D3D0C3D3D3D0C3D3D3D0C3D3D3D0C3D3D
              3D0C3D3D3D0C3D3D3D0C3D3D3D0C3D3D3D0C3D3D3D0C3D3D3D0C3D3D3D0C3D3D
              3D0C3D3D3D0C3D3D3D0C3D3D3D0C3D3D3D0C3D3D3D0C3D3D3D0C3D3D3D0C3D3D
              3D0C3D3D3D0C3D3D3D0C3D3D3D0C3D3D3D0B3E3E3E0947474704000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000414141155A5A5A66757575AD767676D97878
              78F5757575FE757575FF757575FF757575FF757575FF757575FF757575FF7575
              75FF757575FF757575FF757575FF757575FF757575FF757575FF757575FF7575
              75FF757575FF757575FF757575FF757575FF757575FF757575FF757575FF7575
              75FF757575FF757575FF757575FF757575FF767676F9767676E2747474BA6060
              607A404040264C4C4C0100000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000414141186E6E6E93797979F3414141FF0F0F0FFF0A0A0AFF0B0B
              0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B
              0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B
              0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B
              0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0A0A0AFF0B0B0BFF3131
              31FF6D6D6DFC737373B240404030000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000004F4F
              4F0151515156818181EB2B2B2BFF0A0A0AFF0B0B0BFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0B0B
              0BFF0B0B0BFF1A1A1AFF6F6F6FF95F5F5F834040400500000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000004D4D4D026464
              647F666666FD0C0C0CFF0B0B0BFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0A0A0AFF434343FF727272B33F3F3F0C000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000505050016464647C5858
              58FE0A0A0AFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0B0B0BFF343434FF737373B63F3F3F070000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000005050504F6A6A6AFC0A0A
              0AFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0B0B0BFF3F3F3FFF6161618B0000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000044444412858585E50D0D0DFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0B0B0BFF686868FB4040
              403B000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000006D6D6D84333333FF0B0B0BFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0B0B0BFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF141414FF7676
              76C1444444020000000000000000000000000000000000000000000000000000
              00000000000000000000000000004545450B818181EA0A0A0AFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0B0B0BFF0A0A
              0AFF606060FD656565FA0B0B0BFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0B0B0BFF6060
              60FE404040370000000000000000000000000000000000000000000000000000
              00000000000000000000000000005B5B5B504D4D4DFF0B0B0BFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0B0B0BFF0A0A0AFF7070
              70FB5252526D7D7D7DE50B0B0BFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF2121
              21FF676767900000000000000000000000000000000000000000000000000000
              000000000000000000000000000078787895191919FF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0B0B0BFF0D0D0DFF777777F75858
              58593A3A3A057C7C7CE40A0A0AFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0A0A
              0AFF717171D24646460200000000000000000000000000000000000000000000
              000000000000000000005F5F5F017D7D7DC30A0A0AFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0B0B0BFF0E0E0EFF7D7D7DF34F4F4F4B0000
              0000414141047B7B7BE40A0A0AFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0A0A
              0AFF717171F83737370B00000000000000000000000000000000000000000000
              000000000000000000004F4F4F037D7D7DDD0A0A0AFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0B0B0BFF131313FF838383ED4A4A4A3E000000000000
              0000414141047B7B7BE40A0A0AFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0B0B
              0BFF646464FF3A3A3A2200000000000000000000000000000000000000000000
              0000000000000000000042424204797979E50B0B0BFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0B0B0BFF171717FF838383E64545453200000000000000000000
              00003E3E3E047A7A7AE40B0B0BFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
              0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0B0B
              0BFF5F5F5FFF3232322B00000000000000000000000000000000000000000000
              000000000000000000003F3F3F04787878E60B0B0BFF0D0D0DFF0D0D0DFF0D0D
              0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D
              0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D
              0DFF0B0B0BFF1D1D1DFF858585DD464646280000000000000000000000000000
              00003E3E3E04797979E40B0B0BFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D
              0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D
              0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0C0C
              0CFF5E5E5EFF3131312B00000000000000000000000000000000000000000000
              000000000000000000003E3E3E04787878E60B0B0BFF0E0E0EFF0E0E0EFF0E0E
              0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E
              0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0D0D0DFF0C0C
              0CFF242424FF848484D44141411E000000000000000000000000000000000000
              000041414104797979E40B0B0BFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D
              0DFF0D0D0DFF0D0D0DFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E
              0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0C0C
              0CFF5E5E5EFF3131312B00000000000000000000000000000000000000000000
              000000000000000000003D3D3D04787878E60C0C0CFF0E0E0EFF0E0E0EFF0E0E
              0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E
              0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0C0C0CFF2A2A
              2AFF828282C83F3F3F1600000000000000000000000000000000000000000000
              000043434304787878E4090909FF0A0A0AFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B
              0BFF0B0B0BFF0B0B0BFF0C0C0CFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E
              0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0D0D
              0DFF5E5E5EFF3131312B00000000000000000000000000000000000000000000
              000000000000000000003D3D3D04777777E60C0C0CFF0F0F0FFF0F0F0FFF0F0F
              0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F
              0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0C0C0CFF343434FF8181
              81BC4242420F0000000000000000000000000000000000000000000000000000
              00004D4D4D037B7B7BB37A7A7ACA7B7B7BCA7B7B7BCA7B7B7BCA7B7B7BCA7B7B
              7BCA7B7B7BCA7B7B7BCA868686DA2E2E2EFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F
              0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0D0D
              0DFF5D5D5DFF3030302B00000000000000000000000000000000000000000000
              000000000000000000003D3D3D04777777E60D0D0DFF101010FF101010FF1010
              10FF101010FF101010FF101010FF101010FF101010FF101010FF101010FF1010
              10FF101010FF101010FF101010FF0F0F0FFF0D0D0DFF3B3B3BFF7A7A7AAE4040
              400A000000000000000000000000000000000000000000000000000000000000
              0000000000005B5B5B0158585801575757015151510151515101515151015151
              51014F4F4F01575757015D5D5D54454545FF0F0F0FFF101010FF101010FF1010
              10FF101010FF101010FF101010FF101010FF101010FF101010FF101010FF0E0E
              0EFF5D5D5DFF3030302B00000000000000000000000000000000000000000000
              000000000000000000003D3D3D04767676E60E0E0EFF101010FF101010FF1010
              10FF101010FF101010FF101010FF101010FF101010FF101010FF101010FF1010
              10FF101010FF101010FF101010FF0D0D0DFF464646FF7373739F414141060000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000063636354454545FF0F0F0FFF101010FF101010FF1010
              10FF101010FF101010FF101010FF101010FF101010FF101010FF101010FF0F0F
              0FFF5D5D5DFF3030302B00000000000000000000000000000000000000000000
              000000000000000000003D3D3D04767676E60E0E0EFF111111FF111111FF1111
              11FF111111FF111111FF111111FF111111FF111111FF111111FF111111FF1111
              11FF111111FF101010FF0E0E0EFF505050FE6E6E6E8F40404003000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000061616154454545FF101010FF111111FF111111FF1111
              11FF111111FF111111FF111111FF111111FF111111FF111111FF111111FF1010
              10FF5D5D5DFF3030302B00000000000000000000000000000000000000000000
              000000000000000000003D3D3D04767676E60F0F0FFF121212FF121212FF1212
              12FF121212FF121212FF121212FF121212FF121212FF121212FF121212FF1212
              12FF111111FF0E0E0EFF5B5B5BFE6363637E4646460200000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000061616154454545FF111111FF121212FF121212FF1212
              12FF121212FF121212FF121212FF121212FF121212FF121212FF121212FF1010
              10FF5D5D5DFF3030302B00000000000000000000000000000000000000000000
              000000000000000000003D3D3D04757575E6101010FF131313FF131313FF1313
              13FF131313FF131313FF131313FF131313FF131313FF131313FF131313FF1212
              12FF0F0F0FFF676767FC5A5A5A6E484848010000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000061616154454545FF121212FF131313FF131313FF1313
              13FF131313FF131313FF131313FF131313FF131313FF131313FF131313FF1111
              11FF5C5C5CFF3030302B00000000000000000000000000000000000000000000
              000000000000000000003D3D3D04757575E6101010FF141414FF141414FF1414
              14FF141414FF141414FF141414FF141414FF141414FF131313FF121212FF1111
              11FF6E6E6EF95252525E00000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000061616154454545FF121212FF141414FF141414FF1414
              14FF141414FF141414FF141414FF141414FF141414FF141414FF141414FF1212
              12FF5D5D5DFF3030302B00000000000000000000000000000000000000000000
              000000000000000000003D3D3D04757575E6111111FF141414FF141414FF1414
              14FF141414FF141414FF141414FF141414FF141414FF131313FF131313FF7676
              76F44E4E4E500000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000061616154464646FF131313FF141414FF141414FF1414
              14FF141414FF141414FF141414FF141414FF141414FF141414FF141414FF1212
              12FF5D5D5DFF3030302B00000000000000000000000000000000000000000000
              000000000000000000003D3D3D04757575E6121212FF151515FF151515FF1515
              15FF151515FF151515FF151515FF151515FF141414FF181818FF7A7A7AEF4747
              4742000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000061616154464646FF141414FF151515FF151515FF1515
              15FF151515FF151515FF151515FF151515FF151515FF151515FF151515FF1313
              13FF5D5D5DFF3030302B00000000000000000000000000000000000000000000
              000000000000000000003D3D3D04757575E6131313FF161616FF161616FF1616
              16FF161616FF161616FF161616FF161616FF151515FF7D7D7DE9414141360000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000061616154464646FF151515FF161616FF161616FF1616
              16FF161616FF161616FF161616FF161616FF161616FF161616FF161616FF1414
              14FF5D5D5DFF3030302B00000000000000000000000000000000000000000000
              000000000000000000003D3D3D04757575E6131313FF171717FF171717FF1717
              17FF171717FF171717FF171717FF171717FF161616FF747474E9393939360000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000061616154474747FF161616FF171717FF171717FF1717
              17FF171717FF171717FF171717FF171717FF171717FF171717FF171717FF1515
              15FF5D5D5DFF3030302B00000000000000000000000000000000000000000000
              000000000000000000003D3D3D04757575E6141414FF181818FF181818FF1818
              18FF181818FF181818FF181818FF181818FF181818FF1C1C1CFF717171EF3C3C
              3C43000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000061616154474747FF171717FF181818FF181818FF1818
              18FF181818FF181818FF181818FF181818FF181818FF181818FF181818FF1616
              16FF5E5E5EFF3030302B00000000000000000000000000000000000000000000
              000000000000000000003E3E3E04767676E6151515FF191919FF191919FF1919
              19FF191919FF191919FF191919FF191919FF191919FF181818FF191919FF6E6E
              6EF4424242500000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000061616154484848FF181818FF191919FF191919FF1919
              19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1717
              17FF5E5E5EFF3131312B00000000000000000000000000000000000000000000
              000000000000000000003E3E3E04767676E6161616FF1A1A1AFF1A1A1AFF1A1A
              1AFF1A1A1AFF1A1A1AFF1A1A1AFF1A1A1AFF1A1A1AFF1A1A1AFF191919FF1818
              18FF686868F94343435E00000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000061616154484848FF191919FF1A1A1AFF1A1A1AFF1A1A
              1AFF1A1A1AFF1A1A1AFF1A1A1AFF1A1A1AFF1A1A1AFF1A1A1AFF1A1A1AFF1818
              18FF5F5F5FFF3131312B00000000000000000000000000000000000000000000
              000000000000000000003E3E3E04777777E6171717FF1B1B1BFF1B1B1BFF1B1B
              1BFF1B1B1BFF1B1B1BFF1B1B1BFF1B1B1BFF1B1B1BFF1B1B1BFF1B1B1BFF1A1A
              1AFF181818FF646464FC4B4B4B6E454545010000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000062626254494949FF1A1A1AFF1B1B1BFF1B1B1BFF1B1B
              1BFF1B1B1BFF1B1B1BFF1B1B1BFF1B1B1BFF1B1B1BFF1B1B1BFF1B1B1BFF1919
              19FF606060FF3131312B00000000000000000000000000000000000000000000
              000000000000000000003F3F3F04777777E6181818FF1C1C1CFF1C1C1CFF1C1C
              1CFF1C1C1CFF1C1C1CFF1C1C1CFF1C1C1CFF1C1C1CFF1C1C1CFF1C1C1CFF1C1C
              1CFF1B1B1BFF181818FF5B5B5BFE5353537E4343430200000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000626262544A4A4AFF1B1B1BFF1C1C1CFF1C1C1CFF1C1C
              1CFF1C1C1CFF1C1C1CFF1C1C1CFF1C1C1CFF1C1C1CFF1C1C1CFF1C1C1CFF1A1A
              1AFF606060FF3232322B00000000000000000000000000000000000000000000
              000000000000000000003F3F3F04787878E6181818FF1D1D1DFF1D1D1DFF1D1D
              1DFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D
              1DFF1D1D1DFF1D1D1DFF191919FF545454FE5C5C5C8F3E3E3E03000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000626262544B4B4BFF1B1B1BFF1D1D1DFF1D1D1DFF1D1D
              1DFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1A1A
              1AFF616161FF3232322B00000000000000000000000000000000000000000000
              000000000000000000003F3F3F04797979E6191919FF1E1E1EFF1F1F1FFF1F1F
              1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F
              1FFF1F1F1FFF1F1F1FFF1E1E1EFF1B1B1BFF4C4C4CFF6262629F3F3F3F060000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000636363544C4C4CFF1D1D1DFF1F1F1FFF1F1F1FFF1F1F
              1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1B1B
              1BFF626262FF3333332B00000000000000000000000000000000000000000000
              0000000000000000000040404004797979E61A1A1AFF1F1F1FFF1F1F1FFF1F1F
              1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F
              1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1C1C1CFF444444FF686868AE3E3E
              3E0A000000000000000000000000000000000000000000000000000000000000
              0000000000005A5A5A01595959015A5A5A015656560157575701575757015757
              5701545454015E5E5E015F5F5F544E4E4EFF1E1E1EFF1F1F1FFF1F1F1FFF1F1F
              1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1C1C
              1CFF626262FF3333332B00000000000000000000000000000000000000000000
              00000000000000000000404040047A7A7AE61B1B1BFF202020FF202020FF2020
              20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
              20FF202020FF202020FF202020FF202020FF202020FF1D1D1DFF3E3E3EFF6F6F
              6FBC3E3E3E0F0000000000000000000000000000000000000000000000000000
              00004B4B4B036D6D6DB36A6A6ACA6B6B6BCA6B6B6BCA6B6B6BCA6B6B6BCA6B6B
              6BCA6B6B6BCA6B6B6BCA797979DA3A3A3AFF202020FF202020FF202020FF2020
              20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF1D1D
              1DFF636363FF3333332B00000000000000000000000000000000000000000000
              00000000000000000000414141047B7B7BE61C1C1CFF212121FF212121FF2121
              21FF212121FF212121FF212121FF212121FF212121FF212121FF212121FF2121
              21FF212121FF212121FF212121FF212121FF212121FF212121FF1F1F1FFF3636
              36FF737373C93B3B3B1600000000000000000000000000000000000000000000
              0000434343047B7B7BE4171717FF1C1C1CFF1C1C1CFF1C1C1CFF1C1C1CFF1C1C
              1CFF1C1C1CFF1C1C1CFF1E1E1EFF202020FF212121FF212121FF212121FF2121
              21FF212121FF212121FF212121FF212121FF212121FF212121FF212121FF1E1E
              1EFF646464FF3434342B00000000000000000000000000000000000000000000
              00000000000000000000414141047B7B7BE61D1D1DFF222222FF222222FF2222
              22FF222222FF222222FF222222FF222222FF222222FF222222FF222222FF2222
              22FF222222FF222222FF222222FF222222FF222222FF222222FF222222FF2020
              20FF323232FF777777D43C3C3C1E000000000000000000000000000000000000
              0000444444047C7C7CE41D1D1DFF222222FF222222FF222222FF222222FF2222
              22FF222222FF222222FF222222FF222222FF222222FF222222FF222222FF2222
              22FF222222FF222222FF222222FF222222FF222222FF222222FF222222FF1F1F
              1FFF656565FF3434342B00000000000000000000000000000000000000000000
              00000000000000000000424242047C7C7CE61D1D1DFF232323FF232323FF2323
              23FF232323FF232323FF232323FF232323FF232323FF232323FF232323FF2323
              23FF232323FF232323FF232323FF232323FF232323FF232323FF232323FF2323
              23FF212121FF2D2D2DFF7B7B7BDD414141280000000000000000000000000000
              0000424242047D7D7DE41E1E1EFF232323FF232323FF232323FF232323FF2323
              23FF232323FF232323FF232323FF232323FF232323FF232323FF232323FF2323
              23FF232323FF232323FF232323FF232323FF232323FF232323FF232323FF2020
              20FF666666FF3535352B00000000000000000000000000000000000000000000
              00000000000000000000454545047D7D7DE51E1E1EFF242424FF242424FF2424
              24FF242424FF242424FF242424FF242424FF242424FF242424FF242424FF2424
              24FF242424FF242424FF242424FF242424FF242424FF242424FF242424FF2424
              24FF242424FF222222FF2A2A2AFF7B7B7BE63D3D3D3200000000000000000000
              0000424242047E7E7EE41E1E1EFF242424FF242424FF242424FF242424FF2424
              24FF242424FF242424FF242424FF242424FF242424FF242424FF242424FF2424
              24FF242424FF242424FF242424FF242424FF242424FF242424FF242424FF2020
              20FF676767FF3636362B00000000000000000000000000000000000000000000
              0000000000000000000053535303838383DD1E1E1EFF252525FF252525FF2525
              25FF252525FF252525FF252525FF252525FF252525FF252525FF252525FF2525
              25FF252525FF252525FF252525FF252525FF252525FF252525FF252525FF2525
              25FF252525FF252525FF232323FF272727FF7D7D7DED4141413E000000000000
              0000424242047F7F7FE41F1F1FFF252525FF252525FF252525FF252525FF2525
              25FF252525FF252525FF252525FF252525FF252525FF252525FF252525FF2525
              25FF252525FF252525FF252525FF252525FF252525FF252525FF252525FF2121
              21FF6C6C6CFF3E3E3E2200000000000000000000000000000000000000000000
              0000000000000000000065656501828282C31D1D1DFF252525FF262626FF2626
              26FF262626FF262626FF262626FF262626FF262626FF262626FF262626FF2626
              26FF262626FF262626FF262626FF262626FF262626FF262626FF262626FF2626
              26FF262626FF262626FF262626FF242424FF252525FF797979F34545454B0000
              000042424204808080E4202020FF262626FF262626FF262626FF262626FF2626
              26FF262626FF262626FF262626FF262626FF262626FF262626FF262626FF2626
              26FF262626FF262626FF262626FF262626FF262626FF262626FF262626FF2020
              20FF797979F83D3D3D0B00000000000000000000000000000000000000000000
              0000000000000000000000000000808080942B2B2BFF252525FF272727FF2727
              27FF272727FF272727FF272727FF272727FF272727FF272727FF272727FF2727
              27FF272727FF272727FF272727FF272727FF272727FF272727FF272727FF2727
              27FF272727FF272727FF272727FF272727FF252525FF242424FF757575F74C4C
              4C593D3D3D05818181E4212121FF272727FF272727FF272727FF272727FF2727
              27FF272727FF272727FF272727FF272727FF272727FF272727FF272727FF2727
              27FF272727FF272727FF272727FF272727FF272727FF272727FF262626FF1E1E
              1EFF797979D24E4E4E0200000000000000000000000000000000000000000000
              000000000000000000000000000066666650595959FF242424FF272727FF2727
              27FF272727FF272727FF272727FF272727FF272727FF272727FF272727FF2727
              27FF272727FF272727FF272727FF272727FF272727FF272727FF272727FF2727
              27FF272727FF272727FF272727FF272727FF272727FF262626FF222222FF7171
              71FB4545456D838383E5242424FF272727FF272727FF272727FF272727FF2727
              27FF272727FF272727FF272727FF272727FF272727FF272727FF272727FF2727
              27FF272727FF272727FF272727FF272727FF272727FF272727FF252525FF3131
              31FF6F6F6F900000000000000000000000000000000000000000000000000000
              00000000000000000000000000004F4F4F0B8F8F8FEA202020FF282828FF2929
              29FF292929FF292929FF292929FF292929FF292929FF292929FF292929FF2929
              29FF292929FF292929FF292929FF292929FF292929FF292929FF292929FF2929
              29FF292929FF292929FF292929FF292929FF292929FF292929FF282828FF2525
              25FF6A6A6AFD6E6E6EFA272727FF292929FF292929FF292929FF292929FF2929
              29FF292929FF292929FF292929FF292929FF292929FF292929FF292929FF2929
              29FF292929FF292929FF292929FF292929FF292929FF282828FF232323FF6D6D
              6DFE4A4A4A370000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000007C7C7C84424242FF262626FF2929
              29FF292929FF292929FF292929FF292929FF292929FF292929FF292929FF2929
              29FF292929FF292929FF292929FF292929FF292929FF292929FF292929FF2929
              29FF292929FF292929FF292929FF292929FF292929FF292929FF292929FF2929
              29FF282828FF292929FF292929FF292929FF292929FF292929FF292929FF2929
              29FF292929FF292929FF292929FF292929FF292929FF292929FF292929FF2929
              29FF292929FF292929FF292929FF292929FF292929FF272727FF262626FF8383
              83C14F4F4F020000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000051515112949494E5232323FF2828
              28FF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A
              2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A
              2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A
              2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A
              2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A
              2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF292929FF222222FF777777FB4E4E
              4E3B000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000006161614F787878FC2222
              22FF292929FF2A2A2AFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B
              2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B
              2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B
              2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B
              2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B
              2BFF2B2B2BFF2B2B2BFF2B2B2BFF292929FF242424FF4D4D4DFF7171718B0000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000005E5E5E017878787C6767
              67FE232323FF292929FF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B
              2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B
              2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B
              2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B
              2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B
              2BFF2B2B2BFF2B2B2BFF292929FF252525FF434343FF878787B54C4C4C060000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000005C5C5C027979
              797F767676FD232323FF272727FF2A2A2AFF2B2B2BFF2C2C2CFF2C2C2CFF2C2C
              2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C
              2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C
              2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C
              2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2B2B
              2BFF2B2B2BFF282828FF232323FF515151FF888888B34E4E4E0C000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000005F5F
              5F0166666656969696EB3C3C3CFF232323FF282828FF2A2A2AFF2B2B2BFF2B2B
              2BFF2B2B2BFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C
              2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C
              2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C
              2CFF2C2C2CFF2C2C2CFF2C2C2CFF2B2B2BFF2B2B2BFF2B2B2BFF2A2A2AFF2828
              28FF242424FF2C2C2CFF828282F9757575834E4E4E0500000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000053535318878787938F8F8FF34F4F4FFF252525FF222222FF2424
              24FF252525FF252525FF252525FF252525FF252525FF252525FF252525FF2525
              25FF252525FF252525FF252525FF252525FF252525FF252525FF252525FF2525
              25FF252525FF252525FF252525FF252525FF252525FF252525FF252525FF2525
              25FF252525FF252525FF252525FF252525FF242424FF232323FF212121FF4242
              42FF7F7F7FFC8C8C8CB153535330000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000052525215757575658B8B8BAA8E8E8ED99393
              93F58E8E8EFE8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D
              8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D
              8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D
              8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF919191F88F8F8FE28A8A8AB97979
              7978535353265D5D5D0100000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000575757034747
              47084545450B4444440C4444440C4444440C4444440C4444440C4444440C4444
              440C4444440C4444440C4444440C4444440C4444440C4444440C4444440C4444
              440C4444440C4444440C4444440C4444440C4444440C4444440C4444440C4444
              440C4444440C4444440C4444440C4444440B464646094F4F4F04000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000}
            Proportional = True
            Stretch = True
          end
          object HOME: TImage
            Left = 191
            Top = 40
            Width = 62
            Height = 65
            Center = True
            Picture.Data = {
              07544269746D617042400000424D424000000000000042000000280000004000
              000040000000010020000300000000400000C40E0000C40E0000000000000000
              00000000FF0000FF0000FF000000FF00000000FF00000000FF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000030000
              0008000000110000001B000000270000002F0000003400000037000000390000
              0039000000390000003900000039000000390000003900000039000000390000
              0039000000390000003900000039000000390000003900000039000000390000
              0039000000390000003900000039000000390000003900000039000000390000
              0039000000390000003900000039000000390000003900000039000000390000
              0039000000390000003900000039000000390000003900000039000000390000
              0039000000390000003900000039000000390000003900000037000000340000
              002F000000270000001B00000011000000080000000300000001000000030000
              000A0000001500000022000000300000003B000000412A2B2B963A3C40E83B3D
              41E83B3D41E83B3D41E83B3D41E83B3D41E83B3D41E83B3D41E83B3D41E83B3D
              41E83B3D41E83B3D41E84B4C4FE8B3B3B3F9AFAFAFE8AFAFAFE8AFAFAFE8AFAF
              AFE8AFAFAFE8AFAFAFE8B5B5B5FBB6B6B6FEB7B7B7FFB7B7B7FFB7B7B7FFB7B7
              B7FFB7B7B7FFB7B7B7FFB7B7B7FFB7B7B7FFB7B7B7FFB7B7B7FFB7B7B7FFB5B5
              B5FE8C8C8CF13B3D41E83B3D41E83B3D41E83B3D41E83B3D41E83B3D41E83B3D
              41E83B3D41E83B3D41E83B3D41E83B3D41E83B3D41E8393B3EE8000000410000
              003B0000003000000022000000150000000A0000000300000001000000020000
              00050000000B000000130000001B00000020000000242D2E2F92667078FF6B76
              7FFF6B767FFF6B767FFF6B767FFF6C777FFF6C777FFF6C777FFF6C777FFF6C77
              7FFF6C777FFF6C777FFF6B7277FF999999FF999999FF999999FF999999FF9999
              99FF999999FF999999FF999999FF999999FF999999FF999999FF999999FF9999
              99FF999999FF999999FF999999FF999999FF999999FF999999FF999999FF9999
              99FF828282FF6C777FFF6C777FFF6C777FFF6C777FFF6C777FFF6C777FFF6C77
              7FFF6B767FFF6B767FFF6B767FFF6B767FFF6B767FFF5A6268FF000000240000
              00200000001B000000130000000B000000050000000200000000000000000000
              00010000000200000004090A0A06151617071E202108404245846C7882FF727F
              8AFF727F8AFF727F8AFF727F8AFF73808AFF74808AFF74808AFF74808AFF7480
              8AFF74808AFF74808AFF727D85FF73797EFF747A7FFF747A7FFF71777CFF646A
              73FF577092FF587397FF587397FF587397FF587397FF587397FF587397FF5873
              97FF587397FF587397FF587397FF556781FF6B7176FF72777CFF747A7FFF747A
              7FFF71787DFF74808AFF74808AFF74808AFF74808AFF74808AFF74808AFF7380
              8AFF727F8AFF727F8AFF727F8AFF727F8AFF727F8AFF606972FF26292B081F21
              2307171819060E0F0F0400000002000000010000000000000000000000000000
              00000000000000000000000000000000000000000000595D607F73818CFF7989
              95FF798995FF798995FF798995FF7A8995FF7A8A95FF7A8A95FF7A8A95FF7A8A
              95FF7A8A95FF7A8A95FF7A8A95FF7A8A95FF7A8A95FF7A8A95FF748390FF5164
              7BFF2A6EC6FF2C75D4FF327AD6FF327AD6FF3079D6FF2C75D4FF2C76D4FF3279
              D4FF3177D1FF2E74CEFF2C74D2FF24559AFF677787FF778692FF7A8A95FF7A8A
              95FF7A8A95FF7A8A95FF7A8A95FF7A8A95FF7A8A95FF7A8A95FF7A8A95FF7A89
              95FF798995FF798995FF798995FF798995FF798995FF65717BFF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000007174767FB9C4C7FFC3CF
              D3FFC3CFD3FFC3CFD3FFC3CFD3FFC5D0D4FFC6D1D4FFC6D1D4FFC6D1D4FFC6D1
              D4FFC6D1D4FFC6D1D4FFC6D1D4FFC6D1D4FFC6D1D4FFC6D1D4FFBCC8CDFF7F8E
              A1FF296CC3FF2A72CEFF3E7ED1FF3E7ED1FF387ACFFF2A72CFFF2B74D1FF4486
              D7FF4384D4FF3B7DCEFF2B72CFFF245498FFA5B1BBFFBFCBD0FFC6D1D4FFC6D1
              D4FFC6D1D4FFC6D1D4FFC6D1D4FFC6D1D4FFC6D1D4FFC6D1D4FFC6D1D4FFC5D0
              D4FFC3CFD3FFC3CFD3FFC3CFD3FFC3CFD3FFC3CFD3FFA3ABAEFF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000008286877FCFD8D9FFDBE5
              E6FFDCE6E7FFDEE7E7FFDFE8E8FFEAF0F0FFEEF3F3FFEEF3F3FFEEF3F3FFEEF3
              F3FFEEF3F3FFEEF3F3FFEEF3F3FFEEF3F3FFEEF3F3FFEEF3F3FFE1E7E9FF96A2
              B2FF286AC0FF276DC7FF3978C6FF3978C6FF3474C4FF286FC9FF2A72CEFF4485
              D5FF4282D2FF3A7BCCFF2A70CCFF235396FFC5CCD3FFE6EBEDFFEEF3F3FFEEF3
              F3FFEEF3F3FFEEF3F3FFEEF3F3FFEEF3F3FFEEF3F3FFEEF3F3FFEEF3F3FFEAF0
              F0FFDFE8E8FFDFE8E8FFDEE7E8FFDDE7E7FFDCE6E6FFB8BEBEFF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000009297987FCFD9D9FFDAE5
              E5FFDBE5E6FFDCE6E6FFDCE6E7FFE4EBECFFE7EDEEFFE7EDEEFFE7EDEEFFE7ED
              EEFFE7EDEEFFE7EDEEFFE7EDEEFFE7EDEEFFE7EDEEFFE7EDEEFFDAE2E4FF919E
              AFFF2768BDFF256AC2FF2B6ABAFF2B6ABAFF2868B8FF276BC5FF2970CBFF3579
              CEFF3477CBFF2F72C6FF286EC9FF235295FFBFC8CFFFDFE6E8FFE7EDEEFFE7ED
              EEFFE7EDEEFFE7EDEEFFE7EDEEFFE7EDEEFFE7EDEEFFE7EDEEFFE7EDEEFFE4EB
              ECFFDCE6E7FFDCE6E7FFDCE6E6FFDBE5E6FFDBE5E5FFB7BEBEFF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000009B9FA07FD0D9D9FFDAE5
              E5FFDAE5E5FFDAE5E5FFDAE5E5FFDEE7E8FFDFE9EAFFDFE9EAFFDFE9EAFFDFE9
              EAFFDFE9EAFFDFE9EAFFDFE9EAFFDFE9EAFFDFE9EAFFDFE9EAFFD4DDDFFF8D9C
              ACFF2666BBFF276DC7FF276DC7FF276DC7FF276DC7FF276DC7FF276DC7FF276D
              C7FF276DC7FF276DC7FF276DC7FF225193FFB9C4CBFFD8E2E3FFDFE9EAFFDFE9
              EAFFDFE9EAFFDFE9EAFFDFE9EAFFDFE9EAFFDFE9EAFFDFE9EAFFDFE9EAFFDEE7
              E8FFDAE5E5FFDAE5E5FFDAE5E5FFDAE5E5FFDAE5E5FFB7BDBEFF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A0A4A47FD0D9D9FFDCE6
              E6FFDCE7E7FFDEE7E7FFDFE8E8FFEBF1F1FFEFF4F4FFEFF4F4FFEFF4F4FFEFF4
              F4FFEFF4F4FFEFF4F4FFEFF4F4FFEFF4F4FFEFF4F4FFEFF4F4FFE2E7E9FF96A2
              B2FF2564B7FF276CC6FF3476CDFF3476CDFF3174CCFF266BC5FF276CC6FF3476
              CDFF3476CDFF3174CCFF266BC4FF215092FFC5CCD3FFE7ECEDFFEFF4F4FFEFF4
              F4FFEFF4F4FFEFF4F4FFEFF4F4FFEFF4F4FFEFF4F4FFEFF4F4FFEFF4F4FFEBF1
              F1FFDFE8E8FFDFE8E8FFDEE7E8FFDDE7E7FFDCE6E6FFB9BFBFFF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A1A5A57FD1D9DAFFDBE5
              E6FFDCE5E6FFDDE6E7FFDDE6E7FFE6EDEEFFE9EFF0FFE9EFF0FFE9EFF0FFE9EF
              F0FFE9EFF0FFE9EFF0FFE9EFF0FFE9EFF0FFE9EFF0FFE9EFF0FFDCE2E5FF929F
              AFFF2362B5FF2468C0FF3A79C9FF3A79C9FF3575C7FF2468C0FF2468C0FF3A79
              C9FF3A79C9FF3575C7FF2468C0FF214F90FFC0C8CFFFE1E7E9FFE9EFF0FFE9EF
              F0FFE9EFF0FFE9EFF0FFE9EFF0FFE9EFF0FFE9EFF0FFE9EFF0FFE9EFF0FFE6ED
              EEFFDDE6E7FFDDE6E7FFDDE6E7FFDCE6E7FFDCE5E6FFB9BEBFFF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A1A5A57FD1D9DAFFDBE5
              E6FFDBE5E6FFDBE5E6FFDBE5E6FFE1E9EAFFE3EAEBFFE3EAEBFFE3EAEBFFE3EA
              EBFFE3EAEBFFE3EAEBFFE3EAEBFFE3EAEBFFE3EAEBFFE3EAEBFFD6DEE1FF8E9C
              ACFF2260B2FF2164BAFF3774C0FF3774C0FF3170BDFF2265BBFF2164B9FF3774
              C0FF3774BFFF316FBCFF2266BCFF204E8EFFBAC5CBFFDBE3E5FFE3EAEBFFE3EA
              EBFFE3EAEBFFE3EAEBFFE3EAEBFFE3EAEBFFE3EAEBFFE3EAEBFFE3EAEBFFE1E9
              EAFFDBE5E6FFDBE5E6FFDBE5E6FFDBE5E6FFDBE5E6FFB8BEBFFF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A1A5A57FD2DADAFFDCE6
              E7FFDDE7E8FFDEE7E8FFDFE8E9FFECF1F2FFF1F5F5FFF1F5F5FFF1F5F5FFF1F5
              F5FFF1F5F5FFF1F5F5FFF1F5F5FFF1F5F5FFF1F5F5FFF1F5F5FFE3E8E9FF96A2
              B2FF215FAFFF1F62B6FF2362B3FF2362B3FF2161B2FF2063B7FF1F61B5FF2362
              B3FF205CA7FF1E59A4FF2063B9FF1F4D8DFFC5CDD3FFE9EDEEFFF1F5F5FFF1F5
              F5FFF1F5F5FFF1F5F5FFF1F5F5FFF1F5F5FFF1F5F5FFF1F5F5FFF1F5F5FFECF1
              F2FFDFE8E9FFDFE8E9FFDFE7E8FFDEE7E8FFDDE6E7FFBABFC0FF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A1A5A57FD2DADAFFDCE6
              E6FFDDE6E7FFDDE7E7FFDDE7E7FFE8EEEFFFEBF1F1FFEBF1F1FFEBF1F1FFEBF1
              F1FFEBF1F1FFEBF1F1FFEBF1F1FFEBF1F1FFEBF1F1FFEBF1F1FFDEE4E6FF939F
              AFFF1F5CACFF2062B7FF2062B7FF2062B7FF2062B7FF2062B7FF2062B7FF2062
              B7FF1B549EFF1B529BFF2062B7FF1E4C8BFFC1C9CFFFE3E9EAFFEBF1F1FFEBF1
              F1FFEBF1F1FFEBF1F1FFEBF1F1FFEBF1F1FFEBF1F1FFEBF1F1FFEBF1F1FFE8EE
              EFFFDDE7E7FFDDE7E7FFDDE7E7FFDDE6E7FFDCE6E6FFBABFC0FF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A1A5A57FD2DADBFFDCE6
              E7FFDCE6E7FFDCE6E7FFDCE6E7FFE3EBECFFE6EDEEFFE6EDEEFFE6EDEEFFE6ED
              EEFFE6EDEEFFE6EDEEFFE6EDEEFFE6EDEEFFE6EDEEFFE6EDEEFFD8E0E2FF909D
              ADFF1E5BA9FF1F60B3FF1F60B3FF1F60B3FF1F60B3FF1F60B3FF1F60B3FF1F60
              B3FF6F8095FF89919CFF1F60B3FF1E4B89FFBDC6CCFFDEE5E6FFE6EDEEFFE6ED
              EEFFE6EDEEFFE6EDEEFFE6EDEEFFE6EDEEFFE6EDEEFFE6EDEEFFE6EDEEFFE3EB
              ECFFDCE6E7FFDCE6E7FFDCE6E7FFDCE6E7FFDCE6E7FFBABFC0FF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A1A5A67FD3DBDCFFDDE6
              E7FFDEE7E8FFDFE8E9FFE0E8E9FFEEF3F3FFF3F6F7FFF3F6F7FFF3F6F7FFF3F6
              F7FFF3F6F7FFF3F6F7FFF3F6F7FFF3F6F7FFF3F6F7FFF3F6F7FFE4E8EAFF97A2
              B2FF1D58A7FF1D5EB1FF1D5EB1FF1D5EB1FF1D5EB1FF1D5EB1FF1D5EB1FF1D5E
              B1FF475B75FF545D6AFF1D5EB1FF1D4A88FFC6CCD3FFEAEEEFFFF3F6F7FFF3F6
              F7FFF3F6F7FFF3F6F7FFF3F6F7FFF3F6F7FFF3F6F7FFF3F6F7FFF3F6F7FFEEF3
              F3FFE0E8E9FFE0E8E9FFDFE8E9FFDEE8E8FFDDE7E8FFBBC0C0FF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A2A5A67FD4DBDCFFDDE6
              E7FFDEE6E7FFDEE7E8FFDEE7E8FFEAEFF0FFEEF3F3FFEEF3F3FFEEF3F3FFEEF3
              F3FFEEF3F3FFEEF3F3FFEEF3F3FFEEF3F3FFEEF3F3FFEEF3F3FFE0E5E6FF94A0
              AFFF1C56A3FF1C5BADFF1C5BADFF1C5BADFF1C5BADFF1C5BADFF1C5BADFF1C5B
              ADFF1C5BADFF1C5BADFF1C5BADFF1C4886FFC2C9D0FFE5EAEBFFEEF3F3FFEEF3
              F3FFEEF3F3FFEEF3F3FFEEF3F3FFEEF3F3FFEEF3F3FFEEF3F3FFEEF3F3FFEAEF
              F0FFDEE7E8FFDEE7E8FFDEE7E8FFDEE7E8FFDDE6E7FFBBC0C0FF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A2A5A67FD4DCDCFFDDE7
              E7FFDDE7E7FFDDE7E7FFDDE7E7FFE6EDEDFFE9EFEFFFE9EFEFFFE9EFEFFFE9EF
              EFFFE9EFEFFFE9EFEFFFE9EFEFFFE9EFEFFFE9EFEFFFE9EFEFFFDBE2E3FF919E
              ADFF1A55A1FF1D5FB2FF3071C5FF3071C5FF2D6FC4FF1C5DAFFF1F61B5FF3071
              C5FF3071C5FF2D6FC4FF1B5BACFF1B4785FFBFC6CDFFE1E7E8FFE9EFEFFFE9EF
              EFFFE9EFEFFFE9EFEFFFE9EFEFFFE9EFEFFFE9EFEFFFE9EFEFFFE9EFEFFFE6ED
              EDFFDDE7E7FFDDE7E7FFDDE7E7FFDDE7E7FFDDE7E7FFBAC0C0FF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A2A6A67FD5DCDCFFDEE7
              E8FFDFE8E9FFE0E8E9FFE0E9EAFFEFF3F4FFF4F7F7FFF4F7F7FFF4F7F7FFF4F7
              F7FFF4F7F7FFF4F7F7FFF4F7F7FFF4F7F7FFF4F7F7FFF4F7F7FFE5E8EAFF97A2
              B1FF19529EFF1B5AABFF3673BFFF3673BFFF306EBCFF1A59A9FF1B5CADFF3673
              BFFF3673BFFF306EBCFF1958A8FF1B4683FFC7CCD2FFEBEEEFFFF4F7F7FFF4F7
              F7FFF4F7F7FFF4F7F7FFF4F7F7FFF4F7F7FFF4F7F7FFF4F7F7FFF4F7F7FFEFF3
              F4FFE0E9EAFFE0E9EAFFE0E8E9FFDFE8E9FFDEE8E9FFBCC1C1FF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A2A6A67FD5DCDDFFDEE7
              E8FFDEE7E8FFDFE8E9FFDFE8E9FFEBF1F1FFF0F4F4FFF0F4F4FFF0F4F4FFF0F4
              F4FFF0F4F4FFF0F4F4FFF0F4F4FFF0F4F4FFF0F4F4FFF0F4F4FFE1E5E7FF95A0
              B0FF17509BFF1755A4FF316BB4FF316BB4FF2B66B1FF1755A4FF1856A5FF316B
              B4FF316BB4FF2B66B1FF1754A3FF1A4581FFC3CAD0FFE7EBECFFF0F4F4FFF0F4
              F4FFF0F4F4FFF0F4F4FFF0F4F4FFF0F4F4FFF0F4F4FFF0F4F4FFF0F4F4FFEBF1
              F1FFDFE8E9FFDFE8E9FFDFE8E9FFDEE7E8FFDEE7E8FFBCC1C1FF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A2A6A67FD6DCDDFFDEE7
              E8FFDEE7E8FFDEE7E8FFDEE7E8FFE8EEEFFFECF1F2FFECF1F2FFECF1F2FFECF1
              F2FFECF1F2FFECF1F2FFECF1F2FFECF1F2FFECF1F2FFECF1F2FFDDE3E4FF939E
              AEFF164F98FF14519FFF1A57A0FF1A57A0FF1955A0FF15529FFF14519EFF1A57
              A0FF1A57A0FF1955A0FF15529FFF194480FFC0C7CEFFE3E8EAFFECF1F2FFECF1
              F2FFECF1F2FFECF1F2FFECF1F2FFECF1F2FFECF1F2FFECF1F2FFECF1F2FFE8EE
              EFFFDEE7E8FFDEE7E8FFDEE7E8FFDEE7E8FFDEE7E8FFBCC1C1FF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A2A6A67FD6DDDDFFDFE8
              E9FFE0E8E9FFE1E8E9FFE1E9EAFFF0F4F5FFF6F8F9FFF6F8F9FFF6F8F9FFF6F8
              F9FFF6F8F9FFF6F8F9FFF6F8F9FFF6F8F9FFF6F8F9FFF6F8F9FFE6E9EBFF98A2
              B2FF144D94FF14519DFF1653A0FF1653A0FF1653A0FF14519DFF15519EFF1653
              A0FF1653A0FF1653A0FF14509CFF18437EFFC7CCD3FFECEFF0FFF6F8F9FFF6F8
              F9FFF6F8F9FFF6F8F9FFF6F8F9FFF6F8F9FFF6F8F9FFF6F8F9FFF6F8F9FFF0F4
              F5FFE1E9EAFFE1E9EAFFE1E9E9FFE0E8E9FFDFE8E9FFBDC1C1FF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A2A6A67FD6DDDEFFDFE8
              E9FFDFE8E9FFDFE8E9FFE0E9E9FFEEF2F3FFF3F5F6FFF3F5F6FFF3F5F6FFF3F5
              F6FFF3F5F6FFF3F5F6FFF3F5F6FFF3F5F6FFF3F5F6FFF3F5F6FFE3E7E8FF96A0
              B0FF134B92FF1755A4FF3171BFFF3171BFFF2D6DBDFF1553A0FF1958A8FF3171
              BFFF3171BFFF2D6DBDFF14509CFF17427CFFC5CAD1FFE9ECEDFFF3F5F6FFF3F5
              F6FFF3F5F6FFF3F5F6FFF3F5F6FFF3F5F6FFF3F5F6FFF3F5F6FFF3F5F6FFEEF2
              F3FFE0E9E9FFE0E9E9FFDFE9E9FFDFE8E9FFDFE8E9FFBDC1C2FF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A2A6A67FD6DDDEFFDFE8
              E9FFDFE8E9FFDFE8E9FFDFE8E9FFEBF0F1FFEFF3F3FFEFF3F3FFEFF3F3FFEFF3
              F3FFEFF3F3FFEFF3F3FFEFF3F3FFEFF3F3FFEFF3F3FFEFF3F3FFE0E5E6FF949F
              AFFF12488FFF14509DFF326DB6FF326DB6FF2C68B3FF134F9BFF1552A0FF326D
              B6FF326DB6FF2C68B3FF114D98FF17407BFFC2C8CFFFE6EAEBFFEFF3F3FFEFF3
              F3FFEFF3F3FFEFF3F3FFEFF3F3FFEFF3F3FFEFF3F3FFEFF3F3FFEFF3F3FFEBF0
              F1FFDFE8E9FFDFE8E9FFDFE8E9FFDFE8E9FFDFE8E9FFBDC1C1FF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A2A6A67FD7DEDEFFDFE8
              E9FFE0E9E9FFE1E9EAFFE1E9EAFFF2F5F5FFF7F9F9FFF7F9F9FFF7F9F9FFF7F9
              F9FFF7F9F9FFF7F9F9FFF7F9F9FFF7F9F9FFF7F9F9FFF7F9F9FFE7E9EBFF99A2
              B2FF10468CFF104C96FF2E67ABFF2E67ABFF2861A8FF104B95FF114D98FF2E67
              ABFF2E67ABFF2861A8FF0F4A93FF163F79FFC8CCD3FFEEF0F1FFF7F9F9FFF7F9
              F9FFF7F9F9FFF7F9F9FFF7F9F9FFF7F9F9FFF7F9F9FFF7F9F9FFF7F9F9FFF2F5
              F5FFE1E9EAFFE1E9EAFFE1E9EAFFE0E9E9FFE0E9E9FFBEC2C2FF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000A2A6A67FD7DEDEFFDFE9
              E9FFDFE9EAFFE0E9EAFFE0E9EAFFF0F4F4FFF5F7F8FFF5F7F8FFF5F7F8FFF5F7
              F8FFF5F7F8FFF5F7F8FFF5F7F8FFF5F7F8FFF5F7F8FFF5F7F8FFE4E8E9FF97A1
              B0FF0E4588FF0D488FFF0D4990FF0D4990FF0D4990FF0C478EFF0D488FFF0D49
              90FF0D4990FF0D4990FF0C478EFF143E77FFC6CBD1FFEBEEEFFFF5F7F8FFF5F7
              F8FFF5F7F8FFF5F7F8FFF5F7F8FFF5F7F8FFF5F7F8FFF5F7F8FFF5F7F8FFF0F4
              F4FFE0E9EAFFE0E9EAFFE0E9EAFFDFE9EAFFDFE8E9FFBEC2C2FF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000009EA1A27FD6DDDEFFDFE7
              E8FFDFE8E9FFDFE9EAFFDFE9EAFFEEF2F2FFF2F6F6FFF2F6F6FFF2F6F6FFF2F6
              F6FFF2F6F6FFF2F6F6FFF2F6F6FFF2F6F6FFF2F6F6FFF2F6F6FFE2E6E7FF95A0
              AFFF0D4286FF0B448BFF0B448BFF0B448BFF0B448BFF0B448BFF0B448BFF0B44
              8BFF0B448BFF0B448BFF0B448BFF143D75FFC4C9CFFFE8ECEDFFF2F6F6FFF2F6
              F6FFF2F6F6FFF2F6F6FFF2F6F6FFF2F6F6FFF2F6F6FFF2F6F6FFF2F6F6FFEEF2
              F2FFDFE9EAFFDFE9EAFFDFE9EAFFDFE8E9FFDFE7E8FFBDC1C1FF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000009396977FD6DBDBFFDEE6
              E7FFDFE8E9FFE1E9EAFFE1E9EAFFF3F6F6FFF9FBFBFFF9FBFBFFF9FBFBFFF9FB
              FBFFF9FBFBFFF9FBFBFFF9FBFBFFF9FBFBFFF9FBFBFFF9FBFBFFE8EAEBFFACB3
              BEFF536889FF596F8DFF607690FF657C94FF6B8398FF70889BFF70879BFF6A81
              97FF657B93FF5E7590FF586E8CFF546786FFCED2D7FFEEF1F1FFF9FBFBFFF9FB
              FBFFF9FBFBFFF9FBFBFFF9FBFBFFF9FBFBFFF9FBFBFFF9FBFBFFF9FBFBFFF3F6
              F6FFE2EAEBFFE1E9EAFFE1E9EAFFDFE8E9FFDEE6E7FFBDC1C1FF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000008A8E8F7FD1D7D7FFDBE4
              E4FFDDE6E6FFDFE8E8FFE0E9E9FFF1F5F5FFF6F9F9FFF6F9F9FFF6F9F9FFF6F9
              F9FFF6F9F9FFF6F9F9FFF6F9F9FFF6F9F9FFF6F9F9FFF6F9F9FFE6E9EAFFDCDF
              E1FFDCDFE1FFDCDFE1FFDCDFE1FFDCDFE1FFDCDFE1FFDCDFE1FFDCDFE1FFDCDF
              E1FFDCDFE1FFDCDFE1FFDCDFE1FFDCDFE1FFDCDFE1FFECEFF0FFF6F9F9FFF6F9
              F9FFF6F9F9FFF6F9F9FFF6F9F9FFF6F9F9FFF6F9F9FFF6F9F9FFF6F9F9FFF1F5
              F5FFE0E9E9FFE0E9E9FFDFE7E7FFDDE6E6FFDBE4E4FFBBBFBFFF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000008386887FCCD2D2FFD7DF
              DFFFDAE2E3FFDDE5E5FFDEE7E7FFEFF3F3FFF4F7F7FFF5F8F8FFF5F8F8FFF5F8
              F8FFF5F8F8FFF5F8F8FFF5F8F8FFF5F8F8FFF5F8F8FFF5F8F8FFF3F5F6FFF2F4
              F5FFF2F4F5FFF2F4F5FFF2F4F5FFF2F4F5FFF2F4F5FFF2F4F5FFF2F4F5FFF2F4
              F5FFF2F4F5FFF2F4F5FFF2F4F5FFF2F4F5FFF2F4F5FFF4F6F6FFF5F8F8FFF5F8
              F8FFF5F8F8FFF5F8F8FFF5F8F8FFF5F8F8FFF5F8F8FFF5F8F8FFF5F8F8FFEFF3
              F3FFDFE8E8FFDEE6E7FFDCE5E5FFD9E1E2FFD6DEDFFFB8BCBCFF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00005858586B5D5D5DD7191919DF000000DF08101FDF3D3F41EFC5CBCBFFD0D8
              D9FFD5DDDEFFDAE1E2FFDDE5E5FFF1F3F4FFF8FAFAFFF9FAFAFFFAFBFBFFFAFB
              FBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFB
              FBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFB
              FBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFB
              FBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFBFBFFFAFBFBFFF9FBFBFFF9FAFAFFF2F5
              F5FFDFE6E7FFDCE4E5FFD9E0E1FFD4DCDDFFD0D7D8FFB5B9B9FF282E37E70408
              0FDF000000DF242424DF616161C34E4E4F430000000000000000000000000000
              00005556563B626262F35F5F5FFF1B1D21FF182F56FF2E405FFFBAC0C1FFC9D0
              D0FFCDD5D6FFD2DBDBFFD7DFDFFFEBEEEFFFF4F5F6FFF6F7F8FFF7F9F9FFF8F9
              FAFFF9FAFAFFF9FAFBFFF9FAFBFFF9FAFBFFF9FAFBFFF9FAFBFFF9FAFBFFF9FA
              FBFFF9FAFBFFF9FAFBFFF9FAFBFFF9FAFBFFF9FAFBFFF9FAFBFFF9FAFBFFF9FA
              FBFFF9FAFBFFF9FAFBFFF9FAFBFFF9FAFBFFF9FAFBFFF9FAFBFFF9FAFBFFF9FA
              FBFFF9FAFBFFF9FAFBFFF9FAFBFFF9FAFAFFF8F9F9FFF7F9F9FFF6F7F8FFEEF1
              F1FFD9E2E2FFD6DDDEFFD1D9DAFFCCD3D4FFC7CFCFFF979FA8FF20375FFF1123
              41FF242424FF616161FF616161D74C4C4D170000000000000000000000000000
              0000000000005454553B626262F35F5F5FFF1E232AFF1C3358FF435573FFBBC2
              C4FFC6CCCDFFCBD1D2FFD0D7D7FFE5E8E8FFEEF0F0FFF2F3F4FFF4F6F7FFF6F7
              F8FFF7F8F9FFF8F9F9FFF8FAFAFFF8FAFAFFF8FAFAFFF8FAFAFFF8FAFAFFF8FA
              FAFFE3E6E8FFD5D6D7FFD5D6D7FFD5D6D7FFD5D6D7FFD5D6D7FFD5D6D7FFD5D6
              D7FFD5D6D7FFD5D6D7FFD8D9DAFFECEFF1FFF8FAFAFFF8FAFAFFF8FAFAFFF8FA
              FAFFF8FAFAFFF8F9FAFFF8F9F9FFF7F8F9FFF6F7F8FFF4F5F6FFF1F3F3FFE8EB
              EBFFD4DBDCFFCFD6D6FFCAD0D1FFC4CBCBFF9BA5AEFF263D63FF182C4CFF2527
              2AFF616161FF616161D7484A4E17000000000000000000000000000000000000
              000000000000000000005454563B626262F35F5F5FFF1F232AFF1E3559FF4355
              72FFB8C0C1FFC4CACBFFC8CFD0FFDFE1E2FFEBEBEBFFEFF0F0FFF3F4F4FFF6F7
              F7FFF9FAFAFFFAFBFBFFFAFBFBFFFBFCFCFFFCFDFDFFFCFDFDFFFCFDFDFFFCFD
              FDFFDADCDEFFCACACAFFD8D8D8FFD0D0D0FFD0D0D0FFC3C3C3FFD7D7D7FFD2D2
              D2FFD0D0D0FFD0D0D0FFC2C3C3FFEBEDEFFFFCFDFDFFFCFDFDFFFCFDFDFFFCFD
              FDFFFBFCFCFFFAFBFBFFFAFBFBFFF8F9F9FFF6F7F7FFF3F4F4FFEFEFEFFFE3E5
              E5FFCDD3D4FFC7CECEFFC2C9C9FF99A3ACFF263D62FF1A2E4DFF27292BFF6161
              61FF616161D74C4F531700000000000000000000000000000000000000000000
              00000000000000000000000000005657593B626262F35F5F5FFF1F242AFF2037
              5AFF425470FFB6BDBFFFC0C7C7FFD5D7D7FFE1E2E2FFE7E8E8FFECEDEDFFF1F1
              F1FFF4F5F5FFF7F8F8FFF9FAFAFFFAFBFBFFFBFCFCFFFCFCFCFFFCFCFCFFFCFC
              FCFFD7D9DBFFD1D1D1FFEDEDEDFFE0E0E0FFD8D8D8FFC2C2C2FFECECECFFE7E7
              E7FFDADADAFFD8D8D8FFBEBEBFFFEAEDEFFFFCFCFCFFFCFCFCFFFBFCFCFFFBFC
              FCFFFAFBFBFFF9FAFAFFF6F7F7FFF4F5F5FFF0F0F0FFEBECECFFE5E6E6FFDADC
              DCFFC4CACBFFBFC5C6FF97A0A9FF263C60FF1C304EFF313235FF636363FF6161
              61D751555B170000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000057585A3B626262F35F5F5FFF2024
              2AFF22395BFF384B66FFACB3B6FFCCCFCFFFD7D8D8FFDDDDDDFFE3E3E3FFE9EA
              EAFFEEEFEFFFF2F3F3FFF5F7F7FFF8F9F9FFF9FBFBFFFAFBFBFFFBFCFCFFFBFD
              FDFFD4D6D8FFCBCBCBFFF8F8F8FFEDEDEDFFE0E0E0FFBDBDBDFFEAEAEAFFF5F5
              F5FFE7E7E7FFDADADAFFB7B8B8FFEAECEEFFFBFDFDFFFBFCFCFFFAFBFBFFF9FA
              FAFFF7F8F8FFF5F6F6FFF1F2F2FFEDEEEEFFE7E9E9FFE2E3E3FFDBDCDCFFD0D2
              D3FFBCC2C3FF959EA6FF273C5FFF1E324FFF313235FF636363FF616161D7565A
              6117000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000057585A3B626262F35F5F
              5FFF20242AFF243A5BFF324461FFBABCBFFFD0D0D0FFD5D5D5FFDADADBFFE1E1
              E2FFE8E8E8FFEEEEEEFFF2F2F3FFF7F7F7FFF9F9F9FFFBFBFCFFFCFCFDFFFDFD
              FDFFD2D4D6FFBABABAFFEEEEEEFFF8F8F8FFEDEDEDFFBDBDBDFFD3D3D3FFF3F3
              F3FFF5F5F5FFE7E7E7FFB3B4B4FFEBEDEFFFFDFDFDFFFCFCFCFFFBFBFBFFF8F8
              F9FFF6F6F6FFF1F1F2FFECECECFFE6E6E7FFDFDFE0FFD9D9DAFFD4D4D4FFC9CB
              CBFF939CA3FF273D5FFF203450FF313335FF636363FF616161D75A5F65170000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000057585A3B6262
              62F35F5F5FFF20252BFF253C5DFF354661FFBBBDBFFFCDCDCDFFD1D1D1FFD7D8
              D8FFDEDEDEFFE5E5E5FFEBEBEBFFF0F0F0FFF5F5F5FFF8F8F8FFFAFAFAFFFCFC
              FCFFCFD0D2FF9F9F9FFFB6B6B6FFBEBEBEFFBEBEBEFFA4A4A4FFABABABFFB7B7
              B7FFBFBFBFFFBCBCBCFFA3A3A4FFEAECEDFFFBFCFCFFFAFAFAFFF7F8F8FFF4F4
              F4FFEFEFEFFFE9EAEAFFE3E3E3FFDCDDDDFFD5D6D6FFD0D0D0FFCCCCCCFF8F96
              A0FF223959FF223651FF313335FF636363FF636363E361656B17000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000005758
              5A3B626262F35F5F5FFF21252BFF273E5DFF35455EFFB9BBBDFFCACBCBFFCECF
              CFFFD4D4D4FFDADADAFFE1E1E1FFE8E8E8FFEDEEEEFFF2F2F2FFF6F7F7FFF9F9
              F9FFCBCDCEFFB9B9B9FFE7E7E7FFDBDBDBFFD8D8D8FFADADADFFE3E3E3FFE5E5
              E5FFDADADAFFD6D6D6FFA4A4A5FFE9EAEBFFF8F9F9FFF5F6F6FFF2F2F2FFECED
              EDFFE6E6E6FFE0E0E0FFD8D9D9FFD3D3D3FFCDCDCDFFC9CACAFF90959FFF2339
              59FF243852FF313335FF636363FF717374FF7174785F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000057585A3B626262F35F5F5FFF21262BFF29415EFF35445DFFB9B9BCFFC9C9
              C9FFCDCDCDFFD1D1D1FFD8D8D8FFDEDEDEFFE5E5E5FFEBEBEBFFF0F0F0FFF5F5
              F5FFC6C7C9FFB7B7B7FFF2F2F2FFE7E7E7FFDBDBDBFFA8A8A8FFEAEAEAFFF0F0
              F0FFE3E3E3FFD7D7D7FF9D9D9DFFE5E6E8FFF4F4F4FFEFEFEFFFEAEAEAFFE3E3
              E3FFDDDDDDFFD6D6D6FFD0D0D0FFCBCBCBFFC8C8C8FF8F949DFF243958FF263A
              54FF313335FF636363FF747676FFB4C1C4FF777B7D5F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000057585A3B626262F35F5F5FFF22262CFF2B425FFF35435BFFB8B9
              BBFFC7C7C7FFCACACAFFCECECEFFD4D4D4FFDADADAFFE1E1E1FFE8E8E8FFEDED
              EDFFBFC0C1FFA7A7A7FFF3F3F3FFF1F1F1FFE6E6E6FFA5A5A5FFDBDBDBFFF7F7
              F7FFEEEEEEFFDFDFDFFF959595FFDFE0E1FFECECECFFE6E6E6FFDFDFDFFFD9D9
              D9FFD3D3D3FFCDCDCDFFC9C9C9FFC6C6C6FF8E939BFF213654FF283C55FF3133
              35FF636363FF777878FFD3DADBFFC3CFD2FF8083855F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000057585A3B626262F35F5F5FFF22272CFF2E4560FF313F
              56FFABADB0FFC5C5C5FFC7C7C7FFCBCBCBFFD0D0D0FFD6D6D6FFDDDDDDFFE4E4
              E4FFB5B6B7FF929292FFDBDBDBFFF0F0F0FFEFEFEFFFA4A4A4FFC4C4C4FFE5E5
              E5FFF2F2F2FFE7E7E7FF8E8E8EFFD7D8D8FFE3E3E3FFDCDCDCFFD5D5D5FFCFCF
              CFFFCACACAFFC7C7C7FFC5C5C5FF8C9199FF213452FF283D55FF313335FF6363
              63FF777879FFD5DEDEFFE1E8E9FFC8D2D5FF8A8D8E5F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000057585A3B626262F35F5F5FFF23272CFF2F46
              61FF29374EFFAAACAFFFC4C4C4FFC5C5C5FFC9C9C9FFCDCDCDFFD3D3D3FFD9D9
              D9FFB6B7B8FF808181FF848485FF878788FF89898AFF8A8B8BFF8A8A8BFF8989
              89FF868687FF838484FF8A8B8CFFCDCECEFFD8D8D8FFD1D1D1FFCCCCCCFFC8C8
              C8FFC5C5C5FFC3C3C3FF8B9098FF22344FFF2A3F57FF323335FF636363FF7779
              79FFD7DEDFFFE3EAEBFFE1E8E9FFC8D2D5FF9497975F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000057585A3B626262F35F5F5FFF2327
              2CFF2E445EFF253348FFAAABAEFFC2C2C2FFC3C3C3FFC6C6C6FFCACACAFFD0D0
              D0FFBFC0C1FFC5C6C7FFCBCBCDFFD0D1D2FFD3D4D6FFD6D6D8FFD5D6D8FFD3D4
              D5FFCFD0D1FFC9CACCFFC3C4C5FFC3C4C5FFCECECEFFC9C9C9FFC5C5C5FFC3C3
              C3FFC2C2C2FF8B8F96FF21344EFF2C4157FF323435FF636363FF767778FFD9DF
              E0FFE5ECECFFE5ECECFFE1E8E9FFC8D2D5FF9B9E9F5F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000005758593B626262F35F5F
              5FFF23282DFF30465FFF253145FFA9AAACFFC2C2C2FFC2C2C2FFC4C4C4FFC8C8
              C8FFCDCDCDFFD2D2D2FFD8D8D8FFDEDEDEFFE2E2E2FFE5E5E5FFE5E5E5FFE2E2
              E2FFDDDDDDFFD7D7D7FFD1D1D1FFCBCBCBFFC7C7C7FFC4C4C4FFC2C2C2FFC2C2
              C2FF777D85FF21344CFF2E4358FF323435FF636363FF727475FFC4CED0FFE6ED
              EEFFE6EDEEFFE6EDEEFFE1E8E9FFC8D2D5FFA0A3A45F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000005758593B6262
              62F35F5F5FFF24282DFF32485FFF253042FFA9AAACFFC2C2C2FFC2C2C2FFC3C3
              C3FFC6C6C6FFCACACAFFCFCFCFFFD3D3D3FFD7D7D7FFD9D9D9FFD9D9D9FFD6D6
              D6FFD2D2D2FFCDCDCDFFC9C9C9FFC5C5C5FFC2C2C2FFC1C1C1FFC2C2C2FF777B
              84FF1E3048FF2F4559FF323436FF636363FF616161D79CA1A3EBCFD8DBFFE8EF
              EFFFE8EFEFFFE8EFEFFFE1E8E9FFC8D2D5FFA3A6A75F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000005758
              593B626262F35F5F5FFF24292DFF334A60FF242F40FFA8AAACFFC1C1C1FFC1C1
              C1FFC2C2C2FFC4C4C4FFC7C7C7FFCACACAFFCCCCCCFFCECECEFFCECECEFFCCCC
              CCFFCACACAFFC6C6C6FFC3C3C3FFC1C1C1FFC1C1C1FFC1C1C1FF777B82FF1D2F
              45FF32475AFF323436FF636363FF616161D77C8084179FA4A6DFD0D9DCFFEAEF
              F0FFEAEFF0FFEAEFF0FFE1E8E9FFC8D2D5FFA4A7A75F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00005758593B626262F35F5F5FFF24292DFF344C60FF242E3DFF9A9C9EFFC1C1
              C1FFC0C0C0FFC1C1C1FFC2C2C2FFC4C4C4FFC6C6C6FFC6C6C6FFC6C6C6FFC5C5
              C5FFC3C3C3FFC2C2C2FFC1C1C1FFC0C0C0FFC1C1C1FF767A81FF19283DFF3247
              59FF333436FF636363FF616161D772767A1700000000A0A5A6DFD2DBDDFFEBF1
              F1FFEBF1F1FFEBF1F1FFE3E9EBFFC9D4D6FFA4A7A85F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000005758593B626262F35F5F5FFF25292DFF364D61FF1A2432FF999B
              9DFFC1C1C1FFC0C0C0FFC0C0C0FFC0C0C0FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
              C1FFC0C0C0FFC0C0C0FFC0C0C0FFC1C1C1FF76797FFF19283AFF33485AFF3334
              36FF636363FF616161D765696D170000000000000000A0A5A7DFD3DCDEFFEDF2
              F3FFEDF2F3FFEDF2F3FFE5EBECFFCAD4D8FFA5A8A85F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000005758593B626262F35F5F5FFF252A2EFF384E61FF1A22
              2FFF999B9DFFC1C1C1FFC0C0C0FFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBF
              BFFFBFBFBFFFBFBFBFFFC1C1C1FF75787EFF182638FF354A5BFF333436FF6363
              63FF616161D7575A5E17000000000000000000000000A1A6A8DFD5DDE0FFEFF3
              F3FFEFF3F3FFEFF3F3FFE6ECEDFFCCD6D9FFA5A8A95F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000005758593B626262F35F5F5FFF262A2EFF3A50
              61FF171E29FF999A9CFFC0C0C0FFBFBFBFFFBFBFBFFFBEBEBEFFBEBEBEFFBFBF
              BFFFBFBFBFFFC0C0C0FF74777CFF182635FF374C5CFF333536FF636363FF6161
              61D755595C1700000000000000000000000000000000A2A6A8DFD6DEE1FFF0F4
              F5FFF0F4F5FFF0F4F5FFE7EDEEFFCED6DAFFA6A9A95F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000005658593B626262F35F5F5FFF262B
              2EFF364A5BFF141B23FF999A9BFFC0C0C0FFBFBFBFFFBEBEBEFFBEBEBEFFBFBF
              BFFFC0C0C0FF64676BFF182432FF384E5DFF333536FF636363FF616161D75559
              5C170000000000000000000000000000000000000000A3A7A8DFD8E0E1FFF3F6
              F6FFF3F6F6FFF3F6F6FFEAEFEFFFCFD8DAFFA7A9AA5F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000005657583B626262F35F5F
              5FFF262B2EFF374C5BFF141920FF99999AFFC0C0C0FFBFBFBFFFBFBFBFFFC0C0
              C0FF5D6064FF18242FFF3A4F5DFF333536FF636363FF616161D755595C170000
              00000000000000000000000000000000000000000000A4A8A9DFDAE1E3FFF4F7
              F8FFF4F7F8FFF4F7F8FFECF0F1FFD1D9DCFFA6A8A95F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000005657583B6262
              62F35F5F5FFF272C2EFF384D5BFF13171CFF8C8D8DFFC1C1C1FFC1C1C1FF5D5F
              62FF131C26FF3B515FFF333536FF636363FF616161D755595C17000000000000
              00000000000000000000000000000000000000000000A5A8AADFDCE2E4FFF7F9
              F9FFF7F9F9FFF7F9F9FFEEF1F2FFD3DADEFFA5A8A85F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000005657
              583B626262F35F5F5FFF272C2FFF394E5BFF0B0E11FF888889FF5E5E60FF1018
              20FF3A4E5AFF333536FF636363FF616161D754585B1700000000000000000000
              00000000000000000000000000000000000000000000A8ABADDFE3E7EAFFFFFF
              FFFFFFFFFFFFFFFFFFFFF6F7F8FFDADFE3FFA4A7A75F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00005657583B626262F35F5F5FFF272C2FFF3B505BFF050709FF0F161CFF3B50
              5BFF343536FF636363FF616161D754575A170000000000000000000000000000
              000000000000000000000000000000000000000000009AA0A2DFC5D0D3FFDDE6
              E7FFDDE6E7FFDDE6E7FFD5DFE0FFBECACDFFA2A5A55F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000005657583B626262F35F5F5FFF282D2FFF3D535EFF3C515CFF3435
              36FF636363FF616161D754575917000000000000000000000000000000000000
              00000000000000000000000000000000000000000000989FA0DFC1CDD0FFD9E3
              E4FFD9E3E4FFD9E3E4FFD1DBDDFFBAC7CAFFA1A4A55F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000005657573B626262F35F5F5FFF272B2EFF343637FF6363
              63FF616161D75355571700000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000989FA0DFC1CDD0FFD9E3
              E4FFD9E3E4FFD9E3E4FFD1DBDDFFBAC7CAFF9FA3A45F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000005556573B626262F3606060FF636363FF6161
              61D74E5153170000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000909596DFAFB9BBFFC1C9
              CAFFC1C9CAFFC1C9CAFFBBC3C5FFA9B4B6FF9DA1A25F00000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000005657583B626262F3616161D75254
              5617000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000059595A3758595A170000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000}
            Proportional = True
            Stretch = True
          end
        end
        object Pag01: TTabSheet
          Caption = 'Totales'
          ImageIndex = 1
          object Label1: TLabel
            Left = 10
            Top = 64
            Width = 87
            Height = 19
            Caption = 'SUBTOTAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 10
            Top = 39
            Width = 103
            Height = 19
            Caption = 'DESCUENTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 10
            Top = 89
            Width = 77
            Height = 19
            Caption = 'SERVICIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 10
            Top = 114
            Width = 37
            Height = 19
            Caption = 'I.V.A.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 10
            Top = 139
            Width = 118
            Height = 19
            Caption = 'IMP. CONSUMO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 333
            Top = 14
            Width = 69
            Height = 19
            Caption = 'RETEIVA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 333
            Top = 38
            Width = 39
            Height = 19
            Caption = 'I.C.A.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 333
            Top = 63
            Width = 46
            Height = 19
            Caption = 'CREE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 333
            Top = 115
            Width = 52
            Height = 19
            Caption = 'TOTAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 693
            Top = 97
            Width = 69
            Height = 19
            Caption = 'SODEXO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 693
            Top = 74
            Width = 70
            Height = 19
            Caption = 'CHEQUE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 693
            Top = 52
            Width = 148
            Height = 19
            Caption = 'TARJETA CREDITO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 693
            Top = 30
            Width = 136
            Height = 19
            Caption = 'TARJETA DEBITO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 693
            Top = 8
            Width = 81
            Height = 19
            Caption = 'EFECTIVO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 693
            Top = 120
            Width = 83
            Height = 19
            Caption = 'CORTESIA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 693
            Top = 144
            Width = 79
            Height = 19
            Caption = 'CARTERA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object VALOR_SUBTOTAL: TDBText
            Left = 137
            Top = 61
            Width = 166
            Height = 17
            Alignment = taRightJustify
            DataField = 'VALOR_SUBTOTAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object VALOR_DESCUENTO: TDBText
            Left = 137
            Top = 35
            Width = 166
            Height = 17
            Alignment = taRightJustify
            DataField = 'VALOR_DESCUENTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object VALOR_SERVICIO: TDBText
            Left = 137
            Top = 86
            Width = 166
            Height = 17
            Alignment = taRightJustify
            DataField = 'VALOR_SERVICIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object VALOR_IVA: TDBText
            Left = 137
            Top = 112
            Width = 166
            Height = 17
            Alignment = taRightJustify
            DataField = 'VALOR_IVA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object VALOR_IMPCONSUMO: TDBText
            Left = 137
            Top = 138
            Width = 166
            Height = 17
            Alignment = taRightJustify
            DataField = 'VALOR_IMPCONSUMO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object VALOR_RETEIVA: TDBText
            Left = 497
            Top = 12
            Width = 165
            Height = 17
            Alignment = taRightJustify
            DataField = 'VALOR_RETEIVA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object VALOR_ICA: TDBText
            Left = 497
            Top = 35
            Width = 165
            Height = 17
            Alignment = taRightJustify
            DataField = 'VALOR_ICA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object VALOR_CREE: TDBText
            Left = 497
            Top = 62
            Width = 165
            Height = 17
            Alignment = taRightJustify
            DataField = 'VALOR_CREE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object VALOR_TOTAL: TDBText
            Left = 497
            Top = 113
            Width = 165
            Height = 17
            Alignment = taRightJustify
            DataField = 'VALOR_TOTAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object EFE: TDBText
            Left = 841
            Top = 8
            Width = 141
            Height = 17
            Alignment = taRightJustify
            DataField = 'EFE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object TDD: TDBText
            Left = 841
            Top = 31
            Width = 141
            Height = 17
            Alignment = taRightJustify
            DataField = 'TDD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object TDC: TDBText
            Left = 841
            Top = 54
            Width = 141
            Height = 17
            Alignment = taRightJustify
            DataField = 'TDC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object CHE: TDBText
            Left = 841
            Top = 77
            Width = 141
            Height = 17
            Alignment = taRightJustify
            DataField = 'CHE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object SDX: TDBText
            Left = 841
            Top = 100
            Width = 141
            Height = 17
            Alignment = taRightJustify
            DataField = 'SDX'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object COR: TDBText
            Left = 841
            Top = 123
            Width = 141
            Height = 17
            Alignment = taRightJustify
            DataField = 'COR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object CAR: TDBText
            Left = 841
            Top = 146
            Width = 141
            Height = 17
            Alignment = taRightJustify
            DataField = 'CAR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 333
            Top = 89
            Width = 83
            Height = 19
            Caption = 'DOMICILIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object VALOR_DOMICILIO: TDBText
            Left = 497
            Top = 88
            Width = 165
            Height = 17
            Alignment = taRightJustify
            DataField = 'VALOR_DOMICILIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 333
            Top = 139
            Width = 152
            Height = 19
            Caption = 'TOTAL + DOMICILIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object TOTAL_CON_DOMICILIO: TDBText
            Left = 497
            Top = 137
            Width = 165
            Height = 17
            Alignment = taRightJustify
            DataField = 'TOTAL_CON_DOMICILIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object Label20: TLabel
            Left = 10
            Top = 14
            Width = 116
            Height = 19
            Caption = 'VALOR INICIAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object VALOR_BRUTO: TDBText
            Left = 137
            Top = 10
            Width = 166
            Height = 17
            Alignment = taRightJustify
            DataField = 'VALOR_BRUTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
        end
        object Pag02: TTabSheet
          Caption = 'Discriminados'
          ImageIndex = 2
          object DISCRIMINADOS: TDBMemo
            Left = 0
            Top = 0
            Width = 1136
            Height = 197
            Align = alClient
            Alignment = taCenter
            Color = clBlack
            DataField = 'DISCRIMINADOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clLime
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 208
      Width = 1186
      Height = 161
      Align = alClient
      TabOrder = 1
      object GridDetalle: TDBGrid
        Left = 1
        Top = 1
        Width = 1184
        Height = 159
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        OnColExit = GridDetalleColExit
        OnExit = GridDetalleExit
        OnKeyPress = GridDetalleKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'FECHA_TRM'
            Title.Caption = 'Fecha(TRM)'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TRM'
            Title.Caption = 'Valor(TRM)'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_PRODUCTO'
            ReadOnly = True
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 135
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
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DETALLEOBSERVACION'
            Title.Caption = 'Observaci'#243'n'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANTIDAD'
            Title.Caption = 'Cantidad'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_ORIGINAL'
            Title.Caption = 'Valor Original'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_CALCULADO'
            ReadOnly = True
            Title.Caption = 'Vlr. Calculado'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_UNITARIO'
            ReadOnly = True
            Title.Caption = 'Vlr. Unitario'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_SUBTOTAL'
            ReadOnly = True
            Title.Caption = 'Subtotal'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            ReadOnly = True
            Title.Caption = 'Total'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_TRM'
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
    end
  end
  object PnlVendedor: TPanel
    Left = 0
    Top = 228
    Width = 1188
    Height = 27
    Align = alTop
    TabOrder = 3
    object BtnElegirVendedor: TSpeedButton
      Left = 1
      Top = 1
      Width = 120
      Height = 25
      Align = alLeft
      Caption = 'Elegir Vendedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = BtnElegirVendedorClick
      ExplicitLeft = -5
      ExplicitHeight = 33
    end
    object lbNombre_Vendedor: TLabel
      Left = 121
      Top = 1
      Width = 288
      Height = 25
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = 'lbNombre_Vendedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object lbVuelto: TLabel
      Left = 1112
      Top = 1
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'lbVuelto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 1116
      ExplicitHeight = 22
    end
    object DOCUMENTO_COMANDA: TDBComboBox
      Left = 409
      Top = 1
      Width = 214
      Height = 24
      Style = csDropDownList
      Align = alLeft
      DataField = 'DOCUMENTO_COMANDA'
      TabOrder = 0
      OnChange = DOCUMENTO_COMANDAChange
      OnClick = DOCUMENTO_COMANDAClick
    end
  end
end
