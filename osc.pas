unit osc;
{$H+} {$R+} {$Q+}
interface
uses Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Buttons,
  Classes;
type
  TOscCalFm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    RetlwLab: TLabel;
    BandGapLabel: TLabel;
    OscEdit: TEdit;
    OKbutt: TBitBtn;
    CanButt: TBitBtn;
    BGedit: TEdit;
    ReadButt: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    procedure OscEditKeyPress(Sender: TObject; var Key: Char);
    procedure BGeditKeyPress(Sender: TObject; var Key: Char);
    procedure ReadButtClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKbuttClick(Sender: TObject);
  public
    FOscalBeforeEdit: AnsiString; { Original +$0320 }
    FBandgapBeforeEdit: AnsiString; { Original +$0324 }
  end;
var OscCalFm: TOscCalFm;
implementation
uses prog40;
{$R *.dfm}

{ VA $0047223C }
procedure TOscCalFm.OscEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (UpCase(Key) in [#8, #13, '0'..'9', 'A'..'F']) then Key := #0;
end;


{ VA $0047241C }
procedure TOscCalFm.BGeditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, #13, '0', '1']) then Key := #0;
end;


{ VA $00472430 }
procedure TOscCalFm.ReadButtClick(Sender: TObject);
begin
  Panel1.Enabled := False;
  ProjFm.ReadCalibrationAndBG;
end;


{ VA $00472450 }
procedure TOscCalFm.FormActivate(Sender: TObject);
begin
  FOscalBeforeEdit := OscEdit.Text;
  FBandgapBeforeEdit := BGedit.Text;
end;

{ VA $00472264 }
procedure TOscCalFm.OKbuttClick(Sender: TObject);
begin
  if Length(OscEdit.Text) <> 2 then begin
    ShowMessage('Invalid OSCAL value'); ModalResult := mrNone; Exit;
  end;
  if Length(BGedit.Text) <> 2 then begin
    ShowMessage('Invalid BandGap value'); ModalResult := mrNone; Exit;
  end;
  if (OscEdit.Text <> FOscalBeforeEdit) or (BGedit.Text <> FBandgapBeforeEdit) then
    if MessageDlg('You are about to insert the calibration data into the HEX file.' +
      #13#13 + 'Continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      ModalResult := mrCancel;
end;


end.
