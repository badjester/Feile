program TMCLDemo;

uses
  Forms,
  TMCLDemoMain in 'TMCLDemoMain.pas' {FormMain},
  uComNames in 'uComNames.pas',
  uFrmCommands in 'uFrmCommands.pas' {frmCommands: TFrame},
  uHelp in 'uHelp.pas' {FormHelp},
  uFormFeile in 'uFormFeile.pas' {FormFeile};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormHelp, FormHelp);
  Application.CreateForm(TFormFeile, FormFeile);
  Application.Run;
end.
