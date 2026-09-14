unit edit;
{$H+} {$R+} {$Q+}
interface
uses SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls, Buttons, Grids;
type
  TEditFm = class(TForm)
    ChipGrid: TStringGrid;
    ChipMemo: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FillChipGrid;
    procedure ChipGridSelectCell(Sender: TObject; ACol, ARow: Longint;
  var CanSelect: Boolean);
    procedure ChipGridDblClick(Sender: TObject);
    procedure ModifyChipList;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  public
    FSelectedChipRow: Integer; { Original +$0300 }
    FChipDatabaseModified: Boolean; { Original +$0304 }
    FEditableChipLines: TStringList; { Original +$0308 }
  end;
var EditFm: TEditFm;
implementation
{$R *.dfm}

{ VA $00470D9C }
procedure TEditFm.FormShow(Sender: TObject);
begin
  FillChipGrid; FSelectedChipRow := -1;
end;


{ VA $00470DB8 }
procedure TEditFm.FillChipGrid;
var LineIndex, GridRow: Integer; ChipNameText, InclusionLine: AnsiString;
begin
  ChipGrid.RowCount := 1;
  ChipGrid.Cells[0, 0] := 'Chip'; ChipGrid.Cells[1, 0] := 'Included';
  for LineIndex := 0 to FEditableChipLines.Count - 1 do begin
    ChipNameText := UpperCase(FEditableChipLines[LineIndex]);
    if Copy(ChipNameText, 1, 9) = 'CHIPNAME=' then begin
      Delete(ChipNameText, 1, 9); ChipNameText := Copy(ChipNameText, 1, 8);
      try InclusionLine := UpperCase(FEditableChipLines[LineIndex + 1]); except InclusionLine := ''; end;
      if InclusionLine <> '' then begin
        GridRow := ChipGrid.RowCount; ChipGrid.RowCount := GridRow + 1;
        ChipGrid.Cells[0, GridRow] := ChipNameText;
        if Copy(InclusionLine, 1, 8) = 'INCLUDE=' then
          ChipGrid.Cells[1, GridRow] := Copy(InclusionLine, Length(InclusionLine), 1)
        else ChipGrid.Cells[1, GridRow] := 'Y';
      end;
    end;
  end;
  ChipGrid.FixedRows := 1;
end;


{ VA $0047106C }
procedure TEditFm.ChipGridSelectCell(Sender: TObject; ACol, ARow: Longint;
  var CanSelect: Boolean);
begin
  FSelectedChipRow := ARow;
end;


{ VA $0047107C }
procedure TEditFm.ChipGridDblClick(Sender: TObject);
begin
  if FSelectedChipRow = -1 then Exit;
  if ChipGrid.Cells[1, FSelectedChipRow] = 'Y' then ChipGrid.Cells[1, FSelectedChipRow] := 'N'
  else ChipGrid.Cells[1, FSelectedChipRow] := 'Y';
  FSelectedChipRow := -1; FChipDatabaseModified := True;
end;


{ VA $00471148 }
procedure TEditFm.ModifyChipList;
var LineIndex, GridRow: Integer; ConfigLine: AnsiString;
begin
  GridRow := 1;
  for LineIndex := 0 to FEditableChipLines.Count - 1 do begin
    ConfigLine := UpperCase(FEditableChipLines[LineIndex]);
    if Copy(ConfigLine, 1, 8) = 'INCLUDE=' then begin
      FEditableChipLines[LineIndex] := 'INCLUDE=' + ChipGrid.Cells[1, GridRow]; Inc(GridRow);
    end;
  end;
end;


{ VA $00471244 }
procedure TEditFm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if FChipDatabaseModified then
    if MessageDlg('Chip list has changed.' + #13#13 + 'Save changes?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then ModifyChipList
    else FChipDatabaseModified := False;
end;


{ VA $004712BC }
procedure TEditFm.FormCreate(Sender: TObject);
begin
  FEditableChipLines := TStringList.Create;
end;


{ VA $004712D8 }
procedure TEditFm.FormDestroy(Sender: TObject);
begin
  FEditableChipLines.Free;
end;


end.
