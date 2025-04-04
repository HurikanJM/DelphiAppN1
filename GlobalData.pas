unit GlobalData;

interface

uses Snap7;

type
TLanguage = (langCZ, langEN);

const
 LanguageNames: array[TLanguage] of string = ('Èeština', 'English');
 UsersFilePath: string = 'Log\users.txt';
 GridFilePath: string = 'Txt\Graf.txt';

  mrLogin = 1; // Místo mrOK pro RadioButtony na pøihlašování
  mrRegister = 2;
 // PermAdnim = 0;
 // PermMod = 1;
 // PermUser = 2;

var
ConnectedToPLC : Boolean;  // Pøipojení OK or No
EnableCom: Boolean;  // Povolení jestli se komunikace propíše
KeepConnection: Boolean; // Pøidáno na zachování komunikace
TypeOfConnection: Boolean; // 1 = Snap7 | 0 = ModBus
Logged: Boolean = False;  // 0 není - 1 je pøihlášen  Inic. na false ze zaèátku
LoginSelected: Boolean; // Pro urèení zobrazení v Log.pas jestli 0-1 Login-Registrace
IsKesat: Boolean;
taskSoubor: string;
GridWidth: Integer = 315; // Šíøka TNiceGrid
GridHeight: Integer = 500;  //Výška TNiceGrid
//GrafInfo: Integer; // Informace o grafu jaký se používá v Unit2 a Dialog
UserRole: Integer; // Pøidáno pro uložení role



PLC_IP: string;
PLC_Rack: Integer;
PLC_Slot: Integer;
PLCClient: TS7Client; // možná zakomentovat

//function ReadDB(DBNumber: Integer; StartAddress: Integer; Count: Integer; var Data: array of Byte; DataType: Integer): Boolean;
// Prvnì je definice typù konstant a potom jsou promìnné, pøi nepropsání do ostatních Form CLEAR -> BUILD
 CurrentLanguage: TLanguage;
 Texts: array[TLanguage, 0..6] of string = (
 ( // Èeština
  'Spustit',
  'Zastavit',
  'Nádrž',
  '',
  '',
  '',
  ''
  ),
  ( // English
  'Start',
  'Stop',
  'Tank',
  '',
  '',
  '',
  ''
  )
 );

{
TLanguage: Výètový typ pro jazyky.
LanguageNames: Pole s názvy jazykù.
CurrentLanguage: Promìnná pro aktuálnì vybraný jazyk.
Texts: Vícerozmìrné pole s texty pro každý jazyk.
GetText: Funkce pro získání textu podle indexu a aktuálního jazyka.
}

function ReadDB(DBNumber: Integer; StartAddress: Integer; Count: Integer; var Data: array of Byte; DataType: Integer): Boolean;
function GetText(TextIndex: Integer): string;
procedure SetLanguage(Language: TLanguage);
function GetLanguageCount: Integer;
function GetLanguageName(LanguageIndex: Integer): string;

implementation

 function GetText(TextIndex: Integer): string;
 begin
  Result:= Texts[CurrentLanguage, TextIndex];
 end;

 procedure SetLanguage(Language: TLanguage);
 begin
   CurrentLanguage := Language;
 end;

 function GetLanguageCount: Integer;
 begin
   Result := Length(LanguageNames);
 end;

 function GetLanguageName(LanguageIndex: Integer): string;
 begin
   Result := LanguageNames[TLanguage(LanguageIndex)];
 end;



function ReadDB(DBNumber: Integer; StartAddress: Integer; Count: Integer; var Data: array of Byte; DataType: Integer): Boolean;
 var
 FClient : TS7Client;
 Length: Integer;
 begin
   if ConnectedToPLC then
   begin
     FClient := TS7Client.Create;
     try
       if FClient.ConnectTo(PLC_IP, PLC_Rack, PLC_Slot) = 0 then
       begin
         Length := Count * DataType;
         if FClient.DBRead(DBNumber, StartAddress, Length, @Data[0]) = 0 then
         Result := True
         else
         Result := False;
       end
       else
       Result := False;
     finally
       FClient.Free;
     end;
   end
   else
   Result := False;
 end;


  initialization // inicializace ConnectedToPLC
  ConnectedToPLC := False;
  CurrentLanguage := langCZ; // výchozí
  taskSoubor := 'C:\Users\jamr\Desktop\BBNOM\Prog\Txt\tasks.txt';
end.




