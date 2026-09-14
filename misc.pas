unit misc;

interface

function HexToDec(HexChar: Char): Integer;
function CheckASCII(HexChar: Char): Char;
function ToHex(Value: Integer): Char;
function DecToASCII(Value: Integer): Char;
function VerifyHEX(HexText: AnsiString): Integer;
function MyIntToHex(Value, Digits: Integer): AnsiString;
function DecToBinary(Value, Width: Integer): AnsiString;
function CheckSum(RecordText: AnsiString): AnsiString;

implementation

uses SysUtils;

{ VA $0047DB4C }
function HexToDec(HexChar: Char): Integer;
begin
  case HexChar of
    '0'..'9': Result := Ord(HexChar) - Ord('0');
    'A'..'F': Result := Ord(HexChar) - Ord('A') + 10;
  else
    Result := -1;
  end;
end;

{ VA $0047DB18 }
function CheckASCII(HexChar: Char): Char;
begin
  case HexChar of
    '0'..'9', 'A'..'F': Result := HexChar;
    'a'..'f': Result := UpCase(HexChar);
  else
    Result := '-';
  end;
end;

{ VA $0047E1F0 - every number > 15 become F also }
function ToHex(Value: Integer): Char;
begin
  case Value of
    0..9: Result := Chr(Ord('0') + Value);
    10..14: Result := Chr(Ord('A') + Value - 10);
  else
    Result := 'F';
  end;
end;

{ VA $0047F600 }
function DecToASCII(Value: Integer): Char;
begin
  Result := ToHex(Value);
end;

{ VA $0047D45C }
function VerifyHEX(HexText: AnsiString): Integer;
var
  PaddedHex: AnsiString;
  DigitIndex, Digit, DecodedValue: Integer;
begin
  Result := -1;
  PaddedHex := UpperCase(HexText);
  if Length(PaddedHex) > 6 then Exit;
  while Length(PaddedHex) < 6 do PaddedHex := '0' + PaddedHex;
  DecodedValue := 0;
  for DigitIndex := 1 to 6 do
  begin
    Digit := HexToDec(PaddedHex[DigitIndex]);
    if Digit < 0 then Exit;
    DecodedValue := DecodedValue * 16 + Digit;
  end;
  Result := DecodedValue;
end;

{ VA $0047E0C4 }
function MyIntToHex(Value, Digits: Integer): AnsiString;
var
  BytePart: Integer;
begin
  BytePart := Value mod 256;
  Result := ToHex(BytePart mod 16);
  Result := ToHex(BytePart div 16) + Result;
  if Digits = 4 then
  begin
    BytePart := Value div 256;
    Result := ToHex(BytePart mod 16) + Result;
    Result := ToHex(BytePart div 16) + Result;
  end;
end;

{ VA $0047F518 }
function DecToBinary(Value, Width: Integer): AnsiString;
var
  Mask: Integer;
begin
  Result := '';
  case Width of
    2: Mask := $0002;
    4: Mask := $0008;
    5: Mask := $0010;
    7: Mask := $0040;
    8: Mask := $0080;
    10: Mask := $0200;
    11: Mask := $0400;
    12: Mask := $0800;
    13: Mask := $1000;
  else
    Mask := $2000;
  end;
  while Mask > 0 do
  begin
    if (Mask and Value) <> 0 then Result := Result + '1'
    else Result := Result + '0';
    Mask := Mask div 2;
  end;
end;

{ VA $0047AC78. Intel HEX checksum over text WITHOUT ':' or checksum.
  StrPCopy can cause a buffer overrun }
function CheckSum(RecordText: AnsiString): AnsiString;
var
  Buffer: array[0..50] of Char;
  CharacterIndex, ChecksumTotal: Integer;
begin
  CharacterIndex := 0;
  ChecksumTotal := 0;
  StrPCopy(Buffer, RecordText);
  while Buffer[CharacterIndex] <> #0 do
  begin
    ChecksumTotal := ChecksumTotal + HexToDec(Buffer[CharacterIndex]) * 16 + HexToDec(Buffer[CharacterIndex + 1]);
    Inc(CharacterIndex, 2);
  end;
  ChecksumTotal := 256 - (ChecksumTotal and $FF);
  if ChecksumTotal = 256 then ChecksumTotal := 0;
  Result := IntToHex(ChecksumTotal, 2);
end;

end.
