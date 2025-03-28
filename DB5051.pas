unit DB5051;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Snap7,
  Vcl.Samples.Spin, GlobalData, Vcl.Buttons;

type
  TForm8 = class(TForm)
    lstDataDB50: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    TimerDB50: TTimer;
    adressSpin50: TSpinEdit;
    PocetDB: TSpinEdit;
    edtWriteValue: TSpinEdit;
    Label3: TLabel;
    checkTrvaleCteni: TCheckBox;
    Label4: TLabel;
    Panel1: TPanel;
    ComIsOK: TPanel;
    ComIsOKLabel: TLabel;
    ResetList: TButton;
    CtiPoleByte: TBitBtn;
    CtiPoleWord: TBitBtn;
    CtiPoleDWBtn: TBitBtn;
    ZapisPoleByte: TBitBtn;
    ZapisPoleWord: TBitBtn;
    ZapisPoleDWBtn: TBitBtn;
    rbDB50: TRadioButton;     // DB50
    rbDB51: TRadioButton;     // DB51
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerDB50Timer(Sender: TObject);
    procedure ResetListClick(Sender: TObject);
    procedure CtiPoleByteClick(Sender: TObject);
    procedure CtiPoleWordClick(Sender: TObject);
    procedure CtiPoleDWBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbDB50Click(Sender: TObject);
    procedure rbDB51Click(Sender: TObject);
    procedure checkTrvaleCteniClick(Sender: TObject);
   // procedure CtiPoleByteClick(Sender: TObject);
  private
    { Private declarations }
    //ActiveBtn: TBitBtn; // Funguje pro aktivaci tlaèítka jestli je zmáèknuté nebo není
    //procedure UpdateBtnState;
    LastClickedBtn: TBitBtn; // Promìná pro uchování poslední kliknutého tlaèítka
    var
    SelectedDB: Integer;
    TrvaleCteni: Boolean;

  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

uses
 Main;


procedure TForm8.checkTrvaleCteniClick(Sender: TObject);
begin
TrvaleCteni:= checkTrvaleCteni.Checked;
TimerDB50.Enabled := TrvaleCteni;
end;

procedure TForm8.CtiPoleByteClick(Sender: TObject);
begin
LastClickedBtn := CtiPoleByte;
TimerDB50Timer(Sender);
end;

procedure TForm8.CtiPoleDWBtnClick(Sender: TObject);
begin
LastClickedBtn := CtiPoleDWBtn;
TimerDB50Timer(Sender);
end;

procedure TForm8.CtiPoleWordClick(Sender: TObject);
begin
LastClickedBtn := CtiPoleWord;
TimerDB50Timer(Sender);
end;

procedure TForm8.FormActivate(Sender: TObject);
begin
if KeepConnection=True then
  begin
  ComIsOKLabel.Caption:='Pøipojen';
  ComIsOK.Color:=clGreen

  end
  else
 begin
 ComIsOKLabel.Caption:='Nepøipojen';
 ComIsOK.Color:=clRed;
 Panel1.Visible:= False;
 lstDataDB50.Items.Add('Nejprve se pøipoj k PLC');
 TimerDB50.Enabled:=False; // Vypne se timer když není pøipojeno
 // Exit; //Mozná
 end;

end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 MainForm.FormDBInstance := nil;
 lstDataDB50.Clear;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
LastClickedBtn := CtiPoleByte;
SelectedDB := 50; // výchozí hodnota
TrvaleCteni := false;
rbDB50.Checked := True; // Výchozí zaškrtnutí radiobutton
end;

procedure TForm8.rbDB50Click(Sender: TObject);
begin
SelectedDB:=50;
end;

procedure TForm8.rbDB51Click(Sender: TObject);
begin
SelectedDB:=51;
end;

procedure TForm8.ResetListClick(Sender: TObject);
begin
 lstDataDB50.Items.Clear;
end;

procedure TForm8.TimerDB50Timer(Sender: TObject);
var
Buffer: array of Byte;
//Value: Integer;
Value: LongWord; // zmìna na DWord
i: Integer;
Length: Integer;
//ErrorText: string;
StartAddress: Integer;
RecordCount: Integer;
begin
 if not ConnectedToPLC then
 begin
 lstDataDB50.Items.Clear;
 lstDataDB50.Items.Add('Nejprve se pøipoj k PLC');
 TimerDB50.Enabled:= False;
 Exit;
 end;
 StartAddress := adressSpin50.Value;
 RecordCount := PocetDB.Value;

 if LastClickedBtn = CtiPoleByte then
 begin
   Length := RecordCount;
   SetLength(Buffer, Length);
  if GlobalData.ReadDB(SelectedDB, StartAddress, RecordCount, Buffer, 1) then
  begin
    lstDataDB50.Items.Clear;
    for i := 0 to Length - 1 do
      begin
        lstDataDB50.Items.Add(Format('DB%d[%d]: %d', [SelectedDB, StartAddress + i, Buffer [i]]));
      end;
  end
  else
  begin
    lstDataDB50.Items.Add(Format('Chyba ètení DB%d Byte.', [SelectedDB]));
  end;
 end
 else if LastClickedBtn = CtiPoleWord then
 begin
 Length := RecordCount * 2;
 SetLength(Buffer, Length);
 if GlobalData.ReadDB(SelectedDB, StartAddress, RecordCount, Buffer, 2) then
  begin
  lstDataDB50.Items.Clear;
  for i := 0 to RecordCount - 1 do
    begin
      Value := Buffer[i * 2] + (Buffer[i * 2 + 1] shl 8);
      lstDataDB50.Items.Add(Format('DB%d[%d]: %d', [SelectedDB, StartAddress + i * 2, Value]));
    end;
  end
  else
  begin
    lstDataDB50.Items.Add(Format('Chyba ètení DB%d Word.', [SelectedDB]));
  end;
 end
 else if LastClickedBtn = CtiPoleDWBtn then
 begin
   Length := RecordCount * 4;
   SetLength(Buffer, Length);
   if GlobalData.ReadDB(SelectedDB, StartAddress, RecordCount, Buffer, 4) then
   begin
     lstDataDB50.Items.Clear;
     for i := 0 to RecordCount - 1 do
       begin
         Value := Buffer[i * 4] + (Buffer[i * 4 + 1] shl 8) + (Buffer[i * 4 + 2] shl 16) + (Buffer[i * 4 + 3] shl 24);
         lstDataDB50.Items.Add(Format('DB%d[%d]: %d', [SelectedDB, StartAddress + i * 4, Value]));
         //lstDataDB50.Items.Add(Format('Chyba ètení DB%d DWord.', [SelectedDB]));
       end;
   end
   else
   begin
     lstDataDB50.Items.Add(Format('Chyba ètení DB%d DWord.', [SelectedDB]));
   end;
   if TrvaleCteni then
   begin
     TimerDB50.Enabled := True;
   end
   else
   TimerDB50.Enabled := False;
 end;
end;

end.
