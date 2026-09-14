object EditFm: TEditFm
  Left = 384
  Top = 191
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Kitsrus.com Chip Editor'
  ClientHeight = 286
  ClientWidth = 224
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ChipGrid: TStringGrid
    Left = 0
    Top = 0
    Width = 225
    Height = 252
    ColCount = 2
    RowCount = 10
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goThumbTracking]
    ScrollBars = ssVertical
    TabOrder = 0
    OnDblClick = ChipGridDblClick
    OnSelectCell = ChipGridSelectCell
    ColWidths = (
      135
      67)
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object ChipMemo: TMemo
    Left = 700
    Top = 16
    Width = 185
    Height = 89
    Lines.Strings = (
      'CHIPname=16F84A'
      'Kitsrus.com=2'
      'ProgramMode=0'
      'PowerSequence=VccVpp1'
      'ProgramDelay=0050'
      'CoreType=5'
      'ROMsize=0400'
      'EEPROMsize=0040'
      'FUSEblank=3FFF'
      'CPwarn=N'
      'CALword=N'
      'ChipID=0560'
      'LIST1 FUSE1 "WDT" "Enabled"=3FFF "Disabled"=3FFB'
      'LIST2 FUSE1 "PWRTE" "Disabled"=3FFF "Enabled"=3FF7'
      'LIST3 FUSE1 "Oscillator" "RC"=3FFF "HS"=3FFE "XT"=3FFD "LP"=3FFC'
      'LIST4 FUSE1 "Code Protect" "Disabled"=3FFF "Enabled"=000F')
    TabOrder = 1
    WordWrap = False
  end
  object BitBtn1: TBitBtn
    Left = 128
    Top = 258
    Width = 75
    Height = 25
    HelpContext = 2
    TabOrder = 2
    Kind = bkHelp
  end
  object BitBtn2: TBitBtn
    Left = 22
    Top = 258
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    Kind = bkCancel
  end
end
