unit Serial2;

{ This is replacement component for TSerial and only implements the parts
necessary for MicroBrn. }

{$H+} {$R+} {$Q-} {$B-}
interface
uses Windows, Messages, Classes;
type
  eParity = (paNone, paOdd, paEven, paMark, paSpace);
  eDataBits = (d7bit, d8bit);
  eStopBits = (st1bit, st2bit);
  sPorts = 1..99;
  eFlowControl = (fcNone, fcRTS_CTS, fcDTR_DSR, fcXON_XOF);
  eOpModes = (rxNormal, rxMessage);
  eMsgState = (msNone, msStarted, msEnded, msDone);
  eNotifyErr = (neDialog, neEvent, neNone);
  eModemInSignal = (msCTS, msDSR, msRLSD);
  eModemOutSignal = (msRTS, msDTR);
  TRxMessageEvent = procedure(Sender: TObject; RxMessage: AnsiString) of object;
  TSignalChangeEvent = procedure(Sender: TObject; Signal: eModemInSignal; SignalState: Boolean) of object;
  TWriteCompletedEvent = procedure of object;
  TSerialMonitor = class(TThread)
  private
    FPortHandle, FStopEvent, FCommEvent, FWriteEvent: THandle;
    FWindow: HWND;
    FGeneration: Cardinal;
  protected
    procedure Execute; override;
  public
    constructor Create(PortHandle, StopEvent, CommEvent, WriteEvent: THandle;
      Window: HWND; Generation: Cardinal);
  end;
  TSerial = class(TComponent)
  private
    FPort: sPorts; FBaudrate: Integer; FParity: eParity;
    FDataBits: eDataBits; FStopBits: eStopBits; FActive, FClosing: Boolean;
    FRxQueueSize, FTxQueueSize: Word; FFlowMode: eFlowControl;
    FCheckParity: Boolean; FRxEventMode: eOpModes;
    FMessageStartChar, FMessageEndChar: Char; FMessageAppendCount: Word;
    FNotifyErrors: eNotifyErr; FErrorCode: Integer;
    FWaitOnTxFull, FWaitTxComplete: Boolean; FTimeout: Cardinal;
    FOnRxData, FOnTxEmpty, FOnError, FOnBreak, FOnRing: TNotifyEvent;
    FOnMessage: TRxMessageEvent; FOnSignalChange: TSignalChangeEvent;
    FOnWriteCompleted: TWriteCompletedEvent;
    FHandle, FStopEvent, FCommEvent, FReadEvent, FWriteEvent: THandle;
    FWindow: HWND; FGeneration: Cardinal; FMonitor: TSerialMonitor;
    FDispatchingEvents, FPollDeferred: Boolean;
    FDeferredMessages: array of TMessage;
    FDeferredHead, FDeferredCount: Integer;
    FReadOverlap, FWriteOverlap: TOverlapped;
    FWritePending, FWriteNotify: Boolean; FWriteData: AnsiString;
    FMessage: AnsiString; FMessageState: eMsgState; FAppendRemaining: Word;
    procedure SetPort(Value: sPorts);
    procedure SetBaudrate(Value: Integer);
    procedure SetParity(Value: eParity);
    procedure SetDataBits(Value: eDataBits);
    procedure SetStopBits(Value: eStopBits);
    procedure SetActive(Value: Boolean);
    procedure SetRxQueueSize(Value: Word);
    procedure SetTxQueueSize(Value: Word);
    procedure SetFlowMode(Value: eFlowControl);
    procedure SetCheckParity(Value: Boolean);
    procedure SetTimeout(Value: Cardinal);
    procedure SetRxEventMode(Value: eOpModes);
    function GetRxWaiting: Integer;
    function GetTxWaiting: Integer;
    procedure Reconfigure;
    procedure OpenPort;
    procedure ClosePort;
    function Configure: Boolean;
    procedure ReportError(Code: Integer);
    function RequireActive: Boolean;
    function WaitTimeout: Cardinal;
    function ReadBuffer(var Buffer; Count: DWORD): Integer;
    function FinishWrite(Wait: Boolean): Boolean;
    procedure CancelWrite;
    procedure WndProc(var Msg: TMessage);
    procedure QueueNotification(const Msg: TMessage);
    procedure ClearNotifications;
    procedure DispatchEvents(Events: DWORD);
    function FeedMessage(ReceivedChar: Char): Boolean;
  protected
    { A test subclass can replace monitoring while exercising mocked Win32 I/O. }
    procedure StartMonitor; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteChar(SendChar: Char);
    procedure WriteString(SendData: AnsiString);
    function ReadChar(var ReceivedChar: Char): Integer;
    procedure SetSignal(Signal: eModemOutSignal; State: Boolean);
    procedure AbortReceive;
    procedure SetControlLine(Selector: Byte; State: Boolean);
    property Active: Boolean read FActive write SetActive;
  published
    property Port: sPorts read FPort write SetPort default 1;
    property Baudrate: Integer read FBaudrate write SetBaudrate default 9600;
    property Parity: eParity read FParity write SetParity default paNone;
    property DataBits: eDataBits read FDataBits write SetDataBits default d7bit;
    property StopBits: eStopBits read FStopBits write SetStopBits default st1bit;
    property RxQueueSize: Word read FRxQueueSize write SetRxQueueSize default 1024;
    property TxQueueSize: Word read FTxQueueSize write SetTxQueueSize default 1024;
    property FlowMode: eFlowControl read FFlowMode write SetFlowMode default fcNone;
    property CheckParity: Boolean read FCheckParity write SetCheckParity default True;
    property RxWaiting: Integer read GetRxWaiting;
    property TxWaiting: Integer read GetTxWaiting;
    property RxEventMode: eOpModes read FRxEventMode write SetRxEventMode default rxNormal;
    property MessageStartChar: Char read FMessageStartChar write FMessageStartChar default #2;
    property MessageEndChar: Char read FMessageEndChar write FMessageEndChar default #3;
    property MessageAppendCount: Word read FMessageAppendCount write FMessageAppendCount default 0;
    property NotifyErrors: eNotifyErr read FNotifyErrors write FNotifyErrors default neDialog;
    property ErrorCode: Integer read FErrorCode;
    property WaitOnTxFull: Boolean read FWaitOnTxFull write FWaitOnTxFull default True;
    property Timeout: Cardinal read FTimeout write SetTimeout default 10000;
    property WaitTxComplete: Boolean read FWaitTxComplete write FWaitTxComplete default True;
    property OnRxData: TNotifyEvent read FOnRxData write FOnRxData;
    property OnTxEmpty: TNotifyEvent read FOnTxEmpty write FOnTxEmpty;
    property OnMessage: TRxMessageEvent read FOnMessage write FOnMessage;
    property OnError: TNotifyEvent read FOnError write FOnError;
    property OnBreak: TNotifyEvent read FOnBreak write FOnBreak;
    property OnRing: TNotifyEvent read FOnRing write FOnRing;
    property OnSignalChange: TSignalChangeEvent read FOnSignalChange write FOnSignalChange;
    property OnWriteCompleted: TWriteCompletedEvent read FOnWriteCompleted write FOnWriteCompleted;
  end;
procedure Serial2_SendByte(Serial: TSerial; Value: Byte);
procedure Serial2_SendBytes(Serial: TSerial; Data: AnsiString);
function Serial2_ReadByte(Serial: TSerial; var Value: Char): Integer;
procedure Serial2_AbortReceive(Serial: TSerial);
procedure Serial2_SetControlLine(Serial: TSerial; Selector: Byte; State: Boolean);
implementation
uses SysUtils, Forms, Dialogs;
const
  WM_SERIAL_EVENT = WM_USER + $351;
  WM_SERIAL_ERROR = WM_USER + $352;
  WM_SERIAL_POLL = WM_USER + $353;
  WM_SERIAL_WRITTEN = WM_USER + $354;
  SerialEventMask = EV_RXCHAR or EV_TXEMPTY or EV_CTS or EV_DSR or EV_RLSD or EV_BREAK or EV_RING;
function ValidBaud(Value: Integer): Boolean;
const Rates: array[0..14] of Integer = (110,300,600,1200,2400,4800,9600,14400,19200,38400,56000,57600,115200,128000,256000);
var RateIndex: Integer;
begin Result := False; for RateIndex := 0 to High(Rates) do if Value = Rates[RateIndex] then Result := True; end;
procedure ReleaseEvent(var Event: THandle);
begin if Event <> 0 then begin CloseHandle(Event); Event := 0; end; end;
constructor TSerialMonitor.Create(PortHandle, StopEvent, CommEvent, WriteEvent: THandle;
  Window: HWND; Generation: Cardinal);
begin
  inherited Create(True); FreeOnTerminate := False;
  FPortHandle := PortHandle; FStopEvent := StopEvent; FCommEvent := CommEvent;
  FWriteEvent := WriteEvent; FWindow := Window; FGeneration := Generation;
end;
procedure TSerialMonitor.Execute;
var CommOverlap: TOverlapped; Events, TransferredBytes, Error, WaitResult: DWORD;
    Handles: array[0..1] of THandle; Pending: Boolean;
begin
  FillChar(CommOverlap, SizeOf(CommOverlap), 0); CommOverlap.hEvent := FCommEvent;
  Handles[0] := FStopEvent; Handles[1] := FCommEvent;
  while not Terminated do begin
    Events := 0; ResetEvent(FCommEvent);
    Pending := not WaitCommEvent(FPortHandle, Events, @CommOverlap);
    if Pending then begin
      Error := GetLastError;
      if Error <> ERROR_IO_PENDING then begin
        if not Terminated then PostMessage(FWindow, WM_SERIAL_ERROR, FGeneration, Error);
        Exit;
      end;
      repeat
        WaitResult := WaitForMultipleObjects(2, @Handles[0], False, 100);
        if (WaitResult = WAIT_TIMEOUT) and
           (WaitForSingleObject(FWriteEvent, 0) = WAIT_OBJECT_0) then
          PostMessage(FWindow, WM_SERIAL_POLL, FGeneration, 0);
      until WaitResult <> WAIT_TIMEOUT;
      if (WaitResult = WAIT_OBJECT_0) or Terminated then begin
        CancelIo(FPortHandle); GetOverlappedResult(FPortHandle, CommOverlap, TransferredBytes, True); Exit;
      end;
      if WaitResult <> WAIT_OBJECT_0 + 1 then begin
        Error := GetLastError;
        CancelIo(FPortHandle); GetOverlappedResult(FPortHandle, CommOverlap, TransferredBytes, True);
        PostMessage(FWindow, WM_SERIAL_ERROR, FGeneration, Error); Exit;
      end;
      if not GetOverlappedResult(FPortHandle, CommOverlap, TransferredBytes, False) then begin
        Error := GetLastError;
        if not Terminated then PostMessage(FWindow, WM_SERIAL_ERROR, FGeneration, Error);
        Exit;
      end;
    end;
    if not Terminated and (Events <> 0) then
      PostMessage(FWindow, WM_SERIAL_EVENT, FGeneration, Events);
  end;
end;
constructor TSerial.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHandle := INVALID_HANDLE_VALUE; FPort := 1; FBaudrate := 9600;
  FRxQueueSize := 1024; FTxQueueSize := 1024; FCheckParity := True;
  FMessageStartChar := #2; FMessageEndChar := #3;
  FWaitOnTxFull := True; FWaitTxComplete := True; FTimeout := 10000;
  { No handles or threads are created until Active is set at run time. }
end;
destructor TSerial.Destroy;
begin ClosePort; if FWindow <> 0 then DeallocateHWnd(FWindow); inherited Destroy; end;
procedure TSerial.ReportError(Code: Integer);
var ErrorText: AnsiString;
begin
  FErrorCode := Code;
  if csDestroying in ComponentState then Exit;
  if FNotifyErrors = neEvent then begin if Assigned(FOnError) then FOnError(Self); end
  else if FNotifyErrors = neDialog then begin
    case Code of
      -1: ErrorText := 'The port is not active';
      -2: ErrorText := 'String too long for Tx buffer';
    else ErrorText := SysErrorMessage(Code); end;
    MessageDlg(ErrorText, mtError, [mbOK], 0);
  end;
end;
function TSerial.RequireActive: Boolean;
begin Result := FActive and not FClosing; if not Result then ReportError(-1); end;
function TSerial.WaitTimeout: Cardinal;
begin if FTimeout = 0 then Result := INFINITE else Result := FTimeout; end;
procedure TSerial.SetPort(Value: sPorts);
begin if FPort <> Value then begin FPort := Value; Reconfigure; end; end;
procedure TSerial.SetBaudrate(Value: Integer);
begin
  if not ValidBaud(Value) then begin ReportError(ERROR_INVALID_PARAMETER); Exit; end;
  if FBaudrate <> Value then begin FBaudrate := Value; Reconfigure; end;
end;
procedure TSerial.SetParity(Value: eParity);
begin if FParity <> Value then begin FParity := Value; Reconfigure; end; end;
procedure TSerial.SetDataBits(Value: eDataBits);
begin if FDataBits <> Value then begin FDataBits := Value; Reconfigure; end; end;
procedure TSerial.SetStopBits(Value: eStopBits);
begin if FStopBits <> Value then begin FStopBits := Value; Reconfigure; end; end;
procedure TSerial.SetRxQueueSize(Value: Word);
begin if Value = 0 then ReportError(ERROR_INVALID_PARAMETER) else if FRxQueueSize <> Value then begin FRxQueueSize := Value; Reconfigure; end; end;
procedure TSerial.SetTxQueueSize(Value: Word);
begin if Value = 0 then ReportError(ERROR_INVALID_PARAMETER) else if FTxQueueSize <> Value then begin FTxQueueSize := Value; Reconfigure; end; end;
procedure TSerial.SetFlowMode(Value: eFlowControl);
begin if FFlowMode <> Value then begin FFlowMode := Value; Reconfigure; end; end;
procedure TSerial.SetCheckParity(Value: Boolean);
begin if FCheckParity <> Value then begin FCheckParity := Value; Reconfigure; end; end;
procedure TSerial.SetTimeout(Value: Cardinal);
begin if FTimeout <> Value then begin FTimeout := Value; Reconfigure; end; end;
procedure TSerial.SetRxEventMode(Value: eOpModes);
begin if FRxEventMode <> Value then begin FRxEventMode := Value; FMessage := ''; FMessageState := msNone; end; end;
procedure TSerial.SetActive(Value: Boolean);
begin
  if (csDesigning in ComponentState) or FClosing then Exit;
  if Value then begin if not FActive then OpenPort; end else ClosePort;
end;
procedure TSerial.Reconfigure;
begin if FActive then begin ClosePort; OpenPort; end; end;
function TSerial.Configure: Boolean;
var PortConfig: TDCB; PortTimeouts: TCommTimeouts;
begin
  FillChar(PortConfig, SizeOf(PortConfig), 0); PortConfig.DCBlength := SizeOf(PortConfig);
  PortConfig.BaudRate := FBaudrate; PortConfig.Flags := $0001 or $0010 or $1000;
  if FCheckParity then PortConfig.Flags := PortConfig.Flags or $0002 or $0400;
  case FFlowMode of
    fcRTS_CTS: PortConfig.Flags := (PortConfig.Flags and not $3000) or $2000 or $0004;
    fcDTR_DSR: PortConfig.Flags := (PortConfig.Flags and not $0030) or $0020 or $0008;
    fcXON_XOF: PortConfig.Flags := PortConfig.Flags or $0300;
  end;
  PortConfig.ByteSize := 7 + Ord(FDataBits); PortConfig.Parity := Ord(FParity); PortConfig.StopBits := 2 * Ord(FStopBits);
  PortConfig.XonLim := FRxQueueSize div 3; PortConfig.XoffLim := FRxQueueSize div 3;
  PortConfig.XonChar := #17; PortConfig.XoffChar := #19; PortConfig.ErrorChar := '?';
  Result := SetCommState(FHandle, PortConfig); if not Result then Exit;
  FillChar(PortTimeouts, SizeOf(PortTimeouts), 0); PortTimeouts.ReadIntervalTimeout := DWORD($FFFFFFFF);
  PortTimeouts.WriteTotalTimeoutConstant := FTimeout;
  Result := SetCommTimeouts(FHandle, PortTimeouts);
end;
procedure TSerial.StartMonitor;
begin
  FMonitor := TSerialMonitor.Create(FHandle, FStopEvent, FCommEvent, FWriteEvent, FWindow, FGeneration);
  FMonitor.Resume;
end;
procedure TSerial.OpenPort;
var PortPath: AnsiString; Error: DWORD;
begin
  if FActive or FClosing or (csDesigning in ComponentState) then Exit;
  if FWindow = 0 then FWindow := AllocateHWnd(WndProc);
  PortPath := '\\.\COM' + IntToStr(FPort);
  FHandle := CreateFile(PChar(PortPath), GENERIC_READ or GENERIC_WRITE, 0, nil,
    OPEN_EXISTING, FILE_FLAG_OVERLAPPED, 0);
  if FHandle = INVALID_HANDLE_VALUE then begin ReportError(GetLastError); Exit; end;
  FStopEvent := CreateEvent(nil, True, False, nil);
  FCommEvent := CreateEvent(nil, True, False, nil);
  FReadEvent := CreateEvent(nil, True, False, nil);
  FWriteEvent := CreateEvent(nil, True, False, nil);
  if (FStopEvent = 0) or (FCommEvent = 0) or (FReadEvent = 0) or (FWriteEvent = 0) then begin
    Error := GetLastError; ClosePort; ReportError(Error); Exit;
  end;
  if not SetupComm(FHandle, FRxQueueSize, FTxQueueSize) or not Configure or
     not SetCommMask(FHandle, SerialEventMask) then begin
    Error := GetLastError; ClosePort; ReportError(Error); Exit;
  end;
  FillChar(FReadOverlap, SizeOf(FReadOverlap), 0); FReadOverlap.hEvent := FReadEvent;
  FillChar(FWriteOverlap, SizeOf(FWriteOverlap), 0); FWriteOverlap.hEvent := FWriteEvent;
  FErrorCode := 0; FMessage := ''; FMessageState := msNone;
  if FGeneration = High(Cardinal) then FGeneration := 1 else Inc(FGeneration);
  FActive := True;
  try StartMonitor; except ClosePort; raise; end;
  PostMessage(FWindow, WM_SERIAL_EVENT, FGeneration, EV_TXEMPTY);
end;
procedure TSerial.CancelWrite;
var TransferredBytes: DWORD;
begin
  if FWritePending then begin
    PurgeComm(FHandle, PURGE_TXABORT);
    GetOverlappedResult(FHandle, FWriteOverlap, TransferredBytes, True);
  end;
  FWritePending := False; FWriteNotify := False; FWriteData := '';
  if FWriteEvent <> 0 then ResetEvent(FWriteEvent);
end;
procedure TSerial.ClosePort;
begin
  if FClosing then Exit;
  FClosing := True; FActive := False;
  try
    if FGeneration = High(Cardinal) then FGeneration := 1 else Inc(FGeneration);
    ClearNotifications;
    if Assigned(FMonitor) then begin
      FMonitor.Terminate; SetEvent(FStopEvent); SetCommMask(FHandle, 0);
      FMonitor.WaitFor; FreeAndNil(FMonitor);
    end;
    if FHandle <> INVALID_HANDLE_VALUE then begin
      CancelWrite; PurgeComm(FHandle, PURGE_RXABORT or PURGE_TXABORT);
      CloseHandle(FHandle); FHandle := INVALID_HANDLE_VALUE;
    end;
    ReleaseEvent(FWriteEvent); ReleaseEvent(FReadEvent); ReleaseEvent(FCommEvent); ReleaseEvent(FStopEvent);
    FMessage := ''; FMessageState := msNone;
  finally FClosing := False; end;
end;
function TSerial.GetRxWaiting: Integer;
var QueueStatus: TComStat; CommErrors: DWORD;
begin
  Result := 0; if not FActive then Exit; FillChar(QueueStatus, SizeOf(QueueStatus), 0);
  if ClearCommError(FHandle, CommErrors, @QueueStatus) then Result := QueueStatus.cbInQue else ReportError(GetLastError);
end;
function TSerial.GetTxWaiting: Integer;
var QueueStatus: TComStat; CommErrors: DWORD;
begin
  Result := 0; if not FActive then Exit; FillChar(QueueStatus, SizeOf(QueueStatus), 0);
  if ClearCommError(FHandle, CommErrors, @QueueStatus) then Result := QueueStatus.cbOutQue else ReportError(GetLastError);
end;
function TSerial.ReadBuffer(var Buffer; Count: DWORD): Integer;
var TransferredBytes, Error, WaitResult: DWORD;
begin
  Result := 0; if not RequireActive or (Count = 0) then Exit;
  ResetEvent(FReadEvent); TransferredBytes := 0;
  if not ReadFile(FHandle, Buffer, Count, TransferredBytes, @FReadOverlap) then begin
    Error := GetLastError;
    if Error <> ERROR_IO_PENDING then begin ReportError(Error); Exit; end;
    WaitResult := WaitForSingleObject(FReadEvent, 100);
    if WaitResult <> WAIT_OBJECT_0 then begin
      Error := GetLastError; PurgeComm(FHandle, PURGE_RXABORT);
      GetOverlappedResult(FHandle, FReadOverlap, TransferredBytes, True);
      if WaitResult <> WAIT_TIMEOUT then ReportError(Error);
      Exit;
    end;
    if not GetOverlappedResult(FHandle, FReadOverlap, TransferredBytes, False) then begin ReportError(GetLastError); Exit; end;
  end;
  Result := TransferredBytes;
end;
function TSerial.ReadChar(var ReceivedChar: Char): Integer;
var ReadValue: Char;
begin
  Result := 0; if not RequireActive then Exit; if GetRxWaiting = 0 then Exit;
  Result := ReadBuffer(ReadValue, 1); if Result = 1 then ReceivedChar := ReadValue;
end;
function TSerial.FinishWrite(Wait: Boolean): Boolean;
var TransferredBytes, Error, WaitResult: DWORD; NotifyCompletion: Boolean; ExpectedBytes: Integer;
begin
  Result := True; if not FWritePending then Exit;
  if Wait then WaitResult := WaitForSingleObject(FWriteEvent, WaitTimeout)
  else WaitResult := WaitForSingleObject(FWriteEvent, 0);
  if WaitResult <> WAIT_OBJECT_0 then begin
    Result := False; if not Wait and (WaitResult = WAIT_TIMEOUT) then Exit;
    if WaitResult = WAIT_TIMEOUT then Error := ERROR_SEM_TIMEOUT else Error := GetLastError;
    CancelWrite; ReportError(Error); Exit;
  end;
  if not GetOverlappedResult(FHandle, FWriteOverlap, TransferredBytes, False) then begin
    Error := GetLastError;
    if Error = ERROR_IO_INCOMPLETE then begin Result := False; Exit; end;
    CancelWrite; ReportError(Error); Result := False; Exit;
  end;
  NotifyCompletion := FWriteNotify; ExpectedBytes := Length(FWriteData);
  FWritePending := False; FWriteNotify := False; FWriteData := ''; ResetEvent(FWriteEvent);
  if TransferredBytes <> DWORD(ExpectedBytes) then begin ReportError(ERROR_WRITE_FAULT); Result := False; Exit; end;
  if NotifyCompletion then PostMessage(FWindow, WM_SERIAL_WRITTEN, FGeneration, 0);
end;
procedure TSerial.WriteChar(SendChar: Char);
var SendData: AnsiString;
begin SendData := SendChar; WriteString(SendData); end;
procedure TSerial.WriteString(SendData: AnsiString);
var TransferredBytes, Error, StartedAtTick: DWORD;
begin
  if not RequireActive or (SendData = '') then Exit;
  { One owned asynchronous write buffer; a later write waits for its predecessor. }
  if not FinishWrite(True) or not FActive then Exit;
  if FWaitOnTxFull then begin
    if Length(SendData) > FTxQueueSize then begin ReportError(-2); Exit; end;
    StartedAtTick := GetTickCount;
    while FActive and (GetTxWaiting + Length(SendData) > FTxQueueSize) do begin
      if (FTimeout <> 0) and (DWORD(GetTickCount - StartedAtTick) >= FTimeout) then begin ReportError(ERROR_SEM_TIMEOUT); Exit; end;
      Sleep(1);
    end;
    if not FActive then Exit;
  end;
  FWriteData := SendData; UniqueString(FWriteData); ResetEvent(FWriteEvent); TransferredBytes := 0;
  FWriteNotify := not FWaitTxComplete;
  if WriteFile(FHandle, PChar(FWriteData)^, Length(FWriteData), TransferredBytes, @FWriteOverlap) then begin
    FWriteData := ''; ResetEvent(FWriteEvent);
    if TransferredBytes <> DWORD(Length(SendData)) then begin FWriteNotify := False; ReportError(ERROR_WRITE_FAULT); Exit; end;
    if FWriteNotify then PostMessage(FWindow, WM_SERIAL_WRITTEN, FGeneration, 0);
    FWriteNotify := False;
  end else begin
    Error := GetLastError;
    if Error <> ERROR_IO_PENDING then begin FWriteNotify := False; FWriteData := ''; ReportError(Error); Exit; end;
    FWritePending := True; if FWaitTxComplete then FinishWrite(True);
  end;
end;
procedure TSerial.SetSignal(Signal: eModemOutSignal; State: Boolean);
var ControlFunction: DWORD;
begin
  if not RequireActive then Exit;
  if Signal = msRTS then begin if State then ControlFunction := SETRTS else ControlFunction := CLRRTS; end
  else begin if State then ControlFunction := SETDTR else ControlFunction := CLRDTR; end;
  if not EscapeCommFunction(FHandle, ControlFunction) then ReportError(GetLastError);
end;
function TSerial.FeedMessage(ReceivedChar: Char): Boolean;
begin
  Result := False;
  if FMessageState = msEnded then begin
    FMessage := FMessage + ReceivedChar; Dec(FAppendRemaining);
    if FAppendRemaining = 0 then begin FMessageState := msDone; Result := True; end;
  end else if ReceivedChar = FMessageStartChar then begin FMessage := ReceivedChar; FMessageState := msStarted; end
  else if (ReceivedChar = FMessageEndChar) and (FMessageState = msStarted) then begin
    FMessage := FMessage + ReceivedChar; FAppendRemaining := FMessageAppendCount;
    if FAppendRemaining = 0 then begin FMessageState := msDone; Result := True; end else FMessageState := msEnded;
  end else if FMessageState = msStarted then FMessage := FMessage + ReceivedChar;
end;
procedure TSerial.DispatchEvents(Events: DWORD);
var Signals, DispatchGeneration: DWORD; ReceivedChar: Char; CompletedMessage: AnsiString;
  function SamePort: Boolean;
  begin Result := FActive and (DispatchGeneration = FGeneration); end;
begin
  DispatchGeneration := FGeneration; if not SamePort then Exit;
  FinishWrite(False); if not SamePort then Exit;
  if (Events and (EV_CTS or EV_DSR or EV_RLSD) <> 0) and Assigned(FOnSignalChange) then begin
    if not GetCommModemStatus(FHandle, Signals) then begin ReportError(GetLastError); Exit; end;
    if Events and EV_CTS <> 0 then FOnSignalChange(Self, msCTS, Signals and MS_CTS_ON <> 0);
    if not SamePort then Exit;
    if Events and EV_DSR <> 0 then FOnSignalChange(Self, msDSR, Signals and MS_DSR_ON <> 0);
    if not SamePort then Exit;
    if Events and EV_RLSD <> 0 then FOnSignalChange(Self, msRLSD, Signals and MS_RLSD_ON <> 0);
    if not SamePort then Exit;
  end;
  if (Events and EV_TXEMPTY <> 0) and Assigned(FOnTxEmpty) then FOnTxEmpty(Self);
  if not SamePort then Exit;
  if (Events and EV_BREAK <> 0) and Assigned(FOnBreak) then FOnBreak(Self);
  if not SamePort then Exit;
  if (Events and EV_RING <> 0) and Assigned(FOnRing) then FOnRing(Self);
  if not SamePort or (Events and EV_RXCHAR = 0) then Exit;
  if FRxEventMode = rxNormal then begin
    if (GetRxWaiting > 0) and Assigned(FOnRxData) then FOnRxData(Self);
  end else if Assigned(FOnMessage) then
    while SamePort and (FRxEventMode = rxMessage) and (ReadChar(ReceivedChar) > 0) do
      if FeedMessage(ReceivedChar) then begin CompletedMessage := FMessage; FOnMessage(Self, CompletedMessage); end;
end;
procedure TSerial.ClearNotifications;
begin
  FDeferredHead := 0; FDeferredCount := 0; FPollDeferred := False;
  SetLength(FDeferredMessages, 0);
end;
procedure TSerial.QueueNotification(const Msg: TMessage);
var Capacity: Integer;
begin
  if (Msg.Msg = WM_SERIAL_POLL) and FPollDeferred then Exit;
  if FDeferredHead = FDeferredCount then begin FDeferredHead := 0; FDeferredCount := 0; end;
  if FDeferredCount = Length(FDeferredMessages) then begin
    Capacity := Length(FDeferredMessages) * 2;
    if Capacity < 16 then Capacity := 16;
    SetLength(FDeferredMessages, Capacity);
  end;
  FDeferredMessages[FDeferredCount] := Msg; Inc(FDeferredCount);
  if Msg.Msg = WM_SERIAL_POLL then FPollDeferred := True;
end;
procedure TSerial.WndProc(var Msg: TMessage);
var Error: Integer; Notification: TMessage;
begin
  if (Msg.Msg >= WM_SERIAL_EVENT) and (Msg.Msg <= WM_SERIAL_WRITTEN) then begin
    Msg.Result := 0;
    if not FActive or (Cardinal(Msg.WParam) <> FGeneration) then Exit;
    try
      QueueNotification(Msg);
    except Application.HandleException(Self); Exit; end;
    if FDispatchingEvents then Exit;
    FDispatchingEvents := True;
    try
      while FDeferredHead < FDeferredCount do begin
        Notification := FDeferredMessages[FDeferredHead]; Inc(FDeferredHead);
        if Notification.Msg = WM_SERIAL_POLL then FPollDeferred := False;
        if FActive and (Cardinal(Notification.WParam) = FGeneration) then
          try
            case Notification.Msg of
              WM_SERIAL_EVENT: DispatchEvents(DWORD(Notification.LParam));
              WM_SERIAL_ERROR: begin Error := Notification.LParam; ClosePort; ReportError(Error); end;
              WM_SERIAL_POLL: FinishWrite(False);
              WM_SERIAL_WRITTEN: if Assigned(FOnWriteCompleted) then FOnWriteCompleted;
            end;
          except Application.HandleException(Self); end;
      end;
    finally
      ClearNotifications; FDispatchingEvents := False;
    end;
  end else Msg.Result := DefWindowProc(FWindow, Msg.Msg, Msg.WParam, Msg.LParam);
end;
procedure TSerial.AbortReceive;
begin
  { MicroBrn aborts read but does not clear queue }
  if RequireActive then
    if not PurgeComm(FHandle, PURGE_RXABORT) then ReportError(GetLastError);
end;
procedure TSerial.SetControlLine(Selector: Byte; State: Boolean);
begin if Selector > 1 then ReportError(ERROR_INVALID_PARAMETER) else SetSignal(eModemOutSignal(Selector), State); end;
procedure Serial2_SendByte(Serial: TSerial; Value: Byte);
begin Serial.WriteChar(Chr(Value)); end;
procedure Serial2_SendBytes(Serial: TSerial; Data: AnsiString);
begin Serial.WriteString(Data); end;
function Serial2_ReadByte(Serial: TSerial; var Value: Char): Integer;
begin Result := Serial.ReadChar(Value); end;
procedure Serial2_AbortReceive(Serial: TSerial);
begin Serial.AbortReceive; end;
procedure Serial2_SetControlLine(Serial: TSerial; Selector: Byte; State: Boolean);
begin Serial.SetControlLine(Selector, State); end;
initialization
  RegisterClass(TSerial);
finalization
  UnRegisterClass(TSerial);
end.
