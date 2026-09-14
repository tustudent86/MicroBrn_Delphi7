unit codeedit;
{$H+} {$R+} {$Q+}
interface
uses SysUtils, Controls, Forms, StdCtrls, Buttons, Grids,
  Classes;
type
  TEditCodeFm = class(TForm)
    ROMGrid: TStringGrid;
    EEPROMGrid: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ROMGridSelectCell(Sender: TObject; ACol, ARow: Longint;
  var CanSelect: Boolean);
    procedure EEPROMGridSelectCell(Sender: TObject; ACol, ARow: Longint;
  var CanSelect: Boolean);
    procedure ROMGridKeyPress(Sender: TObject; var Key: Char);
    procedure EEPROMGridKeyPress(Sender: TObject; var Key: Char);
    procedure ROMAddASCIItoAddress(Row: Integer);
    procedure EEPROMAddASCIItoAddress(Row: Integer);
    procedure FormActivate(Sender: TObject);
  public
    FSelectedColumn: Integer; { Original +$0310 }
    FSelectedRow: Integer; { Original +$0314 }
    FROMCellBeforeEdit: AnsiString; { Original +$0318 }
    FEEPROMCellBeforeEdit: AnsiString; { Original +$031C }
    FBlankROMWord: Integer; { Original +$0320 }
  end;
var EditCodeFm: TEditCodeFm;
implementation
uses prog40;
{$R *.dfm}

{ VA $00472C30 }
procedure TEditCodeFm.FormCreate(Sender: TObject);
begin
  FBlankROMWord := $3FFF;
end;


{ VA $00472C3C }
procedure TEditCodeFm.SpeedButton1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;


{ VA $00472C48 }
procedure TEditCodeFm.SpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;


{ VA $00472810 }
procedure TEditCodeFm.ROMGridSelectCell(Sender: TObject; ACol, ARow: Longint;
  var CanSelect: Boolean);
begin
  FROMCellBeforeEdit := ROMGrid.Cells[ACol, ARow]; FSelectedColumn := ACol; FSelectedRow := ARow;
end;


{ VA $00472880 }
procedure TEditCodeFm.EEPROMGridSelectCell(Sender: TObject; ACol, ARow: Longint;
  var CanSelect: Boolean);
begin
  FEEPROMCellBeforeEdit := EEPROMGrid.Cells[ACol, ARow]; FSelectedColumn := ACol; FSelectedRow := ARow;
end;


{ VA $004728F0 }
procedure TEditCodeFm.ROMGridKeyPress(Sender: TObject; var Key: Char);
var CellText: AnsiString; ROMWord: Integer; IsDigit: Boolean;
begin
  CellText := ''; IsDigit := False; Key := UpCase(Key);
  case Key of
    #27: ROMGrid.Cells[FSelectedColumn, FSelectedRow] := FROMCellBeforeEdit;
    #8: ;
    #13: begin
      CellText := ROMGrid.Cells[FSelectedColumn, FSelectedRow];
      if CellText = '' then ROMWord := FBlankROMWord else ROMWord := ProjFm.VerifyHEX(CellText);
      if (ROMWord = -1) or (ROMWord > FBlankROMWord) then
        ROMGrid.Cells[FSelectedColumn, FSelectedRow] := FROMCellBeforeEdit
      else begin
        CellText := IntToHex(ROMWord, 4); if FBlankROMWord = $FFF then Delete(CellText, 1, 1);
        ROMGrid.Cells[FSelectedColumn, FSelectedRow] := CellText; ROMAddASCIItoAddress(FSelectedRow);
      end;
    end;
    '0'..'9', 'A'..'F': IsDigit := True;
  else Key := #0;
  end;
  if IsDigit and (Length(CellText) > 3) then Key := #0;
end;


{ VA $00472A8C }
procedure TEditCodeFm.EEPROMGridKeyPress(Sender: TObject; var Key: Char);
var CellText: AnsiString; EEPROMByte: Integer; IsDigit: Boolean;
begin
  CellText := ''; IsDigit := False; Key := UpCase(Key);
  case Key of
    #27: EEPROMGrid.Cells[FSelectedColumn, FSelectedRow] := FEEPROMCellBeforeEdit;
    #8: ;
    #13: begin
      CellText := EEPROMGrid.Cells[FSelectedColumn, FSelectedRow]; if CellText = '' then CellText := 'FF';
      EEPROMByte := ProjFm.VerifyHEX(CellText);
      if (EEPROMByte = -1) or (EEPROMByte > $FF) then EEPROMGrid.Cells[FSelectedColumn, FSelectedRow] := FEEPROMCellBeforeEdit
      else begin
        EEPROMGrid.Cells[FSelectedColumn, FSelectedRow] := IntToHex(EEPROMByte, 2);
        EEPROMAddASCIItoAddress(FSelectedRow);
      end;
    end;
    '0'..'9', 'A'..'F': begin
      IsDigit := True; CellText := EEPROMGrid.Cells[FSelectedColumn, FSelectedRow];
    end;
  else Key := #0;
  end;
  if IsDigit and (Length(CellText) > 1) then Key := #0;
end;


{ VA $00472C54 }
procedure TEditCodeFm.ROMAddASCIItoAddress(Row: Integer);
var LowByte: Integer; AddressText: AnsiString;
begin
  LowByte := ProjFm.VerifyHEX(ROMGrid.Cells[1, Row]) and $FF;
  AddressText := IntToHex(Row - 1, 4);
  if (LowByte >= 32) and (LowByte <= 127) then AddressText := AddressText + ' [' + Chr(LowByte) + ']'
  else AddressText := AddressText + ' [.]';
  ROMGrid.Cells[0, Row] := AddressText;
end;


{ VA $00472D8C }
procedure TEditCodeFm.EEPROMAddASCIItoAddress(Row: Integer);
var DataByte: Integer; AddressText: AnsiString;
begin
  DataByte := ProjFm.VerifyHEX(EEPROMGrid.Cells[1, Row]) and $FF;
  AddressText := IntToHex(Row - 1, 4);
  if (DataByte >= 32) and (DataByte <= 127) then AddressText := AddressText + ' [' + Chr(DataByte) + ']'
  else AddressText := AddressText + ' [.]';
  EEPROMGrid.Cells[0, Row] := AddressText;
end;


{ VA $00472EC4 }
procedure TEditCodeFm.FormActivate(Sender: TObject);
var GridRow: Integer; Selection: TGridRect;
begin
  Selection.Left := -1; Selection.Top := -1;
  Selection.Right := -1; Selection.Bottom := -1;
  ROMGrid.Selection := Selection; EEPROMGrid.Selection := Selection;
  for GridRow := 1 to ROMGrid.RowCount - 1 do ROMAddASCIItoAddress(GridRow);
  for GridRow := 1 to EEPROMGrid.RowCount - 1 do EEPROMAddASCIItoAddress(GridRow);
  FSelectedColumn := -1; FSelectedRow := -1;
end;

end.
