object EditCodeFm: TEditCodeFm
  Left = 306
  Top = 226
  BorderStyle = bsDialog
  Caption = 'Kitsrus.com Code Editor'
  ClientHeight = 303
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 73
    Top = 8
    Width = 25
    Height = 13
    Caption = 'ROM'
  end
  object Label2: TLabel
    Left = 208
    Top = 8
    Width = 46
    Height = 13
    Caption = 'EEPROM'
  end
  object SpeedButton1: TSpeedButton
    Left = 24
    Top = 272
    Width = 75
    Height = 25
    Caption = '&OK'
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000C40E0000C40E00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888844888888888888842248888888888842222488888888842222224888
      88884222A22224888888222A8A2224888888A2A888A2224888888A88888A2224
      888888888888A2224888888888888A2224888888888888A2224888888888888A
      2224888888888888A2248888888888888A2288888888888888A8}
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 116
    Top = 272
    Width = 75
    Height = 25
    Caption = '&Cancel'
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000C40E0000C40E00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00887788888888
      8888891178888897888889111788891178888911117891111788889111171111
      1788888911111111788888889111111788888888811111788888888889111178
      8888888891111178888888891117111788888891117891117888889117888911
      1788888918888891118888888888888919888888888888888888}
    OnClick = SpeedButton2Click
  end
  object ROMGrid: TStringGrid
    Left = 8
    Top = 24
    Width = 150
    Height = 232
    ColCount = 2
    DefaultRowHeight = 18
    RowCount = 20
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goThumbTracking]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnKeyPress = ROMGridKeyPress
    OnSelectCell = ROMGridSelectCell
  end
  object EEPROMGrid: TStringGrid
    Left = 160
    Top = 24
    Width = 150
    Height = 232
    ColCount = 2
    DefaultRowHeight = 18
    RowCount = 20
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goThumbTracking]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    OnKeyPress = EEPROMGridKeyPress
    OnSelectCell = EEPROMGridSelectCell
  end
  object BitBtn1: TBitBtn
    Left = 416
    Top = 160
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 272
    Width = 75
    Height = 25
    HelpContext = 1
    TabOrder = 3
    Kind = bkHelp
  end
end
