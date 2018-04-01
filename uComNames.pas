unit uComNames;

interface

uses Registry, classes, Windows, Dialogs, Sysutils, StrUtils;

function GetComNames: TStrings;

implementation

function Compare(List: TStringList; Index1, Index2: Integer): Integer;
var
Start1, Start2: Integer;
S1, S2: String;
N1, N2: Boolean;
Item1, Item2: String;

function IsDigit(C: Char): Boolean;
begin
Result := (C in ['0'..'9']);
end;

function GetNext(S: String; var Start: Integer; var IsNumber: Boolean): String;
var
StringLaenge: Integer;
C, Laenge: Integer;
begin
Result := '';
StringLaenge := Length(S);
if Start > StringLaenge then
Exit;

// Beginnt eine Zahl?
IsNumber := IsDigit(S[Start]);
Laenge := 1;

for C := Start + 1 to StringLaenge do
begin
// Weiterhin eine Zahl/ein Wort?
if IsDigit(S[C]) = IsNumber then
Inc(Laenge)
else
Break;
end;

Result := Copy(S, Start, Laenge);
Inc(Start, Laenge);
end;

begin
Result := 0;
Item1 := List[Index1];
Item2 := List[Index2];
// Beide gleich -> Raus hier
if Item1 = Item2 then
Exit;

Start1 := 1;
Start2 := 1;
// Alle Teile durchgehen
repeat
// Teile holen
S1 := GetNext(Item1, Start1, N1);
S2 := GetNext(Item2, Start2, N2);

// Haben wir zwei Zahlen?
if N1 and N2 then
begin // Ja -> Zahlen Vergleichen
Result := StrToInt(S1) - StrToInt(S2);
end else
begin // Nein -> Normaler Stringvergleich
if List.CaseSensitive then
Result := AnsiCompareStr(S1, S2)
else
Result := AnsiCompareText(S1, S2);
end;

until (Result <> 0) or
(Start1 > Length(Item1)) or
(Start2 > Length(Item2));
end;

function GetComNames: TStrings;
var
  KeyNames1,KeyNames2,KeyNames3: TStrings;
  Res: TStringList;
  i,ii,iii: integer;
  s,Key0: string;
begin
  KeyNames1 := TStringList.Create;
  KeyNames2 := TStringList.Create;
  KeyNames3 := TStringList.Create;
  Key0 := '\SYSTEM\CurrentControlSet\Enum\';
  Res := TStringList.Create;
  with TRegistry.Create do begin
    try
      RootKey := HKEY_LOCAL_MACHINE;
      if OpenKeyReadOnly(Key0) then begin
        GetKeyNames(KeyNames1);
        for i:=0 to KeyNames1.Count-1 do begin
          OpenKeyReadOnly(Key0+KeyNames1[i]+'\');
          GetKeyNames(KeyNames2);
          for ii:=0 to KeyNames2.Count-1 do begin
            OpenKeyReadOnly(Key0+KeyNames1[i]+'\'+KeyNames2[ii]+'\');
            GetKeyNames(KeyNames3);
            for iii:=0 to KeyNames3.Count-1 do begin
              OpenKeyReadOnly(Key0+KeyNames1[i]+'\'+KeyNames2[ii]+'\'+KeyNames3[iii]+'\');
              if KeyExists('Device Parameters') then begin
               s := ReadString('FriendlyName');
               OpenKeyReadOnly(Key0+KeyNames1[i]+'\'+KeyNames2[ii]+'\'+KeyNames3[iii]+'\Device Parameters\');
               if ValueExists('PortName') then begin

                 s := ReadString('PortName')+' | '+s;
                 if Pos('COM',s)=1 then Res.Add(s);
                 end;
               end;
            end;
          end;
        end;
      end;
      finally
      CloseKey;
      Free;
    end;
  end;
  //sortieren
  Res.CustomSort(Compare);
  Result := Res;
end;

end.
