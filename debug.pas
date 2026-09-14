unit debug;
{$H+} {$R+} {$Q+}
interface
uses SysUtils, Forms, StdCtrls, ExtCtrls, Buttons,
  Controls, Classes;
type
  TDebugFm = class(TForm)
    DbEdit: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    BitBtn3: TBitBtn;
    procedure DbEditKeyPress(Sender: TObject; var Key: Char);
    function HexToDec(HexChar: Char): Integer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    FDebugVectorText: AnsiString; { Original +$030C }
    FDebugAddressHigh: Integer; { Original +$0310 }
    FDebugAddressMiddle: Integer; { Original +$0314 }
    FDebugAddressLow: Integer; { Original +$0318 }
  end;
var DebugFm: TDebugFm;
implementation
{$R *.dfm}

{ VA $004736B8 }
procedure TDebugFm.DbEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);
  if not (Key in [#8, #13, '0'..'9', 'A'..'F']) then Key := #0;
end;


{ VA $004735E4 }
function TDebugFm.HexToDec(HexChar: Char): Integer;
begin
  case HexChar of
    '0'..'9': Result := Ord(HexChar) - Ord('0');
    'A'..'F': Result := Ord(HexChar) - Ord('A') + 10;
  else
    Result := -1;
  end;
end;


{ VA $004736E4 }
procedure TDebugFm.FormClose(Sender: TObject; var Action: TCloseAction);
var EncodedAddressText: AnsiString; ByteAddress: Integer;
begin
  EncodedAddressText := DbEdit.Text;
  while Length(EncodedAddressText) <> DbEdit.MaxLength do EncodedAddressText := '0' + EncodedAddressText;
  DbEdit.Text := EncodedAddressText;
  ByteAddress := HexToDec(EncodedAddressText[1]) * $1000 + HexToDec(EncodedAddressText[2]) * $100 +
       HexToDec(EncodedAddressText[3]) * $10 + HexToDec(EncodedAddressText[4]);
  EncodedAddressText := IntToHex(ByteAddress div 2 + $F00000, 6);
  FDebugAddressHigh := HexToDec(EncodedAddressText[1]) * 16 + HexToDec(EncodedAddressText[2]);
  FDebugAddressMiddle := HexToDec(EncodedAddressText[3]) * 16 + HexToDec(EncodedAddressText[4]);
  FDebugAddressLow := HexToDec(EncodedAddressText[5]) * 16 + HexToDec(EncodedAddressText[6]);
  Delete(EncodedAddressText, 1, 2); Insert(' ', EncodedAddressText, 3);
  FDebugVectorText := '0x EF FO ' + EncodedAddressText;
end;


end.
