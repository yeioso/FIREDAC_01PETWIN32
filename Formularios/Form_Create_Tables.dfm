object FrForm_Create_Tables: TFrForm_Create_Tables
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Creaci'#243'n de Tablas'
  ClientHeight = 332
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 518
    Height = 291
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 522
    ExplicitHeight = 292
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 107
      Height = 16
      Align = alTop
      Caption = 'Lista de archivos'
      FocusControl = pfArchivos
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbInformacion: TLabel
      Left = 1
      Top = 262
      Width = 65
      Height = 13
      Align = alBottom
      Caption = 'lbInformacion'
    end
    object pfArchivos: TCheckListBox
      Left = 1
      Top = 23
      Width = 520
      Height = 239
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 19
      ParentFont = False
      TabOrder = 0
    end
    object Progreso: TProgressBar
      Left = 1
      Top = 274
      Width = 516
      Height = 16
      Align = alBottom
      Step = 1
      TabOrder = 1
      ExplicitTop = 275
      ExplicitWidth = 520
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 291
    Width = 518
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 292
    ExplicitWidth = 522
    object BtnCrear: TSpeedButton
      Left = 1
      Top = 1
      Width = 150
      Height = 39
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Crear tablas'
      Flat = True
      Glyph.Data = {
        720C0000424D720C0000000000003600000028000000240000001D0000000100
        1800000000003C0C000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF
        FFFFFFFF0000000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000000000
        00000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000007F7F7FBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBF7F7F7F000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000007F
        7F7FBFBFBFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFBFBFBF7F7F7F000000FFFFFFFF
        FFFFFFFFFFFFFFFF0000007F7F7FBFBFBFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F
        FFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFF7F7F7F7F7F7F7F7F
        7F7F7F7FFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFBF
        BFBF7F7F7F000000FFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FBFBFBFBFBFBF
        7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBF
        BFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7FBFBFBFBFBFBF7F7F7F000000FFFFFFFFFFFFFFFFFFFFFFFF
        0000007F7F7FBFBFBFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBF
        BFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFF
        FFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFBFBFBF7F7F7F000000
        FFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FBFBFBFFFFFFFBFBFBFBFBFBFBFBF
        BFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBF
        BFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        FFFFFFBFBFBF7F7F7F000000FFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FBFBF
        BFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F
        7F7FBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF7F7F7F000000FFFFFFFFFFFFFFFF
        FFFFFFFF0000007F7F7FBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBF
        BFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F
        BFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF7F7F
        7F000000FFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FBFBFBFFFFFFFBFBFBFBF
        BFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFF
        BFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFFFFFFFBFBFBF7F7F7F000000FFFFFFFFFFFFFFFFFFFFFFFF0000007F
        7F7FBFBFBFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFBFBFBF7F7F7F000000FFFFFFFF
        FFFFFFFFFFFFFFFF0000007F7F7FBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F
        BFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF7F7F7F7F7F7F7F7F
        7F7F7F7FBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBF
        BFBF7F7F7F000000FFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FBFBFBFBFBFBF
        7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBF
        BFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7FBFBFBFBFBFBF7F7F7F000000FFFFFFFFFFFFFFFFFFFFFFFF
        0000007F7F7FBFBFBFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBF
        BFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFF
        FFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFBFBFBF7F7F7F000000
        FFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FBFBFBFFFFFFFBFBFBFBFBFBFBFBF
        BFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBF
        BFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        FFFFFFBFBFBF7F7F7F000000FFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FBFBF
        BFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F
        7F7FBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF7F7F7F000000FFFFFFFFFFFFFFFF
        FFFFFFFF0000007F7F7FBFBFBFFFFFFF7F7F7F0080800080807F7F7FBFBFBFFF
        FFFF7F7F7F0080800080807F7F7FBFBFBFFFFFFF7F7F7F0080800080807F7F7F
        BFBFBFFFFFFF7F7F7F0080800080800080800080807F7F7FBFBFBFBFBFBF7F7F
        7F000000FFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FBFBFBFFFFFFFBFBFBFBF
        BFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFF
        BFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFFFFFFFBFBFBF7F7F7F000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
        00007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F800000000000FFFFFFFF
        FFFFFFFFFFFFFFFF000000000000800000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000800000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000800000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000800000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
        0000000000007F7F7FBFBFBFBFBFBF7F7F7FFF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF00007F7F7FBFBFBFBFBFBF7F7F7F000000000000
        FFFFFFFFFFFFFFFFFFFFFFFF0000000000007F7F7F7F7F7F7F7F7F7F7F7F8000
        0080000080000080000080000080000080000080000080000080000080000080
        00008000008000008000008000008000008000008000008000007F7F7F7F7F7F
        7F7F7F7F7F7F000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
        0000808000808000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000008080008080000000000000000000FFFFFFFFFFFFFFFF
        FFFFFFFF00000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = BtnCrearClick
    end
    object BtnSalir: TSpeedButton
      Left = 371
      Top = 1
      Width = 150
      Height = 39
      Cursor = crHandPoint
      Align = alRight
      Caption = 'Salir'
      Flat = True
      Glyph.Data = {
        2E0A0000424D2E0A00000000000036000000280000001D0000001D0000000100
        180000000000F809000000000000000000000000000000000000DCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCE1DFDBDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCC8CEC67C817761675B6F846B687C69677B6B66796C697A706C
        7B726D7A71737970767A6D7C796C7E786A62827059806B577E69587E6B5C7A6A
        6C7D72DCDCDCDED8D600DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA8
        B4AC354039535F5B225A371A5936185835175A3A155A3D145A411558441B5942
        1F5B3D245C39295A33295E3C205A381D5839255C3F27533C2E4A39DCDCDCDEDD
        D900DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCB3BEBC6E797FDEEBF1
        78AA90629C7837784E347C522F7E573182602B7E6130806232815A328352398A
        504082573B82583A815942836144775C486A55DCDCDCDCDCDC00DCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCB8C1C65B6587FCFFFFD7ECE8B8D4C389AB
        8E55855B326C412665402B6D4E2E7354276F4735834C1F72323079472A764A27
        74492E755030684B476D55DCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCC3CAD52C3370898CD2FFFFFFE0ECF9E3F6F0BEDDC090B78F5A
        886536684D2A60462668462F79462272372B76452974472771472C734F2F6749
        496C56DCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCCD
        D1E125297F2A25A5A18DCFFFF8FFF8F1FEEDEEE8EBEED8D3D8C3A3AA9D647269
        3953413C604138663C286B40276D40266B432B6C482D6145476654DCDCDCDCDC
        DC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCC3C6DC3B38A7382AC6
        3730A76D6AB5F3F4FFEAEDF2EAE8DBEBE3D9E0D6D7D7D2D8A0A8A74D64573256
        3B27613826663D25633E2A65442D5A3F476352DCDCDCDCDCDC00DCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCECECE34E44BF0B00A41B36C918349F4865
        A3EAFFFFDFEEE5C6CBCACECED4B8BDC9D0E0E8D2F1F05E87791149262C643D27
        613F2F64452F5A414B6356DCDCDCDCDCDC00494D880000450000790000710000
        700000760000760000901F21C81719D00800CA180CDC160AC32829AEB3C3F9CE
        E5EEB2C4C6C3C4D0A498ADFFF2FF86736E0C4F292659352B5939185B3A135536
        3E644BDCDCDCDCDCDC00817BCB2811D6382BFF2E2CF4292AEE2B25F53127F82C
        25E92C27EB1410D80000C10C06D91512D11B1CBB333BA796A4DEC5D4F0B6C2CD
        B0B2B6F2E9ED8B807F03401F2356322954351858361051313C614BDCDCDCDCDC
        DC007C71C80B00CB0700DB0000CB0000C80000D00000D50000CB0700D20000C0
        0408E20000CD0105C5191CD22322C33638B1828CCDB3C3D1A6B6A9ECF0EC8282
        8A003817224F2F254F311555320F4E303E5E49DCDCDCDCDCDC007A75C71601D8
        1108F1040CE20612DC040AE30B07ED0D07E31713DB0C0ECB010EE3050EDC040F
        DD0B09DB1D14DA2E28C62F368C8295A2A2B9A4E8F4E97E7F8C00301420492C24
        4B2F134F310E4A2D3E5D48DCDCDCDCDCDC007878C51C0AD81D16FB0C1BE71127
        E51A25F12B28FB2F2BF93635F43438EA192BF7222FF71C20F1231AF42C22E638
        31C74247968C9EA8ADC2AEE3EDE784839700270A1F432821442C11482C0B4529
        3C5B46DCDCDCDCDCDC007772C7210ADA3228FF2432F82A3EFB3038FE3934FE39
        30FD413CFF4240FE3745FF3235FF4039FE493CFB493FDD5452B89EA5D2ABB9BC
        A7B0ABF0F0F78E889C001C021F40291E3D270D4228083F243C5A46DCDCDCDCDC
        DC007D74C5341EDC584DFF474FFF4A54FF4A4BFF4E48FF4C43FF584FFF3F37FE
        3B41F23E38FE5343FF4C3CDE5F5BC2A5AAD2D6DFE590949548494CDBD4E18E84
        95001702213E2A1B36220B3B240537203E5846DCDCDCDCDCDC00726DA7170A89
        3835B73038AF343AB02F30AF3435B43132BA4341D94840FF3737D8554CF14B3B
        D9645AC4B8BBDFD5DFD9D7DDCDC3BFBF2019258F8594A198A4000B001F372718
        2F1E08341F03321C3E5445DCDCDCDCDCDC00D1D3E2B2B0C9BABAD3B8BDD3B9BE
        D4B7B9D2C5C4D9909ABE3F44B94139EC5F5DE4423EB76862BEC7C7F1E0E8EAD5
        DECCD4D6C6C8C1C5726978CBC2CF9491970004001F3124162B1C05311E002F1A
        3D5244DCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCBE
        CAD1484FB26C5EFF1F1C9E6D72C3D6E4FFE2F2F3D3DCCFD8D9D4CBC7CCCFC9CF
        AAA9AFEEF0F399A1A1000000182C20132419042B19002C183C5242DCDCDCDCDC
        DC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCC0CCCE5B5BC5000090
        7473EAE5F5FFE6FFF8D6F0D5DBE8D7D1CDD8C8C2D8BFBDC6AFB3B0F1FAF37A89
        8700000013271D122114032919002614394F3EDCDCDCDCDCDC00DCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDBD3DB1A0D2CB6A6D5FFFFFFE8F0F7E4EA
        E9DFE5E2D2D7D8CED5D5D0D6D4BDC4C3A8ADACE4EAE9969C9A0000000B1F1308
        190E04190B0A1D10414E42DCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCCCC6CC6D6281FFFFFFE4ECEBE9EFE8E8EDEBDFE5E5D3D9D9CB
        D1D0C8CECDBDC3C2AAB1AFE7ECEC949C9A000000081B1104170A02160905180B
        3B4B3FDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCBC
        B9BD736A83F5EDFFE8EFEEE7EFEBE8EDEDDFE5E4D4DAD9CFD6D5CCD2D1C0C6C5
        ACB2B1E4E9E8949E9B00000003150B0010050212060315073A4A3DDCDCDCDCDC
        DC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCBAB8BB76727CF2EDFF
        EBEFEDE8EFECE8EDECE0E5E4D6DBDAD2D7D6CACFCEBBC0BFA6AAA9DCE0DF929A
        98000000010F06000C04000E0302110539493DDCDCDCDCDCDC00DCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCC1C0C16D6B6FF9F8FEEBEDEBE6EDEBE9EE
        EDE5EAE9DADFDECCD1D1B9BEBDA4A8A88A908FBEC4C274787900000000060000
        0600000801000C0336463BDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCC5C6C46B6B68F9F9F7F0F2F2F7FBFBF7F9F9DDE0E0BCC0C0A3
        A6A69093928386867277769B9F9D616465000000000100000300000501010C05
        39483EDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCBF
        C1BD70736DFFFFFFF0F1F4D8DADAB2B3B38789896B6C6D606161595A5A565757
        494B4B5B5C5C383A3A0000000000000000000000000000002D3530DCDCDCDCDC
        DC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCC4C4C450514E777674
        7474764E4E4E3434342F2F2F2C2D2D2D2D2D2929292E2D2D2626262B2C2C1D1F
        1F131212181818111312121612070B072B352FDCDCDCDCDCDC00DCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCF2F3F2C4C5C3DCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00}
      OnClick = BtnSalirClick
      ExplicitLeft = 266
    end
  end
end
