object PortFm: TPortFm
  Left = 269
  Top = 258
  BorderStyle = bsDialog
  Caption = 'Kitsrus.com Serial Port Change'
  ClientHeight = 117
  ClientWidth = 258
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
  object Bevel1: TBevel
    Left = 6
    Top = 8
    Width = 245
    Height = 103
  end
  object Label1: TLabel
    Left = 39
    Top = 29
    Width = 77
    Height = 13
    Caption = 'Enter Port Value'
  end
  object PortEdit: TEdit
    Left = 183
    Top = 25
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
    OnKeyPress = PortEditKeyPress
  end
  object BitBtn1: TBitBtn
    Left = 35
    Top = 74
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 147
    Top = 74
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end
