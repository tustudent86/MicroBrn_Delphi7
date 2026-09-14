unit fusesee;
{$H+} {$R+} {$Q+}
interface
uses Forms, StdCtrls, ExtCtrls, Buttons,
  Controls, Classes;
type
  TFuseValFm = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    FuseLabel1: TLabel;
    Label2: TLabel;
    FuseLabel2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    FuseLabel3: TLabel;
    FuseLabel4: TLabel;
    FuseLabel5: TLabel;
    FuseLabel6: TLabel;
    FuseLabel7: TLabel;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    procedure ShowLabels(Count: Integer; Calibration: Boolean);
  public

  end;
var FuseValFm: TFuseValFm;
implementation
{$R *.dfm}

{ VA $00473244 }
procedure TFuseValFm.ShowLabels(Count: Integer; Calibration: Boolean);
var ComponentIndex: Integer;
begin
  if Calibration then begin
    Caption := 'CAL Value(s)'; Label1.Caption := 'CAL 1'; Label2.Caption := 'CAL 2';
  end else begin
    Caption := 'Fuse Value(s)'; Label1.Caption := 'Fuse 1'; Label2.Caption := 'Fuse 2';
  end;
  for ComponentIndex := 0 to ComponentCount - 1 do
    if Components[ComponentIndex] is TLabel then
      TLabel(Components[ComponentIndex]).Visible := Components[ComponentIndex].Tag <= Count;
end;


end.
