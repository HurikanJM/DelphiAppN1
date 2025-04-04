unit GlobalData;

interface

uses Snap7;

type
TLanguage = (langCZ, langEN);

const
 LanguageNames: array[TLanguage] of string = ('�e�tina', 'English');
 UsersFilePath: string = 'Log\users.txt';
 GridFilePath: string = 'Txt\Graf.txt';

  mrLogin = 1; // M�sto mrOK pro RadioButtony na p�ihla�ov�n�
  mrRegister = 2;
 // PermAdnim = 0;
 // PermMod = 1;
 // PermUser = 2;

var
ConnectedToPLC : Boolean;  // P�ipojen� OK or No
EnableCom: Boolean;  // Povolen� jestli se komunikace prop�e
KeepConnection: Boolean; // P�id�no na zachov�n� komunikace
TypeOfConnection: Boolean; // 1 = Snap7 | 0 = ModBus
Logged: Boolean = False;  // 0 nen� - 1 je p�ihl�en  Inic. na false ze za��tku
LoginSelected: Boolean; // Pro ur�en� zobrazen� v Log.pas jestli 0-1 Login-Registrace
IsKesat: Boolean;
taskSoubor: string;
GridWidth: Integer = 315; // ���ka TNiceGrid
GridHeight: Integer = 500;  //V��ka TNiceGrid
//GrafInfo: Integer; // Informace o grafu jak� se pou��v� v Unit2 a Dialog
UserRole: Integer; // P�id�no pro ulo�en� role



PLC_IP: string;
PLC_Rack: Integer;
PLC_Slot: Integer;
PLCClient: TS7Client; // mo�n� zakomentovat

//function ReadDB(DBNumber: Integer; StartAddress: Integer; Count: Integer; var Data: array of Byte; DataType: Integer): Boolean;
// Prvn� je definice typ� konstant a potom jsou prom�nn�, p�i neprops�n� do ostatn�ch Form CLEAR -> BUILD
 CurrentLanguage: TLanguage;
 Texts: array[TLanguage, 0..6] of string = (
 ( // �e�tina
  'Spustit',
  'Zastavit',
  'N�dr�',
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
TLanguage: V��tov� typ pro jazyky.
LanguageNames: Pole s n�zvy jazyk�.
CurrentLanguage: Prom�nn� pro aktu�ln� vybran� jazyk.
Texts: V�cerozm�rn� pole s texty pro ka�d� jazyk.
GetText: Funkce pro z�sk�n� textu podle indexu a aktu�ln�ho jazyka.
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
  CurrentLanguage := langCZ; // v�choz�
  taskSoubor := 'C:\Users\jamr\Desktop\BBNOM\Prog\Txt\tasks.txt';
end.




