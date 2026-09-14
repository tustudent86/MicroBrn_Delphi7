unit prog40;
{$H+} {$R+} {$Q+}
interface
uses Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, Menus, ImgList, Serial2;
type
  TProjFm = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Timer1: TTimer;
    SocketImage: TImage;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Serial1: TSerial;
    Bevel2: TBevel;
    StatusLabel: TLabel;
    Panel2: TPanel;
    CodeScroll: TScrollBar;
    CodeImage: TImage;
    Bevel1: TBevel;
    ComLabel: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Programmer1: TMenuItem;
    Options1: TMenuItem;
    Help1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Program1: TMenuItem;
    Read1: TMenuItem;
    Verify1: TMenuItem;
    Blank1: TMenuItem;
    OSCAL1: TMenuItem;
    Cancel1: TMenuItem;
    Edit1: TMenuItem;
    FuseValue1: TMenuItem;
    Bevel4: TBevel;
    ICSPLabel: TLabel;
    ReadChipID1: TMenuItem;
    N2: TMenuItem;
    Port1: TMenuItem;
    Reset1: TMenuItem;
    Contents1: TMenuItem;
    ProgressBar1: TProgressBar;
    Bevel3: TBevel;
    SerialOff1: TMenuItem;
    FlyWindow1: TMenuItem;
    AutoUpdateFiles1: TMenuItem;
    Merge1: TMenuItem;
    Bevel5: TBevel;
    ICSPMode1: TMenuItem;
    AutoProgram: TMenuItem;
    AutoLabel: TLabel;
    IgnoreBlankCheck1: TMenuItem;
    Panel4: TPanel;
    Image12: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    ChipSelect: TComboBox;
    Label1: TLabel;
    CanButt: TBitBtn;
    ImageList1: TImageList;
    ProgrammerStyle1: TMenuItem;
    K1281: TMenuItem;
    K149A: TMenuItem;
    K149BF: TMenuItem;
    K1501: TMenuItem;
    ResetPolarity1: TMenuItem;
    Positive1: TMenuItem;
    Negative1: TMenuItem;
    About1: TMenuItem;
    Version1: TMenuItem;
    EditHEXCode1: TMenuItem;
    CalOptions1: TMenuItem;
    ErrorMessage1: TMenuItem;
    InsertOriginalIntoFile1: TMenuItem;
    InsertFileIntoOriginal1: TMenuItem;
    N3: TMenuItem;
    DebugVector1: TMenuItem;
    ReadDebug: TMenuItem;
    WriteDebug: TMenuItem;
    DevList1: TMenuItem;
    TimeLabel: TLabel;
    Timer2: TTimer;
    Refresh1: TMenuItem;
    ClipBoardEdit: TEdit;
    ButtonPanel: TPanel;
    Image11: TImage;
    Image20: TImage;
    Image7: TImage;
    Image10: TImage;
    ProgButt: TBitBtn;
    ReadButt: TBitBtn;
    VerfButt: TBitBtn;
    BlankButt: TBitBtn;
    LoadButt: TBitBtn;
    SaveButt: TBitBtn;
    OscalButt: TBitBtn;
    FuseButt: TBitBtn;
    RecentFiles1: TMenuItem;
    RecentFile1: TMenuItem;
    RecentFile2: TMenuItem;
    RecentFile3: TMenuItem;
    RecentFile4: TMenuItem;
    Clear1: TMenuItem;
    N4: TMenuItem;
    RefreshButt: TBitBtn;
    MergeButt: TBitBtn;
    Bevel6: TBevel;
    Bevel7: TBevel;
    EepLineMode: TMenuItem;
    N5: TMenuItem;
    ReadCalibrationWords1: TMenuItem;
    K1821: TMenuItem;
    MPLABmenu: TMenuItem;
    Start1: TMenuItem;
    Path1: TMenuItem;
    OpenDialog2: TOpenDialog;
    K1701: TMenuItem;
    function SyntaxCheckChipList: Integer;
    procedure Extractchipdata;
    function ExecuteStartupProcedures: Boolean;
    function ActivateSerialPort(PortNumber: Integer): Boolean;
    function LoadMultipleHexFiles: Boolean;
    procedure AutoProgramClick(Sender: TObject);
    procedure DevList1Click(Sender: TObject);
    procedure WriteDebugClick(Sender: TObject);
    procedure ReadCalibrationWords1Click(Sender: TObject);
    function SetParity(Value: Integer): Integer;
    procedure UpdateFuses1214;
    procedure SetOscalFmValues(CheckValue: Boolean);
    function SetCalibrationValues: Boolean;
    function CheckOscalValue: Boolean;
    procedure FuseButtClick(Sender: TObject);
    procedure FuseValue1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure EditHEXCode1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure SetProgramVersion(Model: Integer; Reload: Boolean);
    procedure DrawTheSocket;
    procedure PasteThePicture(ResourceName: PChar);
    procedure DisplayCodeLines;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function CheckAndLoadChipData: Boolean;
    procedure UpdateFuses16;
    procedure CreateFuseValueFromFuseEdits;
    procedure SaveButtClick(Sender: TObject);
    function DoLoadProcedure(Merge: Boolean; FileName: AnsiString): Boolean;
    function LoadTheHexFile(FileName: AnsiString): Boolean;
    procedure SelectTheChip;
    procedure CreateCodeData;
    function ScanHexFile: Integer;
    function NewExtractROMData: Integer;
    function NewExtractEEPROMData: Integer;
    function NewExtractIDData: Integer;
    function NewExtractFuseData: Integer;
    function SaveINHX8MFile: Boolean;
    function SaveINHX32File: Boolean;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function FileSaveQuery(AllowCancel: Boolean): Boolean;
    function IsChipSelected: Boolean;
    function CheckButtonsAllow(RequireChip: Boolean): Boolean;
    procedure DisableUserButtons;
    procedure DrawBlankSocket;
    procedure CodeScrollChange(Sender: TObject);
    procedure PreSelectChip;
    procedure ChipSelectChange(Sender: TObject);
    procedure Positive1Click(Sender: TObject);
    procedure Negative1Click(Sender: TObject);
    procedure Reset1Click(Sender: TObject);
    procedure FlyWindow1Click(Sender: TObject);
    procedure ICSPMode1Click(Sender: TObject);
    procedure IgnoreBlankCheck1Click(Sender: TObject);
    procedure K1281Click(Sender: TObject);
    procedure K149aClick(Sender: TObject);
    procedure K149BFClick(Sender: TObject);
    procedure K1501Click(Sender: TObject);
    procedure K1701Click(Sender: TObject);
    procedure K1821Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure CodeImageDblClick(Sender: TObject);
    procedure ErrorMessage1Click(Sender: TObject);
    procedure InsertOriginalIntoFile1Click(Sender: TObject);
    procedure InsertFileIntoOriginal1Click(Sender: TObject);
    procedure SetCalInsertStyle;
    procedure ReadDebugClick(Sender: TObject);
    procedure AutoUpdateFiles1Click(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure EepLineModeClick(Sender: TObject);
    procedure CodeScrollEnter(Sender: TObject);
    procedure CodeScrollExit(Sender: TObject);
    procedure Start1Click(Sender: TObject);
    procedure Path1Click(Sender: TObject);
    procedure Serial1RxData(Sender: TObject);
    procedure SetProgrammingDataSize;
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure Timer2Timer(Sender: TObject);
    procedure SetTheCurrentDirectory;
    procedure Merge1Click(Sender: TObject);
    procedure LoadButtClick(Sender: TObject);
    procedure ResetCodeMemory(PreserveData, FillBlank, ClearFileList: Boolean);
    procedure SetCaption;
    function CheckFileNames(RemainingPaths: AnsiString): Boolean;
    function FindChipCBText(ChipName: AnsiString): Integer;
    function VerifyString(InputText: AnsiString): AnsiString;
    function TrimSpaces(InputText: AnsiString): AnsiString;
    function ExtractNextWord(var RemainingText: AnsiString): AnsiString;
    function ExtractItemName(var RemainingText: AnsiString): AnsiString;
    procedure AddToRecentFileNamesMenu(FileName: AnsiString; Merge: Boolean);
    procedure SetRecentFileNames;
    procedure SetFileNamesListFromFile(RemainingPaths: AnsiString);
    procedure RecentFile1Click(Sender: TObject);
    procedure UpdateIDedit;
    procedure SerialOff1Click(Sender: TObject);
    procedure Port1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure DeleteUnwantedChipData;
    function ExtractChipNames: Integer;
    procedure ProgButtClick(Sender: TObject);
    procedure BlankButtClick(Sender: TObject);
    procedure OscalButtClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ResetSerial(ShowReady: Boolean);
    procedure SetProgrammerReset(State: Boolean);
    procedure ResetProgrammer;
    procedure InitialiseProgrammerVariables(NextState: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure ReadButtClick(Sender: TObject);
    procedure VerfButtClick(Sender: TObject);
    procedure CanButtClick(Sender: TObject);
    procedure ReadChipID1Click(Sender: TObject);
    procedure ReadCalibrationAndBG;
    procedure Version1Click(Sender: TObject);
    function HexToDec(HexChar: Char): Integer;
    function CheckASCII(HexChar: Char): Char;
    function ToHex(Value: Integer): Char;
    function DecToASCII(Value: Integer): Char;
    function VerifyHEX(HexText: AnsiString): Integer;
    function MyIntToHex(Value, Digits: Integer): AnsiString;
    function DecToBinary(Value, Width: Integer): AnsiString;
    function CheckSum(RecordText: AnsiString): AnsiString;
  public
    FTextWorkLines: TStringList; { Original +$04D4 }
    FROMWords: TStringList; { Original +$04D8 }
    FEEPROMBytes: TStringList; { Original +$04DC }
    FCodeDisplayLines: TStringList; { Original +$04E0 }
    FLoadedFilePaths: TStringList; { Original +$04E4 }
    FImportedROMWords: TStringList; { Original +$04E8 }
    FImportedEEPROMBytes: TStringList; { Original +$04EC }
    FExecutableDirectory: AnsiString; { Original +$04F0 }
    FLastFileDirectory: AnsiString; { Original +$04F4 }
    FConfigurationReply: AnsiString; { Original +$04F8 }
    FReceiveBuffer: AnsiString; { Original +$04FC }
    FBaseCaption: AnsiString; { Original +$0500 }
    FImportedUserID: AnsiString; { Original +$0504 }
    FChipNameAtSyntaxCheck: AnsiString; { Original +$0508 }
    FFuseWord1: Integer; { Original +$050C }
    FFuseWord2: Integer; { Original +$0510 }
    FFuseWord3: Integer; { Original +$0514 }
    FFuseWord4: Integer; { Original +$0518 }
    FFuseWord5: Integer; { Original +$051C }
    FFuseWord6: Integer; { Original +$0520 }
    FFuseWord7: Integer; { Original +$0524 }
    FImportedFuseWord1: Integer; { Original +$0528 }
    FImportedFuseWord2: Integer; { Original +$052C }
    FImportedFuseWord3: Integer; { Original +$0530 }
    FImportedFuseWord4: Integer; { Original +$0534 }
    FImportedFuseWord5: Integer; { Original +$0538 }
    FImportedFuseWord6: Integer; { Original +$053C }
    FImportedFuseWord7: Integer; { Original +$0540 }
    FBlankFuseWord1: Integer; { Original +$0544 }
    FBlankFuseWord2: Integer; { Original +$0548 }
    FBlankFuseWord3: Integer; { Original +$054C }
    FBlankFuseWord4: Integer; { Original +$0550 }
    FBlankFuseWord5: Integer; { Original +$0554 }
    FBlankFuseWord6: Integer; { Original +$0558 }
    FBlankFuseWord7: Integer; { Original +$055C }
    FReceiveIdleTicks: Integer; { Original +$0560 }
    FTransferOffset: Integer; { Original +$0564 }
    FReceiveState: Integer; { Original +$0568 }
    FAfterInitializeState: Integer; { Original +$056C }
    FStartupPending: Boolean; { Original +$0570 }
    FDataModified: Boolean; { Original +$0571 }
    FWarnCodeProtection: Boolean; { Original +$0572 }
    FHasCalibrationWord: Boolean; { Original +$0573 }
    FProgramPIC18FusesAfterVerify: Boolean; { Original +$0574 }
    FSkipPreferenceSave: Boolean; { Original +$0575 }
    FBaselineUserIDMode: Boolean; { Original +$0576 }
    FCancelRequested: Boolean; { Original +$0577 }
    FProtocolError: Boolean; { Original +$0578 }
    FResetIdleLevel: Boolean; { Original +$0579 }
    FAwaitingProgrammerReset: Boolean; { Original +$057A }
    FResumeConfigAfterVerify: Boolean; { Original +$057B }
    FTimeoutProbeSent: Boolean; { Original +$057C }
    FFastPowerSequence: Boolean; { Original +$057D }
    FIsFlashDevice: Boolean; { Original +$057E }
    FHasBandgapCalibration: Boolean; { Original +$057F }
    FResetOnlyFlag: Boolean; { Original +$0580 }
    FShowDeviceID: Boolean; { Original +$0581 }
    FCommandLineAutoProgram: Boolean; { Original +$0582 }
    FRequiresICSP: Boolean; { Original +$0583 }
    FCoreAlgorithm: Integer; { Original +$0584 }
    FSocketLayout: Integer; { Original +$0588 }
    FROMWordCount: Integer; { Original +$058C }
    FEEPROMByteCount: Integer; { Original +$0590 }
    FExpectedDeviceID: Integer; { Original +$0594 }
    FBlankROMWord: Integer; { Original +$0598 }
    FBlankCheckFlags: Integer; { Original +$059C }
    FEraseMode: Integer; { Original +$05A0 }
    FProgramFlags: Integer; { Original +$05A4 }
    FProgramDelay: Integer; { Original +$05A8 }
    FPowerSequence: Integer; { Original +$05AC }
    FAfterBlankCheckState: Integer; { Original +$05B0 }
    FFuseWordCount: Integer; { Original +$05B4 }
    FProgramFlag2: Integer; { Original +$05B8 }
    FPanelSizing: Integer; { Original +$05BC }
    FROMTransferWordCount: Integer; { Original +$05C0 }
    FEEPROMTransferByteCount: Integer; { Original +$05C4 }
    FCalibrationPolicy: Integer; { Original +$05C8 }
    FProgrammerModel: Integer; { Original +$05CC }
    FEEPROMConfigPrefix: Integer; { Original +$05D0 }
    FFuseWordByControlTag: array[0..35] of Integer; { Original +$05D4 }
    FRetainedBitmap: TBitmap; { Original +$0664 }
    FRecentFilePaths: array[0..3] of AnsiString; { Original +$0668 }
    FMPLABExecutablePath: AnsiString; { Original +$0678 }
    FHexErrorText: AnsiString; { Original +$067C }
    FCodeScrollFocused: Boolean; { Original +$0680 }
    FIsPIC16F88: Boolean; { Original +$0681 }
    FChipDatabaseLines: TStringList; { Original +$0684 }
  end;
var ProjFm: TProjFm;
implementation
uses ShellAPI, misc, fuseedit, osc, edit, codeedit, fusesee, debug, serport, eraser, fly;
{$R *.dfm}
type TWinControlAccess = class(TWinControl) public property DoubleBuffered; end;

function SerialIsActive(Serial: TObject): Boolean;
begin Result := TSerial(Serial).Active; end;

{ VA $00476820 }
function TProjFm.SyntaxCheckChipList: Integer;
const
  Keys: array[0..17] of AnsiString = ('CHIPNAME=', 'INCLUDE=', 'KITSRUS.COM=',
    'ERASEMODE=', 'FLASHCHIP=', 'POWERSEQUENCE=', 'PROGRAMDELAY=', 'PROGRAMFLAG2=',
    'PANELSIZING=', 'CORETYPE=', 'ROMSIZE=', 'EEPROMSIZE=', 'FUSEBLANK=', 'CPWARN=',
    'CALWORD=', 'BANDGAP=', 'ICSPONLY=', 'CHIPID=');
var LineIndex, HeaderFieldIndex, NextListNumber, FuseCount, ParsedValue: Integer; RemainingText, WordText, ItemName: AnsiString;
begin
  LineIndex := 0; HeaderFieldIndex := 0; NextListNumber := 1; FuseCount := 0;
  while LineIndex < FChipDatabaseLines.Count do begin
    Result := LineIndex;
    if HeaderFieldIndex > 17 then begin
      RemainingText := FChipDatabaseLines[LineIndex]; WordText := UpperCase(ExtractNextWord(RemainingText));
      if Pos('LIST', WordText) <> 1 then begin
        HeaderFieldIndex := 0; NextListNumber := 1; FuseCount := 0; Inc(LineIndex); Continue;
      end;
      Delete(WordText, 1, 4); ParsedValue := StrToIntDef(WordText, 0);
      if (ParsedValue < 1) or (ParsedValue > 34) or (ParsedValue <> NextListNumber) then Exit;
      Inc(NextListNumber); WordText := UpperCase(ExtractNextWord(RemainingText));
      if Pos('FUSE', WordText) = 1 then begin
        Delete(WordText, 1, 4); ParsedValue := StrToIntDef(WordText, 0);
        if (ParsedValue < 1) or (ParsedValue > FuseCount) then Exit;
      end;
      ItemName := ExtractItemName(RemainingText);
      if (ItemName = '') or (RemainingText = '') then Exit;
      while RemainingText <> '' do begin
        if Length(RemainingText) < 8 then Exit;
        WordText := ExtractItemName(RemainingText);
        if (WordText = '') or (Pos('&', WordText) <> 0) then Exit;
        if RemainingText[1] <> '=' then Exit;
        Delete(RemainingText, 1, 1); WordText := ExtractNextWord(RemainingText);
        if Length(WordText) = 4 then begin
          if VerifyHEX(WordText) = -1 then Exit;
        end else begin
          if Length(WordText) <> 9 then Exit;
          if (WordText[5] <> '&') or (FuseCount <> 2) then Exit;
          if VerifyHEX(Copy(WordText, 1, 4)) = -1 then Exit;
          if VerifyHEX(Copy(WordText, 6, 4)) = -1 then Exit;
        end;
      end;
    end else begin
      RemainingText := TrimSpaces(UpperCase(FChipDatabaseLines[LineIndex])); FChipDatabaseLines[LineIndex] := RemainingText;
      if Pos(Keys[HeaderFieldIndex], RemainingText) <> 1 then Exit;
      Delete(RemainingText, 1, Pos('=', RemainingText)); if RemainingText = '' then Exit;
      case HeaderFieldIndex of
        0: FChipNameAtSyntaxCheck := RemainingText;
        1, 4, 13..16: if (RemainingText <> 'N') and (RemainingText <> 'Y') then Exit;
        2: if (RemainingText <> '0PIN') and (RemainingText <> '8PIN') and (RemainingText <> '18PIN') and
             (RemainingText <> '28NPIN') and (RemainingText <> '28WPIN') and (RemainingText <> '40PIN') and (RemainingText <> '14PIN') then Exit;
        3: begin ParsedValue := StrToIntDef(RemainingText, -1); if (ParsedValue < 0) or (ParsedValue > 7) then Exit; end;
        5: if (RemainingText <> 'VCC') and (RemainingText <> 'VCCVPP1') and (RemainingText <> 'VCCVPP2') and
             (RemainingText <> 'VCCFASTVPP1') and (RemainingText <> 'VCCFASTVPP2') and (RemainingText <> 'VPP1VCC') and
             (RemainingText <> 'VPP2VCC') and (RemainingText <> 'VPP1FASTVCC') and (RemainingText <> 'VPP2FASTVCC') then Exit;
        6..8: if StrToIntDef(RemainingText, -1) = -1 then Exit;
        9: if (RemainingText <> 'BIT16_C') and (RemainingText <> 'BIT16_A') and (RemainingText <> 'BIT16_B') and
             (RemainingText <> 'BIT12_A') and (RemainingText <> 'BIT14_A') and (RemainingText <> 'BIT14_B') and
             (RemainingText <> 'BIT14_C') and (RemainingText <> 'BIT12_B') and (RemainingText <> 'BIT14_E') and
             (RemainingText <> 'BIT14_F') and (RemainingText <> 'BIT14_G') and (RemainingText <> 'BIT14_H') and (RemainingText <> 'NEWF12B') then Exit;
        10: begin
          ParsedValue := VerifyHEX(RemainingText); if (ParsedValue = -1) or (ParsedValue and $FF <> 0) or (ParsedValue > $8000) then Exit;
        end;
        11: begin
          if VerifyHEX(Copy(RemainingText, 1, 2)) = -1 then Exit; Delete(RemainingText, 1, 2);
          ParsedValue := VerifyHEX(RemainingText); if (ParsedValue = -1) or (ParsedValue > $10000) then Exit;
        end;
        12: begin
          while RemainingText <> '' do begin
            if Length(RemainingText) < 4 then Exit;
            if VerifyHEX(Copy(RemainingText, 1, 4)) = -1 then Exit;
            Delete(RemainingText, 1, 4); Inc(FuseCount);
          end;
          if (FuseCount <> 1) and (FuseCount <> 2) and (FuseCount <> 7) then Exit;
        end;
        17: if VerifyHEX(RemainingText) = -1 then Exit;
      end;
    end;
    Inc(HeaderFieldIndex); Inc(LineIndex);
  end;
  Result := -1;
end;


{ VA $00477620 }
procedure TProjFm.Extractchipdata;
var LineIndex, ChipOrdinal, ComponentIndex, TagValue, FuseValue: Integer; RemainingText, WordText, ItemName: AnsiString;
    FuseLabel: TLabel; FuseCombo: TComboBox;
  function FieldText(RelativeLine, PrefixLength: Integer): AnsiString;
  begin Result := FChipDatabaseLines[LineIndex + RelativeLine]; Delete(Result, 1, PrefixLength); end;
  function FieldFlag(RelativeLine: Integer): Boolean;
  var FlagLine: AnsiString;
  begin FlagLine := FChipDatabaseLines[LineIndex + RelativeLine]; Result := FlagLine[Length(FlagLine)] <> 'N'; end;
begin
  LineIndex := 0; ChipOrdinal := 0; FIsFlashDevice := False;
  RemainingText := ChipSelect.Items[ChipSelect.ItemIndex];
  while LineIndex < FChipDatabaseLines.Count do begin
    RemainingText := FChipDatabaseLines[LineIndex];
    if Pos('CHIPNAME=', RemainingText) = 1 then begin
      if ChipOrdinal = ChipSelect.ItemIndex then Break;
      Inc(ChipOrdinal);
    end;
    Inc(LineIndex);
  end;
  RemainingText := UpperCase(FieldText(2, 12));
  if RemainingText = '0PIN' then FSocketLayout := 0 else if RemainingText = '8PIN' then FSocketLayout := 1
  else if RemainingText = '18PIN' then FSocketLayout := 2 else if RemainingText = '28NPIN' then FSocketLayout := 3
  else if RemainingText = '28WPIN' then FSocketLayout := 4 else if RemainingText = '40PIN' then FSocketLayout := 5 else FSocketLayout := 8;
  FEraseMode := StrToInt(FieldText(3, 10)); FIsFlashDevice := FieldFlag(4);
  RemainingText := FieldText(5, 14); FFastPowerSequence := Pos('FAST', RemainingText) <> 0;
  if RemainingText = 'VCC' then FPowerSequence := 0
  else if (RemainingText = 'VCCVPP1') or (RemainingText = 'VCCFASTVPP1') then FPowerSequence := 1
  else if (RemainingText = 'VCCVPP2') or (RemainingText = 'VCCFASTVPP2') then FPowerSequence := 2
  else if (RemainingText = 'VPP1VCC') or (RemainingText = 'VPP1FASTVCC') then FPowerSequence := 3
  else if (RemainingText = 'VPP2VCC') or (RemainingText = 'VPP2FASTVCC') then FPowerSequence := 4;
  FProgramDelay := StrToInt(FieldText(6, 13)); FProgramFlag2 := StrToInt(FieldText(7, 13));
  FPanelSizing := StrToInt(FieldText(8, 12)); RemainingText := FieldText(9, 9);
  if RemainingText = 'BIT16_C' then FCoreAlgorithm := 0 else if RemainingText = 'BIT16_A' then FCoreAlgorithm := 1
  else if RemainingText = 'BIT16_B' then FCoreAlgorithm := 2 else if RemainingText = 'BIT12_A' then FCoreAlgorithm := 4
  else if RemainingText = 'BIT14_A' then FCoreAlgorithm := 5 else if RemainingText = 'BIT14_B' then FCoreAlgorithm := 6
  else if RemainingText = 'BIT14_C' then FCoreAlgorithm := 7 else if RemainingText = 'BIT12_B' then FCoreAlgorithm := 8
  else if RemainingText = 'BIT14_E' then FCoreAlgorithm := 9 else if RemainingText = 'BIT14_F' then FCoreAlgorithm := 10
  else if RemainingText = 'BIT14_G' then FCoreAlgorithm := 3 else if RemainingText = 'BIT14_H' then FCoreAlgorithm := 12 else FCoreAlgorithm := 11;
  FROMWordCount := VerifyHEX(FieldText(10, 8)); RemainingText := FieldText(11, 11);
  FEEPROMConfigPrefix := HexToDec(RemainingText[1]) * 16 + HexToDec(RemainingText[2]); Delete(RemainingText, 1, 2); FEEPROMByteCount := VerifyHEX(RemainingText);
  RemainingText := FieldText(12, 10); FBlankFuseWord1 := $FFFF; FBlankFuseWord2 := $FFFF; FBlankFuseWord3 := $FFFF;
  FBlankFuseWord4 := $FFFF; FBlankFuseWord5 := $FFFF; FBlankFuseWord6 := $FFFF; FBlankFuseWord7 := $FFFF; FFuseWordCount := 0;
  while RemainingText <> '' do begin
    Inc(FFuseWordCount); WordText := Copy(RemainingText, 1, 4); Delete(RemainingText, 1, 4); FuseValue := VerifyHEX(WordText);
    case FFuseWordCount of
      1: FBlankFuseWord1 := FuseValue; 2: FBlankFuseWord2 := FuseValue; 3: FBlankFuseWord3 := FuseValue;
      4: FBlankFuseWord4 := FuseValue; 5: FBlankFuseWord5 := FuseValue; 6: FBlankFuseWord6 := FuseValue;
      7: FBlankFuseWord7 := FuseValue;
    end;
  end;
  FWarnCodeProtection := FieldFlag(13); FHasCalibrationWord := FieldFlag(14); FHasBandgapCalibration := FieldFlag(15);
  FRequiresICSP := FieldFlag(16); FExpectedDeviceID := VerifyHEX(FieldText(17, 7)); Inc(LineIndex, 18);
  while LineIndex < FChipDatabaseLines.Count do begin
    RemainingText := FChipDatabaseLines[LineIndex]; WordText := UpperCase(ExtractNextWord(RemainingText));
    if Pos('LIST', WordText) <> 1 then Break;
    Delete(WordText, 1, 4); TagValue := StrToIntDef(WordText, 0);
    FuseLabel := nil; FuseCombo := nil;
    for ComponentIndex := 0 to FuseEditFM.ComponentCount - 1 do
      if (FuseEditFM.Components[ComponentIndex] is TLabel) and (FuseEditFM.Components[ComponentIndex].Tag = TagValue) then begin
        FuseLabel := TLabel(FuseEditFM.Components[ComponentIndex]); FuseLabel.Visible := True; Break;
      end;
    for ComponentIndex := 0 to FuseEditFM.ComponentCount - 1 do
      if (FuseEditFM.Components[ComponentIndex] is TComboBox) and (FuseEditFM.Components[ComponentIndex].Tag = TagValue) then begin
        FuseCombo := TComboBox(FuseEditFM.Components[ComponentIndex]); FuseCombo.Visible := True; Break;
      end;
    WordText := ExtractNextWord(RemainingText); Delete(WordText, 1, 4);
    FFuseWordByControlTag[TagValue] := StrToInt(WordText); FuseLabel.Caption := ExtractItemName(RemainingText);
    while RemainingText <> '' do begin
      ItemName := ExtractItemName(RemainingText); Delete(RemainingText, 1, 1);
      WordText := ItemName + '                                        ' + ExtractNextWord(RemainingText);
      FuseCombo.Items.Add(WordText);
    end;
    FuseCombo.ItemIndex := 0; Inc(LineIndex);
  end;
end;


{ VA $00475948 }
function TProjFm.ExecuteStartupProcedures: Boolean;
var RecentIndexOrPass, ShiftIndex, PortNumber, SavedChipCount, SavedChipIndex, CommandChipIndex: Integer;
    CommandFile, CommandChip, SavedChip, RecentPath, StartupFileList: AnsiString;
    OpenFloatingWindow, IgnoreBlankCheck: Boolean;
begin
  FLoadedFilePaths.Clear; for RecentIndexOrPass := 0 to 3 do FRecentFilePaths[RecentIndexOrPass] := '?';
  CommandFile := ''; PortNumber := 1; SavedChipCount := -1; SavedChipIndex := -1;
  OpenFloatingWindow := False; IgnoreBlankCheck := False; FProgrammerModel := 1; SavedChip := '';
  if FileExists(FExecutableDirectory + 'pro.dat') then
    try
      FROMWords.LoadFromFile(FExecutableDirectory + 'pro.dat');
      if FROMWords.Count > 0 then begin
        PortNumber := StrToIntDef(FROMWords[0], -1);
        if FROMWords.Count > 1 then SavedChipCount := StrToIntDef(FROMWords[1], -1);
        if FROMWords.Count > 2 then SavedChipIndex := StrToIntDef(FROMWords[2], -1);
        if FROMWords.Count > 3 then SavedChip := FROMWords[3];
        if FROMWords.Count > 4 then AutoUpdateFiles1.Checked := FROMWords[4] = 'T';
        if FROMWords.Count > 5 then FProgrammerModel := StrToIntDef(FROMWords[5], 1);
        if FROMWords.Count > 6 then begin
          Positive1.Checked := FROMWords[6] = 'T'; Negative1.Checked := not Positive1.Checked;
        end;
        if FROMWords.Count > 7 then IgnoreBlankCheck := FROMWords[7] = 'T';
        if FROMWords.Count > 8 then begin
          FCalibrationPolicy := StrToIntDef(FROMWords[8], 1); if FCalibrationPolicy > 2 then FCalibrationPolicy := 1;
        end;
        if not FileExists(FLastFileDirectory) then FLastFileDirectory := FExecutableDirectory;
        if FROMWords.Count > 9 then EepLineMode.Checked := FROMWords[9] = 'T';
        if FROMWords.Count > 10 then ICSPMode1.Checked := FROMWords[10] = 'T';
        if FROMWords.Count > 11 then FMPLABExecutablePath := FROMWords[11];
        if FileExists(FMPLABExecutablePath) then Path1.Checked := True;
        if FROMWords.Count > 15 then
          for RecentIndexOrPass := 0 to 3 do begin
            RecentPath := FROMWords[RecentIndexOrPass + 12];
            if FileExists(RecentPath) and (Pos('.HEX', UpperCase(RecentPath)) <> 0) then FRecentFilePaths[RecentIndexOrPass] := FROMWords[RecentIndexOrPass + 12];
          end;
      end;
    except
      PortNumber := 1; SavedChipCount := -1; SavedChipIndex := -1; FProgrammerModel := 1;
      Positive1.Checked := True; Negative1.Checked := False; FLastFileDirectory := FExecutableDirectory;
      raise ERangeError.Create('Range check error');
    end;
  SetProgramVersion(FProgrammerModel, False); DrawTheSocket;
  if not CheckAndLoadChipData then Close
  else begin
    CommandChip := '';
    if ParamCount > 0 then begin
      CommandFile := ParamStr(1);
      if not FileExists(CommandFile) then CommandFile := ''
      else if ParamCount > 1 then begin
        CommandChip := ParamStr(2);
        if ParamCount > 2 then begin
          if ParamStr(3) = '/F' then OpenFloatingWindow := True;
          if ParamCount > 3 then begin
            if ParamStr(4) = '/Q' then FCommandLineAutoProgram := True;
            if ParamCount > 4 then PortNumber := StrToIntDef(ParamStr(5), -1);
          end;
        end;
      end;
    end;
    CommandChipIndex := FindChipCBText(UpperCase(CommandChip));
    if CommandChipIndex <> -1 then begin
      SavedChip := UpperCase(CommandChip); SavedChipIndex := CommandChipIndex;
      if Pos('PIC', SavedChip) = 1 then Delete(SavedChip, 1, 3);
    end;
    if (SavedChipCount <> -1) and (SavedChipCount = ChipSelect.Items.Count) then
      if SavedChipIndex < ChipSelect.Items.Count then
        if SavedChip = ChipSelect.Items[SavedChipIndex] then begin
          ChipSelect.ItemIndex := SavedChipIndex;
          if SavedChipIndex <> -1 then PreSelectChip;
        end;
    for RecentIndexOrPass := 0 to 3 do if not CheckFileNames(FRecentFilePaths[RecentIndexOrPass]) then FRecentFilePaths[RecentIndexOrPass] := '?';
    for RecentIndexOrPass := 1 to 4 do
      if FRecentFilePaths[0] = '?' then begin
        for ShiftIndex := 0 to 2 do FRecentFilePaths[ShiftIndex] := FRecentFilePaths[ShiftIndex + 1]; FRecentFilePaths[3] := '?';
      end;
    SetRecentFileNames;
    if CommandFile = '' then StartupFileList := FRecentFilePaths[0] else StartupFileList := CommandFile;
    SetFileNamesListFromFile(StartupFileList); LoadMultipleHexFiles;
  end;
  ActivateSerialPort(PortNumber); IgnoreBlankCheck1.Checked := IgnoreBlankCheck;
  EditCodeFm.ROMGrid.Cells[0, 0] := 'Address'; EditCodeFm.ROMGrid.Cells[1, 0] := 'Code';
  EditCodeFm.EEPROMGrid.Cells[0, 0] := 'Address'; EditCodeFm.EEPROMGrid.Cells[1, 0] := 'Data';
  SetCalInsertStyle;
  if Serial1.Active then begin
    if not FCommandLineAutoProgram then begin if OpenFloatingWindow then FlyWindow1.Click; end else WindowState := wsMinimized;
    ResetProgrammer;
  end;
  Result := Serial1.Active;
end;

{ VA $0047911C }
function TProjFm.ActivateSerialPort(PortNumber: Integer): Boolean;
begin
  Result := True;
  try
    if (PortNumber < 1) or (PortNumber > 99) then
      raise ERangeError.Create('Range check error');
    Serial1.Port := PortNumber;
    Serial1.Active := True;
  except
    Result := False;
  end;
  if not Serial1.Active then Result := False;
  if not Result then begin
    MessageDlg('There appears to be a problem accessing the COM Port', mtError, [mbOK], 0);
    ComLabel.Caption := 'COM x'; ComLabel.ShowHint := False; Refresh;
  end else begin
    ComLabel.Caption := 'COM ' + IntToStr(PortNumber); ComLabel.ShowHint := True;
  end;
end;


{ VA $0047ADCC }
function TProjFm.LoadMultipleHexFiles: Boolean;
var FileIndex: Integer;
begin
  Result := False;
  if ChipSelect.ItemIndex = -1 then Exit;
  if FLoadedFilePaths.Count <> 0 then begin
    ResetCodeMemory(False, True, False);
    if not DoLoadProcedure(False, FLoadedFilePaths[0]) then Exit;
    for FileIndex := 1 to FLoadedFilePaths.Count - 1 do
      if not DoLoadProcedure(True, FLoadedFilePaths[FileIndex]) then Exit;
  end;
  Result := True;
end;


{ VA $00488490 }
procedure TProjFm.AutoProgramClick(Sender: TObject);
begin
  if AutoProgram.Checked then begin
    ResetSerial(False);
    FlyForm.ProgButt.Visible := True; FlyForm.VerfButt.Visible := True;
    FlyForm.StatusLabel.Caption := ''; FlyForm.StatusLabel.Visible := False;
  end else if CheckButtonsAllow(False) then begin
    if (FROMWords.Count = 0) and (FEEPROMBytes.Count = 0) then begin
      MessageDlg('Nothing to program', mtInformation, [mbOK], 0); Exit;
    end;
    if ICSPMode1.Checked then MessageDlg(
      'Auto Program Mode may not work correctly when ICSP is enabled.', mtInformation, [mbOK], 0);
    AutoProgram.Checked := True; AutoLabel.Caption := 'Auto'; ICSPMode1.Enabled := False;
    FlyForm.ProgButt.Visible := False; FlyForm.VerfButt.Visible := False;
    FlyForm.StatusLabel.Caption := ''; FlyForm.StatusLabel.Visible := True;
    DisableUserButtons; Serial2_SendBytes(Serial1, 'P'#18);
    FReceiveState := 600; Timer1.Enabled := True;
  end;
end;


{ VA $004890B4 }
procedure TProjFm.DevList1Click(Sender: TObject);
var ChipIndex: Integer;
begin
  FTextWorkLines.Clear;
  for ChipIndex := 0 to ChipSelect.Items.Count - 1 do FTextWorkLines.Add(ChipSelect.Items[ChipIndex]);
  FTextWorkLines.SaveToFile('devlist.txt');
end;


{ VA $00488E78 }
procedure TProjFm.WriteDebugClick(Sender: TObject);
var ConfirmationText: AnsiString;
begin
  if not CheckButtonsAllow(True) then Exit;
  if DebugFm.ShowModal <> mrOK then Exit;
  ConfirmationText := 'Code to be programmed into debug vector...' + #13#13 + DebugFm.FDebugVectorText + #13#13 +
    'To program the DEBUG vector, the DEBUG option must have' + #13 +
    'been enabled in the fuses when the 18F452 chip was programmed.' + #13 +
    'The DEBUG location must be blank.' + #13 + 'Code protection must be disabled.' +
    #13#13 + 'Proceed...';
  if MessageDlg(ConfirmationText, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    InitialiseProgrammerVariables(550);
end;


{ VA $00488C98 }
procedure TProjFm.ReadCalibrationWords1Click(Sender: TObject);
begin
  if (FROMWords.Count = 0) and (FEEPROMBytes.Count = 0) then begin
    MessageDlg('No data available', mtInformation, [mbOK], 0); Exit;
  end;
  FuseValFm.FuseLabel1.Caption := MyIntToHex(FFuseWord2, 4);
  FuseValFm.FuseLabel2.Caption := MyIntToHex(FFuseWord3, 4);
  FuseValFm.ShowLabels(1, True); FuseValFm.ShowModal;
end;


{ VA $00489794. Encodes a 14-bit word with interleaved parity in bits 0/1. }
function TProjFm.SetParity(Value: Integer): Integer;
var BitPairIndex, EvenPositionOnes, OddPositionOnes: Integer;
begin
  EvenPositionOnes := 0; OddPositionOnes := 0;
  for BitPairIndex := 0 to 6 do begin
    if Value and (1 shl (BitPairIndex * 2)) <> 0 then Inc(EvenPositionOnes);
    if Value and (2 shl (BitPairIndex * 2)) <> 0 then Inc(OddPositionOnes);
  end;
  Result := Value * 4;
  if Odd(EvenPositionOnes) then Inc(Result);
  if not Odd(OddPositionOnes) then Inc(Result, 2);
end;


{ VA $0047EC60. An unconditional jump bypasses the old implementation at
  $0047EC8C..$0047EE3C. The reachable body delegates to UpdateFuses16. }
procedure TProjFm.UpdateFuses1214;
begin
  UpdateFuses16;
end;


{ VA $00480864 }
procedure TProjFm.SetOscalFmValues(CheckValue: Boolean);
var CalibrationText: AnsiString;
begin
  OscCalFm.OscEdit.Text := 'FF'; OscCalFm.BGedit.Text := '11';
  if FHasCalibrationWord then begin
    if CheckValue and not CheckOscalValue then Exit;
    CalibrationText := MyIntToHex(StrToInt(FROMWords[FROMWordCount - 1]), 4);
    OscCalFm.RetlwLab.Caption := Copy(CalibrationText, 1, 2); OscCalFm.OscEdit.Text := Copy(CalibrationText, 3, 2);
  end;
  if FHasBandgapCalibration then begin
    if FFuseWord1 and $2000 <> 0 then CalibrationText := '1' else CalibrationText := '0';
    if FFuseWord1 and $1000 <> 0 then CalibrationText := CalibrationText + '1' else CalibrationText := CalibrationText + '0';
    OscCalFm.BGedit.Text := CalibrationText;
  end;
  OscCalFm.BandGapLabel.Visible := FHasBandgapCalibration; OscCalFm.BGedit.Visible := FHasBandgapCalibration;
end;


{ VA $00480A6C }
function TProjFm.SetCalibrationValues: Boolean;
var CalibrationText: AnsiString; CalibrationWord: Integer;
begin
  Result := False; CalibrationText := OscCalFm.RetlwLab.Caption;
  CalibrationWord := (HexToDec(CalibrationText[1]) * 16 + HexToDec(CalibrationText[2])) * 256;
  CalibrationText := OscCalFm.OscEdit.Text; CalibrationWord := CalibrationWord + HexToDec(CalibrationText[1]) * 16 + HexToDec(CalibrationText[2]);
  if FROMWords.Count <> 0 then begin
    FROMWords[FROMWordCount - 1] := IntToStr(CalibrationWord); CreateCodeData; DisplayCodeLines;
    if FHasBandgapCalibration then begin
      CalibrationText := OscCalFm.BGedit.Text; FFuseWord1 := FFuseWord1 and $FFF;
      if CalibrationText[1] = '1' then FFuseWord1 := FFuseWord1 or $2000;
      if CalibrationText[2] = '1' then FFuseWord1 := FFuseWord1 or $1000;
      UpdateFuses1214;
    end;
    Result := True;
  end;
end;


{ VA $00480560 }
function TProjFm.CheckOscalValue: Boolean;
var CalibrationWord, ExpectedOpcode, Answer: Integer; OpcodeText, PromptText: AnsiString;
begin
  Result := False;
  if FHasCalibrationWord then begin
    CalibrationWord := StrToInt(FROMWords[FROMWordCount - 1]); OpcodeText := MyIntToHex(CalibrationWord, 4); Delete(OpcodeText, 3, 2);
    if FBlankROMWord = $FFF then begin
      ExpectedOpcode := $C00; PromptText := 'The OSCAL value should be in the form of a MOVLW instruction [ 0Cxx ]';
    end else begin
      ExpectedOpcode := $3400; PromptText := 'The OSCAL value should be in the form of a RETLW instruction [ 34xx ]';
    end;
    if CalibrationWord and $FF00 <> ExpectedOpcode then begin
      Answer := MessageDlg(PromptText + #13#13 + 'Currently [ ' + OpcodeText + 'xx ]' + #13#13 +
        'Do you want this changed?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
      if Answer = mrCancel then Exit;
      if Answer = mrYes then begin
        FROMWords[FROMWordCount - 1] := IntToStr((CalibrationWord and $FF) + ExpectedOpcode); CreateCodeData; DisplayCodeLines;
      end;
    end;
  end;
  Result := True;
end;


{ VA $0048027C }
procedure TProjFm.FuseButtClick(Sender: TObject);
var SavedFuseWords: array[0..6] of Integer; SavedUserID: AnsiString; Answer: Integer;
begin
  if ChipSelect.ItemIndex = -1 then begin
    MessageDlg('Please select a processor', mtInformation, [mbOK], 0); Exit;
  end;
  if (FROMWords.Count = 0) and (FEEPROMBytes.Count = 0) then begin
    MessageDlg('No fuse data', mtInformation, [mbOK], 0); Exit;
  end;
  if AutoUpdateFiles1.Checked then begin
    Answer := MessageDlg('Auto File Update is enabled.' + #13#13 +
      'Any ID / FUSE data you change will not be programmed because all' + #13 +
      'file data will be reloaded at time of programming.' + #13#13 +
      'Do you want to un-check this feature?', mtInformation, [mbYes, mbNo, mbCancel], 0);
    if Answer = mrCancel then Exit;
    if Answer = mrYes then AutoUpdateFiles1.Checked := False;
  end;
  SavedFuseWords[0] := FFuseWord1; SavedFuseWords[1] := FFuseWord2; SavedFuseWords[2] := FFuseWord3; SavedFuseWords[3] := FFuseWord4;
  SavedFuseWords[4] := FFuseWord5; SavedFuseWords[5] := FFuseWord6; SavedFuseWords[6] := FFuseWord7;
  SavedUserID := FuseEditFM.IDedit.Text; Answer := FuseEditFM.ShowModal;
  if Answer = mrCancel then begin
    FFuseWord1 := SavedFuseWords[0]; FFuseWord2 := SavedFuseWords[1]; FFuseWord3 := SavedFuseWords[2]; FFuseWord4 := SavedFuseWords[3];
    FFuseWord5 := SavedFuseWords[4]; FFuseWord6 := SavedFuseWords[5]; FFuseWord7 := SavedFuseWords[6]; FuseEditFM.IDedit.Text := SavedUserID;
    case FBlankROMWord of $FFF, $3FFF: UpdateFuses1214; $FFFF: UpdateFuses16; end;
  end else if Answer = mrOK then CreateFuseValueFromFuseEdits;
end;


{ VA $00488AC4 }
procedure TProjFm.FuseValue1Click(Sender: TObject);
begin
  if (FROMWords.Count = 0) and (FEEPROMBytes.Count = 0) then begin
    MessageDlg('No data available', mtInformation, [mbOK], 0); Exit;
  end;
  FuseValFm.FuseLabel1.Caption := MyIntToHex(FFuseWord1, 4);
  FuseValFm.FuseLabel2.Caption := MyIntToHex(FFuseWord2, 4);
  FuseValFm.FuseLabel3.Caption := MyIntToHex(FFuseWord3, 4);
  FuseValFm.FuseLabel4.Caption := MyIntToHex(FFuseWord4, 4);
  FuseValFm.FuseLabel5.Caption := MyIntToHex(FFuseWord5, 4);
  FuseValFm.FuseLabel6.Caption := MyIntToHex(FFuseWord6, 4);
  FuseValFm.FuseLabel7.Caption := MyIntToHex(FFuseWord7, 4);
  FuseValFm.ShowLabels(FFuseWordCount - 1, False); FuseValFm.ShowModal;
end;


{ VA $0047E880 }
procedure TProjFm.Edit1Click(Sender: TObject);
var ChipDatabaseReady: Boolean;
begin
  ChipDatabaseReady := True;
  if not FileExists(FExecutableDirectory + 'chipdata.cid') then begin
    MessageDlg('chipdata.cid file is missing', mtError, [mbOK], 0); ChipDatabaseReady := False;
  end else begin
    EditFm.FChipDatabaseModified := False; EditFm.FEditableChipLines.LoadFromFile(FExecutableDirectory + 'chipdata.cid'); EditFm.ShowModal;
    if EditFm.FChipDatabaseModified then begin
      EditFm.FEditableChipLines.SaveToFile(FExecutableDirectory + 'chipdata.cid'); ChipSelect.Items.Clear;
      DrawBlankSocket; ChipDatabaseReady := CheckAndLoadChipData;
    end;
  end;
  if not ChipDatabaseReady then Close else begin SetTheCurrentDirectory; StatusLabel.Caption := 'Ready'; end;
end;


{ VA $0047E47C }
procedure TProjFm.EditHEXCode1Click(Sender: TObject);
var MemoryIndex: Integer; WordText: AnsiString;
begin
  if (FROMWords.Count = 0) and (FEEPROMBytes.Count = 0) then begin
    MessageDlg('Nothing to edit', mtInformation, [mbOK], 0); Exit;
  end;
  if AutoUpdateFiles1.Checked then
    if MessageDlg('Auto File Update is enabled.' + #13#13 +
      'Any ROM / EEPROM data you change will not be programmed because all' + #13 +
      'file data will be reloaded at time of programming.' + #13#13 +
      'Do you want to un-check this feature?', mtInformation, [mbYes, mbNo], 0) = mrYes then
      AutoUpdateFiles1.Checked := False;
  Screen.Cursor := crHourGlass;
  try
    for MemoryIndex := 0 to FROMWordCount - 1 do begin
      WordText := MyIntToHex(StrToInt(FROMWords[MemoryIndex]), 4); if FBlankROMWord = $FFF then Delete(WordText, 1, 1);
      EditCodeFm.ROMGrid.Cells[1, MemoryIndex + 1] := WordText;
    end;
    for MemoryIndex := 0 to FEEPROMByteCount - 1 do
      EditCodeFm.EEPROMGrid.Cells[1, MemoryIndex + 1] := MyIntToHex(StrToInt(FEEPROMBytes[MemoryIndex]), 2);
  finally
    Screen.Cursor := crDefault;
  end;
  EditCodeFm.FBlankROMWord := FBlankROMWord;
  if EditCodeFm.ShowModal = mrOK then begin
    for MemoryIndex := 0 to FROMWordCount - 1 do FROMWords[MemoryIndex] := IntToStr(VerifyHEX(EditCodeFm.ROMGrid.Cells[1, MemoryIndex + 1]));
    for MemoryIndex := 0 to FEEPROMByteCount - 1 do FEEPROMBytes[MemoryIndex] := IntToStr(VerifyHEX(EditCodeFm.EEPROMGrid.Cells[1, MemoryIndex + 1]));
    CreateCodeData; DisplayCodeLines;
  end;
end;


{ VA $004886A4 }
procedure TProjFm.About1Click(Sender: TObject);
var Model: AnsiString;
begin
  case FProgrammerModel of
    0: Model := '28'; 1: Model := '49-A'; 2: Model := '49-BC';
    3: Model := '50'; 4: Model := '70';
  else Model := '82'; end;
  MessageDlg('DIY K1' + Model + ' PICmicro Programmer' + #13#13 + 'v140926 ' + #13#13 +
    'Protocol: P18A' + #13#13 + 'Ladda Crowcroft' + #13 + 'DIY Electronics (HK) Ltd' + #13 +
    'PO Box 88458, Sham Shui Po, Hong Kong' + #13 + 'Voice: 852-2304 2250' + #13 +
    'Fax: 852-2729 1400' + #13 + 'Web:  http://kitsrus.com' + #13 +
    'Email:   Ladda@kitsrus.com' + #13 + 'Number One in Electronic Kits Worldwide.' + #13#13 +
    'Project design by Tony Nixon.' + #13#13 + 'Additional work done by Jim Robertson' +
    #13#13 + 'Decompiled and bug-fixed version by TU-Student 09/2026 ',
    mtInformation, [mbOK], 0);
end;


{ VA $00487FE4 }
procedure TProjFm.SetProgramVersion(Model: Integer; Reload: Boolean);
var BoardCaption: AnsiString;
begin
  FProgrammerModel := Model;
  K1281.Checked := Model = 0; K149A.Checked := Model = 1; K149BF.Checked := Model = 2;
  K1501.Checked := Model = 3; K1701.Checked := Model = 4;
  K1821.Checked := not (Model in [0..4]);
  case Model of
    0: BoardCaption := 'DIY K128'; 1: BoardCaption := 'DIY K149-A'; 2: BoardCaption := 'DIY K149-BC';
    3: BoardCaption := 'DIY K150'; 4: BoardCaption := 'DIY K170';
  else BoardCaption := 'DIY K182'; end;
  if Model in [1, 2] then FResetIdleLevel := Positive1.Checked else FResetIdleLevel := False;
  FlyForm.Caption := BoardCaption; FBaseCaption := BoardCaption; ResetPolarity1.Enabled := Model in [1, 2];
  ChipSelect.ItemIndex := -1; FBaseCaption := FBaseCaption + ' ' + 'v140926 '; SetCaption;
  CodeImage.Canvas.Font := StatusLabel.Font; CodeImage.Canvas.Pen.Width := 1;
  if Reload then begin
    CheckAndLoadChipData; FileSaveQuery(False); ResetCodeMemory(False, False, True);
    SetCaption; DrawTheSocket; ResetProgrammer;
  end;
end;


{ VA $00479464 }
procedure TProjFm.DrawTheSocket;
var PictureName: PChar;
begin
  if ChipSelect.ItemIndex = -1 then begin DrawBlankSocket; Exit; end;
  SocketImage.Canvas.Brush.Color := clBlack; SocketImage.Canvas.FillRect(ClientRect);
  PictureName := nil;
  if ICSPMode1.Checked or (FSocketLayout = 0) then begin
    case FProgrammerModel of 0: PictureName := 'icsp128'; 5: PictureName := 'icsp182';
    else PictureName := 'icsp'; end;
  end else begin
    case FSocketLayout of
      1: if FProgrammerModel = 1 then PictureName := 'pin811' else PictureName := 'pin813';
      2: PictureName := 'pin18'; 3: PictureName := 'pin28n';
      4: PictureName := 'pin28w'; 5: PictureName := 'pin40';
      8: if FProgrammerModel = 1 then PictureName := 'pin1411' else PictureName := 'pin1413';
      9: if FProgrammerModel = 1 then PictureName := 'pin840' else PictureName := 'pin837';
    end;
  end;
  if PictureName <> nil then PasteThePicture(PictureName);
end;


{ VA $004796DC }
procedure TProjFm.PasteThePicture(ResourceName: PChar);
var Bitmap: TBitmap;
begin
  Bitmap := TBitmap.Create;
  try
    Bitmap.LoadFromResourceName(HInstance, AnsiString(ResourceName));
    SocketImage.Canvas.CopyMode := cmSrcCopy; SocketImage.Canvas.Draw(0, 0, Bitmap);
  finally
    Bitmap.Free;
  end;
end;


{ VA $004797AC }
procedure TProjFm.DisplayCodeLines;
var VisibleRow, DisplayLineIndex: Integer; LineText, AddressText: AnsiString; Canvas: TCanvas;
begin
  if FCodeDisplayLines.Count = 0 then Exit;
  Canvas := CodeImage.Canvas;
  Canvas.Pen.Color := clWhite; Canvas.MoveTo(42, 0); Canvas.LineTo(42, CodeImage.Height);
  Canvas.Pen.Color := clGray; Canvas.MoveTo(43, 0); Canvas.LineTo(43, CodeImage.Height);
  Canvas.Brush.Color := clSilver; Canvas.FillRect(Bounds(0, 0, 42, CodeImage.Height));
  for VisibleRow := 0 to 15 do begin
    DisplayLineIndex := CodeScroll.Position + VisibleRow;
    if DisplayLineIndex < FCodeDisplayLines.Count then LineText := FCodeDisplayLines[DisplayLineIndex] else LineText := '';
    while Length(LineText) <= 56 do LineText := LineText + ' ';
    if LineText[3] in ['M', 'P'] then begin
      Canvas.Brush.Color := clWhite; Canvas.Font.Color := clRed;
      Canvas.TextOut(56, VisibleRow * 14 + 5, LineText);
    end else begin
      Canvas.Font.Color := clBlack; AddressText := Copy(LineText, 1, 5); Delete(LineText, 1, 5);
      Canvas.Brush.Color := clSilver; Canvas.TextOut(0, VisibleRow * 14 + 5, ' ' + AddressText);
      Canvas.Brush.Color := clWhite; Canvas.TextOut(48, VisibleRow * 14 + 5, LineText);
    end;
  end;
end;


{ VA $00474FF8 }
procedure TProjFm.FormClose(Sender: TObject; var Action: TCloseAction);
var RecentIndex: Integer; RecentPath: AnsiString;
  procedure AddFlag(Value: Boolean);
  begin if Value then FTextWorkLines.Add('T') else FTextWorkLines.Add('F'); end;
begin
  if FSkipPreferenceSave then Exit;
  ChDir(FExecutableDirectory); FTextWorkLines.Clear;
  FTextWorkLines.Add(IntToStr(Serial1.Port)); FTextWorkLines.Add(IntToStr(ChipSelect.Items.Count));
  FTextWorkLines.Add(IntToStr(ChipSelect.ItemIndex)); FTextWorkLines.Add(ChipSelect.Items[ChipSelect.ItemIndex]);
  AddFlag(AutoUpdateFiles1.Checked); FTextWorkLines.Add(IntToStr(FProgrammerModel)); AddFlag(Positive1.Checked);
  AddFlag(IgnoreBlankCheck1.Checked); FTextWorkLines.Add(IntToStr(FCalibrationPolicy)); AddFlag(EepLineMode.Checked);
  AddFlag(ICSPMode1.Checked); FTextWorkLines.Add(FMPLABExecutablePath);
  for RecentIndex := 0 to 3 do begin RecentPath := FRecentFilePaths[RecentIndex]; if RecentPath = '' then RecentPath := '?'; FTextWorkLines.Add(RecentPath); end;
  FTextWorkLines.SaveToFile('pro.dat'); Application.HelpCommand(2, 0);
end;


{ VA $00476578 }
function TProjFm.CheckAndLoadChipData: Boolean;
var ErrorLineIndex: Integer;
begin
  Result := False; FChipDatabaseLines.Clear;
  if FileExists(FExecutableDirectory + 'chipdata.cid') then
    try FChipDatabaseLines.LoadFromFile(FExecutableDirectory + 'chipdata.cid'); except FChipDatabaseLines.Clear; end;
  if FChipDatabaseLines.Count = 0 then
    MessageDlg('Chip configuration file is missing or contains no data', mtError, [mbOK], 0)
  else begin
    ErrorLineIndex := SyntaxCheckChipList;
    if ErrorLineIndex = -1 then begin
      DeleteUnwantedChipData;
      if ExtractChipNames = 0 then
        MessageDlg('Chip configuration file contains no chip information', mtError, [mbOK], 0)
      else Result := True;
    end else
      MessageDlg('Chip configuration file contains syntax errors.' + #13#13 + FChipNameAtSyntaxCheck +
        '  Line ' + IntToStr(ErrorLineIndex) + '  ' + FChipDatabaseLines[ErrorLineIndex], mtError, [mbOK], 0);
  end;
  FROMWords.Clear; Refresh;
end;


{ VA $0047EE64 }
procedure TProjFm.UpdateFuses16;
var ComponentIndex, OptionIndex, Mask1, Mask2, Bits1, Bits2, Value1, Value2, Candidate1, Candidate2: Integer;
    FuseCombo: TComboBox; OptionText: AnsiString;
begin
  for ComponentIndex := 0 to FuseEditFM.ComponentCount - 1 do
    if FuseEditFM.Components[ComponentIndex] is TComboBox then begin
      FuseCombo := TComboBox(FuseEditFM.Components[ComponentIndex]);
      if (FuseCombo.Tag = 0) or (FuseCombo.Items.Count = 0) then Continue;
      Mask1 := FBlankROMWord; Mask2 := FBlankROMWord;
      for OptionIndex := 0 to FuseCombo.Items.Count - 1 do begin
        OptionText := FuseCombo.Items[OptionIndex];
        if Pos('&', OptionText) = 0 then Mask1 := Mask1 and VerifyHEX(Copy(OptionText, Length(OptionText) - 3, 4))
        else begin
          Mask1 := Mask1 and VerifyHEX(Copy(OptionText, Length(OptionText) - 8, 4));
          Mask2 := Mask2 and VerifyHEX(Copy(OptionText, Length(OptionText) - 3, 4));
        end;
      end;
      Bits1 := FBlankROMWord xor Mask1; Bits2 := FBlankROMWord xor Mask2; Value2 := 0;
      case FFuseWordByControlTag[FuseCombo.Tag] of
        1: begin Value1 := FFuseWord1 and Bits1; Value2 := FFuseWord2 and Bits2; end;
        2: Value1 := FFuseWord2 and Bits1; 3: Value1 := FFuseWord3 and Bits1;
        4: Value1 := FFuseWord4 and Bits1; 5: Value1 := FFuseWord5 and Bits1; 6: Value1 := FFuseWord6 and Bits1;
      else Value1 := FFuseWord7 and Bits1; end;
      for OptionIndex := 0 to FuseCombo.Items.Count - 1 do begin
        OptionText := FuseCombo.Items[OptionIndex];
        if Pos('&', OptionText) = 0 then begin
          Candidate1 := VerifyHEX(Copy(OptionText, Length(OptionText) - 3, 4)) and Bits1;
          if Candidate1 = Value1 then begin FuseCombo.ItemIndex := OptionIndex; Break; end;
        end else begin
          Candidate1 := VerifyHEX(Copy(OptionText, Length(OptionText) - 8, 4)) and Bits1;
          Candidate2 := VerifyHEX(Copy(OptionText, Length(OptionText) - 3, 4)) and Bits2;
          if (Candidate1 = Value1) and (Candidate2 = Value2) then begin FuseCombo.ItemIndex := OptionIndex; Break; end;
        end;
      end;
    end;
end;


{ VA $0047F274 }
procedure TProjFm.CreateFuseValueFromFuseEdits;
var ComponentIndex, PrimaryMask, SecondaryMask: Integer; FuseCombo: TComboBox; OptionText: AnsiString;
begin
  FFuseWord1 := FBlankFuseWord1; FFuseWord2 := FBlankFuseWord2; FFuseWord3 := FBlankFuseWord3; FFuseWord4 := FBlankFuseWord4;
  FFuseWord5 := FBlankFuseWord5; FFuseWord6 := FBlankFuseWord6; FFuseWord7 := FBlankFuseWord7;
  for ComponentIndex := 0 to FuseEditFM.ComponentCount - 1 do
    if FuseEditFM.Components[ComponentIndex] is TComboBox then begin
      FuseCombo := TComboBox(FuseEditFM.Components[ComponentIndex]);
      if (FuseCombo.Tag = 0) or not FuseCombo.Visible then Continue;
      OptionText := FuseCombo.Items[FuseCombo.ItemIndex];
      if Pos('&', OptionText) = 0 then begin
        PrimaryMask := VerifyHEX(Copy(OptionText, Length(OptionText) - 3, 4));
        case FFuseWordByControlTag[FuseCombo.Tag] of
          1: FFuseWord1 := FFuseWord1 and PrimaryMask; 2: FFuseWord2 := FFuseWord2 and PrimaryMask; 3: FFuseWord3 := FFuseWord3 and PrimaryMask;
          4: FFuseWord4 := FFuseWord4 and PrimaryMask; 5: FFuseWord5 := FFuseWord5 and PrimaryMask; 6: FFuseWord6 := FFuseWord6 and PrimaryMask;
        else FFuseWord7 := FFuseWord7 and PrimaryMask; end;
      end else begin
        PrimaryMask := VerifyHEX(Copy(OptionText, Length(OptionText) - 8, 4)); SecondaryMask := VerifyHEX(Copy(OptionText, Length(OptionText) - 3, 4));
        if FFuseWordByControlTag[FuseCombo.Tag] = 1 then begin FFuseWord1 := FFuseWord1 and PrimaryMask; FFuseWord2 := FFuseWord2 and SecondaryMask; end;
      end;
    end;
end;


{ VA $00479B74 }
procedure TProjFm.SaveButtClick(Sender: TObject);
var Saved: Boolean;
begin
  if not IsChipSelected then Exit;
  if (FROMWords.Count = 0) and (FEEPROMBytes.Count = 0) then begin
    MessageDlg('Nothing to save', mtInformation, [mbOK], 0); Exit;
  end;
  SetTheCurrentDirectory; StatusLabel.Caption := 'Saving...';
  if SaveDialog1.Execute then begin
    SetProgrammingDataSize;
    if FBlankROMWord = $FFFF then Saved := SaveINHX32File else Saved := SaveINHX8MFile;
    if Saved then begin
      FLoadedFilePaths.Clear; FLoadedFilePaths.Add(SaveDialog1.FileName);
      AddToRecentFileNamesMenu(OpenDialog1.FileName, False);
      FLastFileDirectory := ExtractFilePath(SaveDialog1.FileName); SetCaption; FDataModified := False;
    end;
  end;
  StatusLabel.Caption := 'Program Ready'; SetCurrentDir(FExecutableDirectory);
end;


{ VA $0047AEE8 }
function TProjFm.DoLoadProcedure(Merge: Boolean; FileName: AnsiString): Boolean;
var ResolvedFileName: AnsiString; MemoryIndex: Integer;
begin
  Result := False;
  if FileName = '' then begin
    SetTheCurrentDirectory;
    if Merge then OpenDialog1.Title := 'Merge HEX File' else OpenDialog1.Title := 'Open HEX File';
    if not OpenDialog1.Execute then Exit;
    ResolvedFileName := OpenDialog1.FileName;
    if not Merge then ResetCodeMemory(False, True, True);
  end else ResolvedFileName := FileName;
  UpdateIDedit;
  if not Merge then begin
    EditCodeFm.ROMGrid.RowCount := FROMWordCount + 1; EditCodeFm.EEPROMGrid.RowCount := FEEPROMByteCount + 1;
  end;
  if FileExists(ResolvedFileName) then begin
    Result := LoadTheHexFile(ResolvedFileName);
    if Result then begin
      for MemoryIndex := 0 to FImportedROMWords.Count - 1 do
        if not Merge or (StrToInt(FROMWords[MemoryIndex]) = FBlankROMWord) then FROMWords[MemoryIndex] := FImportedROMWords[MemoryIndex];
      for MemoryIndex := 0 to FImportedEEPROMBytes.Count - 1 do
        if not Merge or (StrToInt(FEEPROMBytes[MemoryIndex]) = $FF) then FEEPROMBytes[MemoryIndex] := FImportedEEPROMBytes[MemoryIndex];
      if not Merge then begin
        FuseEditFM.IDedit.Text := FImportedUserID;
        FFuseWord1 := FImportedFuseWord1; FFuseWord2 := FImportedFuseWord2; FFuseWord3 := FImportedFuseWord3; FFuseWord4 := FImportedFuseWord4;
        FFuseWord5 := FImportedFuseWord5; FFuseWord6 := FImportedFuseWord6; FFuseWord7 := FImportedFuseWord7;
      end;
      case FBlankROMWord of $FFF, $3FFF: UpdateFuses1214; $FFFF: UpdateFuses16; end;
      if FileName = '' then begin FLoadedFilePaths.Add(ResolvedFileName); AddToRecentFileNamesMenu(ResolvedFileName, Merge); end;
      FLastFileDirectory := ExtractFilePath(OpenDialog1.FileName); CreateCodeData;
    end;
  end;
  if not Result then begin
    ResetCodeMemory(False, False, True);
    EditCodeFm.ROMGrid.RowCount := 1; EditCodeFm.EEPROMGrid.RowCount := 1;
  end;
  DisplayCodeLines; SetCaption; StatusLabel.Caption := 'Ready'; SetCurrentDir(FExecutableDirectory);
end;


{ VA $0047B5EC }
function TProjFm.LoadTheHexFile(FileName: AnsiString): Boolean;
var WordIndex, ErrorLineIndex, LoadStageOrAnswer: Integer; Region: AnsiString;
begin
  Result := False;
  try FTextWorkLines.LoadFromFile(FileName);
  except MessageDlg('Error loading file', mtError, [mbOK], 0); Exit; end;
  ErrorLineIndex := ScanHexFile;
  if ErrorLineIndex >= 0 then begin
    MessageDlg('Error in HEX file - line ' + IntToStr(ErrorLineIndex) + #13#13 + FTextWorkLines[ErrorLineIndex] +
      #13#13 + FHexErrorText, mtError, [mbOK], 0); Exit;
  end;
  FImportedROMWords.Clear; FImportedEEPROMBytes.Clear;
  for WordIndex := 0 to FROMWordCount do FImportedROMWords.Add(IntToStr(FBlankROMWord));
  for WordIndex := 0 to FEEPROMByteCount do FImportedEEPROMBytes.Add('255');
  LoadStageOrAnswer := 0; ErrorLineIndex := NewExtractROMData;
  if ErrorLineIndex <> -1 then LoadStageOrAnswer := 1;
  if LoadStageOrAnswer = 0 then begin ErrorLineIndex := NewExtractEEPROMData; if ErrorLineIndex <> -1 then LoadStageOrAnswer := 2; end;
  if LoadStageOrAnswer = 0 then begin
    ErrorLineIndex := NewExtractIDData;
    if FBlankROMWord <> $FFFF then Delete(FImportedUserID, 5, 4);
    if ErrorLineIndex <> -1 then LoadStageOrAnswer := 3;
  end;
  if LoadStageOrAnswer = 0 then begin ErrorLineIndex := NewExtractFuseData; if ErrorLineIndex <> -1 then LoadStageOrAnswer := 4; end;
  if LoadStageOrAnswer <> 0 then begin
    case LoadStageOrAnswer of 1: Region := 'ROM'; 2: Region := 'EEPROM'; 3: Region := 'ID'; else Region := 'FUSE'; end;
    MessageDlg('Error in HEX file - ' + Region + #13#13 + 'Line: ' + IntToStr(ErrorLineIndex) + #13#13 +
      FTextWorkLines[ErrorLineIndex], mtError, [mbOK], 0); Exit;
  end;
  for WordIndex := 0 to FImportedROMWords.Count - 1 do
    if StrToInt(FImportedROMWords[WordIndex]) > FBlankROMWord then begin
      LoadStageOrAnswer := MessageDlg('This data appears to be for a different core type' + #13 +
        'and may not function with the selected device.' + #13#13 +
        'Data will be truncated. Continue loading?', mtConfirmation, [mbYes, mbNo], 0);
      Refresh; if LoadStageOrAnswer = mrNo then Exit; Break;
    end;
  for WordIndex := 0 to FImportedROMWords.Count - 1 do FImportedROMWords[WordIndex] := IntToStr(StrToInt(FImportedROMWords[WordIndex]) and FBlankROMWord);
  Result := True;
end;


{ VA $00478C54 }
procedure TProjFm.SelectTheChip;
var ControlTagIndex: Integer; ChipName: AnsiString;
begin
  if ChipSelect.ItemIndex = -1 then Exit;
  ICSPMode1.Checked := False; Refresh; FIsPIC16F88 := False; FBaselineUserIDMode := False;
  ChipName := ChipSelect.Items[ChipSelect.ItemIndex];
  if ChipName = '16F88' then FIsPIC16F88 := True
  else if (ChipName = '16F54') or (ChipName = '16F57') then FBaselineUserIDMode := True;
  FlyWindow1.Enabled := True; FuseButt.Enabled := True;
  for ControlTagIndex := 0 to 31 do FFuseWordByControlTag[ControlTagIndex] := -1;
  FuseEditFM.ResetFuseEdits; OscalButt.Enabled := False;
  FuseEditFM.IDedit.MaxLength := 4; FuseEditFM.IDLabel.Visible := True;
  FuseEditFM.IDedit.Visible := True; FProgramFlags := 0;
  Extractchipdata;
  if FHasCalibrationWord then FProgramFlags := FProgramFlags or 1;
  if FHasBandgapCalibration then FProgramFlags := FProgramFlags or 2;
  if FCoreAlgorithm = 1 then FProgramFlags := FProgramFlags or 4;
  if FFastPowerSequence then FProgramFlags := FProgramFlags or 8;
  if (ChipName = '16F737') or (ChipName = '16F747') or (ChipName = '16F767') then FProgramFlags := FProgramFlags or $10;
  case FCoreAlgorithm of
    0..2: begin FuseEditFM.IDedit.MaxLength := 8; FBlankROMWord := $FFFF; end;
    3, 5..10: begin FBlankROMWord := $3FFF; OscalButt.Enabled := FHasCalibrationWord; end;
    4: begin
      FBlankROMWord := $FFF; OscalButt.Enabled := FHasCalibrationWord;
      FuseEditFM.IDLabel.Visible := False; FuseEditFM.IDedit.Visible := False;
    end;
    11: FBlankROMWord := $FFF;
    12: begin FBlankROMWord := $FFF; OscalButt.Enabled := FHasCalibrationWord; end;
  end;
  OSCAL1.Enabled := OscalButt.Enabled;
  SaveButt.Enabled := True; ReadButt.Enabled := True; VerfButt.Enabled := True;
  Save1.Enabled := True; Read1.Enabled := True; Verify1.Enabled := True;
  DrawTheSocket;
  ReadDebug.Enabled := Pos('18F', ChipSelect.Text) = 1;
  WriteDebug.Enabled := ReadDebug.Enabled;
  if FRequiresICSP and not ICSPMode1.Checked then begin
    if not FStartupPending then MessageDlg('This chip requires ICSP Mode to be enabled.', mtInformation, [mbOK], 0);
    Refresh; ICSPMode1.Click;
  end;
end;


{ VA $0047DC20 }
procedure TProjFm.CreateCodeData;
var MemoryIndex, DisplayColumn, Address, Value, MaxScrollPosition: Integer; Line, Chars, WordHexText: AnsiString;
begin
  CodeImage.Canvas.Brush.Color := clWhite; CodeImage.Canvas.FillRect(ClientRect);
  StatusLabel.Caption := 'Sorting data...'; StatusLabel.Refresh; FCodeDisplayLines.Clear;
  if FROMWords.Count <> 0 then begin
    FCodeDisplayLines.Add('ROM DATA'); Address := 0; DisplayColumn := 0; Line := '0000: '; Chars := '';
    for MemoryIndex := 0 to FROMWords.Count - 1 do begin
      Value := StrToInt(FROMWords[MemoryIndex]); WordHexText := MyIntToHex(Value, 4);
      if (FBlankROMWord = $FFF) or (FCoreAlgorithm = 12) then WordHexText[1] := ' ';
      Line := Line + WordHexText + ' '; Value := Value and $FF;
      if (Value >= 32) and (Value <= 127) then Chars := Chars + Chr(Value)
      else Chars := Chars + '.';
      Inc(DisplayColumn);
      if DisplayColumn = 8 then begin
        FCodeDisplayLines.Add(Line + '   ' + Chars);
        if FBlankROMWord = $FFFF then Inc(Address, 16) else Inc(Address, 8);
        Line := MyIntToHex(Address, 4) + ': '; Chars := ''; DisplayColumn := 0;
      end;
    end;
  end;
  if FEEPROMBytes.Count <> 0 then begin
    FCodeDisplayLines.Add(''); FCodeDisplayLines.Add('EEPROM DATA'); Address := 0; DisplayColumn := 0; Line := '0000: '; Chars := '';
    for MemoryIndex := 0 to FEEPROMBytes.Count - 1 do begin
      Value := StrToInt(FEEPROMBytes[MemoryIndex]); Line := Line + '  ' + MyIntToHex(Value, 2) + ' ';
      if (Value >= 32) and (Value <= 127) then Chars := Chars + Chr(Value)
      else Chars := Chars + '.';
      Inc(DisplayColumn);
      if DisplayColumn = 8 then begin
        FCodeDisplayLines.Add(Line + '   ' + Chars); Inc(Address, 8);
        Line := MyIntToHex(Address, 4) + ': '; Chars := ''; DisplayColumn := 0;
      end;
    end;
  end;
  CodeScroll.Position := 0; MaxScrollPosition := FCodeDisplayLines.Count - 16; if MaxScrollPosition < 0 then MaxScrollPosition := 0;
  CodeScroll.Max := MaxScrollPosition; StatusLabel.Caption := 'Ready';
end;

{ VA $0047D660 }
function TProjFm.ScanHexFile: Integer;
var LineIndex, CharacterIndex, LineLength, ByteCount, Address, PreviousAddress, ChecksumSum, ExpectedChecksum: Integer;
    RecordText: AnsiString;
begin
  Result := -1; PreviousAddress := 0;
  for LineIndex := 0 to FTextWorkLines.Count - 1 do begin
    RecordText := FTextWorkLines[LineIndex]; LineLength := Length(RecordText);
    if (LineLength < 11) or (LineLength > 43) then begin
      FHexErrorText := 'Invalid line length'; Result := LineIndex; Exit;
    end;
    if LineLength = 11 then begin FHexErrorText := ''; Exit; end;
    if (LineIndex = 0) and (Copy(RecordText, 8, 2) <> '00') and (Copy(RecordText, 8, 2) <> '04') then begin
      FHexErrorText := 'Invalid file type'; Result := 1; Exit;
    end;
    if RecordText[1] <> ':' then begin Result := LineIndex; Exit; end;
    for CharacterIndex := 2 to LineLength do begin
      RecordText[CharacterIndex] := CheckASCII(RecordText[CharacterIndex]);
      if RecordText[CharacterIndex] = '-' then begin
        FHexErrorText := 'Invalid character found in file'; Result := LineIndex; Exit;
      end;
    end;
    ByteCount := HexToDec(RecordText[2]) * 16 + HexToDec(RecordText[3]);
    Address := (HexToDec(RecordText[4]) * 4096 + HexToDec(RecordText[5]) * 256 +
      HexToDec(RecordText[6]) * 16 + HexToDec(RecordText[7])) div 2;
    if LineIndex = 0 then PreviousAddress := Address;
    if Address < PreviousAddress then begin
      if (RecordText[8] <> '0') and (RecordText[9] <> '4') then begin
        FHexErrorText := 'Invalid address found'; Result := LineIndex; Exit;
      end;
      PreviousAddress := Address;
    end;
    Inc(PreviousAddress, ByteCount div 2);
    if LineLength - ByteCount * 2 <> 11 then begin
      FHexErrorText := 'Invalid line length'; Result := LineIndex; Exit;
    end;
    ExpectedChecksum := HexToDec(RecordText[LineLength - 1]) * 16 + HexToDec(RecordText[LineLength]);
    ChecksumSum := 0; CharacterIndex := 2;
    while CharacterIndex < LineLength - 2 do begin
      Inc(ChecksumSum, HexToDec(RecordText[CharacterIndex]) * 16 + HexToDec(RecordText[CharacterIndex + 1])); Inc(CharacterIndex, 2);
    end;
    if (((ChecksumSum and $FF) xor $FF) + 1) and $FF <> ExpectedChecksum then begin
      FHexErrorText := 'Invalid checksum'; Result := LineIndex; Exit;
    end;
  end;
end;


{ VA $0047BAF0 }
function TProjFm.NewExtractROMData: Integer;
var LineIndex, Address, PayloadCharCount, Offset: Integer; RecordText, WordText: AnsiString;
begin
  Result := -1; Address := 0;
  for LineIndex := 0 to FTextWorkLines.Count - 1 do begin
    RecordText := FTextWorkLines[LineIndex];
    if Length(RecordText) = 11 then Exit;
    if (Length(RecordText) = 15) and (Copy(RecordText, 8, 2) = '04') then
      Address := VerifyHEX(Copy(RecordText, 10, 4)) * $1000
    else begin
      try Offset := VerifyHEX(RecordText[4] + RecordText[5] + RecordText[6] + RecordText[7]);
      except Result := LineIndex; Exit; end;
      Address := (Address and $FF0000) + Offset div 2;
      if Address > FROMWordCount then Exit;
      try PayloadCharCount := VerifyHEX(RecordText[2] + RecordText[3]);
      except Result := LineIndex; Exit; end;
      PayloadCharCount := PayloadCharCount * 2;
      Delete(RecordText, 1, 9); Delete(RecordText, Length(RecordText) - 1, 2);
      if Length(RecordText) <> PayloadCharCount then Exit;
      while RecordText <> '' do begin
        if Address >= FROMWordCount then Exit;
        WordText := RecordText[1] + RecordText[2];
        try WordText := RecordText[3] + RecordText[4] + WordText;
        except WordText := 'FF' + WordText; end;
        FImportedROMWords[Address] := IntToStr(VerifyHEX(WordText));
        Inc(Address); Delete(RecordText, 1, 4);
      end;
    end;
  end;
end;


{ VA $0047C10C }
function TProjFm.NewExtractEEPROMData: Integer;
var LineIndex, ExtendedAddressBase, Address, EEPROMIndex, PayloadCharCount, DataByte: Integer; RecordText: AnsiString; PackedBytes: Boolean;
begin
  Result := -1;
  if not FIsFlashDevice or (FEEPROMByteCount = 0) then Exit;
  ExtendedAddressBase := 0; PackedBytes := False;
  for LineIndex := 0 to FTextWorkLines.Count - 1 do begin
    RecordText := FTextWorkLines[LineIndex];
    if Length(RecordText) = 11 then Exit;
    if (LineIndex <> 0) and (Length(RecordText) = 15) and (Copy(RecordText, 8, 2) = '04') then
      ExtendedAddressBase := VerifyHEX(Copy(RecordText, 10, 4)) * $1000
    else begin
      try Address := VerifyHEX(RecordText[4] + RecordText[5] + RecordText[6] + RecordText[7]);
      except Result := LineIndex; Exit; end;
      Inc(Address, ExtendedAddressBase);
      if (Address >= $4200) and (Address < $4200 + FEEPROMByteCount * 2) then
        EEPROMIndex := Address div 2 - $2100
      else if (Address >= $F0000) and (Address < $F0000 + FEEPROMByteCount) then begin
        EEPROMIndex := Address - $F0000;
        if not EepLineMode.Checked then PackedBytes := True;
      end else Continue;
      try PayloadCharCount := VerifyHEX(RecordText[2] + RecordText[3]);
      except Result := LineIndex; Exit; end;
      PayloadCharCount := PayloadCharCount * 2;
      Delete(RecordText, 1, 9); Delete(RecordText, Length(RecordText) - 1, 2);
      if Length(RecordText) <> PayloadCharCount then begin Result := LineIndex; Exit; end;
      if EepLineMode.Checked then EEPROMIndex := EEPROMIndex div 2;
      while RecordText <> '' do begin
        if EEPROMIndex > FEEPROMByteCount - 1 then Exit;
        try DataByte := VerifyHEX(RecordText[1] + RecordText[2]);
        except Result := LineIndex; Exit; end;
        FImportedEEPROMBytes[EEPROMIndex] := IntToStr(DataByte);
        if PackedBytes then Delete(RecordText, 1, 2) else Delete(RecordText, 1, 4);
        Inc(EEPROMIndex);
      end;
    end;
  end;
end;


{ VA $0047C74C }
function TProjFm.NewExtractIDData: Integer;
var LineIndex, ExtendedAddressBase, Address, UserIDIndex, PayloadCharCount, UserIDCharCount: Integer; RecordText: AnsiString; PackedBytes: Boolean;
begin
  Result := -1; ExtendedAddressBase := 0; FImportedUserID := 'FFFFFFFF'; PackedBytes := False;
  if FBlankROMWord = $FFFF then UserIDCharCount := 8 else UserIDCharCount := 4;
  for LineIndex := 0 to FTextWorkLines.Count - 1 do begin
    RecordText := FTextWorkLines[LineIndex];
    if Length(RecordText) = 11 then Exit;
    if (LineIndex <> 0) and (Length(RecordText) = 15) and (Copy(RecordText, 8, 2) = '04') then
      ExtendedAddressBase := VerifyHEX(Copy(RecordText, 10, 4)) * $1000
    else begin
      try Address := VerifyHEX(RecordText[4] + RecordText[5] + RecordText[6] + RecordText[7]);
      except Result := LineIndex; Exit; end;
      Inc(Address, ExtendedAddressBase);
      if (FCoreAlgorithm = 12) or FBaselineUserIDMode then begin
        if (Address < FROMWordCount * 2) or (Address >= FROMWordCount * 2 + 4) then Continue;
        UserIDIndex := Address - (FROMWordCount * 2 - 1);
      end else if (Address >= $4000) and (Address < $4004) then
        UserIDIndex := Address div 2 - $1FFF
      else if (Address >= $20000) and (Address < $20008) then begin
        UserIDIndex := Address - $1FFFF; PackedBytes := True;
      end else Continue;
      try PayloadCharCount := VerifyHEX(RecordText[2] + RecordText[3]);
      except Result := LineIndex; Exit; end;
      PayloadCharCount := PayloadCharCount * 2;
      Delete(RecordText, 1, 9); Delete(RecordText, Length(RecordText) - 1, 2);
      if Length(RecordText) <> PayloadCharCount then begin Result := LineIndex; Exit; end;
      while RecordText <> '' do begin
        if UserIDIndex > UserIDCharCount then Exit;
        FImportedUserID[UserIDIndex] := RecordText[2];
        if PackedBytes then Delete(RecordText, 1, 2) else Delete(RecordText, 1, 4);
        Inc(UserIDIndex);
      end;
    end;
  end;
end;


{ VA $0047CD20 }
function TProjFm.NewExtractFuseData: Integer;
var LineIndex, Address, FirstAddress, Offset, FuseIndex, PayloadCharCount, FuseWord: Integer; RecordText: AnsiString;
begin
  FImportedFuseWord1 := FBlankFuseWord1; FImportedFuseWord2 := FBlankFuseWord2; FImportedFuseWord3 := FBlankFuseWord3; FImportedFuseWord4 := FBlankFuseWord4;
  FImportedFuseWord5 := FBlankFuseWord5; FImportedFuseWord6 := FBlankFuseWord6; FImportedFuseWord7 := FBlankFuseWord7;
  Result := -1; Address := 0;
  if FCoreAlgorithm = 12 then FirstAddress := $FFF
  else if FBlankROMWord = $FFFF then FirstAddress := $30000
  else if FBlankROMWord = $FFF then FirstAddress := $FFF else FirstAddress := $2007;
  for LineIndex := 0 to FTextWorkLines.Count - 1 do begin
    RecordText := FTextWorkLines[LineIndex];
    if Length(RecordText) = 11 then Exit;
    if (Length(RecordText) = 15) and (Copy(RecordText, 8, 2) = '04') then
      Address := VerifyHEX(Copy(RecordText, 10, 4)) * $1000
    else begin
      try Offset := VerifyHEX(RecordText[4] + RecordText[5] + RecordText[6] + RecordText[7]);
      except Result := LineIndex; Exit; end;
      Address := (Address and $FF0000) + Offset div 2;
      if (Address < FirstAddress) or (Address > FirstAddress + FFuseWordCount - 1) then Continue;
      FuseIndex := Address - FirstAddress;
      try PayloadCharCount := VerifyHEX(RecordText[2] + RecordText[3]);
      except Result := LineIndex; Exit; end;
      PayloadCharCount := PayloadCharCount * 2;
      Delete(RecordText, 1, 9); Delete(RecordText, Length(RecordText) - 1, 2);
      if Length(RecordText) <> PayloadCharCount then begin Result := LineIndex; Exit; end;
      while RecordText <> '' do begin
        try FuseWord := VerifyHEX(RecordText[3] + RecordText[4] + RecordText[1] + RecordText[2]);
        except Result := LineIndex; Exit; end;
        case FuseIndex of
          0: FImportedFuseWord1 := FBlankFuseWord1 and FuseWord;
          1: FImportedFuseWord2 := FBlankFuseWord2 and FuseWord;
          2: FImportedFuseWord3 := FBlankFuseWord3 and FuseWord;
          3: FImportedFuseWord4 := FBlankFuseWord4 and FuseWord;
          4: FImportedFuseWord5 := FBlankFuseWord5 and FuseWord;
          5: FImportedFuseWord6 := FBlankFuseWord6 and FuseWord;
          6: begin FImportedFuseWord7 := FBlankFuseWord7 and FuseWord; Exit; end;
        else Exit;
        end;
        Delete(RecordText, 1, 4); Inc(FuseIndex); Inc(Address);
      end;
    end;
  end;
end;


{ VA $00479D38 }
function TProjFm.SaveINHX8MFile: Boolean;
var DataIndex, WordInRecord, Address, Value, LoByte, HiByte: Integer; RecordText, UserIDText: AnsiString; IncludeID: Boolean;
  procedure AddRecord;
  begin FTextWorkLines.Add(':' + RecordText + CheckSum(RecordText)); end;
begin
  Result := True;
  try
    FTextWorkLines.Clear; DataIndex := 0; Address := 0;
    while DataIndex < FROMTransferWordCount do begin
      RecordText := '';
      for WordInRecord := 0 to 7 do begin
        if DataIndex + WordInRecord < FROMWords.Count then begin
          Value := StrToInt(FROMWords[DataIndex + WordInRecord]); LoByte := Value mod 256; HiByte := Value div 256;
        end else begin
          LoByte := $FF; if FBlankROMWord = $FFF then HiByte := $0F else HiByte := $3F;
        end;
        RecordText := RecordText + MyIntToHex(LoByte, 2) + MyIntToHex(HiByte, 2);
      end;
      RecordText := '10' + MyIntToHex(Address, 4) + '00' + RecordText; AddRecord;
      Inc(DataIndex, 8); Inc(Address, 16);
    end;
    IncludeID := False;
    if FBlankROMWord = $FFF then IncludeID := FBaselineUserIDMode
    else if FCoreAlgorithm = 12 then IncludeID := True;
    { EEPROM SAVE BUG for all chips except BIT14_H (non-existent in CHIPDATA.CID }
    { OLD: if IncludeID then begin, so it was dependant on IncludeID and on FCoreAlgorithm = 12 }
    if (FEEPROMByteCount > 0) and (FEEPROMTransferByteCount > 0) then begin
      DataIndex := 0;
      if (FCoreAlgorithm = 12) or FBaselineUserIDMode then Address := FROMWordCount * 2 else Address := $4200;
      while DataIndex < FEEPROMTransferByteCount do begin
        RecordText := '';
        for WordInRecord := 0 to 7 do begin
          if DataIndex + WordInRecord < FEEPROMBytes.Count then Value := StrToInt(FEEPROMBytes[DataIndex + WordInRecord]) else Value := $FF;
          RecordText := RecordText + MyIntToHex(Value, 2) + '00';
        end;
        RecordText := '10' + MyIntToHex(Address, 4) + '00' + RecordText; AddRecord;
        Inc(DataIndex, 8); Inc(Address, 16);
      end;
    end;
    if IncludeID then begin
      if not FBaselineUserIDMode then RecordText := '08400000'
      else RecordText := '08' + MyIntToHex(FROMWordCount * 2, 4) + '00';
      UserIDText := FuseEditFM.IDEdit.Text;
      for DataIndex := 1 to 4 do RecordText := RecordText + '0' + UserIDText[DataIndex] + '00';
      AddRecord;
    end;
    if FCoreAlgorithm = 12 then RecordText := ':021FFE00'
    else if FBlankROMWord = $FFF then RecordText := '021FFE00' else RecordText := '02400E00';
    RecordText := RecordText + MyIntToHex(FFuseWord1 mod 256, 2) + MyIntToHex(FFuseWord1 div 256, 2); AddRecord;
    if FFuseWordCount = 2 then begin
      RecordText := '02401000' + MyIntToHex(FFuseWord1 mod 256, 2) + MyIntToHex(FFuseWord1 div 256, 2);
      AddRecord;
    end;
    FTextWorkLines.Add(':00000001FF'); FTextWorkLines.SaveToFile(SaveDialog1.FileName);
  except
    MessageDlg('A problem occurred while trying to save the HEX file', mtError, [mbOK], 0);
    Result := False;
  end;
end;


{ VA $0047A46C }
function TProjFm.SaveINHX32File: Boolean;
var DataIndex, WordInRecord, Address, Value: Integer; RecordText, UserIDText: AnsiString;
  procedure AddRecord;
  begin FTextWorkLines.Add(':' + RecordText + CheckSum(RecordText)); end;
  procedure AddWord(WordValue: Integer);
  begin RecordText := RecordText + MyIntToHex(WordValue and $FF, 2) + MyIntToHex(WordValue div 256, 2); end;
begin
  Result := True;
  try
    FTextWorkLines.Clear; FTextWorkLines.Add(':020000040000FA'); DataIndex := 0; Address := 0;
    while DataIndex < FROMTransferWordCount do begin
      RecordText := '';
      for WordInRecord := 0 to 7 do begin
        if DataIndex + WordInRecord < FROMWords.Count then Value := StrToInt(FROMWords[DataIndex + WordInRecord]) else Value := $FFFF;
        RecordText := RecordText + MyIntToHex(Value mod 256, 2) + MyIntToHex(Value div 256, 2);
      end;
      RecordText := '10' + MyIntToHex(Address, 4) + '00' + RecordText; AddRecord;
      Inc(DataIndex, 8); Inc(Address, 16);
    end;
    FTextWorkLines.Add(':020000040020DA'); RecordText := '08000000';
    UserIDText := FuseEditFM.IDEdit.Text;
    while Length(UserIDText) < 8 do UserIDText := 'F' + UserIDText;
    FuseEditFM.IDEdit.Text := UserIDText;
    for DataIndex := 1 to 8 do RecordText := RecordText + '0' + UserIDText[DataIndex];
    AddRecord;
    FTextWorkLines.Add(':020000040030CA'); RecordText := '08000000';
    AddWord(FFuseWord1); AddWord(FFuseWord2); AddWord(FFuseWord3); AddWord(FFuseWord4); AddRecord;
    if FEEPROMTransferByteCount <> 0 then begin
      FTextWorkLines.Add(':0200000400F00A'); DataIndex := 0;
      while DataIndex < FEEPROMTransferByteCount do begin
        RecordText := '';
        for WordInRecord := 0 to 15 do begin
          if DataIndex + WordInRecord < FEEPROMBytes.Count then Value := StrToInt(FEEPROMBytes[DataIndex + WordInRecord]) else Value := $FF;
          RecordText := RecordText + MyIntToHex(Value, 2);
        end;
        RecordText := '10' + MyIntToHex(DataIndex, 4) + '00' + RecordText; AddRecord; Inc(DataIndex, 16);
      end;
    end;
    FTextWorkLines.Add(':00000001FF'); FTextWorkLines.SaveToFile(SaveDialog1.FileName);
  except
    MessageDlg('A problem occurred while trying to save the HEX file', mtError, [mbOK], 0);
    Result := False;
  end;
end;

{ VA $00474FE0 }
procedure TProjFm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := FileSaveQuery(True);
end;


{ VA $00479A58 }
function TProjFm.FileSaveQuery(AllowCancel: Boolean): Boolean;
var
  Answer: Integer;
begin
  Result := True;
  if FDataModified then
  begin
    if AllowCancel then
    begin
      Answer := MessageDlg('Data file has changed. Do you wish to save it?',
        mtConfirmation, [mbYes, mbNo, mbCancel], 0);
      case Answer of
        mrYes: SaveButt.Click;
        mrCancel: Result := False;
      end;
    end
    else if MessageDlg('Data file has changed. Do you wish to save it?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      SaveButt.Click;
  end;
end;


{ VA $00479B14 }
function TProjFm.IsChipSelected: Boolean;
begin
  Result := True;
  if ChipSelect.ItemIndex = -1 then
  begin
    MessageDlg('Please select a processor', mtInformation, [mbOK], 0);
    Result := False;
  end;
end;


{ VA $0047FAC4. Spelling in the diagnostic is preserved. }
function TProjFm.CheckButtonsAllow(RequireChip: Boolean): Boolean;
begin
  Result := False;
  if RequireChip then
    if not IsChipSelected then Exit;
  if not SerialIsActive(Serial1) then
    MessageDlg('COM port innactive, cannot execute selected function.',
      mtError, [mbOK], 0)
  else
    Result := True;
end;


{ VA $0047FA6C }
procedure TProjFm.DisableUserButtons;
begin
  ButtonPanel.Enabled := False;
  ChipSelect.Enabled := False;
  File1.Enabled := False;
  Programmer1.Enabled := False;
  Options1.Enabled := False;
  Help1.Enabled := False;
end;


{ VA $0047944C }
procedure TProjFm.DrawBlankSocket;
begin
  PasteThePicture('sockets');
end;


{ VA $004797A0 }
procedure TProjFm.CodeScrollChange(Sender: TObject);
begin
  DisplayCodeLines;
end;


{ VA $00478C24. FileSaveQuery's result is intentionally ignored here. }
procedure TProjFm.PreSelectChip;
begin
  FileSaveQuery(False);
  SelectTheChip;
  ResetCodeMemory(False, False, True);
  SetCaption;
end;


{ VA $00478BF4 }
procedure TProjFm.ChipSelectChange(Sender: TObject);
begin
  PreSelectChip;
  StatusLabel.Caption := 'Ready';
end;


{ VA $0047EAA4 }
procedure TProjFm.Positive1Click(Sender: TObject);
begin
  Positive1.Checked := not Positive1.Checked;
  Negative1.Checked := not Positive1.Checked;
  FResetIdleLevel := Positive1.Checked;
  Reset1.Click;
end;


{ VA $0047EAF0 }
procedure TProjFm.Negative1Click(Sender: TObject);
begin
  Negative1.Checked := not Negative1.Checked;
  Positive1.Checked := not Negative1.Checked;
  FResetIdleLevel := Positive1.Checked;
  Reset1.Click;
end;


{ VA $0047EB3C }
procedure TProjFm.Reset1Click(Sender: TObject);
begin
  if CheckButtonsAllow(False) then ResetProgrammer;
end;


{ VA $0047EB5C. Original explicitly references global forms. }
procedure TProjFm.FlyWindow1Click(Sender: TObject);
begin
  ProjFm.Visible := False;
  FlyForm.StatusLabel.Caption := '';
  FlyForm.Show;
end;


{ VA $0047F678 }
procedure TProjFm.ICSPMode1Click(Sender: TObject);
begin
  if not IsChipSelected then Exit;
  ICSPMode1.Checked := not ICSPMode1.Checked;
  if not ICSPMode1.Checked then
    ICSPLabel.Caption := ''
  else
  begin
    ICSPLabel.Caption := 'ICSP';
    if AutoProgram.Checked then
      MessageDlg('Auto Program Mode may not work correctly when ICSP is enabled.',
        mtInformation, [mbOK], 0);
  end;
  DrawTheSocket;
end;


{ VA $0047F74C }
procedure TProjFm.IgnoreBlankCheck1Click(Sender: TObject);
begin
  IgnoreBlankCheck1.Checked := not IgnoreBlankCheck1.Checked;
end;


{ VA $00487EC4 }
procedure TProjFm.K1281Click(Sender: TObject);
begin
  if not K1281.Checked then
    if CheckButtonsAllow(False) then SetProgramVersion(0, True);
end;


{ VA $00487EF4 }
procedure TProjFm.K149aClick(Sender: TObject);
begin
  if not K149A.Checked then
    if CheckButtonsAllow(False) then SetProgramVersion(1, True);
end;


{ VA $00487F24 }
procedure TProjFm.K149BFClick(Sender: TObject);
begin
  if not K149BF.Checked then
    if CheckButtonsAllow(False) then SetProgramVersion(2, True);
end;


{ VA $00487F54 }
procedure TProjFm.K1501Click(Sender: TObject);
begin
  if not K1501.Checked then
    if CheckButtonsAllow(False) then SetProgramVersion(3, True);
end;


{ VA $00487F84 }
procedure TProjFm.K1701Click(Sender: TObject);
begin
  if not K1701.Checked then
    if CheckButtonsAllow(False) then SetProgramVersion(4, True);
end;


{ VA $00487FB4 }
procedure TProjFm.K1821Click(Sender: TObject);
begin
  if not K1821.Checked then
    if CheckButtonsAllow(False) then SetProgramVersion(5, True);
end;


{ VA $00488698 }
procedure TProjFm.Exit1Click(Sender: TObject);
begin
  Close;
end;


{ VA $00488AB4 }
procedure TProjFm.CodeImageDblClick(Sender: TObject);
begin
  EditHEXCode1.Click;
end;


{ VA $00488DA8 }
procedure TProjFm.ErrorMessage1Click(Sender: TObject);
begin
  FCalibrationPolicy := 0;
  SetCalInsertStyle;
end;


{ VA $00488DBC }
procedure TProjFm.InsertOriginalIntoFile1Click(Sender: TObject);
begin
  FCalibrationPolicy := 1;
  SetCalInsertStyle;
end;


{ VA $00488DD0 }
procedure TProjFm.InsertFileIntoOriginal1Click(Sender: TObject);
begin
  FCalibrationPolicy := 2;
  SetCalInsertStyle;
end;


{ VA $00488DE4. Every value except 0 and 1 selects the third item. }
procedure TProjFm.SetCalInsertStyle;
begin
  case FCalibrationPolicy of
    0:
      begin
        ErrorMessage1.Checked := True;
        InsertOriginalIntoFile1.Checked := False;
        InsertFileIntoOriginal1.Checked := False;
      end;
    1:
      begin
        ErrorMessage1.Checked := False;
        InsertOriginalIntoFile1.Checked := True;
        InsertFileIntoOriginal1.Checked := False;
      end;
  else
    ErrorMessage1.Checked := False;
    InsertOriginalIntoFile1.Checked := False;
    InsertFileIntoOriginal1.Checked := True;
  end;
end;


{ VA $00489090. $230 is the original state argument, not a renamed enum. }
procedure TProjFm.ReadDebugClick(Sender: TObject);
begin
  if CheckButtonsAllow(True) then InitialiseProgrammerVariables($230);
end;


{ VA $00489238 }
procedure TProjFm.AutoUpdateFiles1Click(Sender: TObject);
begin
  AutoUpdateFiles1.Checked := not AutoUpdateFiles1.Checked;
end;


{ VA $00489254 }
procedure TProjFm.Refresh1Click(Sender: TObject);
begin
  LoadMultipleHexFiles;
end;


{ VA $00489744 }
procedure TProjFm.Clear1Click(Sender: TObject);
begin
  if FileSaveQuery(True) then
  begin
    ResetCodeMemory(False, False, True);
    SetCaption;
  end;
end;


{ VA $00489770 }
procedure TProjFm.EepLineModeClick(Sender: TObject);
begin
  EepLineMode.Checked := not EepLineMode.Checked;
  LoadMultipleHexFiles;
end;


{ VA $00489908 }
procedure TProjFm.CodeScrollEnter(Sender: TObject);
begin
  FCodeScrollFocused := True;
end;


{ VA $00489910 }
procedure TProjFm.CodeScrollExit(Sender: TObject);
begin
  FCodeScrollFocused := False;
end;


{ VA $00489918. Menu is under MPLABmenu in the extracted DFM.
  FMPLABExecutablePath is the configured file path, not a hard-coded program name. }
procedure TProjFm.Start1Click(Sender: TObject);
begin
  if FileExists(FMPLABExecutablePath) then
  begin
    if ShellExecute(Handle, 'open', PChar(FMPLABExecutablePath), nil, nil, SW_SHOWNORMAL) > 32 then
      FlyWindow1.Click;
  end
  else if not FStartupPending then
    MessageDlg('The path for this file is invalid', mtError, [mbOK], 0);
end;


{ VA $004899C0 }
procedure TProjFm.Path1Click(Sender: TObject);
var
  ChosenFile: AnsiString;
begin
  OpenDialog2.FileName := '*.exe';
  if OpenDialog2.Execute then
  begin
    ChosenFile := OpenDialog2.FileName;
    if not FileExists(ChosenFile) then
    begin
      MessageDlg('The path for this file is invalid', mtError, [mbOK], 0);
      Path1.Checked := False;
    end
    else
    begin
      FMPLABExecutablePath := ChosenFile;
      Path1.Checked := True;
    end;
  end;
end;

{ VA $00480C8C }
procedure TProjFm.Serial1RxData(Sender: TObject);
var
  ReceivedByte: Char;
  ReceivedByteCount, ElementIndex, ConfigByteIndex, ProtocolValue, ProgramWord, ExpectedValue, ActualValue, ErrorAddress, DeviceID, DeviceRevision: Integer;
  ResponseText, DetailText, UnusedReceiveText, FuseAddressText: AnsiString;
  ContinueProgramming: Boolean;

  procedure Tx(Value: Integer);
  begin Serial2_SendByte(Serial1, Byte(Value)); end;
  procedure TxString(const Bytes: AnsiString);
  begin Serial2_SendBytes(Serial1, Bytes); end;
  procedure TxBE(Value: Integer);
  begin TxString(Chr(Byte(Value div 256)) + Chr(Byte(Value mod 256))); end;
  procedure TxLE(Value: Integer);
  begin TxString(Chr(Byte(Value mod 256)) + Chr(Byte(Value div 256))); end;
  function WordBE(const Bytes: AnsiString; ByteIndex: Integer): Integer;
  begin Result := Ord(Bytes[ByteIndex]) * 256 + Ord(Bytes[ByteIndex + 1]); end;
  function WordLE(const Bytes: AnsiString; ByteIndex: Integer): Integer;
  begin Result := Ord(Bytes[ByteIndex]) + Ord(Bytes[ByteIndex + 1]) * 256; end;
  procedure Progress(Value: Integer);
  begin ProgressBar1.Position := Value; FlyForm.ProgressBar1.Position := Value; end;
  procedure Maximum(Value: Integer);
  begin ProgressBar1.Max := Value; FlyForm.ProgressBar1.Max := Value; end;
  procedure Info(const Text: AnsiString);
  begin MessageDlg(Text, mtInformation, [mbOK], 0); end;
  procedure Error(const Text: AnsiString);
  begin MessageDlg(Text, mtError, [mbOK], 0); end;
  function Ask(const Text: AnsiString): Boolean;
  begin Result := MessageDlg(Text, mtConfirmation, [mbYes, mbNo], 0) = mrYes; end;
  function IsReply(const Bytes: AnsiString): Boolean;
  begin Result := FReceiveBuffer = Bytes; if not Result then FProtocolError := True; end;
  procedure EnableProgramming(Command: Integer);
  begin if FBlankROMWord = $FFFF then TxString(#2'V') else Tx(Command); end;
  procedure DisableProgramming;
  begin if FBlankROMWord = $FFFF then TxString(#2'v') else Tx(5); end;
  function Cancelled: Boolean;
  begin
    Result := FCancelRequested;
    if Result then begin ResetSerial(True); ResetProgrammer; if FCommandLineAutoProgram then Close; end;
  end;
  function BoardName(Board: Integer): AnsiString;
  begin
    case Board of
      0: Result := 'K128'; 1: Result := 'K149-A'; 2: Result := 'K149-BC';
      3: Result := 'K150'; 4: Result := 'K170';
    else Result := 'K182'; end;
  end;
  procedure SelectBoard(Board: Integer);
  begin
    case Board of
      0: K1281.Click; 1: K149a.Click; 2: K149BF.Click;
      3: K1501.Click; 4: K1701.Click; 5: K1821.Click;
    end;
  end;
  function FuseValue(FuseIndex: Integer): Integer;
  begin
    case FuseIndex of
      0: Result := FFuseWord1; 1: Result := FFuseWord2; 2: Result := FFuseWord3;
      3: Result := FFuseWord4; 4: Result := FFuseWord5; 5: Result := FFuseWord6;
    else Result := FFuseWord7; end;
  end;
  function BlankFuseValue(FuseIndex: Integer): Integer;
  begin
    case FuseIndex of
      0: Result := FBlankFuseWord1; 1: Result := FBlankFuseWord2; 2: Result := FBlankFuseWord3;
      3: Result := FBlankFuseWord4; 4: Result := FBlankFuseWord5; 5: Result := FBlankFuseWord6;
    else Result := FBlankFuseWord7; end;
  end;
  procedure SendFuses;
  var FuseIndex: Integer;
  begin for FuseIndex := 0 to 6 do TxLE(FuseValue(FuseIndex)); end;
  function VerifyID: Boolean;
  var UserIDIndex, UserIDCount: Integer; ReadUserID, ExpectedUserID: AnsiString;
  begin
    Result := True;
    if not (FBaselineUserIDMode or (FBlankROMWord = $3FFF) or (FBlankROMWord = $FFFF)) then Exit;
    ExpectedUserID := FuseEditFM.IDedit.Text; ReadUserID := '';
    if FBlankROMWord = $FFFF then UserIDCount := 8 else UserIDCount := 4;
    for UserIDIndex := 1 to UserIDCount do ReadUserID := ReadUserID + DecToASCII(Ord(FConfigurationReply[UserIDIndex + 2]) and 15);
    for UserIDIndex := 1 to UserIDCount do
      if HexToDec(ExpectedUserID[UserIDIndex]) <> (Ord(FConfigurationReply[UserIDIndex + 2]) and 15) then begin
        Tx(5); Timer1.Enabled := False; Progress(0);
        Error('ID error' + #13#13 + 'Good ' + ExpectedUserID + #13 + 'Bad ' + ReadUserID);
        Timer1.Enabled := True; FReceiveBuffer := ''; FReceiveState := 500;
        Result := False; Exit;
      end;
  end;
  function CompareFuses(const Bytes: AnsiString; Include16: Boolean;
    var Location: AnsiString; var ReadFuse: Integer): Integer;
  var FuseIndex, FuseCount, ExpectedFuse: Integer;
  begin
    Result := -1; FuseCount := 0;
    if (FBlankROMWord = $FFF) or (FBlankROMWord = $3FFF) then FuseCount := 1;
    if (FBlankROMWord = $3FFF) and (FFuseWordCount = 2) then FuseCount := 2;
    if (FBlankROMWord = $FFFF) and Include16 then FuseCount := 7;
    for FuseIndex := 0 to FuseCount - 1 do begin
      ExpectedFuse := FuseValue(FuseIndex); ReadFuse := WordLE(Bytes, 11 + FuseIndex * 2);
      if ExpectedFuse <> ReadFuse then begin
        if FBlankROMWord = $FFF then Location := 'FFF'
        else if FBlankROMWord = $3FFF then Location := IntToHex($2007 + FuseIndex, 4)
        else Location := IntToHex($300000 + FuseIndex * 2, 6);
        Result := ExpectedFuse; Exit;
      end;
    end;
  end;
  procedure FuseError(const Location: AnsiString; ExpectedFuse, ReadFuse: Integer);
  begin
    Error('Fuse error 0x' + Location + #13#13 + 'Good 0x' +
      MyIntToHex(ExpectedFuse, 4) + #13 + 'Bad 0x' + MyIntToHex(ReadFuse, 4));
  end;
  function VerifyReceiveBlocks(ROM: Boolean; AbortCommand: Integer): Boolean;
  var BlockIndex, ValuesPerBlock, ExpectedData, ReadData, HexDigits: Integer; Region: AnsiString;
  begin
    Result := False; if Cancelled then Exit;
    if ROM then begin ValuesPerBlock := 8; HexDigits := 4; Region := 'ROM'; end
    else begin ValuesPerBlock := 16; HexDigits := 2; Region := 'EEPROM'; end;
    while Length(FReceiveBuffer) >= 16 do begin
      for BlockIndex := 0 to ValuesPerBlock - 1 do begin
        if ROM then begin
          ReadData := WordBE(FReceiveBuffer, BlockIndex * 2 + 1); ExpectedData := StrToInt(FROMWords[FTransferOffset]);
        end else begin
          ReadData := Ord(FReceiveBuffer[BlockIndex + 1]); ExpectedData := StrToInt(FEEPROMBytes[FTransferOffset]);
        end;
        if ReadData <> ExpectedData then begin
          Tx(AbortCommand); StatusLabel.Caption := 'Verify result...';
          Timer1.Enabled := False; Progress(0);
          Error(Region + ' error at 0x' + MyIntToHex(FTransferOffset, 4) + #13#13 +
            'Good 0x' + MyIntToHex(ExpectedData, HexDigits) + #13 + 'Bad 0x' + MyIntToHex(ReadData, HexDigits));
          Timer1.Enabled := True; FReceiveBuffer := ''; FReceiveState := 500; Exit;
        end;
        Inc(FTransferOffset);
      end;
      Delete(FReceiveBuffer, 1, 16);
    end;
    Progress(FTransferOffset); Result := True;
  end;
begin
  FReceiveIdleTicks := 0;
  while Serial2_ReadByte(Serial1, ReceivedByte) > 0 do FReceiveBuffer := FReceiveBuffer + ReceivedByte;
  ReceivedByteCount := Length(FReceiveBuffer); if ReceivedByteCount = 0 then Exit;
  case FReceiveState of
    0: begin
      if ReceivedByteCount < 2 then FReceiveBuffer := ''
      else begin
        if FReceiveBuffer[1] <> 'B' then ResetSerial(False)
        else begin
        if Ord(FReceiveBuffer[2]) > 5 then begin ResetSerial(False); Exit; end;
        ProtocolValue := Ord(FReceiveBuffer[2]);
        if ProtocolValue <> FProgrammerModel then begin
          ResponseText := BoardName(FProgrammerModel); DetailText := BoardName(ProtocolValue); ResetSerial(False);
          StatusLabel.Caption := 'System matching...';
          Info('Program mode = ' + ResponseText + ', connected board = ' + DetailText + '.' + #13#13 +
            'Will attempt to match the board');
          Refresh; SelectBoard(ProtocolValue); Exit;
        end;
        StatusLabel.Caption := BoardName(ProtocolValue) + ' board connected'; Refresh;
        ResetSerial(False);
        if FCommandLineAutoProgram then begin Sleep(1000); ProgButt.Click; Exit; end;
        ResetSerial(False);
        end;
      end;
    end;
    10: if ReceivedByteCount = 2 then
      if IsReply('PI') then begin Tx(20); Inc(FReceiveState); FReceiveBuffer := ''; end;
    11: if ReceivedByteCount = 1 then begin
      if FReceiveBuffer = 'X' then begin FReceiveBuffer := ''; Tx(Ord('P')); Inc(FReceiveState); Exit; end;
      ProtocolValue := Ord(FReceiveBuffer[1]);
      if ProtocolValue <= 5 then begin
        if ProtocolValue = FProgrammerModel then begin Tx(4); Inc(FReceiveState, 2); end
        else begin
          Tx(1); StatusLabel.Caption := 'Error...'; Timer1.Enabled := False;
          Error('You are trying to connect to [ ' + BoardName(FProgrammerModel) + ' ]' + #13#13 +
            'Please select [ ' + BoardName(ProtocolValue) + ' ] to match your programmer board.');
          Timer1.Enabled := True; FReceiveState := 501;
        end;
        FReceiveBuffer := '';
      end else FProtocolError := True;
    end;
    12: if ReceivedByteCount = 1 then
      if IsReply('P') then begin Tx(4); Inc(FReceiveState); FReceiveBuffer := ''; end;
    13: if IsReply('V') then begin Tx(13); Inc(FReceiveState); FReceiveBuffer := ''; end;
    14: if ReceivedByteCount = 27 then begin
      if FReceiveBuffer[1] = #0 then Exit;
      if FReceiveBuffer[1] = 'C' then begin
        DisableProgramming; Delete(FReceiveBuffer, 1, 1); FConfigurationReply := FReceiveBuffer;
        FReceiveBuffer := ''; Inc(FReceiveState);
      end else FProtocolError := True;
    end;
    15: if IsReply('v') then begin
      FReceiveBuffer := ''; ProtocolValue := WordLE(FConfigurationReply, 1); DeviceID := ProtocolValue and $3FE0; DeviceRevision := ProtocolValue and $1F;
      if (FExpectedDeviceID <> $FFFF) and (FExpectedDeviceID <> DeviceID) then begin
        Timer1.Enabled := False; StatusLabel.Caption := 'Confirming...';
        if not Ask('The programmer does not recognise the [' +
          ChipSelect.Items[ChipSelect.ItemIndex] + '] processor' + #13#13 + 'Continue anyway?') then begin
          Tx(1); FReceiveState := 501; Timer1.Enabled := True; Exit;
        end;
      end;
      if FAfterInitializeState = -1 then begin
        Tx(1); Timer1.Enabled := False;
        if FShowDeviceID then
          Info('[' + ChipSelect.Items[ChipSelect.ItemIndex] + ']   Version ' +
            IntToStr(DeviceRevision) + #13#13 + 'Chip ID = ' + MyIntToHex(DeviceID, 4))
        else begin
          OscCalFm.OscEdit.Text := MyIntToHex(Ord(FConfigurationReply[25]), 2);
          ProtocolValue := WordLE(FConfigurationReply, 11);
          if ProtocolValue and $2000 <> 0 then ResponseText := '1' else ResponseText := '0';
          if ProtocolValue and $1000 <> 0 then ResponseText := ResponseText + '1' else ResponseText := ResponseText + '0';
          OscCalFm.BGedit.Text := ResponseText;
        end;
        Timer1.Enabled := True; FReceiveState := 501;
      end else begin Timer1.Enabled := True; FReceiveState := FAfterInitializeState; EnableProgramming(4); end;
    end;
    50, 52, 100, 102, 404: if IsReply('V') then begin
      ProtocolValue := FReceiveState; FReceiveBuffer := ''; Inc(FReceiveState);
      case ProtocolValue of
        50: StatusLabel.Caption := 'Reading ROM...';
        52: StatusLabel.Caption := 'Reading EEPROM...';
        100: StatusLabel.Caption := 'Verifying ROM...';
      else StatusLabel.Caption := 'Verifying EEPROM...'; end;
      if (ProtocolValue = 50) or (ProtocolValue = 100) then Tx(11) else Tx(12);
    end;
    51: if ReceivedByteCount >= 16 then begin
      if Cancelled then Exit;
      if FROMWords.Count = 34 then Exit;
      while Length(FReceiveBuffer) >= 16 do begin
        for ElementIndex := 0 to 7 do FROMWords.Add(IntToStr(WordBE(FReceiveBuffer, ElementIndex * 2 + 1)));
        Inc(FTransferOffset, 8); Delete(FReceiveBuffer, 1, 16);
      end;
      Progress(FTransferOffset);
      if FTransferOffset >= FROMWordCount then begin
        if FEEPROMByteCount = 0 then begin Tx(5); FReceiveState := 60; end
        else begin EnableProgramming(6); Inc(FReceiveState); Progress(0); FTransferOffset := 0; Maximum(FEEPROMByteCount); end;
        FReceiveBuffer := '';
      end;
    end;
    53: if ReceivedByteCount >= 16 then begin
      if Cancelled then Exit;
      while Length(FReceiveBuffer) >= 16 do begin
        for ElementIndex := 1 to 16 do FEEPROMBytes.Add(IntToStr(Ord(FReceiveBuffer[ElementIndex])));
        Inc(FTransferOffset, 16); Delete(FReceiveBuffer, 1, 16);
      end;
      Progress(FTransferOffset);
      if FTransferOffset >= FEEPROMByteCount then begin
        Tx(5);
        if FROMWordCount = 0 then begin FReceiveState := 500; FDataModified := True; CreateCodeData; DisplayCodeLines; end
        else FReceiveState := 60;
        FReceiveBuffer := '';
      end;
    end;
    60: begin
      FDataModified := True;
      if (FBlankROMWord = $FFF) or (FBlankROMWord = $3FFF) then begin
        if FBaselineUserIDMode or (FBlankROMWord = $3FFF) then begin
          ResponseText := ''; for ElementIndex := 3 to 6 do ResponseText := ResponseText + DecToASCII(Ord(FConfigurationReply[ElementIndex]) and 15);
          FuseEditFM.IDedit.Text := ResponseText;
        end;
        FFuseWord1 := WordLE(FConfigurationReply, 11);
        if FBlankROMWord = $3FFF then begin FFuseWord2 := WordLE(FConfigurationReply, 13); FFuseWord3 := WordLE(FConfigurationReply, 15); end;
        UpdateFuses1214;
      end else if FBlankROMWord = $FFFF then begin
        ResponseText := ''; for ElementIndex := 3 to 10 do ResponseText := ResponseText + DecToASCII(Ord(FConfigurationReply[ElementIndex]) and 15);
        FuseEditFM.IDedit.Text := ResponseText;
        FFuseWord1 := WordLE(FConfigurationReply, 11); FFuseWord2 := WordLE(FConfigurationReply, 13);
        FFuseWord3 := WordLE(FConfigurationReply, 15); FFuseWord4 := WordLE(FConfigurationReply, 17);
        FFuseWord5 := WordLE(FConfigurationReply, 19); FFuseWord6 := WordLE(FConfigurationReply, 21); FFuseWord7 := WordLE(FConfigurationReply, 23);
        UpdateFuses16;
      end;
      Timer1.Enabled := False; SetOscalFmValues(False); CreateCodeData; DisplayCodeLines;
      Timer1.Enabled := True; FReceiveBuffer := ''; Tx(1); FReceiveState := 501;
    end;
    101: if ReceivedByteCount >= 16 then begin
      if not VerifyReceiveBlocks(True, 5) then Exit;
      if FTransferOffset >= FROMWordCount then begin
        Progress(0);
        if FEEPROMByteCount = 0 then begin Tx(5); FReceiveState := 110; end
        else begin EnableProgramming(6); Inc(FReceiveState); FTransferOffset := 0; Maximum(FEEPROMByteCount); end;
        FReceiveBuffer := '';
      end;
    end;
    103: if ReceivedByteCount >= 16 then begin
      if not VerifyReceiveBlocks(False, 5) then Exit;
      if FTransferOffset >= FEEPROMByteCount then begin
        if FResumeConfigAfterVerify then begin Tx(6); FReceiveState := 406; end
        else begin if FProgramPIC18FusesAfterVerify then TxString(#2'v') else Tx(5); FReceiveState := 110; end;
        FReceiveBuffer := '';
      end;
    end;
    110: if IsReply('v') then begin
      FReceiveBuffer := '';
      if not FProgramPIC18FusesAfterVerify then begin Tx(1); FReceiveState := 501; StatusLabel.Caption := 'Verify result...'; end;
      Timer1.Enabled := False; Progress(0);
      if not VerifyID then Exit;
      if FProgramPIC18FusesAfterVerify then begin
        Tx(17); TxString(#0#0#0#0#0#0#0#0#0#0); SendFuses;
        Timer1.Enabled := True; FReceiveState := 451; StatusLabel.Caption := 'Programming Fuse...'; Exit;
      end;
      ExpectedValue := CompareFuses(FConfigurationReply, True, FuseAddressText, ActualValue);
      if ExpectedValue = -1 then Info('Data verified') else FuseError(FuseAddressText, ExpectedValue, ActualValue);
      Timer1.Enabled := True;
    end;
    200: if IsReply('V') then begin
      FReceiveBuffer := ''; Inc(FReceiveState); FTransferOffset := 0;
      StatusLabel.Caption := 'Erase Check...'; TxString(#15 + Chr(Byte(FBlankROMWord div 256)));
    end;
    201: begin
      while FReceiveBuffer <> '' do begin
        ReceivedByte := FReceiveBuffer[1];
        if ReceivedByte = 'B' then begin Inc(FTransferOffset, 256); Progress(FTransferOffset); end
        else if ReceivedByte in ['Y', 'N', 'C'] then begin
          if ReceivedByte = 'C' then FBlankCheckFlags := 16
          else if ReceivedByte = 'N' then FBlankCheckFlags := 1
          else begin Inc(FTransferOffset, 256); Progress(FTransferOffset); end;
          EnableProgramming(6); Inc(FReceiveState);
        end else FProtocolError := True;
        Delete(FReceiveBuffer, 1, 1);
      end;
    end;
    202: if IsReply('V') then begin FReceiveBuffer := ''; Inc(FReceiveState); Tx(16); end;
    203: begin
      if FReceiveBuffer[1] in ['Y', 'N'] then begin
        DisableProgramming; Inc(FReceiveState);
        if FReceiveBuffer[1] = 'N' then FBlankCheckFlags := FBlankCheckFlags or 2;
      end else FProtocolError := True;
      FReceiveBuffer := '';
    end;
    204: if IsReply('v') then begin
      for ElementIndex := 3 to 10 do
        if Ord(FConfigurationReply[ElementIndex]) and 15 <> 15 then FBlankCheckFlags := FBlankCheckFlags or 4;
      ConfigByteIndex := 11;
      for ElementIndex := 0 to FFuseWordCount - 1 do begin
        ProtocolValue := WordLE(FConfigurationReply, ConfigByteIndex);
        case ConfigByteIndex of
          11: begin
            ExpectedValue := FBlankFuseWord1;
            if FProgramFlags and 2 <> 0 then begin ProtocolValue := ProtocolValue and $FFF; ExpectedValue := ExpectedValue and $FFF; end;
            if FFuseWordCount = 1 then ConfigByteIndex := 24;
          end;
          13: ExpectedValue := FBlankFuseWord2; 15: ExpectedValue := FBlankFuseWord3; 17: ExpectedValue := FBlankFuseWord4;
          19: ExpectedValue := FBlankFuseWord5; 21: ExpectedValue := FBlankFuseWord6;
        else ExpectedValue := FBlankFuseWord7; end;
        if ProtocolValue <> ExpectedValue then FBlankCheckFlags := FBlankCheckFlags or 8;
        Inc(ConfigByteIndex, 2);
      end;
      ResponseText := 'Blank Results: ' + #13#13;
      if FROMWordCount <> 0 then begin
        if FBlankCheckFlags and 1 = 0 then begin
          ResponseText := 'ROM = Erased';
          if FHasCalibrationWord then
            if FBlankCheckFlags and 16 = 0 then ResponseText := ResponseText + ' (including calibration ROM)'
            else ResponseText := ResponseText + ' (except calibration ROM)';
        end else ResponseText := 'ROM = Not Erased';
      end;
      if FEEPROMByteCount <> 0 then
        if FBlankCheckFlags and 2 = 0 then ResponseText := ResponseText + #13 + 'EEPROM = Erased'
        else ResponseText := ResponseText + #13 + 'EEPROM = Not Erased';
      if FROMWordCount <> 0 then begin
        if (FBlankROMWord <> $FFF) or (FCoreAlgorithm = 12) then
          if FBlankCheckFlags and 4 = 0 then ResponseText := ResponseText + #13 + 'ID = Erased'
          else ResponseText := ResponseText + #13 + 'ID = Not Erased';
        if FBlankCheckFlags and 8 = 0 then ResponseText := ResponseText + #13 + 'Fuse = Erased'
        else ResponseText := ResponseText + #13 + 'Fuse = Not Erased';
      end;
      StatusLabel.Caption := 'Blank results...'; Timer1.Enabled := False; Progress(0); FReceiveBuffer := '';
      if FAfterBlankCheckState = -1 then begin Info(ResponseText); Tx(1); FReceiveState := 501; end
      else begin
        if FHasCalibrationWord then begin
          ProtocolValue := Ord(FConfigurationReply[25]); ProgramWord := StrToInt(FROMWords[FROMWordCount - 1]) and $FF;
          DetailText := ''; ContinueProgramming := ProtocolValue <> ProgramWord;
          if ProtocolValue <> ProgramWord then DetailText := 'Calibration data from chip does not match new programming data' +
            #13#13 + 'Chip = 0x' + IntToHex(ProtocolValue, 2) + '     File = 0x' + IntToHex(ProgramWord, 2) + #13#13;
          ActualValue := 0;
          if FHasBandgapCalibration then begin
            ExpectedValue := FFuseWord1 and $3000; ActualValue := WordLE(FConfigurationReply, 11) and $3000;
            if ActualValue <> ExpectedValue then begin
              ContinueProgramming := True;
              DetailText := DetailText + 'Bandgap data from chip does not match new programming data' + #13#13 +
                'Chip = ' + DecToBinary(ExpectedValue shr 12, 2) + '     File = ' +
                DecToBinary(ActualValue shr 12, 2) + #13#13;
            end;
          end;
          if ContinueProgramming then begin
            ContinueProgramming := False;
            if FCalibrationPolicy = 0 then begin
              if not FIsFlashDevice then DetailText := DetailText + 'The new data may not program properly?' + #13#13;
              ContinueProgramming := Ask(DetailText + 'Continue programming with new data?');
            end else if FCalibrationPolicy = 1 then begin
              ContinueProgramming := True;
              if (FBlankROMWord = $FFF) or (FCoreAlgorithm = 12) then ProgramWord := ProtocolValue + $C00 else ProgramWord := ProtocolValue + $3400;
              FROMWords[FROMWordCount - 1] := IntToStr(ProgramWord); CreateCodeData; DisplayCodeLines;
              if FHasBandgapCalibration then begin FFuseWord1 := ActualValue + (FFuseWord1 and $FFF); UpdateFuses1214; end;
            end else ContinueProgramming := True;
            if not ContinueProgramming then begin Tx(1); FReceiveState := 501; Timer1.Enabled := True; Exit; end;
          end;
        end;
        if FBlankCheckFlags = 0 then begin EnableProgramming(4); FReceiveState := FAfterBlankCheckState; end
        else begin
          ContinueProgramming := True;
          if not IgnoreBlankCheck1.Checked then begin
            if FIsFlashDevice then ResponseText := ResponseText + #13#13 + 'Continue to erase and program this chip?'
            else ResponseText := ResponseText + #13#13 + 'Continue to program this chip?';
            ContinueProgramming := Ask(ResponseText);
          end;
          if ContinueProgramming then begin
            if FIsFlashDevice then FReceiveState := 205 else FReceiveState := FAfterBlankCheckState;
            EnableProgramming(4);
          end else begin Tx(1); FReceiveState := 501; end;
        end;
      end;
      Timer1.Enabled := True;
    end;
    205: if IsReply('V') then begin
      FReceiveBuffer := ''; StatusLabel.Caption := 'Erasing...'; Tx(14); Inc(FReceiveState);
    end;
    206: if IsReply('Y') then begin EnableProgramming(6); FReceiveState := FAfterBlankCheckState; FReceiveBuffer := ''; end;
    250: if IsReply('V') then begin
      FReceiveBuffer := ''; StatusLabel.Caption := 'Erasing...'; Tx(14);
      if FROMWordCount = 0 then begin FReceiveState := 255; Maximum(FEEPROMByteCount); end
      else if FHasCalibrationWord then Inc(FReceiveState) else FReceiveState := 253;
    end;
    251: if IsReply('Y') then begin Tx(6); FReceiveBuffer := ''; Inc(FReceiveState); end;
    252: if IsReply('V') then begin
      if FCoreAlgorithm = 12 then begin
        Tx(24); TxString(FConfigurationReply[26] + FConfigurationReply[25]); TxString(FConfigurationReply[14] + FConfigurationReply[13]);
      end else begin
        Tx(10); TxString(FConfigurationReply[26] + FConfigurationReply[25]);
        TxBE((FBlankFuseWord1 and $FFF) + (WordLE(FConfigurationReply, 11) and $3000));
      end;
      FReceiveBuffer := ''; Inc(FReceiveState);
    end;
    253: begin
      if ReceivedByteCount = 1 then begin
        Timer1.Enabled := False; StatusLabel.Caption := 'Erase result...';
        case FReceiveBuffer[1] of
          'Y': begin Tx(5); Info('Chip has been erased'); FReceiveState := 500; end;
          'C': begin
            Tx(5); ResponseText := ''; if FProgramFlags and 2 <> 0 then ResponseText := ' and BandGap';
            Error('Error writing new Calibration' + ResponseText); FReceiveState := 500;
          end;
          'F': begin Tx(5); Error('Error writing new BandGap'); FReceiveState := 500; end;
        else FProtocolError := True; end;
        FReceiveBuffer := ''; Timer1.Enabled := True;
      end else FProtocolError := True;
    end;
    255: begin
      if FReceiveBuffer = 'C' then begin FReceiveBuffer := ''; Inc(FTransferOffset, 256); Progress(FTransferOffset); end
      else if IsReply('Y') then begin FReceiveBuffer := ''; TxString(#2'Y'); Progress(0); FReceiveState := 253; end;
    end;
    400: if ReceivedByteCount = 1 then
      if IsReply('V') then begin
        Tx(7); TxBE(FROMTransferWordCount); Progress(0); StatusLabel.Caption := 'Programming ROM...';
        Maximum(FROMTransferWordCount); FTransferOffset := 0; Inc(FReceiveState); FReceiveBuffer := '';
      end;
    401: begin
      if Cancelled then Exit;
      if FReceiveBuffer[1] = 'Y' then begin
        for ElementIndex := 1 to 16 do begin
          if FTransferOffset < FROMWords.Count then ProtocolValue := StrToInt(FROMWords[FTransferOffset]) else ProtocolValue := FBlankROMWord;
          TxBE(ProtocolValue); Inc(FTransferOffset);
        end;
        FReceiveBuffer := ''; Progress(FTransferOffset);
      end else if (FReceiveBuffer[1] = 'N') and (ReceivedByteCount = 5) then begin
        Progress(0); Timer1.Enabled := False; Tx(5); StatusLabel.Caption := 'Programming error...';
        ErrorAddress := WordBE(FReceiveBuffer, 2) - 1; ActualValue := WordBE(FReceiveBuffer, 4);
        ExpectedValue := StrToInt(FROMWords[ErrorAddress]); FReceiveBuffer := '';
        Error('ROM programming error at address 0x' + MyIntToHex(ErrorAddress, 4) + #13#13 +
          'Good  0x' + IntToHex(ExpectedValue, 4) + #13 + 'Bad 0x' + IntToHex(ActualValue, 4));
        Timer1.Enabled := True; FReceiveState := 500;
      end else if FReceiveBuffer[1] = 'P' then begin
        Progress(0); FReceiveBuffer := ''; EnableProgramming(6);
        if FEEPROMByteCount = 0 then FReceiveState := 406 else Inc(FReceiveState);
      end else FProtocolError := True;
    end;
    402: if ReceivedByteCount = 1 then
      if IsReply('V') then begin
        Tx(8); TxBE(FEEPROMTransferByteCount); StatusLabel.Caption := 'Programming EEPROM...';
        Progress(0); Maximum(FEEPROMTransferByteCount); FTransferOffset := 0; Inc(FReceiveState); FReceiveBuffer := '';
      end;
    403: if ReceivedByteCount = 1 then begin
      if Cancelled then Exit;
      if FReceiveBuffer = 'Y' then begin
        if FTransferOffset < FEEPROMTransferByteCount then
          TxString(Chr(Byte(StrToInt(FEEPROMBytes[FTransferOffset]))) + Chr(Byte(StrToInt(FEEPROMBytes[FTransferOffset + 1]))))
        else TxString(#0#0);
        FReceiveBuffer := ''; Inc(FTransferOffset, 2); Progress(FTransferOffset);
      end else if FReceiveBuffer = 'P' then begin
        Progress(0); FTransferOffset := 0; FReceiveBuffer := '';
        if FBlankROMWord = $FFFF then begin TxString(#2'V'); FReceiveState := 406; end
        else if FCoreAlgorithm = 10 then begin
          Tx(6); FReceiveState := 100; FResumeConfigAfterVerify := True; Progress(0); Maximum(FROMWordCount);
        end else begin Tx(6); Inc(FReceiveState); end;
      end else FProtocolError := True;
    end;
    405: if ReceivedByteCount >= 16 then begin
      if not VerifyReceiveBlocks(False, 1) then Exit;
      if FTransferOffset >= FEEPROMByteCount then begin
        if FROMWordCount = 0 then begin
          Tx(5); Timer1.Enabled := False; StatusLabel.Caption := 'Programming result...';
          StatusLabel.Refresh; Progress(0);
          if not FCommandLineAutoProgram then Info('Programming complete.');
          StatusLabel.Caption := 'Ready'; Timer1.Enabled := True; FReceiveState := 500;
        end else begin Tx(6); Inc(FReceiveState); end;
        FReceiveBuffer := '';
      end;
    end;
    406: if IsReply('V') then begin
      Tx(9); TxString('00'); ResponseText := FuseEditFM.IDedit.Text;
      if Length(ResponseText) = 4 then ResponseText := ResponseText + 'FFFF';
      for ElementIndex := 1 to 8 do Tx(HexToDec(ResponseText[ElementIndex]));
      SendFuses; FReceiveBuffer := '';
      if FBlankROMWord = $FFFF then begin FReceiveState := 430; StatusLabel.Caption := 'Programming ID...'; end
      else begin Inc(FReceiveState); StatusLabel.Caption := 'Programming config...'; end;
    end;
    407: begin Tx(5); FReceiveBuffer := ''; Inc(FReceiveState); Exit; end;
    408: if ReceivedByteCount = 1 then begin Tx(4); Inc(FReceiveState); FReceiveBuffer := ''; end;
    409, 432, 453: if IsReply('V') then begin Tx(13); Inc(FReceiveState); FReceiveBuffer := ''; end;
    410: if ReceivedByteCount = 27 then begin
      if FReceiveBuffer[1] = 'C' then begin
        Tx(5); Delete(FReceiveBuffer, 1, 1); FConfigurationReply := FReceiveBuffer; FReceiveBuffer := ''; Inc(FReceiveState);
      end else FProtocolError := True;
    end;
    411: if IsReply('v') then begin
      FReceiveBuffer := ''; Tx(1); FReceiveState := 501; StatusLabel.Caption := 'Programming result...';
      Timer1.Enabled := False; Progress(0); if not VerifyID then Exit;
      ExpectedValue := CompareFuses(FConfigurationReply, False, FuseAddressText, ActualValue);
      if ExpectedValue = -1 then begin
        if not AutoProgram.Checked and not FCommandLineAutoProgram then Info('Programming complete.');
      end else FuseError(FuseAddressText, ExpectedValue, ActualValue);
      Timer1.Enabled := True;
    end;
    430: begin Tx(5); Inc(FReceiveState); FReceiveBuffer := ''; end;
    431, 452: if IsReply('v') then begin Tx(4); Inc(FReceiveState); FReceiveBuffer := ''; end;
    433: if ReceivedByteCount = 27 then begin
      if FReceiveBuffer[1] = 'C' then begin
        Delete(FReceiveBuffer, 1, 1); FConfigurationReply := FReceiveBuffer; TxString(#2'V'); FReceiveBuffer := '';
        FReceiveState := 100; FProgramPIC18FusesAfterVerify := True; Progress(0); Maximum(FROMWordCount);
      end else FProtocolError := True;
    end;
    451: if IsReply('Y') then begin Tx(5); Inc(FReceiveState); FReceiveBuffer := ''; end;
    454: if ReceivedByteCount = 27 then begin
      if FReceiveBuffer[1] = 'C' then begin
        Delete(FReceiveBuffer, 1, 1); Timer1.Enabled := False; Tx(5); FReceiveState := 500; Progress(0);
        ExpectedValue := -1;
        for ElementIndex := 0 to 6 do begin
          ActualValue := WordLE(FReceiveBuffer, 11 + ElementIndex * 2);
          if ActualValue <> FuseValue(ElementIndex) then begin
            ExpectedValue := FuseValue(ElementIndex); FuseAddressText := IntToHex($300000 + ElementIndex * 2, 6); Break;
          end;
        end;
        if ExpectedValue = -1 then begin
          if not AutoProgram.Checked then begin
            StatusLabel.Caption := 'Programming result...'; StatusLabel.Refresh;
            if not FCommandLineAutoProgram then Info('Programming complete');
          end;
        end else FuseError(FuseAddressText, ExpectedValue, ActualValue);
        FReceiveState := 500; Timer1.Enabled := True;
      end else FProtocolError := True;
    end;
    500: begin Tx(1); Inc(FReceiveState); FReceiveBuffer := ''; end;
    501: if ReceivedByteCount = 1 then
      if IsReply('Q') then begin
        if FCommandLineAutoProgram then Close
        else if AutoProgram.Checked then begin TxString('P'#19); FReceiveBuffer := ''; Inc(FReceiveState); end
        else ResetSerial(True);
      end;
    502: if IsReply('PA') then begin
      FReceiveBuffer := ''; Inc(FReceiveState); Timer1.Enabled := False;
      StatusLabel.Caption := 'Waiting for chip removal...'; FlyForm.StatusLabel.Caption := StatusLabel.Caption;
    end;
    503: if IsReply('Y') then begin
      Timer1.Enabled := False; FReceiveBuffer := ''; Sleep(200); TxString('P'#18);
      Timer1.Enabled := True; FReceiveState := 600;
    end;
    550: if IsReply('V') then begin
      StatusLabel.Caption := 'QBasic vector write...';
      TxString(#22 + Chr(Byte(DebugFm.FDebugAddressHigh)) + Chr(Byte(DebugFm.FDebugAddressMiddle)) + Chr(Byte(DebugFm.FDebugAddressLow)));
      Inc(FReceiveState); FReceiveBuffer := '';
    end;
    551: if ReceivedByteCount = 1 then begin
      Tx(5); FReceiveState := 500; Timer1.Enabled := False;
      StatusLabel.Caption := 'QBasic vector write result...';
      if FReceiveBuffer = 'Y' then begin Info('QBasic Vector programmed'); Timer1.Enabled := True; end
      else if FReceiveBuffer = 'N' then begin Error('ERROR: QBasic Vector not programmed'); Timer1.Enabled := True; end
      else FProtocolError := True;
    end;
    560: if IsReply('V') then begin
      StatusLabel.Caption := 'QBasic vector read...'; Tx(23); Inc(FReceiveState); FReceiveBuffer := '';
    end;
    561: if ReceivedByteCount = 4 then begin
      Tx(5); FReceiveState := 500; Timer1.Enabled := False; StatusLabel.Caption := 'QBasic vector read result...';
      ResponseText := ''; for ElementIndex := 1 to 4 do begin
        if ElementIndex > 1 then ResponseText := ResponseText + ' '; ResponseText := ResponseText + MyIntToHex(Ord(FReceiveBuffer[ElementIndex]), 2);
      end;
      Info('Debug Vector' + #13#13 + '0x ' + ResponseText); Timer1.Enabled := True;
    end;
    600: if IsReply('PA') then begin
      FReceiveBuffer := ''; Inc(FReceiveState); Timer1.Enabled := False;
      StatusLabel.Caption := 'Waiting for chip insertion...'; FlyForm.StatusLabel.Caption := StatusLabel.Caption;
    end;
    601: if IsReply('Y') then begin FReceiveBuffer := ''; Timer1.Enabled := False; Sleep(200); ProgButt.Click; end;
    750: if ReceivedByteCount = 5 then begin
      Delete(FReceiveBuffer, 1, 1); StatusLabel.Caption := 'Protocol Number...'; Timer1.Enabled := False;
      Tx(1); FReceiveState := 501;
      if FReceiveBuffer = 'P18A' then ResponseText := 'System is matched.'
      else ResponseText := 'System missmatch.' + #13#13 +
        'Please use old MicroPro to update firmware to match new MicroBrn.';
      Info('MicroBrn: P18A   Firmware: ' + FReceiveBuffer + #13#13 + ResponseText);
      FReceiveBuffer := ''; Timer1.Enabled := True;
    end;
    760: if (ReceivedByteCount = 2) and (FReceiveBuffer = '??') then begin
      StatusLabel.Caption := 'Function Error...'; ResetSerial(False);
      Error('Received function not supported by this firmware version.'); StatusLabel.Caption := 'Ready';
    end;
  end;
  if FProtocolError then begin
    if FCommandLineAutoProgram then Close
    else begin
      FReceiveBuffer := UpperCase(FReceiveBuffer); ResetSerial(False); StatusLabel.Caption := 'Error...';
      Error('Received data error.' + #13#13 + 'About to apply reset...'); Refresh; ResetProgrammer;
    end;
  end;
end;

{ VA $00487D78 }
procedure TProjFm.SetProgrammingDataSize;
begin
  if FROMWordCount <> 0 then begin
    FROMTransferWordCount := FROMWordCount;
    if not FHasCalibrationWord then
      while FROMTransferWordCount > 0 do
        if StrToInt(FROMWords[FROMTransferWordCount - 1]) = FBlankROMWord then Dec(FROMTransferWordCount) else Break;
  end;
  if FROMTransferWordCount mod 32 <> 0 then FROMTransferWordCount := (FROMTransferWordCount div 32 + 1) * 32;
  if FEEPROMByteCount <> 0 then begin
    FEEPROMTransferByteCount := FEEPROMByteCount;
    while FEEPROMTransferByteCount > 0 do
      if FEEPROMBytes[FEEPROMTransferByteCount - 1] = '255' then Dec(FEEPROMTransferByteCount) else Break;
    if Odd(FEEPROMTransferByteCount) then Inc(FEEPROMTransferByteCount);
  end;
end;


{ VA $0048917C }
procedure TProjFm.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var NewScrollPosition: Integer;
begin
  if not FCodeScrollFocused then Exit;
  NewScrollPosition := CodeScroll.Position;
  if WheelDelta < 0 then Inc(NewScrollPosition) else Dec(NewScrollPosition);
  if NewScrollPosition < 0 then NewScrollPosition := 0;
  if NewScrollPosition > CodeScroll.Max then NewScrollPosition := CodeScroll.Max;
  CodeScroll.Position := NewScrollPosition;
end;


{ VA $004891DC }
procedure TProjFm.Timer2Timer(Sender: TObject);
begin
  TimeLabel.Caption := TimeToStr(Now);
end;


{ VA $0047B360 }
procedure TProjFm.SetTheCurrentDirectory;
begin
  SetCurrentDir(FLastFileDirectory);
end;


{ VA $0047AD74 }
procedure TProjFm.Merge1Click(Sender: TObject);
begin
  if not IsChipSelected then Exit;
  if (FROMWords.Count = 0) and (FEEPROMBytes.Count = 0) then begin
    ResetCodeMemory(False, True, True); DoLoadProcedure(False, '');
  end else DoLoadProcedure(True, '');
end;


{ VA $0047AEBC }
procedure TProjFm.LoadButtClick(Sender: TObject);
begin
  if IsChipSelected and FileSaveQuery(True) then DoLoadProcedure(False, '');
end;


{ VA $0047B3B0 }
procedure TProjFm.ResetCodeMemory(PreserveData, FillBlank, ClearFileList: Boolean);
var ItemIndex: Integer; BlankText: AnsiString;
begin
  if ClearFileList then FLoadedFilePaths.Clear;
  if not PreserveData then begin
    FCodeDisplayLines.Clear; FROMWords.Clear; FEEPROMBytes.Clear;
    if FillBlank then begin
      BlankText := IntToStr(FBlankROMWord);
      for ItemIndex := 0 to FROMWordCount do FROMWords.Add(BlankText);
      for ItemIndex := 0 to FEEPROMByteCount do FEEPROMBytes.Add('255');
    end;
    if FBlankROMWord = $FFFF then BlankText := 'FFFFFFFF' else BlankText := 'FFFF';
    FuseEditFM.IDedit.Text := BlankText; FuseEditFM.IDedit.MaxLength := Length(BlankText);
    FFuseWord1 := FBlankFuseWord1; FFuseWord2 := FBlankFuseWord2; FFuseWord3 := FBlankFuseWord3;
    FFuseWord4 := FBlankFuseWord4; FFuseWord5 := FBlankFuseWord5; FFuseWord6 := FBlankFuseWord6; FFuseWord7 := FBlankFuseWord7;
    CodeImage.Canvas.Brush.Color := clWhite;
    CodeImage.Canvas.FillRect(ClientRect);
    FDataModified := False; CodeScroll.Max := 0;
  end;
  for ItemIndex := 0 to FuseEditFM.ComponentCount - 1 do
    if (FuseEditFM.Components[ItemIndex] is TComboBox) and
       (FuseEditFM.Components[ItemIndex].Tag <> 0) then
      TComboBox(FuseEditFM.Components[ItemIndex]).ItemIndex := 0;
end;


{ VA $00475334 }
procedure TProjFm.SetCaption;
var FileIndex: Integer; CaptionText: AnsiString;
begin
  CaptionText := FBaseCaption;
  for FileIndex := 0 to FLoadedFilePaths.Count - 1 do CaptionText := CaptionText + ' <' + ExtractFileName(FLoadedFilePaths[FileIndex]) + '>';
  Caption := Copy(CaptionText, 1, 80);
end;


{ VA $00476390 }
function TProjFm.CheckFileNames(RemainingPaths: AnsiString): Boolean;
var SeparatorIndex: Integer; NextFileName: AnsiString;
begin
  Result := False; if RemainingPaths = '?' then Exit;
  while RemainingPaths <> '' do begin
    SeparatorIndex := Pos('+', RemainingPaths); if SeparatorIndex = 0 then SeparatorIndex := Length(RemainingPaths) + 1;
    NextFileName := Copy(RemainingPaths, 1, SeparatorIndex - 1); Delete(RemainingPaths, 1, SeparatorIndex);
    if not FileExists(NextFileName) then Exit;
  end;
  Result := True;
end;


{ VA $00476480 }
function TProjFm.FindChipCBText(ChipName: AnsiString): Integer;
var ChipIndex: Integer;
begin
  Result := -1;
  if Copy(ChipName, 1, 3) = 'PIC' then Delete(ChipName, 1, 3);
  for ChipIndex := 0 to ChipSelect.Items.Count - 1 do
    if ChipName = ChipSelect.Items[ChipIndex] then begin Result := ChipIndex; Exit; end;
end;


{ VA $00478958 }
function TProjFm.VerifyString(InputText: AnsiString): AnsiString;
var CharacterIndex: Integer;
begin
  Result := '';
  for CharacterIndex := 1 to Length(InputText) do if not (InputText[CharacterIndex] in ['!'..'9', 'A'..'Z']) then Exit;
  Result := InputText;
end;


{ VA $00478898 }
function TProjFm.TrimSpaces(InputText: AnsiString): AnsiString;
var CharacterIndex: Integer;
begin
  Result := '';
  for CharacterIndex := 1 to Length(InputText) do if InputText[CharacterIndex] in [#33..#127] then Result := Result + InputText[CharacterIndex];
end;


{ VA $00478748 }
function TProjFm.ExtractNextWord(var RemainingText: AnsiString): AnsiString;
var CharacterIndex: Integer;
begin
  Result := ''; CharacterIndex := 1;
  while (CharacterIndex <= Length(RemainingText)) and (RemainingText[CharacterIndex] <= #32) do Inc(CharacterIndex);
  while CharacterIndex <= Length(RemainingText) do begin
    if RemainingText[CharacterIndex] = #32 then begin Delete(RemainingText, 1, CharacterIndex - 1); Exit; end;
    if RemainingText[CharacterIndex] < #32 then begin Result := ''; Exit; end;
    Result := Result + RemainingText[CharacterIndex]; Inc(CharacterIndex);
  end;
  RemainingText := '';
end;


{ VA $00478638 }
function TProjFm.ExtractItemName(var RemainingText: AnsiString): AnsiString;
var ClosingQuoteIndex: Integer;
  procedure StripLeading;
  begin
    while (Length(RemainingText) > 0) and not (RemainingText[1] in [#33..#127]) do Delete(RemainingText, 1, 1);
  end;
begin
  Result := ''; StripLeading;
  if RemainingText[1] <> '"' then Exit;
  Delete(RemainingText, 1, 1); ClosingQuoteIndex := Pos('"', RemainingText);
  if ClosingQuoteIndex > 1 then begin Result := Copy(RemainingText, 1, ClosingQuoteIndex - 1); Delete(RemainingText, 1, ClosingQuoteIndex); StripLeading; end;
end;


{ VA $00489260 }
procedure TProjFm.AddToRecentFileNamesMenu(FileName: AnsiString; Merge: Boolean);
var RecentIndex: Integer;
begin
  if Merge and (FLoadedFilePaths.Count > 1) then FRecentFilePaths[0] := FRecentFilePaths[0] + '+' + FileName
  else if FRecentFilePaths[0] <> FileName then begin
    for RecentIndex := 2 downto 0 do FRecentFilePaths[RecentIndex + 1] := FRecentFilePaths[RecentIndex];
    FRecentFilePaths[0] := FileName;
  end;
  SetRecentFileNames;
end;


{ VA $0048934C }
procedure TProjFm.SetRecentFileNames;
var RecentIndex, SeparatorIndex: Integer; RemainingPaths, CaptionText, LastFile: AnsiString;
begin
  LastFile := '';
  for RecentIndex := 0 to 3 do begin
    RemainingPaths := FRecentFilePaths[RecentIndex]; CaptionText := '';
    if RemainingPaths <> '?' then
      while RemainingPaths <> '' do begin
        SeparatorIndex := Pos('+', RemainingPaths); if SeparatorIndex = 0 then SeparatorIndex := Length(RemainingPaths) + 1;
        LastFile := Copy(RemainingPaths, 1, SeparatorIndex - 1); Delete(RemainingPaths, 1, SeparatorIndex);
        CaptionText := CaptionText + ' ' + ExtractFileName(LastFile);
      end;
    CaptionText := Copy(CaptionText, 1, 80);
    case RecentIndex of
      0: begin RecentFile1.Caption := CaptionText; FLastFileDirectory := ExtractFilePath(LastFile); end;
      1: RecentFile2.Caption := CaptionText;
      2: RecentFile3.Caption := CaptionText;
      3: RecentFile4.Caption := CaptionText;
    end;
  end;
end;


{ VA $0048951C }
procedure TProjFm.SetFileNamesListFromFile(RemainingPaths: AnsiString);
var SeparatorIndex: Integer;
begin
  FLoadedFilePaths.Clear; if RemainingPaths = '?' then Exit;
  while RemainingPaths <> '' do begin
    SeparatorIndex := Pos('+', RemainingPaths); if SeparatorIndex = 0 then SeparatorIndex := Length(RemainingPaths) + 1;
    FLoadedFilePaths.Add(Copy(RemainingPaths, 1, SeparatorIndex - 1)); Delete(RemainingPaths, 1, SeparatorIndex);
  end;
end;


{ VA $00489614 }
procedure TProjFm.RecentFile1Click(Sender: TObject);
var SelectedRecentIndex, ShiftIndex: Integer; SelectedPaths: AnsiString;
begin
  if not IsChipSelected then Exit;
  if not FileSaveQuery(True) then Exit;
  if (Sender as TMenuItem).Caption = '' then Exit;
  SelectedRecentIndex := TMenuItem(Sender).Tag; SelectedPaths := FRecentFilePaths[SelectedRecentIndex];
  if SelectedRecentIndex in [1..3] then for ShiftIndex := SelectedRecentIndex downto 1 do FRecentFilePaths[ShiftIndex] := FRecentFilePaths[ShiftIndex - 1];
  FRecentFilePaths[0] := SelectedPaths; SetRecentFileNames;
  SetFileNamesListFromFile(FRecentFilePaths[0]); LoadMultipleHexFiles;
end;


{ VA $0047EBCC }
procedure TProjFm.UpdateIDedit;
var UserIDText: AnsiString;
begin
  UserIDText := FuseEditFM.IDedit.Text;
  while Length(UserIDText) < FuseEditFM.IDedit.MaxLength do UserIDText := 'F' + UserIDText;
  FuseEditFM.IDedit.Text := UserIDText;
end;


{ VA $0047E268 }
procedure TProjFm.SerialOff1Click(Sender: TObject);
begin
  if Serial1.Active then begin
    Serial1.Active := False; SerialOff1.Caption := 'Turn Serial &On';
    ComLabel.Enabled := False; ComLabel.ShowHint := False; Exit;
  end;
  SerialOff1.Caption := 'Turn Serial &Off';
  if ActivateSerialPort(Serial1.Port) then begin
    Sleep(200); SetProgrammerReset(not FResetIdleLevel);
    Sleep(200); SetProgrammerReset(FResetIdleLevel);
    FReceiveState := 1; Timer1.Enabled := True; DisableUserButtons;
    ComLabel.Enabled := True; ComLabel.ShowHint := True;
  end;
end;


{ VA $0047E374 }
procedure TProjFm.Port1Click(Sender: TObject);
begin
  if Timer1.Enabled then Exit;
  if Serial1.Port = 0 then PortFm.PortEdit.Text := ''
  else PortFm.PortEdit.Text := IntToStr(Serial1.Port);
  if PortFm.ShowModal = mrOK then
    if ActivateSerialPort(StrToInt(PortFm.PortEdit.Text)) then begin
      Sleep(500); SetProgrammerReset(FResetIdleLevel);
      Timer1.Enabled := True; DisableUserButtons;
    end;
  Refresh;
end;


{ VA $0047EB90 }
procedure TProjFm.Contents1Click(Sender: TObject);
begin
  if Timer1.Enabled then Exit;
  ChDir(FExecutableDirectory); Application.HelpCommand(3, 0); SetTheCurrentDirectory;
end;


{ VA $00478A30 }
procedure TProjFm.DeleteUnwantedChipData;
var LineIndex, OTPFamilyPosition, HeaderLineIndex: Integer; ChipNameLine, Inclusion, Flash: AnsiString;
begin
  LineIndex := 0;
  while LineIndex < FChipDatabaseLines.Count do begin
    ChipNameLine := FChipDatabaseLines[LineIndex];
    if Copy(ChipNameLine, 1, 9) = 'CHIPNAME=' then begin
      OTPFamilyPosition := Pos('16C', ChipNameLine); Inclusion := FChipDatabaseLines[LineIndex + 1]; Flash := FChipDatabaseLines[LineIndex + 4];
      if (Inclusion = 'INCLUDE=N') or
        (((FProgrammerModel = 0) or (FProgrammerModel = 5)) and ((Flash = 'FLASHCHIP=N') or (OTPFamilyPosition = 10))) then begin
        for HeaderLineIndex := 1 to 17 do FChipDatabaseLines.Delete(LineIndex);
        while LineIndex < FChipDatabaseLines.Count do
          if Copy(FChipDatabaseLines[LineIndex], 1, 9) <> 'CHIPNAME=' then FChipDatabaseLines.Delete(LineIndex) else Break;
        Continue;
      end;
    end;
    Inc(LineIndex);
  end;
end;


{ VA $00478478 }
function TProjFm.ExtractChipNames: Integer;
var LineIndex: Integer; ChipNameText, InclusionLine: AnsiString;
begin
  ChipSelect.Items.Clear; Result := 0;
  for LineIndex := 0 to FChipDatabaseLines.Count - 1 do begin
    ChipNameText := UpperCase(FChipDatabaseLines[LineIndex]);
    if Copy(ChipNameText, 1, 9) = 'CHIPNAME=' then begin
      try InclusionLine := UpperCase(FChipDatabaseLines[LineIndex + 1]); except InclusionLine := ''; end;
      if (InclusionLine <> '') and (InclusionLine = 'INCLUDE=Y') then begin
        Delete(ChipNameText, 1, 9); ChipSelect.Items.Add(Copy(ChipNameText, 1, 8)); Inc(Result);
      end;
    end;
  end;
end;


{ VA $0047FB4C }
procedure TProjFm.ProgButtClick(Sender: TObject);
var BlankFuses: Boolean; Answer: Integer;
begin
  if not CheckButtonsAllow(True) then Exit;
  if (FROMWords.Count = 0) and (FEEPROMBytes.Count = 0) then begin
    ShowMessage('Nothing to program'); if FCommandLineAutoProgram then Close; Exit;
  end;
  if AutoUpdateFiles1.Checked and not LoadMultipleHexFiles then begin
    if FCommandLineAutoProgram then Close; Exit;
  end;
  if FWarnCodeProtection then
    if MessageDlg('WARNING!' + #13#13 +
      'This device has code protection that cannot be erased.' + #13 +
      'Do you wish to continue?', mtWarning, [mbYes, mbNo], 0) = mrNo then begin
      if FCommandLineAutoProgram then Close; Exit;
    end;
  BlankFuses := FFuseWord1 = FBlankFuseWord1;
  if FFuseWordCount <> 1 then BlankFuses := BlankFuses and (FFuseWord2 = FBlankFuseWord2);
  if not (FFuseWordCount in [1, 2]) then
    BlankFuses := BlankFuses and (FFuseWord3 = FBlankFuseWord3) and (FFuseWord4 = FBlankFuseWord4) and
      (FFuseWord5 = FBlankFuseWord5) and (FFuseWord6 = FBlankFuseWord6) and (FFuseWord7 = FBlankFuseWord7);
  if BlankFuses then begin
    Answer := MessageDlg('The FUSES are set to the default erased values.' + #13#13 +
      'Do you wish to edit the fuses before programming?', mtConfirmation,
      [mbYes, mbNo, mbCancel], 0);
    if Answer = mrCancel then begin if FCommandLineAutoProgram then Close; Exit; end;
    if Answer = mrYes then FuseButt.Click;
  end;
  if CheckOscalValue then begin
    SetProgrammingDataSize; ProgressBar1.Max := FROMWordCount;
    InitialiseProgrammerVariables(200);
    if (FROMWordCount = 0) or (FROMTransferWordCount = 0) then FAfterBlankCheckState := 402 else FAfterBlankCheckState := 400;
  end;
end;


{ VA $0047FFC8 }
procedure TProjFm.BlankButtClick(Sender: TObject);
begin
  if not CheckButtonsAllow(True) then Exit;
  FAfterBlankCheckState := -1; EraseFm.Echeck.Checked := True; ProgressBar1.Max := FROMWordCount;
  if FIsFlashDevice then begin
    if EraseFm.ShowModal = mrOK then begin
      if EraseFm.Echip.Checked then begin
        if MessageDlg('This will totally erase the chip.' + #13#13 +
          'Do you wish to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          InitialiseProgrammerVariables(250);
      end else if FROMWordCount = 0 then InitialiseProgrammerVariables(202)
      else InitialiseProgrammerVariables(200);
    end;
  end else InitialiseProgrammerVariables(200);
end;


{ VA $004800EC }
procedure TProjFm.OscalButtClick(Sender: TObject);
var Answer: Integer;
begin
  if not CheckButtonsAllow(True) then Exit;
  if FROMWords.Count = 0 then begin ShowMessage('No OSCAL value in memory'); Exit; end;
  SetOscalFmValues(True);
  if AutoUpdateFiles1.Checked then begin
    Answer := MessageDlg('Auto File Update is enabled.' + #13#13 +
      'The OSCAL data you change will not be programmed because all' + #13 +
      'file data will be reloaded at time of programming.' + #13#13 +
      'Do you want to un-check this feature?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    if Answer = mrCancel then Exit;
    if Answer = mrYes then AutoUpdateFiles1.Checked := False;
  end;
  if OscCalFm.ShowModal = mrOK then FDataModified := SetCalibrationValues;
end;

{ VA $00474DF8 }
procedure TProjFm.FormCreate(Sender: TObject);
begin
  Application.Icon.Handle := LoadIcon(HInstance, 'Proj');
  FExecutableDirectory := ExtractFilePath(Application.ExeName);
  FLastFileDirectory := FExecutableDirectory;
  FROMWords := TStringList.Create;
  FTextWorkLines := TStringList.Create;
  FEEPROMBytes := TStringList.Create;
  FChipDatabaseLines := TStringList.Create;
  FCodeDisplayLines := TStringList.Create;
  FLoadedFilePaths := TStringList.Create;
  FImportedROMWords := TStringList.Create;
  FImportedEEPROMBytes := TStringList.Create;
  FRetainedBitmap := TBitmap.Create;
  FDataModified := False;
  FShowDeviceID := False;
  FStartupPending := True;
  FResetIdleLevel := True;
  FBlankCheckFlags := 0;
  FAwaitingProgrammerReset := False;
  FProgramPIC18FusesAfterVerify := False;
  FResumeConfigAfterVerify := False;
  FTimeoutProbeSent := False;
  TWinControlAccess(Panel2).DoubleBuffered := True;
  FCalibrationPolicy := 1;
  FCommandLineAutoProgram := False;
  FSkipPreferenceSave := False;
  FRequiresICSP := False;
  FFastPowerSequence := False;
  FCodeScrollFocused := False;
  FIsPIC16F88 := False;
  FMPLABExecutablePath := 'none';
end;


{ VA $004752C8 }
procedure TProjFm.FormDestroy(Sender: TObject);
begin
  FROMWords.Free;
  FTextWorkLines.Free;
  FEEPROMBytes.Free;
  FChipDatabaseLines.Free;
  FCodeDisplayLines.Free;
  FLoadedFilePaths.Free;
  FImportedROMWords.Free;
  FImportedEEPROMBytes.Free;
  FRetainedBitmap.Free;
end;


{ VA $004792D4. Misleading name, only affects GUI. }
procedure TProjFm.ResetSerial(ShowReady: Boolean);
begin
  Timer1.Enabled := False;
  FAwaitingProgrammerReset := True;
  ChipSelect.Enabled := True;
  ButtonPanel.Enabled := True;
  File1.Enabled := True;
  Programmer1.Enabled := True;
  Options1.Enabled := True;
  Help1.Enabled := True;
  ProgButt.Enabled := True;
  LoadButt.Enabled := True;
  ChipSelect.Enabled := True;
  ProgressBar1.Position := 0;
  FlyForm.ProgressBar1.Position := 0;
  FReceiveState := 0;
  FReceiveBuffer := '';
  FCancelRequested := False;
  FReceiveIdleTicks := 0;
  FProtocolError := False;
  FBlankCheckFlags := 0;
  FShowDeviceID := False;
  FProgramPIC18FusesAfterVerify := False;
  FResumeConfigAfterVerify := False;
  FTimeoutProbeSent := False;
  AutoProgram.Checked := False;
  AutoLabel.Caption := '';
  FResetOnlyFlag := False;
  OscCalFm.Panel1.Enabled := True;
  ICSPMode1.Enabled := True;
  if ShowReady then StatusLabel.Caption := 'Ready';
  Serial2_AbortReceive(Serial1);
end;


{ VA $004792B8 }
procedure TProjFm.SetProgrammerReset(State: Boolean);
begin
  if Serial1.Active then
    Serial2_SetControlLine(Serial1, 1, State);
end;


{ VA $004758B8. EDX values passed, but ignored. }
procedure TProjFm.ResetProgrammer;
begin
  ResetSerial(False);
  DisableUserButtons;
  FAwaitingProgrammerReset := True;
  SetProgrammerReset(not FResetIdleLevel);
  StatusLabel.Caption := 'Resetting MicroBrn...';
  StatusLabel.Refresh;
  Sleep(1000);
  SetProgrammerReset(FResetIdleLevel);
  Timer1.Enabled := True;
end;


{ VA $0047F768 }
procedure TProjFm.InitialiseProgrammerVariables(NextState: Integer);
var
  SizeBytes: string[2];
  PowerSequenceByte: Integer;
begin
  FAwaitingProgrammerReset := False;
  DisableUserButtons;
  Serial2_SendBytes(Serial1, 'P' + #3);
  SizeBytes := Chr(Byte(FROMWordCount div 256));
  SizeBytes := SizeBytes + Chr(Byte(FROMWordCount mod 256));
  Serial2_SendBytes(Serial1, AnsiString(SizeBytes));
  SizeBytes := Chr(Byte(FEEPROMByteCount div 256));
  SizeBytes := SizeBytes + Chr(Byte(FEEPROMByteCount mod 256));
  Serial2_SendBytes(Serial1, AnsiString(SizeBytes));
  Serial2_SendByte(Serial1, Byte(FCoreAlgorithm));
  Serial2_SendByte(Serial1, Byte(FProgramFlags));
  Serial2_SendByte(Serial1, Byte(FProgramDelay));
  PowerSequenceByte := FPowerSequence;
  if ICSPMode1.Checked then
    case PowerSequenceByte of
      1, 2: PowerSequenceByte := 1;
      3, 4: PowerSequenceByte := 3;
    end;
  Serial2_SendByte(Serial1, Byte(PowerSequenceByte));
  Serial2_SendByte(Serial1, Byte(FEraseMode));
  Serial2_SendByte(Serial1, Byte(FProgramFlag2));
  Serial2_SendByte(Serial1, Byte(FPanelSizing));
  FTransferOffset := 0;
  FlyForm.ProgressBar1.Max := ProgressBar1.Max;
  FReceiveState := 10;
  FCancelRequested := False;
  FAfterInitializeState := NextState;
  Timer1.Enabled := True;
  if FExpectedDeviceID <> $FFFF then
    StatusLabel.Caption := 'Checking for ' +
      ChipSelect.Items[ChipSelect.ItemIndex] + '...'
  else
    StatusLabel.Caption := 'Initializing...';
end;


{ VA $00475424. Check at 14 ticks }
procedure TProjFm.Timer1Timer(Sender: TObject);
var
  BoardName, PortName, ExtraCheck: AnsiString;
begin
  if FStartupPending then
  begin
    Timer1.Enabled := False;
    if not ExecuteStartupProcedures then FCommandLineAutoProgram := False;
    Timer2.Enabled := True;
    FStartupPending := False;
    Exit;
  end;
  Inc(FReceiveIdleTicks);
  if FReceiveIdleTicks <> 14 then Exit;
  if not FAwaitingProgrammerReset then
  begin
    if not FTimeoutProbeSent then
    begin
      ResetSerial(False);
      Serial2_SendByte(Serial1, Ord('?'));
      FReceiveState := 760;
      FTimeoutProbeSent := True;
      FReceiveIdleTicks := 10;
      FAwaitingProgrammerReset := False;
      Timer1.Enabled := True;
    end
    else
    begin
      ResetSerial(False);
      StatusLabel.Caption := 'Error...';
      MessageDlg('The board is not responding' + #13#13 +
        'About to apply reset...', mtError, [mbOK], 0);
      Refresh;
      ResetProgrammer;
    end;
    Exit;
  end;
  ResetSerial(False);
  StatusLabel.Caption := 'Reset error...';
  ExtraCheck := '';
  case FProgrammerModel of
    0: BoardName := 'K128';
    1:
      begin
        BoardName := 'K149-A';
        ExtraCheck := 'Serial / USB switch' + #13;
      end;
    2:
      begin
        BoardName := 'K149-BC';
        ExtraCheck := 'Serial / USB switch' + #13;
      end;
    3: BoardName := 'K150';
    4: BoardName := 'K170';
  else
    BoardName := 'K182';
  end;
  if not SerialIsActive(Serial1) then PortName := 'None'
  else PortName := 'COM ' + IntToStr(Serial1.Port);
  MessageDlg('Reset failed. Please check...' + #13#13 +
    'Communications port, currently [ ' + PortName + ' ]' + #13 +
    ExtraCheck + 'Board connections and power' + #13 + 'Mode =  [ ' +
    BoardName + ' ], make sure this setting matches programmer board',
    mtError, [mbOK], 0);
  StatusLabel.Caption := 'Ready';
  FAwaitingProgrammerReset := False;
end;


{ VA $0047FE80 }
procedure TProjFm.ReadButtClick(Sender: TObject);
var
  Answer: Integer;
begin
  if not CheckButtonsAllow(True) then Exit;
  if FDataModified then
  begin
    Answer := MessageDlg('Data file has changed.' + #13#13 +
      'Do you wish to save it?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    case Answer of
      mrCancel: Exit;
      mrYes: SaveButt.Click;
    end;
  end;
  ResetCodeMemory(False, False, True);
  SetCaption;
  ProgressBar1.Max := FROMWordCount;
  InitialiseProgrammerVariables(50);
end;


{ VA $0047FF3C }
procedure TProjFm.VerfButtClick(Sender: TObject);
begin
  if not CheckButtonsAllow(True) then Exit;
  if (FROMWords.Count = 0) and (FEEPROMBytes.Count = 0) then
  begin
    MessageDlg('Nothing to verify', mtInformation, [mbOK], 0);
    Exit;
  end;
  ProgressBar1.Max := FROMWordCount;
  InitialiseProgrammerVariables(100);
end;


{ VA $00487D54 }
procedure TProjFm.CanButtClick(Sender: TObject);
begin
  if not AutoProgram.Checked then FCancelRequested := True
  else ResetProgrammer;
end;


{ VA $0047EA18 }
procedure TProjFm.ReadChipID1Click(Sender: TObject);
begin
  if not CheckButtonsAllow(True) then Exit;
  if (FExpectedDeviceID = $FFFF) or (FCoreAlgorithm = 4) then
    MessageDlg('Chip ID is not supported for this device.',
      mtInformation, [mbOK], 0)
  else
  begin
    FShowDeviceID := True;
    InitialiseProgrammerVariables(-1);
  end;
end;


{ VA $00480C7C }
procedure TProjFm.ReadCalibrationAndBG;
begin
  InitialiseProgrammerVariables(-1);
end;


{ VA $00488A6C }
procedure TProjFm.Version1Click(Sender: TObject);
begin
  if FReceiveState = 0 then
  begin
    Serial2_SendBytes(Serial1, 'P' + #21);
    FReceiveState := 750;
    Timer1.Enabled := True;
  end;
end;

function TProjFm.HexToDec(HexChar: Char): Integer;
begin Result := misc.HexToDec(HexChar); end;

function TProjFm.CheckASCII(HexChar: Char): Char;
begin Result := misc.CheckASCII(HexChar); end;

function TProjFm.ToHex(Value: Integer): Char;
begin Result := misc.ToHex(Value); end;

function TProjFm.DecToASCII(Value: Integer): Char;
begin Result := misc.DecToASCII(Value); end;

function TProjFm.VerifyHEX(HexText: AnsiString): Integer;
begin Result := misc.VerifyHEX(HexText); end;

function TProjFm.MyIntToHex(Value, Digits: Integer): AnsiString;
begin Result := misc.MyIntToHex(Value, Digits); end;

function TProjFm.DecToBinary(Value, Width: Integer): AnsiString;
begin Result := misc.DecToBinary(Value, Width); end;

function TProjFm.CheckSum(RecordText: AnsiString): AnsiString;
begin Result := misc.CheckSum(RecordText); end;

end.