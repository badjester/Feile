unit uFormFeile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Menus;

type
  TFormFeile = class(TForm)
    MainMenu1: TMainMenu;
    mmenuSpeichern: TMenuItem;
    mmenuAbbrechen: TMenuItem;
    mmFeile: TMemo;
    SaveDlgFeile: TSaveDialog;
    procedure mmenuSpeichernClick(Sender: TObject);
    procedure mmenuAbbrechenClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FormFeile: TFormFeile;
  FeileNeu: boolean = false;
  FileName: TFileName;

implementation

{$R *.dfm}

procedure TFormFeile.mmenuSpeichernClick(Sender: TObject);
var
  FileHandle: integer;
begin
  If FeileNeu Then
    Begin
    If SaveDlgFeile.Execute Then
      Begin
      FileName := SaveDlgFeile.FileName;
      mmFeile.Lines.SaveToFile(FileName);
      FeileNeu := false;
      FormFeile.Close;
      End
    End
  Else
    Begin
     mmFeile.Lines.SaveToFile(FileName);
     FormFeile.Close;
    End;
end;

procedure TFormFeile.mmenuAbbrechenClick(Sender: TObject);
begin
  mmFeile.Lines.LoadFromFile(FileName);
  FormFeile.Close;
end;

end.
