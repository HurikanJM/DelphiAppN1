unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus, ModBusCom, Unit1, Unit2, Unit3,
  DB5051, Ext, Txt, Obsah, Test, Snap7Com, Log, System.ImageList, Vcl.ImgList, SettingUI,
  Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList, Vcl.ActnMan, Settings;

type
  TMainForm = class(TForm)
    MenuPanel: TPanel;
    BtnPLCCOM: TButton;
    BtnTest: TButton;
    BtnDB: TButton;
    BtnSetting: TButton;
    PopupMenuPLC: TPopupMenu;
    PopupMenuTest: TPopupMenu;
    PopupMenuDB: TPopupMenu;
    PopupMenuFiles: TPopupMenu;
    SNAP71: TMenuItem;
    ModBus1: TMenuItem;
    Unit11: TMenuItem;
    Unit21: TMenuItem;
    Unit31: TMenuItem;
    Obsah1: TMenuItem;
    est1: TMenuItem;
    DB50511: TMenuItem;
    Excell1: TMenuItem;
    xt1: TMenuItem;
    FileTest1: TMenuItem;
    TimerPanel: TPanel;
    Time: TLabel;
    Timer1: TTimer;
    Panel1: TPanel;
    TestPripojeniKPLC: TLabel;
    Button1: TButton;
    Login: TButton;
    ImageList1: TImageList;
    ActionManager1: TActionManager;
    Bevel1: TBevel;
    Panel2: TPanel;
    UName: TPanel;
    Panel4: TPanel;
    Panel15: TPanel;
    Panel6: TPanel;
    FooterTimer: TTimer;
    Button2: TButton;
    procedure OnTimer(Sender: TObject);
    procedure Snap(Sender: TObject);
    procedure PLCMenu(Sender: TObject);
    procedure TestMenu(Sender: TObject);
    procedure DBMenu(Sender: TObject);
    procedure NastaveniClicked(Sender: TObject);
    procedure ModBus(Sender: TObject);
    procedure U1(Sender: TObject);
    procedure U2(Sender: TObject);
    procedure U3(Sender: TObject);
    procedure Obsah(Sender: TObject);
    procedure Test(Sender: TObject);
    procedure DB505(Sender: TObject);
    procedure Excel(Sender: TObject);
    procedure Txt(Sender: TObject);
    procedure FileTest(Sender: TObject);
    procedure ActivateForm(Sender: TObject);
    procedure SelectLanguage(Sender: TObject);
    procedure btnlogin(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FooterTimerTimer(Sender: TObject);
   // procedure Bevel1Gesture(Sender: TObject; const EventInfo: TGestureEventInfo;
   //   var Handled: Boolean);

    //procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure DisableAllButtonsExceptLogin;  // Pøidáno pro login
    procedure EnableAllButtons;  // Pøidáno pro login
    { Private declarations }
   // procedure Spodnimenu(StaticText: TStaticText);
    
//FileTest
  public
    { Public declarations }
    {
    Problém s opìtovným otevøením se vyøeší do FormClose
    a tam se dá Main form jako NIL;
    }
    FormSnap7Instance: TForm1; //Snap7
    FormModBusComInstance: TForm2;   // ModBus
    FormUnit1Instance: TForm3;   //Unit1
    FormUnit2Instance: TForm4;   //Unit2
    FormUnit3Instance: TForm5;   //Unit3
    FormObsahInstance: TForm6; // Obsah
    FormTestInstance: TForm7; //Test
    FormDBInstance: TForm8;   //DB50 DB51
    FormExtInstance: TForm9;  //Excell
    FormTxtInstance: TForm10;  //Txt
    FormLogInstance: TForm11; // Log
    //Pøidat SettingsUI pro nastavení práv
    FormSettingUIInstance: TForm14; // SettingUI
    FormSettingsInstance: TForm13; // Settings
  end;

var
  MainForm: TMainForm;

implementation
 uses
 GlobalData, GlobalProc;
{$R *.dfm}

procedure TMainForm.DisableAllButtonsExceptLogin;
var
i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TButton then
      begin
        if Components[i].Name <> 'Login' then
        begin
          TButton(Components[i]).Enabled := False;
          TButton(Components[i]).TabStop := False;
        end;
      end;
    end;
end;

procedure TMainForm.EnableAllButtons;
var
i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TButton then
      begin
        TButton(Components[i]).Enabled := True;
        TButton(Components[i]).TabStop := True;
      end;
    end;
end;

procedure Spodnimenu(StaticText: TStaticText);
begin
 StaticText.Font.Name := 'Arial';
 StaticText.Font.Size := 14;
 StaticText.Font.Style := [fsBold];
 StaticText.Font.Color := clGreen;
 StaticText.Alignment := taCenter;
end;

procedure TMainForm.Test(Sender: TObject);
begin
   if not Assigned(FormTestInstance) then
    begin
    FormTestInstance := TForm7.Create(Self);
    FormTestInstance.Show;
    end
  else
    begin
    FormTestInstance.SetFocus;
    end;
end;

procedure TMainForm.TestMenu(Sender: TObject);
var
Point: TPoint;
begin
  Point := BtnTest.ClientToScreen(TPoint.Create(0, BtnTest.Height));
  PopupMenuTest.Popup(Point.X,Point.Y);
end;

procedure TMainForm.Txt(Sender: TObject);
begin
   if not Assigned(FormTxtInstance) then
    begin
    FormTxtInstance := TForm10.Create(Self);
    FormTxtInstance.Show;
    end
  else
    begin
    FormTxtInstance.SetFocus;
    end;
end;

procedure TMainForm.U1(Sender: TObject);
begin
 if not Assigned(FormUnit1Instance) then
    begin
    FormUnit1Instance := TForm3.Create(Self);
    FormUnit1Instance.Show;
    end
  else
    begin
    FormUnit1Instance.SetFocus;
    end;
end;

procedure TMainForm.U2(Sender: TObject);
begin
 if not Assigned(FormUnit2Instance) then
    begin
    FormUnit2Instance := TForm4.Create(Self);
    FormUnit2Instance.Show;
    end
  else
    begin
    FormUnit2Instance.SetFocus;
    end;
end;

procedure TMainForm.U3(Sender: TObject);
begin
 if not Assigned(FormUnit3Instance) then
    begin
    FormUnit3Instance := TForm5.Create(Self);
    FormUnit3Instance.Show;
    end
  else
    begin
    FormUnit3Instance.SetFocus;
    end;
end;



procedure TMainForm.ActivateForm(Sender: TObject);
var
i: Integer;
begin
if EnableCom=True then
  begin
  TestPripojeniKPLC.Caption:='Pøipojení aktivní'
  end
  else
  begin
   TestPripojeniKPLC.Caption:='Pøipojení neaktivní';
  end;
end;



procedure TMainForm.btnlogin(Sender: TObject);
begin
//ShowMessage('Test Login');
if not Assigned(FormLogInstance) then
  begin
  FormLogInstance := TForm11.Create(Self);
  FormLogInstance.ShowModal;
  if GlobalData.Logged then
    begin
    EnableAllButtons;
    end;
  end
  else
  begin
  FormLogInstance.SetFocus;
  end;
end;

procedure TMainForm.DB505(Sender: TObject);
begin
   if not Assigned(FormDBInstance) then
    begin
    FormDBInstance := TForm8.Create(Self);
    FormDBInstance.Show;
    end
  else
    begin
    FormDBInstance.SetFocus;
    end;
end;

procedure TMainForm.DBMenu(Sender: TObject);
var
Point: TPoint;
begin
  Point := BtnDB.ClientToScreen(TPoint.Create(0, BtnDB.Height));
  PopupMenuDB.Popup(Point.X,Point.Y);
end;

procedure TMainForm.Excel(Sender: TObject);
begin
    if not Assigned(FormExtInstance) then
    begin
    FormExtInstance := TForm9.Create(Self);
    FormExtInstance.Show;
    end
  else
    begin
    FormExtInstance.SetFocus;
    end;
end;

procedure TMainForm.NastaveniClicked(Sender: TObject);
begin
 // Otevøené Settings
  if not Assigned(FormSettingsInstance) then
  begin
    FormSettingsInstance := TForm13.Create(Self);
    FormSettingsInstance.Show;
  end
  else
  begin
    FormSettingsInstance.SetFocus;
  end;
end;

procedure TMainForm.FileTest(Sender: TObject);
begin
  ShowMessage('Doplnit');
end;


procedure TMainForm.FooterTimerTimer(Sender: TObject);
begin
if GlobalData.Logged then
  begin
    case GlobalData.UserRole of
    0: Panel15.Caption := '0';
    1: Panel15.Caption := '1';
    2: Panel15.Caption := '2';
    else
    Panel15.Caption := 'X';
    end;
  end
  else
  begin
    Panel15.Caption := 'X';
  end;
  if GlobalData.ConnectedToPLC then
  begin
    Panel6.Caption := '1'; // Pøipojeno
    Panel6.Color := clGreen;
  end
  else
  begin
    Panel6.Caption := '0'; // Nepøipojeno
    Panel6.Color := clRed;  // Nefunguje
  end;
  Panel15.StyleElements := [];
  Panel15.StyleElements := [seClient];

  Panel4.StyleElements := [seClient];
  Panel4.StyleElements := [];

  Panel6.StyleElements := [];
  Panel6.StyleElements := [seClient];

  Panel4.Invalidate;
  Panel6.Invalidate;
  Panel15.Invalidate;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
//DisableAllButtonsExceptLogin;
//SpodniMenu();

Panel15.Font.Size := 12;
Panel15.Font.Style := [fsBold];
Panel15.Alignment := taCenter;
Panel15.Font.Color := clWhite;

Panel6.Font.Size := 12;
Panel6.Font.Style := [fsBold];
Panel6.Alignment := taCenter;
Panel6.Font.Color := clWhite;

Panel4.Font.Size := 12;
Panel4.Font.Style := [fsBold];
Panel4.Alignment := taCenter;
Panel4.Font.Color := clWhite;
end;


procedure TMainForm.ModBus(Sender: TObject);
begin
   if not Assigned(FormModBusComInstance) then
    begin
    FormModBusComInstance := TForm2.Create(Self);
    FormModBusComInstance.Show;
    end
  else
    begin
    FormModBusComInstance.SetFocus;
    end;
end;

procedure TMainForm.Obsah(Sender: TObject);
begin
   if not Assigned(FormObsahInstance) then
    begin
    FormObsahInstance := TForm6.Create(Self);
    FormObsahInstance.Show;
    end
  else
    begin
    FormObsahInstance.SetFocus;
    end;
end;

procedure TMainForm.OnTimer(Sender: TObject);
begin
  Time.Caption:=GetCurrentTime;
end;

procedure TMainForm.PLCMenu(Sender: TObject);
var
Point: TPoint;
begin
  Point := BtnPLCCOM.ClientToScreen(TPoint.Create(0, BtnPLCCOM.Height));
  PopupMenuPLC.Popup(Point.X,Point.Y);
end;

procedure TMainForm.SelectLanguage(Sender: TObject);
var
LanguageDialog: TForm;
btnLanguage: array of TButton;
i: Integer;
begin
 LanguageDialog := TForm.Create(Self);
 try
   LanguageDialog.Caption := 'Vyberte jazyk';
   LanguageDialog.BorderStyle := bsDialog;
   LanguageDialog.Position := poOwnerFormCenter;
   LanguageDialog.Width:=200;
   LanguageDialog.Height := 50 + GlobalData.GetLanguageCount * 40;

   SetLength(btnLanguage, GlobalData.GetLanguageCount);
   for i := 0 to GlobalData.GetLanguageCount - 1 do
     begin
       btnLanguage[i] := TButton.Create(LanguageDialog);
       btnLanguage[i].Parent := LanguageDialog;
       btnLanguage[i].Caption := GlobalData.GetLanguageName(i);
       btnLanguage[i].Top := 20 + i * 40;
       btnLanguage[i].Left := 20;
       btnLanguage[i].Width := 160;
       btnLanguage[i].ModalResult := TModalResult(mrYes + i);
     end;

     case LanguageDialog.ShowModal of
      mrYes..mrYes + 1:
        GlobalData.SetLanguage(TLanguage(LanguageDialog.ModalResult - mrYes));
     end;
     //GlobalData.UpdateTexts;
 finally
   LanguageDialog.Free;
 end;
end;


procedure TMainForm.Snap(Sender: TObject);
  begin
  if not Assigned(FormSnap7Instance) then
    begin
    //ShowMessage('Vytváøím instanci FormSnap7Instance');
    FormSnap7Instance := TForm1.Create(Self);
    //ShowMessage('Zobrazuji instanci FormSnap7Instance');
    FormSnap7Instance.Show;
    end
  else
    begin
    //ShowMessage('Instance FormSnap7Instance již existuje');
    //ShowMessage('Nastavuji fokus na instanci FormSnap7Instance');    // Neuvolnuje se instance OPRAVIT
    FormSnap7Instance.SetFocus;
    end;
  end;


end.
