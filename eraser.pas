unit eraser;

interface

uses Forms, StdCtrls, Buttons, ExtCtrls, Controls,
  Classes;

type
  TEraseFm = class(TForm)
    Echeck: TRadioButton;
    Echip: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel2: TBevel;
    BitBtn3: TBitBtn;
  end;

var
  EraseFm: TEraseFm;

implementation

{$R *.dfm}

end.
