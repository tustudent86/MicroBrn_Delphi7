object OscCalFm: TOscCalFm
  Left = 278
  Top = 318
  BorderStyle = bsDialog
  Caption = 'Kitsrus.com OSCAL'
  ClientHeight = 137
  ClientWidth = 353
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 7
    Top = 7
    Width = 251
    Height = 125
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 100
      Top = 20
      Width = 65
      Height = 13
      Caption = 'OSCAL Value'
    end
    object RetlwLab: TLabel
      Left = 195
      Top = 20
      Width = 16
      Height = 13
      Caption = '0C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BandGapLabel: TLabel
      Left = 101
      Top = 47
      Width = 43
      Height = 13
      Caption = 'Bandgap'
    end
    object OscEdit: TEdit
      Left = 216
      Top = 17
      Width = 33
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      Text = 'FF'
      OnKeyPress = OscEditKeyPress
    end
    object OKbutt: TBitBtn
      Left = 94
      Top = 89
      Width = 75
      Height = 25
      TabOrder = 1
      OnClick = OKbuttClick
      Kind = bkOK
    end
    object CanButt: TBitBtn
      Left = 175
      Top = 89
      Width = 75
      Height = 25
      TabOrder = 2
      Kind = bkCancel
    end
    object BGedit: TEdit
      Left = 216
      Top = 44
      Width = 33
      Height = 21
      MaxLength = 2
      TabOrder = 3
      Text = '11'
      OnKeyPress = BGeditKeyPress
    end
    object ReadButt: TBitBtn
      Tag = 200
      Left = 14
      Top = 89
      Width = 74
      Height = 25
      Hint = 'Read chip'
      Caption = '&Read'
      TabOrder = 4
      OnClick = ReadButtClick
      Glyph.Data = {
        36010000424D3601000000000000760000002800000012000000100000000100
        040000000000C0000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777780
        000077000000777777777087778007000000777777778877F778000000007700
        0000077F7777800000007FFFFFFF07F77777800000007F0F000007777FF78000
        00007FFFFFFF08777FF8800000007F0F000000877788080000007FFFFFFFF008
        8880070000007F0F00000F000008770000007FFFFFFFFF077777770000007F0F
        44444F077777770000007FFFFFFFFF077777770000007F0000000F0777777700
        00007FFFFFFFFF77777777000000777777777777777777000000}
    end
  end
  object Panel2: TPanel
    Left = 257
    Top = 7
    Width = 90
    Height = 125
    BevelOuter = bvLowered
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 6
      Top = 89
      Width = 75
      Height = 25
      HelpContext = 6
      TabOrder = 0
      Kind = bkHelp
    end
  end
  object Panel3: TPanel
    Left = 257
    Top = 8
    Width = 4
    Height = 123
    BevelOuter = bvNone
    TabOrder = 2
  end
end
