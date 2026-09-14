object DebugFm: TDebugFm
  Left = 406
  Top = 305
  BorderStyle = bsDialog
  Caption = 'Kitsrus.com DEBUG Vector'
  ClientHeight = 121
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 294
    Height = 121
    Align = alClient
  end
  object Label1: TLabel
    Left = 95
    Top = 24
    Width = 45
    Height = 13
    Caption = 'GOTO 0x'
  end
  object Bevel1: TBevel
    Left = 16
    Top = 64
    Width = 267
    Height = 41
  end
  object DbEdit: TEdit
    Left = 159
    Top = 20
    Width = 41
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 4
    TabOrder = 0
    Text = '0000'
    OnKeyPress = DbEditKeyPress
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 72
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 112
    Top = 72
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object BitBtn3: TBitBtn
    Left = 200
    Top = 72
    Width = 75
    Height = 25
    HelpContext = 4
    TabOrder = 3
    Kind = bkHelp
  end
end
