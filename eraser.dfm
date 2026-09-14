object EraseFm: TEraseFm
  Left = 284
  Top = 246
  BorderStyle = bsDialog
  Caption = 'kitsrus.com Erase'
  ClientHeight = 122
  ClientWidth = 296
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 8
    Top = 8
    Width = 281
    Height = 105
  end
  object Echeck: TRadioButton
    Left = 51
    Top = 32
    Width = 89
    Height = 17
    Caption = 'Erase Check'
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object Echip: TRadioButton
    Left = 163
    Top = 32
    Width = 81
    Height = 17
    Caption = 'Erase Chip'
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 22
    Top = 80
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 110
    Top = 80
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object BitBtn3: TBitBtn
    Left = 198
    Top = 80
    Width = 75
    Height = 25
    HelpContext = 3
    TabOrder = 4
    Kind = bkHelp
  end
end
