unit TMCLDemoMain;
(*
  This software it provided "as is", without any warranty. It may be copied freely.
  It is provided to show how TMCL commands can be sent to a module using the RS232 or
  RS485 port with Delphi.

  The "Async32" component is needed to compile this program.
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Math,
  Dialogs, StdCtrls, Spin, async32, ExtCtrls, ComCtrls, Buttons, uComNames, StrUtils, uHelp, uFormFeile,
  Mask, Grids, Menus, JvExControls, JvChart, MPlayer, JvSwitch;

type
  TFormMain = class(TForm)
    Comm32: TComm32;
    GrpInterface: TGroupBox;
    BtnOpen: TButton;
    CbCOM: TComboBox;
    BtnClose: TButton;
    GrpTMCL: TGroupBox;
    GrpReply: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    StaticHostAddr: TStaticText;
    StaticModAddr: TStaticText;
    StaticStatus: TStaticText;
    StaticValue: TStaticText;
    Label5: TLabel;
    StaticCmd: TStaticText;
    leftSpin: TSpinEdit;
    counter: TStaticText;
    Label8: TLabel;
    rightSpin: TSpinEdit;
    lblLinks: TLabel;
    lblRechts: TLabel;
    speed: TSpinEdit;
    Label11: TLabel;
    startButton: TButton;
    Stop: TButton;
    Label12: TLabel;
    GroupBox1: TGroupBox;
    SK6: TCheckBox;
    SK5: TCheckBox;
    Button3: TButton;
    GroupBox7: TGroupBox;
    Label14: TLabel;
    TrackBar2: TTrackBar;
    GroupBox9: TGroupBox;
    Label16: TLabel;
    ProgressBar2: TProgressBar;
    Timer3: TTimer;
    GroupBox2: TGroupBox;
    ResetButton: TButton;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    cbxFeile: TComboBox;
    Label13: TLabel;
    btnFeileLaden: TButton;
    btnFeileBearbeiten: TButton;
    OpenDlgFeile: TOpenDialog;
    btnFeileNeu: TButton;
    Label15: TLabel;
    Label17: TLabel;
    cbxISO: TComboBox;
    medtLaenge: TMaskEdit;
    sgdDaten: TStringGrid;
    MainMenu1: TMainMenu;
    Daten1: TMenuItem;
    ffnen1: TMenuItem;
    mmDatenSpeichern: TMenuItem;
    Spe1: TMenuItem;
    Programmbeenden1: TMenuItem;
    stxtMW: TStaticText;
    lblMittelwert: TLabel;
    tmrMessung: TTimer;
    btnWerteSpeichern: TButton;
    OpenDlgDaten: TOpenDialog;
    SaveDlgDaten: TSaveDialog;
    stxtMSteps: TStaticText;
    stxtVelocity: TStaticText;
    medtKraft: TMaskEdit;
    lblKraft: TLabel;
    spinSteri: TSpinEdit;
    lblSteri: TLabel;
    Memo1: TMemo;
    sedtGrenzwert: TSpinEdit;
    lblGrenzwert: TLabel;
    Image1: TImage;
    stxtPosition: TStaticText;
    lblPosition: TLabel;
    Label10: TLabel;
    Label18: TLabel;
    JvChart1: TJvChart;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    cbxRechts: TCheckBox;
    cbxLinks: TCheckBox;
    MediaPlayer1: TMediaPlayer;
    Panel3: TPanel;
    sgdDetails: TStringGrid;
    Label9: TLabel;
    StaticDefault: TStaticText;
    Label19: TLabel;
    sgdTMCL: TStringGrid;
    btnLaser: TButton;
    medtWinkel: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label20: TLabel;
    medtTiefe: TMaskEdit;
    medtTemperatur: TMaskEdit;
    Label21: TLabel;
    cbxWarnton: TCheckBox;
    Button1: TButton;
    SaveDlgDetails: TSaveDialog;
    test_CheckBox: TCheckBox;


    procedure BtnOpenClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure Comm32RxChar(Sender: TObject; Count: Integer);
    procedure ResetButtonClick(Sender: TObject);
    procedure startButtonClick(Sender: TObject);
    procedure PositionClick(Sender: TObject);
    procedure StopClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLaserClick(Sender: TObject);
    procedure btnFeileBearbeitenClick(Sender: TObject);
    procedure btnFeileLadenClick(Sender: TObject);
    procedure btnFeileNeuClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tmrMessungTimer(Sender: TObject);
    procedure btnWerteSpeichernClick(Sender: TObject);
    procedure sgdDatenDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure mmDatenSpeichernClick(Sender: TObject);
    procedure Programmbeenden1Click(Sender: TObject);
    procedure ffnen1Click(Sender: TObject);
    procedure Spe1Click(Sender: TObject);
    procedure cbxRechtsClick(Sender: TObject);
    procedure cbxLinksClick(Sender: TObject);
    procedure btnLaserAusClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);


  public
    TMCLReply: array[0..8] of byte;
    Messgrenze: integer;
    Mittelwert: array[0..9] of integer;
    ReplyReady: boolean;
    angle: integer;
    running: boolean;
    timed:boolean;
    count : Integer;
    n:longint;
    DisableOtherFunctionCall,xxx:boolean;
    DatenFileName: TFileName;
    function SendTMCLAndWait(Addr:byte; Cmd:byte; TMCLType: byte; TMCLMotor:byte;
                Value: integer; Wait: boolean):boolean;
    function SendTMCLWaitResponse(Addr:byte; Cmd:byte; TMCLType: byte; TMCLMotor:byte;
                Value: integer; Wait: boolean): Integer;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}
function OpenDevice(CardAddress: Longint): Longint; stdcall; external 'K8055d.dll';
procedure CloseDevice; stdcall; external 'K8055d.dll';
function ReadAnalogChannel(Channel: Longint):Longint; stdcall; external 'K8055d.dll';
procedure ReadAllAnalog(var Data1, Data2: Longint); stdcall; external 'K8055d.dll';
procedure OutputAnalogChannel(Channel: Longint; Data: Longint); stdcall; external 'K8055d.dll';
procedure OutputAllAnalog(Data1: Longint; Data2: Longint); stdcall; external 'K8055d.dll';
procedure ClearAnalogChannel(Channel: Longint); stdcall; external 'K8055d.dll';
procedure ClearAllAnalog; stdcall; external 'K8055d.dll';
procedure SetAnalogChannel(Channel: Longint); stdcall; external 'K8055d.dll';
procedure SetAllAnalog; stdcall; external 'K8055d.dll';
procedure WriteAllDigital(Data: Longint);stdcall;  external 'K8055d.dll';
procedure ClearDigitalChannel(Channel: Longint); stdcall; external 'K8055d.dll';
procedure ClearAllDigital; stdcall; external 'K8055d.dll';
procedure SetDigitalChannel(Channel: Longint); stdcall; external 'K8055d.dll';
procedure SetAllDigital; stdcall; external 'K8055d.dll';
function ReadDigitalChannel(Channel: Longint): Boolean; stdcall; external 'K8055d.dll';
function ReadAllDigital: Longint; stdcall; external 'K8055d.dll';
function ReadCounter(CounterNr: Longint): Longint; stdcall; external 'K8055d.dll';
procedure ResetCounter(CounterNr: Longint); stdcall; external 'K8055d.dll';
procedure SetCounterDebounceTime(CounterNr, DebounceTime:Longint); stdcall; external 'K8055d.dll';
//Send a TMCL command
//Parameters: Addr: Address of the module
//            Cmd: TMCL command code
//            TMCLType: "Type" field of the TMCL command
//            TMCLMotor: Motor number
//            Value: "Value" field of the command
//            Wait: When TRUE: Wait until a valid TMCL answer has arrived (with timeout)
function TFormMain.SendTMCLAndWait(Addr:byte; Cmd:byte; TMCLType: byte; TMCLMotor:byte;
            Value: integer; Wait: boolean): boolean;
var
  TxData: array[0..8] of byte;
  i: integer;
  t1: cardinal;
begin
  ReplyReady:=false;

  //Prepare the data
  TxData[0]:=Addr;
  TxData[1]:=Cmd;
  TxData[2]:=TMCLType;
  TxData[3]:=TMCLMotor;
  TxData[4]:=Value shr 24;
  TxData[5]:=Value shr 16;
  TxData[6]:=Value shr 8;
  TxData[7]:=Value and $ff;

  //Calculate the checksum
  TxData[8]:=0;
  for i:=0 to 7 do TxData[8]:=TxData[8]+TxData[i];

  //Wait until everything has been sent before putting the next data into the
  //transmit buffer (it seems that else unsent data sometimes gets overwritten
  // -- maybe an error in the "Async32" component or a problem in some Windows versions).
  repeat until Comm32.OutQueCount=0;
  Comm32.PurgeIn;
  Comm32.Write(TxData, 9);  //Send the command

  //Wait for reply from the module (1.2sec timeout)
  if Wait then
  begin
    t1:=GetTickCount;
    repeat
      Application.ProcessMessages;
    until ReplyReady or (Abs(GetTickCount-t1)>1200);
    Result:=ReplyReady;
  end else Result:=true;
end;


function TFormMain.SendTMCLWaitResponse(Addr:byte; Cmd:byte; TMCLType: byte; TMCLMotor:byte;
            Value: integer; Wait: boolean): Integer;
var
  TxData: array[0..8] of byte;
  i: integer;
  t1: cardinal;
begin
  ReplyReady:=false;

  //Prepare the data
  TxData[0]:=Addr;
  TxData[1]:=Cmd;
  TxData[2]:=TMCLType;
  TxData[3]:=TMCLMotor;
  TxData[4]:=Value shr 24;
  TxData[5]:=Value shr 16;
  TxData[6]:=Value shr 8;
  TxData[7]:=Value and $ff;

  //Calculate the checksum
  TxData[8]:=0;
  for i:=0 to 7 do TxData[8]:=TxData[8]+TxData[i];

  //Wait until everything has been sent before putting the next data into the
  //transmit buffer (it seems that else unsent data sometimes gets overwritten
  // -- maybe an error in the "Async32" component or a problem in some Windows versions).
  repeat until Comm32.OutQueCount=0;
  Comm32.PurgeIn;
  Comm32.Write(TxData, 9);  //Send the command

  //Wait for reply from the module (1.2sec timeout)
  if Wait then
  begin
    t1:=GetTickCount;
    repeat
      Application.ProcessMessages;
    until ReplyReady or (Abs(GetTickCount-t1)>1200);
    Result:=-1;
  end else Result:=TxData[7];
end;

//Event that is triggered when bytes are received by the COM port.
procedure TFormMain.Comm32RxChar(Sender: TObject; Count: Integer);
begin
  if Count>=9 then //A valid answer always consists of 9 bytes
  begin
    Comm32.Read(TMCLReply, 9);
    ReplyReady:=true;

    StaticHostAddr.Caption:=IntToStr(TMCLReply[0]);
    StaticModAddr.Caption:=IntToStr(TMCLReply[1]);
    StaticStatus.Caption:=IntToStr(TMCLReply[2]);
    StaticCmd.Caption:=IntToStr(TMCLReply[3]);
    // In StaticDefault kommt der aktuelle Wert des aufgerufenen Commands
    StaticDefault.Caption:=IntToStr((TMCLReply[4] shl 24) or (TMCLReply[5] shl 16) or (TMCLReply[6] shl 8)
                           or TMCLReply[7]);
    // In StaticValue kommen nur noch die Werte f�r die Position, damit es bei der Berechnung der Durchl�ufe keine Fehler gibt.
    if (TMCLReply[3] = 6) then
        StaticValue.Caption:=IntToStr((TMCLReply[4] shl 24) or (TMCLReply[5] shl 16) or (TMCLReply[6] shl 8)
                           or TMCLReply[7]);

    if ((TMCLReply[3] > 0) AND (TMCLReply[3] < 10)) then
      sgdTMCL.Cells[1,TMCLReply[3]] := IntToStr((TMCLReply[4] shl 24) or (TMCLReply[5] shl 16) or (TMCLReply[6] shl 8)
                                            or TMCLReply[7]);
  end;
end;

//Button "Open"
procedure TFormMain.BtnOpenClick(Sender: TObject);
begin

  // Simulate connetion to COM Port
  if test_CheckBox.Checked then
    begin
      startButton.Enabled := TRUE;
      BtnOpen.Enabled:=false;
      CbCOM.Enabled:=false;
      BtnClose.Enabled:=true;
      exit;
    end;

  //Select and open the COM port. It is important that the "FlowControl" field of the
  //Comm32 object is set to "fcNone" (using the object inspector) or fcRTSToggle
  //when RS485 is used.
  //Sending and receiving might not work if the flow control is set to any other option.
  Comm32.DeviceName:=TrimRight(LeftStr(CbCOM.Text,Pos('|',CbCOM.Text)-1));
  Comm32.Open;
  if Comm32.Enabled then    
  begin
    BtnOpen.Enabled:=false;
    CbCOM.Enabled:=false;
    BtnClose.Enabled:=true;


     SendTMCLWaitResponse(1,6,4,0,0,true);
     SendTMCLAndWait(1,5,140,0,4,true);
     SendTMCLWaitResponse(1,6,154,0,0,true);
     speed.Value :=(TMCLReply[4] shl 24) or (TMCLReply[5] shl 16) or (TMCLReply[6] shl 8)
                           or TMCLReply[7];

     startButton.Enabled := TRUE;
  end else MessageDlg('Could not open port '+CbCOM.Text+'!', mtError, [mbOK], 0);
end;

//Button "Close"
procedure TFormMain.BtnCloseClick(Sender: TObject);
begin
  Comm32.Close;
  BtnClose.Enabled:=false;
  BtnOpen.Enabled:=true;
  CbCOM.Enabled:=true;

  startButton.Enabled := FALSE;
end;


procedure TFormMain.ResetButtonClick(Sender: TObject);
begin
  count := 0;
  counter.Caption := inttostr(count);
end;


// WICHTIGSTE PROCEDURE, Start des Motors je Auswahl
procedure TFormMain.startButtonClick(Sender: TObject);

var
  direction,i : Integer;
  velocity,pulse_div,microsteps,pos_rechts,pos_links: integer;
  richtung,first: boolean;
  richtung_int: integer;
  fehler: boolean;
  Data1, Data2: longint;

  begin

  startButton.Enabled := FALSE;

  // Die Variabel fehler gibt an, ob ein Fehler passiert ist. Falls sie TRUE wird, soll der Motor stoppen.
  fehler := FALSE;

  // Zuerst muss der Motor auf die absolute Nullposition gefahren werden
  // PopUp mit Warnung, dass die Feile noch nicht eingespannt sein darf!
  if MessageDlg('Spannbacken l�sen! Feile darf nicht klemmen!', mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
    begin
       startButton.Enabled := TRUE;
       exit;
      //fehler := TRUE;
    end;

  // Auf Position 0 fahren (wenn fehler=FALSE)
  // if not fehler then
  // Geschwindigkeit f�r die Fahrt auf ABS POS 0
    if not SendTMCLAndWait(1, 5, 4, 0, 2047, true)
      then MessageDlg('No reply from the module!', mtError, [mbOK], 0);
  // Fahrt auf ABS POS 0
    if not SendTMCLAndWait(1, 4, 0, 0, 0, true)
      then MessageDlg('No reply from the module!', mtError, [mbOK], 0);

  // Hinweis die Feile jetzt einzuspannen
  if MessageDlg('Feile jetzt einspannen!', mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
    begin
      startButton.Enabled := TRUE;
      exit;

  end;

  // Hinweis, falls Data2 = 0 und damit kein Kontakt/Strom
  ReadAllAnalog(Data1,Data2);
  if ((Data2 <= sedtGrenzwert.Value)) then
    begin
     MessageDlg('Messwert f�r Feilenspannung unter Grenzwert. Bitte Kontakte pr�fen!', mtError, [mbOK], 0);
     //MessageDlg('Messwert f�r Feilenspannung unter Grenzwert. Bitte Kontakte pr�fen!', mtConfirmation, [mbOK, mbCancel], 0) = mrOK);
     fehler := true;
     startButton.Enabled := TRUE;
     exit;
    end;


  //  Hinweis, dass der Versuch beginnt
  if MessageDlg('Es geht los!', mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
    begin
      startButton.Enabled := TRUE;
      exit;
  end;

    // Wenn bis hier kein Fehler passiert ist, Start anbieten
  if not fehler then
  begin

  // Alte Messungen aus der Tabelle l�schen? BUG
  if MessageDlg('Alte Details l�schen?', mtConfirmation, [mbOK, mbCancel], 0) = mrOK then
    begin
      for i := 0 to sgdDetails.RowCount - 1 do
        sgdDetails.Rows[i].Clear;
    sgdDetails.RowCount := 0;
    end;


  richtung := true;
  first := FALSE;   // FALSE = erster Durchlauf, true=alle weiteren Durchl�ufe
  richtung_int := 1;  // richtung_int bestimmt sp�ter die Laufrichtung des Motors und geht als Faktor in MVP-Position ein.
  count := 0; // Anzahl der bisherigen Umdrehungen
  microsteps := 3200; // Microsteps festlegen
  pos_rechts := round(microsteps * rightSpin.Value / 360); // Zielposition rechts
  pos_links := round(microsteps * leftSpin.Value / 360);  //Zielposition links
  direction := 1;
  pulse_div := 3;
  // Geschwindigkeitsberechnung, um Umdrehungen pro Minute in die TMCL Velocity umzurechnen (laut Formel aus Handbuch S. 20 (PD-140-42-SE_manual.pdf))
  velocity := round((speed.Value/60)*(microsteps*power(2,pulse_div)*2048*32/16000000));
  // Velocity in der Maske anzeigen
  stxtVelocity.Caption := inttostr(velocity);
  // Geschwindigkeit f�r die Fahrt festlegen
  // Cmd 5 = Set Axis Parameter; Type 4 = maximum positioning speed;
  SendTMCLAndWait(1, 5, 4, 0, velocity, true);
  running := true;
  tmrMessung.Enabled := true;


  if cbxRechts.Checked then
    //Dauerlauf rechts
    begin
      if not SendTMCLAndWait(1, 2, 0, 0, velocity, true)
        then MessageDlg('No reply from the module!', mtError, [mbOK], 0);
      repeat
        Application.ProcessMessages;
        SendTMCLWaitResponse(1, 6, 1, 0, 0, true);
        stxtPosition.Caption := inttostr(round(0.1125*strtoint(StaticValue.Caption)));
        count := -round(strtoint(stxtPosition.Caption) / 360);
        counter.Caption := inttostr(count);
      until running = FALSE;
    end
  else if cbxLinks.Checked then
    // Dauerlauf links
    begin
      if not SendTMCLAndWait(1, 1, 0, 0, velocity, true)
        then MessageDlg('No reply from the module!', mtError, [mbOK], 0);
      repeat
        Application.ProcessMessages;
        SendTMCLWaitResponse(1, 6, 1, 0, 0, true);
        stxtPosition.Caption := inttostr(round(0.1125*strtoint(StaticValue.Caption)));
        count := round(strtoint(stxtPosition.Caption) / 360);
        counter.Caption := inttostr(count);
      until running = FALSE;
    end
  else if ((cbxLinks.Checked = FALSE) AND (cbxRechts.Checked = FALSE)) then
    begin
      repeat
        if richtung then richtung_int := 1 else richtung_int := -1;
        // Cmd 4 = MoveToPosition (MVP); Type 1 = REL; Neue Zielposition zuweisen
        SendTMCLAndWait(1, 4, 1, 0, richtung_int*(pos_rechts - ord(first)*pos_links), false);
        repeat
            Application.ProcessMessages;
            // Cmd 6 = Get Axis Parameter, werden in die StaticValue.Caption geschrieben
            SendTMCLWaitResponse(1, 6, 1, 0, 0, true);
            // StaticValue auslesen und in �bersichtsmaske (stxtPosition) einblenden
            stxtPosition.Caption := inttostr(round(0.1125*strtoint(StaticValue.Caption)));
            // Cmd 6 = Get Axis Parameter; Type 8 = target pos. reached
            SendTMCLAndWait(1, 6, 8, 0, 0, true);
            // StaticValue auslesen, bei 1 ist die Zielposition erreicht, sonst weiterfahren
            // running ist false, wenn keine Strom mehr �ber die Feile flie�t
        until (strtoint(StaticDefault.Caption)=1) or (running=false);
        first := true;
        richtung := not richtung;
        count:= count+1;
        counter.Caption := inttostr(count);
      until running = false;
    end;

  //Maschinen auf jeden Fall stoppen, KONTROLLE warum nicht in der Schleife steht aus!!!
  running := FALSE;
  if not SendTMCLAndWait(1, 3, 0, 0, 0, true)
    then MessageDlg('No reply from the module!', mtError, [mbOK], 0);

  MediaPlayer1.Open;
  //MediaPlayer1.Wait := true;
  MediaPlayer1.Play;
  MediaPlayer1.Close;
  // WriteAllDigital schaltet den Output auf 1 = Output 1; 2 = Output 2; 4 = Output 3; 8 = Output 4; 16 = Output 5 (ggf addieren)...
  if cbxWarnton.Checked then
    if not DisableOtherFunctionCall then WriteAllDigital(4);
  MessageDlg('Feile gebrochen nach '+inttostr(count)+ ' Durchl�ufen.', mtError, [mbOK], 0);
  if TRUE then
    begin
      // Nach dem Best�tigen des OK Buttons Alarmton ausschalten
      if not DisableOtherFunctionCall then WriteAllDigital(0);
      sgdDaten.Cells[0,sgdDaten.RowCount-1] := cbxFeile.Text;
      sgdDaten.Cells[1,sgdDaten.RowCount-1] := cbxISO.Text;
      sgdDaten.Cells[2,sgdDaten.RowCount-1] := medtLaenge.Text;
      sgdDaten.Cells[3,sgdDaten.RowCount-1] := medtKraft.Text;
      sgdDaten.Cells[4,sgdDaten.RowCount-1] := inttostr(count);
      sgdDaten.Cells[5,sgdDaten.RowCount-1] := speed.Text;
      sgdDaten.Cells[6,sgdDaten.RowCount-1] := medtWinkel.Text;
      sgdDaten.Cells[7,sgdDaten.RowCount-1] := spinSteri.Text;
      sgdDaten.Cells[8,sgdDaten.RowCount-1] := stxtPosition.Caption;
      sgdDaten.Cells[9,sgdDaten.RowCount-1] := inttostr(rightSpin.Value);
      sgdDaten.Cells[10,sgdDaten.RowCount-1] := inttostr(leftSpin.Value);
      // Spalte 11 siehe weiter unten
      sgdDaten.Cells[12,sgdDaten.RowCount-1] := DateToStr(Date);
      sgdDaten.Cells[13,sgdDaten.RowCount-1] := TimeToStr(Time);
      sgdDaten.Cells[14,sgdDaten.RowCount-1] := medtTemperatur.Text;
      sgdDaten.Cells[15,sgdDaten.RowCount-1] := medtTiefe.Text;
      //Je Nnach Auswahl den Modus eintragen
      if cbxRechts.Checked then
        sgdDaten.Cells[11,sgdDaten.RowCount-1] := '1'
      else if cbxLinks.Checked then
        sgdDaten.Cells[11,sgdDaten.RowCount-1] := '0'
      else
        sgdDaten.Cells[11,sgdDaten.RowCount-1] := '2';

      sgdDaten.RowCount := sgdDaten.RowCount + 1;
    end;
  end;
  startButton.Enabled := TRUE;

end;

procedure TFormMain.PositionClick(Sender: TObject);
begin
     begin
      if not SendTMCLAndWait(1, 6, 1, 0, 0, true)
    then MessageDlg('No reply from the module!', mtError, [mbOK], 0);
end;
end;

procedure TFormMain.StopClick(Sender: TObject);
begin
  running := FALSE;
  if not SendTMCLAndWait(1, 3, 0, 0, 0, true)
    then MessageDlg('No reply from the module!', mtError, [mbOK], 0);
end;

procedure TFormMain.Button3Click(Sender: TObject);
var h,CardAddr:longint;
begin
  CardAddr:= 3-(integer(sk5.Checked) + integer(sk6.Checked) * 2);
  h:= OpenDevice(CardAddr);
  case h of
    0..3: begin
            label12.caption:='Card '+ inttostr(h)+' connected';
            if not DisableOtherFunctionCall then OutputAnalogChannel(2,255-TrackBar2.position);
            Label14.caption:=inttostr(255-TrackBar2.position);
          end;
    -1: label12.caption:='Card '+ inttostr(CardAddr)+' not found';
  end;
end;

procedure TFormMain.TrackBar2Change(Sender: TObject);
begin
  if not DisableOtherFunctionCall then OutputAnalogChannel(2,255-TrackBar2.position);
  Label14.caption:=inttostr(255-TrackBar2.position);
end;

procedure TFormMain.Timer3Timer(Sender: TObject);
var i, Data1, Data2: longint;
begin
  timer3.enabled:=false;
  ReadAllAnalog(Data1,Data2);
  ProgressBar2.Position:=Data2;
  Label16.caption:=inttostr(Data2);
  timer3.enabled:=true;
end;



procedure TFormMain.FormCreate(Sender: TObject);
var
  i: integer;
begin
  DoubleBuffered:=True;
  CbCOM.Items := GetComNames;
  CbCOM.ItemIndex := 0;
  //�berschriften der Tabelle erstellen
  sgdDaten.Cells[0,0] := 'Feile';
  sgdDaten.Cells[1,0] := 'ISO';
  sgdDaten.Cells[2,0] := 'L�nge';
  sgdDaten.Cells[3,0] := 'Zugraft';
  sgdDaten.Cells[4,0] := 'Umdrehungen';
  sgdDaten.Cells[5,0] := 'Geschwindigkeit';
  sgdDaten.Cells[6,0] := 'Abscherwinkel';
  sgdDaten.Cells[7,0] := 'Sterilisationen';
  sgdDaten.Cells[8,0] := 'Bruchposition';
  sgdDaten.Cells[9,0] := 'EndpunktRechts';
  sgdDaten.Cells[10,0] := 'EndpunktLinks';
  sgdDaten.Cells[11,0] := 'Laufmodus';
  sgdDaten.Cells[12,0] := 'Datum';
  sgdDaten.Cells[13,0] := 'Uhrzeit';
  sgdDaten.Cells[14,0] := 'Temperatur';
  sgdDaten.Cells[15,0] := 'Einspanntiefe';

  sgdDetails.Cells[0,0] := 'Time';
  sgdDetails.Cells[1,0] := 'GW';
  sgdDetails.Cells[2,0] := 'count';
  sgdDetails.Cells[3,0] := 'MW';
  sgdDetails.Cells[4,0] := 'Data2';
  sgdDetails.Cells[5,0] := 'Pos';
  sgdDetails.Cells[6,0] := 'run';

  sgdTMCL.Cells[0,0] := 'Cmd';
  sgdTMCL.Cells[1,0] := 'Value';

  sgdTMCL.RowCount := 15;
  for i := 1 to 14 do
    sgdTMCL.Cells[0,i] := inttostr(i);

  startButton.Enabled := FALSE;

  Messgrenze := 50;
  for i := 0 to 9 do
    Mittelwert[i] := Messgrenze;
end;

procedure TFormMain.btnLaserClick(Sender: TObject);
begin
  if (btnLaser.Caption = 'LASER an') then
    begin
    // WriteAllDigital schaltet den Output auf 1 = Output 1; 2 = Output 2; 4 = Output 3; 8 = Output 4; 16 = Output 5 (ggf addieren)...
    if not DisableOtherFunctionCall then WriteAllDigital(2);
    btnLaser.Caption := 'LASER aus';
    end
  else
    begin
    // WriteAllDigital schaltet den Output auf 1 = Output 1; 2 = Output 2; 4 = Output 3; 8 = Output 4; 16 = Output 5 (ggf addieren)...
    if not DisableOtherFunctionCall then WriteAllDigital(0);
    btnLaser.Caption := 'LASER an';
    end;
end;

procedure TFormMain.btnFeileBearbeitenClick(Sender: TObject);
begin
  FormFeile.ShowModal;
  cbxFeile.Items.LoadFromFile(FileName);
  cbxFeile.ItemIndex := 0;
end;

procedure TFormMain.btnFeileLadenClick(Sender: TObject);
begin
  If OpenDlgFeile.Execute Then
    Begin
    FileName := OpenDlgFeile.FileName;
    cbxFeile.Items.LoadFromFile(FileName);
    FormFeile.mmFeile.Lines.LoadFromFile(FileName);
    FormFeile.SaveDlgFeile.FileName := FileName;
    cbxFeile.ItemIndex := 0;
    FeileNeu := false;
    btnFeileBearbeiten.Enabled := true;
    cbxFeile.Enabled := true;
    End;
end;

procedure TFormMain.btnFeileNeuClick(Sender: TObject);
begin
  FeileNeu := true;
  FormFeile.mmFeile.Lines.Clear;
  FormFeile.ShowModal;
  btnFeileBearbeiten.Enabled := true;
  //ABFANGEN: Neu angeklickt, aber nicht gespeichert!!!
  cbxFeile.Items.LoadFromFile(FileName);
  cbxFeile.ItemIndex := 0;
  cbxFeile.Enabled := true;
end;

procedure TFormMain.FormResize(Sender: TObject);
var
  SpaltenBreite: integer;
begin
  SpaltenBreite := Floor((sgdDaten.Width-16)/9)-1;
  sgdDaten.DefaultColWidth := SpaltenBreite;
  sgdDaten.ColWidths[0] := 3 * SpaltenBreite - 80;
  sgdDaten.ColWidths[1] := 30;
  sgdDaten.ColWidths[2] := 50;
  SpaltenBreite := Floor((sgdDetails.Width-16)/7);
  sgdDetails.DefaultColWidth := SpaltenBreite;

  //sgdTMCL.Top := StaticDefault.Top + StaticDefault.Height + 5;
  SpaltenBreite := Floor((sgdTMCL.Width)/2);
  sgdTMCL.DefaultColWidth := SpaltenBreite;
end;

procedure TFormMain.tmrMessungTimer(Sender: TObject);
var
  i, Data1, Data2, MW: longint;
  canwidth, canheight, r, j, zeilenzahl: integer;
begin
  tmrMessung.enabled:=false;
  ReadAllAnalog(Data1,Data2);

  //SendTMCLAndWait(1, 6, 8, 0, EditPosition.Value, true)

  MW := 0;

  for i := 0 to 8 do
    begin
    Mittelwert[i+1] := Mittelwert[i];
    MW :=  MW + Mittelwert[i+1];
    end;

  Mittelwert[0] := Data2;
  MW := MW+Data2;
  MW := Floor(MW/10);

  // Data2 auswerten oder MW - Spannung am Analogen Eingang 2
  if (MW >= sedtGrenzwert.Value) and running then
      begin
        running := true;
        tmrMessung.enabled:=true;
      end
    else
      begin
        running := false;
        if not SendTMCLAndWait(1, 3, 0, 0, 0, true)
          then MessageDlg('No reply from the module!', mtError, [mbOK], 0);
      end;

  // tempor�r zur Nachverfolgung der Mittelwerte   + ';' + inttostr(SendTMCLWaitResponse(1,6,1,0,0,true))
  //Memo1.Lines.Add(inttostr(DateTimeToTimeStamp(Now()).Time) + ';' + inttostr(sedtGrenzwert.Value) + ';' + inttostr(count) + ';' + inttostr(MW) + ';' + inttostr(Data2) + ';' + stxtPosition.Caption + ';' + booltostr(running));

  sgdDetails.Cells[0,sgdDetails.RowCount-1] := inttostr(DateTimeToTimeStamp(Now()).Time);
  sgdDetails.Cells[1,sgdDetails.RowCount-1] := inttostr(sedtGrenzwert.Value);
  sgdDetails.Cells[2,sgdDetails.RowCount-1] := inttostr(count);
  sgdDetails.Cells[3,sgdDetails.RowCount-1] := inttostr(MW);
  sgdDetails.Cells[4,sgdDetails.RowCount-1] := inttostr(Data2);
  sgdDetails.Cells[5,sgdDetails.RowCount-1] := stxtPosition.Caption;
  sgdDetails.Cells[6,sgdDetails.RowCount-1] := booltostr(running);
  sgdDetails.RowCount := sgdDetails.RowCount + 1;

  zeilenzahl := sgdDetails.Height div sgdDetails.DefaultRowHeight;
  if sgdDetails.RowCount > zeilenzahl then
      sgdDetails.TopRow := sgdDetails.RowCount - zeilenzahl;

canwidth := Image1.Width;
canheight := Image1.Height;
r := 3;
Image1.Picture := nil;
j := strtoint(stxtPosition.Caption);
With Image1.Canvas do
      Begin
        MoveTo(round(canwidth/2),round(canheight/2));
        //pen.color:=clnavy;
        LineTo(round(canwidth/2+(canwidth/2-5)*-sin(DegToRad(j))),round(canheight/2+(canheight/2-5)*-cos(DegToRad(j))));
        //pen.color:=clwhite;
        //Brush.Color:=clwhite;
        //Ellipse(round(canwidth/2+(canwidth/2-5)*cos(DegToRad(i-1)))-r,round(canheight/2+(canheight/2-5)*sin(DegToRad(i-1)))-r,round(canwidth/2+(canwidth/2-5)*cos(DegToRad(i-1)))+r,round(canheight/2+(canheight/2-5)*sin(DegToRad(i-1)))+r);
        pen.color:=clblack;
        Brush.Color:=clred;
        //Ellipse(round(canwidth/2+(canwidth/2-5)*cos(DegToRad(j)))-r,round(canheight/2+(canheight/2-5)*sin(DegToRad(j)))-r,round(canwidth/2+(canwidth/2-5)*cos(DegToRad(j)))+r,round(canheight/2+(canheight/2-5)*sin(DegToRad(j)))+r);
      end;
  //StaticText2.Caption := inttostr(round(50+45*cos(DegToRad(i))));
  //StaticText1.Caption := inttostr(round(50+45*sin(DegToRad(i))));
  //StaticText3.Caption := inttostr(i);
  //inc(i);

  stxtMW.Caption := inttostr(MW);
  //tmrMessung.enabled:=true;

end;

procedure TFormMain.btnWerteSpeichernClick(Sender: TObject);
begin
  sgdDaten.Cells[0,sgdDaten.RowCount-1] := cbxFeile.Text;
  sgdDaten.Cells[1,sgdDaten.RowCount-1] := cbxISO.Text;
  sgdDaten.Cells[2,sgdDaten.RowCount-1] := medtLaenge.Text;
  sgdDaten.Cells[3,sgdDaten.RowCount-1] := medtKraft.Text;
  sgdDaten.Cells[4,sgdDaten.RowCount-1] := inttostr(count);
  sgdDaten.Cells[5,sgdDaten.RowCount-1] := speed.Text;
  sgdDaten.Cells[6,sgdDaten.RowCount-1] := medtWinkel.Text;

  sgdDaten.Cells[7,sgdDaten.RowCount-1] := spinSteri.Text;
  sgdDaten.RowCount := sgdDaten.RowCount + 1;
end;

procedure TFormMain.sgdDatenDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  ShowScrollBar(sgdDaten.Handle, SB_VERT, True);
end;

procedure TFormMain.mmDatenSpeichernClick(Sender: TObject);
var
  F: TStringList;
  i: Integer;
begin
  F := TStringList.Create;
  try
    F.Add(IntToStr(sgdDaten.RowCount));
    F.Add(IntToStr(sgdDaten.ColCount));
    for i := 0 to (sgdDaten.RowCount - 1) do
      F.Add(sgdDaten.Rows[i].CommaText);
    F.SaveToFile(DatenFileName);
  finally
    F.Free;
  end;
end;

procedure TFormMain.Programmbeenden1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.ffnen1Click(Sender: TObject);
var
  F: TStringList;
  i: Integer;
begin
  F := TStringList.Create;
  try
    If OpenDlgDaten.Execute Then
    Begin
      DatenFileName := OpenDlgDaten.FileName;
      F.LoadFromFile(DatenFileName);
      sgdDaten.RowCount := StrToInt(F[0]);
      sgdDaten.ColCount := StrToInt(F[1]);
      for i := 0 to (sgdDaten.RowCount - 1) do
        sgdDaten.Rows[i].CommaText := F[i + 2];
    End;
  finally
    mmDatenSpeichern.Enabled := true;
    F.Free;
  end;
end;

procedure TFormMain.Spe1Click(Sender: TObject);
var
  F: TStringList;
  i: Integer;
begin
  F := TStringList.Create;
  try
    If SaveDlgDaten.Execute Then
    Begin
      F.Add(IntToStr(sgdDaten.RowCount));
      F.Add(IntToStr(sgdDaten.ColCount));
      for i := 0 to (sgdDaten.RowCount - 1) do
        F.Add(sgdDaten.Rows[i].CommaText);
      DatenFileName := SaveDlgDaten.FileName;
      F.SaveToFile(DatenFileName);
    End;
  finally
    mmDatenSpeichern.Enabled := true;
    F.Free;
  end;
end;

procedure TFormMain.cbxRechtsClick(Sender: TObject);
begin
  if cbxRechts.Checked then
    begin
       //Wenn Dauerrechts angeklickt wird, werden die anderen Felder ausgegraut
       cbxLinks.Checked := FALSE;
       cbxLinks.Enabled := FALSE;
       rightSpin.Enabled := FALSE;
       leftSpin.Enabled := FALSE
    end
  else
    begin
       //Wenn Dauerrechts angeklickt wird, werden die anderen Felder ausgegraut
       cbxLinks.Enabled := TRUE;
       rightSpin.Enabled := TRUE;
       leftSpin.Enabled := TRUE
    end;
end;

procedure TFormMain.cbxLinksClick(Sender: TObject);
begin
  if cbxLinks.Checked then
    begin
       //Wenn Dauerrechts angeklickt wird, werden die anderen Felder ausgegraut
       cbxRechts.Checked := FALSE;
       cbxRechts.Enabled := FALSE;
       rightSpin.Enabled := FALSE;
       leftSpin.Enabled := FALSE
    end
  else
    begin
       //Wenn Dauerrechts angeklickt wird, werden die anderen Felder ausgegraut
       cbxRechts.Enabled := TRUE;
       rightSpin.Enabled := TRUE;
       leftSpin.Enabled := TRUE
    end;
end;

procedure TFormMain.btnLaserAusClick(Sender: TObject);
begin
  // WriteAllDigital schaltet den Output auf 1 = Output 1; 2 = Output 2; 4 = Output 3; 8 = Output 4; 16 = Output 5 (ggf addieren)...
  if not DisableOtherFunctionCall then WriteAllDigital(0);
end;

procedure TFormMain.Button1Click(Sender: TObject);
var
  F: TStringList;
  i: Integer;
begin
  F := TStringList.Create;
  try
    If SaveDlgDetails.Execute Then
    Begin
      F.Add(IntToStr(sgdDetails.RowCount));
      F.Add(IntToStr(sgdDetails.ColCount));
      for i := 0 to (sgdDetails.RowCount - 1) do
        F.Add(sgdDetails.Rows[i].CommaText);
      DatenFileName := SaveDlgDetails.FileName;
      F.SaveToFile(DatenFileName);
    End;
  finally
    F.Free;
  end;
end;

end
.
