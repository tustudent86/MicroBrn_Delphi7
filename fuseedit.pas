unit fuseedit;
{$H+} {$R+} {$Q+}
interface
uses Classes, Forms, StdCtrls, ExtCtrls, Buttons,
  Controls, Graphics;
type
  TFuseEditFM = class(TForm)
    FusePan: TPanel;
    Image15: TImage;
    Image17: TImage;
    Image12: TImage;
    Image16: TImage;
    CBLabel1: TLabel;
    CBLabel2: TLabel;
    CBLabel3: TLabel;
    CBLabel4: TLabel;
    CBLabel5: TLabel;
    CBLabel6: TLabel;
    CBLabel7: TLabel;
    CBLabel8: TLabel;
    CBLabel9: TLabel;
    CBLabel10: TLabel;
    CBLabel11: TLabel;
    CBLabel12: TLabel;
    CBLabel13: TLabel;
    CBLabel14: TLabel;
    CBLabel15: TLabel;
    CBLabel16: TLabel;
    CBLabel17: TLabel;
    CBLabel18: TLabel;
    CBLabel19: TLabel;
    CBLabel20: TLabel;
    CBLabel21: TLabel;
    CBLabel22: TLabel;
    CBLabel23: TLabel;
    CBLabel24: TLabel;
    CBLabel25: TLabel;
    CBLabel26: TLabel;
    CBLabel27: TLabel;
    CBLabel28: TLabel;
    CBLabel29: TLabel;
    CBLabel30: TLabel;
    CB1: TComboBox;
    CB2: TComboBox;
    CB4: TComboBox;
    CB3: TComboBox;
    CB5: TComboBox;
    CB6: TComboBox;
    CB7: TComboBox;
    CB8: TComboBox;
    CB9: TComboBox;
    CB10: TComboBox;
    CB11: TComboBox;
    CB12: TComboBox;
    CB13: TComboBox;
    CB14: TComboBox;
    CB15: TComboBox;
    CB16: TComboBox;
    CB17: TComboBox;
    CB18: TComboBox;
    CB19: TComboBox;
    CB20: TComboBox;
    CB21: TComboBox;
    CB22: TComboBox;
    CB23: TComboBox;
    CB24: TComboBox;
    CB25: TComboBox;
    CB26: TComboBox;
    CB27: TComboBox;
    CB28: TComboBox;
    CB29: TComboBox;
    CB30: TComboBox;
    DefButt: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IDedit: TEdit;
    IDLabel: TLabel;
    BClabel31: TLabel;
    CBlabel32: TLabel;
    CBlabel33: TLabel;
    CBlabel34: TLabel;
    CB31: TComboBox;
    CB32: TComboBox;
    CB33: TComboBox;
    CB34: TComboBox;
    BitBtn3: TBitBtn;
    procedure ResetFuseEdits;
    procedure DefButtClick(Sender: TObject);
    procedure IDeditKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  public

  end;
var FuseEditFM: TFuseEditFM;
implementation
{$R *.dfm}

{ VA $00471C50 }
procedure TFuseEditFM.ResetFuseEdits;
var ComponentIndex: Integer; FuseControl: TComponent;
begin
  for ComponentIndex := 0 to ComponentCount - 1 do begin
    FuseControl := Components[ComponentIndex];
    if (FuseControl is TComboBox) and (FuseControl.Tag <> 0) then begin
      while TComboBox(FuseControl).Items.Count <> 0 do TComboBox(FuseControl).Items.Delete(0);
      TComboBox(FuseControl).Visible := False;
    end;
    if (FuseControl is TLabel) and (FuseControl.Tag <> 0) then TLabel(FuseControl).Caption := '';
  end;
  IDLabel.Visible := False;
  IDedit.Visible := False;
end;


{ VA $00471D38 }
procedure TFuseEditFM.DefButtClick(Sender: TObject);
var ComponentIndex: Integer;
begin
  for ComponentIndex := 0 to ComponentCount - 1 do
    if Components[ComponentIndex] is TComboBox then TComboBox(Components[ComponentIndex]).ItemIndex := 0;
  if IDedit.MaxLength = 4 then IDedit.Text := 'FFFF'
  else IDedit.Text := 'FFFFFFFF';
end;


{ VA $00471DE4 }
procedure TFuseEditFM.IDeditKeyPress(Sender: TObject; var Key: Char);
var UserIDText: AnsiString;
begin
  UserIDText := IDedit.Text;
  Key := UpCase(Key);
  if not (Key in [#8, #13, '0'..'9', 'A'..'F']) then Key := #0;
end;


{ VA $00471E50 }
procedure TFuseEditFM.FormClose(Sender: TObject; var Action: TCloseAction);
var UserIDText: AnsiString;
begin
  UserIDText := IDedit.Text;
  while Length(UserIDText) < IDedit.MaxLength do UserIDText := 'F' + UserIDText;
  IDedit.Text := UserIDText;
end;


{ VA $00471ED8 }
procedure TFuseEditFM.FormActivate(Sender: TObject);
var UserIDText: AnsiString;
begin
  UserIDText := IDedit.Text;
  while Length(UserIDText) < IDedit.MaxLength do UserIDText := UserIDText + 'F';
  IDedit.Text := UserIDText;
end;


end.
