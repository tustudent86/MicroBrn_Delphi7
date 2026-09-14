program MicroBrn;

{ VA $00489D5C. }
{$R MicroBrn.res}

uses
  Forms,
  prog40 in 'prog40.pas' {ProjFm},
  serport in 'serport.pas' {PortFm},
  eraser in 'eraser.pas' {EraseFm},
  fly in 'fly.pas' {FlyForm},
  fuseedit in 'fuseedit.pas' {FuseEditFM},
  osc in 'osc.pas' {OscCalFm},
  edit in 'edit.pas' {EditFm},
  codeedit in 'codeedit.pas' {EditCodeFm},
  fusesee in 'fusesee.pas' {FuseValFm},
  debug in 'debug.pas' {DebugFm};

begin
  Application.Initialize;
  Application.Title := 'MicroBrn';
  Application.HelpFile := 'microBrn.hlp';
  Application.CreateForm(TProjFm, ProjFm);
  Application.CreateForm(TPortFm, PortFm);
  Application.CreateForm(TEraseFm, EraseFm);
  Application.CreateForm(TFlyForm, FlyForm);
  Application.CreateForm(TFuseEditFM, FuseEditFM);
  Application.CreateForm(TOscCalFm, OscCalFm);
  Application.CreateForm(TEditFm, EditFm);
  Application.CreateForm(TEditCodeFm, EditCodeFm);
  Application.CreateForm(TFuseValFm, FuseValFm);
  Application.CreateForm(TDebugFm, DebugFm);
  Application.Run;
end.
