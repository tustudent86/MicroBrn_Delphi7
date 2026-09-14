unit Serial2Reg;

interface

procedure Register;

implementation

uses
  Classes, Serial2;

procedure Register;
begin
  RegisterComponents('MicroBrn', [TSerial]);
end;

end.
