unit fly;

interface

uses Windows, Forms, StdCtrls, Buttons, ComCtrls,
  Controls, Classes;

type
  TFlyForm = class(TForm)
    ProgButt: TBitBtn;
    ProgressBar1: TProgressBar;
    VerfButt: TBitBtn;
    StatusLabel: TLabel;
    procedure ProgButtClick(Sender: TObject);
    procedure VerfButtClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FTopMostActive: Boolean;
  end;

var
  FlyForm: TFlyForm;

implementation

uses prog40;

{$R *.dfm}

{ VA $0047153C }
procedure TFlyForm.ProgButtClick(Sender: TObject);
begin
  ProjFm.ProgButt.Click;
end;

{ VA $0047155C }
procedure TFlyForm.VerfButtClick(Sender: TObject);
begin
  ProjFm.VerfButt.Click;
end;

{ VA $0047157C }
procedure TFlyForm.FormCreate(Sender: TObject);
begin
  FTopMostActive := False;
end;

{ VA $00471584 }
procedure TFlyForm.FormActivate(Sender: TObject);
begin
  if not FTopMostActive then
  begin
    FTopMostActive := True;
    Application.NormalizeTopMosts;
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0,
      SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE);
  end;
end;

{ VA $004715C4 }
procedure TFlyForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FTopMostActive := False;
  SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
    SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE);
  Application.RestoreTopMosts;
  ProjFm.Visible := True;
end;

end.
