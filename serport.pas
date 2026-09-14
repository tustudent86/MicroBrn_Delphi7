unit serport;

interface

uses
  Windows, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  Classes;

type
  TPortFm = class(TForm)
    Label1: TLabel;
    PortEdit: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    procedure PortEditKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  PortFm: TPortFm;

implementation

{$R *.dfm}

{ VA $00464D30 }
procedure TPortFm.PortEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (UpCase(Key) in [#8, #13, '0'..'9']) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
end;

{ VA $00464D58 }
procedure TPortFm.BitBtn1Click(Sender: TObject);
begin
  if PortEdit.Text = '' then
  begin
    MessageDlg('Invalid port value', mtError, [mbOK], 0);
    ModalResult := mrNone;
  end;
end;

{ VA $00464DE0 }
procedure TPortFm.FormActivate(Sender: TObject);
begin
  PortFm.PortEdit.SetFocus;
end;

end.
