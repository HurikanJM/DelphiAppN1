unit Log;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, GlobalData, GlobalProc,
  System.Actions, Vcl.ActnList;

type
  TForm11 = class(TForm)
    Panel1: TPanel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    btnAction: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnRegister: TButton;
    procedure btnActionClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRegisterClick(Sender: TObject);
   // procedure btnLoginClick(Sender: TObject);      // Pøidáno
   // procedure btnRegisterClick(Sender: TObject);   // Pøidáno
  private
    { Private declarations }
   // procedure UpdateFormState;
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation
 uses
 Main;

{$R *.dfm}
 {
 users.txt:
uzivatel1,heslo1
uzivatel2,heslo2
uzivatel3,heslo3
 }
procedure TForm11.btnActionClick(Sender: TObject);
var
Users: TStringList;
i: Integer;
UserInfo: array[0..1] of string; // nefunguje SplitString až v novìjších verzích
CommaPos: Integer;
begin
 Users := TStringList.Create;
 try
 //Kontrola kesat pøed naètením souboru
 if (edtUsername.Text = 'kesat') and (edtPassword.Text = 'kesat') then
  begin
  ShowMessage('Pøihlášení úspìšnì jako Kesat');
  GlobalData.Logged := True;
  GlobalData.IsKesat := True;
  ModalResult := mrOk;
  Exit;
  end;

   if not FileExists(GlobalData.UsersFilePath) then
   begin
     ShowMessage('Soubor s uživateli neexistuje.');
     Exit;
   end;
 Users.LoadFromFile(GlobalData.UsersFilePath);
 for i := 0 to Users.Count - 1 do
   begin
     CommaPos := Pos(',', Users[i]);
     if CommaPos > 0 then
     begin
       UserInfo[0] := Copy(Users[i], 1, CommaPos -1);
       UserInfo[1] := Copy(Users[i],CommaPos + 1, Length(Users[i]));
       if (UserInfo[0] = edtUsername.Text) and (UserInfo[1] = edtPassword.Text) then
       begin
         ShowMessage('Pøihlášení úspìšné.');
         GlobalData.Logged := True;
         GlobalData.IsKesat := False;
         ModalResult := mrOk;
         Exit;
       end;
     end;
   end;
   ShowMessage('Neplatné uživatelské jméno nebo heslo.');
   GlobalData.Logged := False;
 finally
   Users.Free;
 end;
end;

procedure TForm11.btnRegisterClick(Sender: TObject);
var
Users: TStringList;
i: Integer;
UserInfo: array[0..1] of string;
CommaPos: Integer;
begin
  Users := TStringList.Create;
  try
    if FileExists(GlobalData.UsersFilePath) then
    begin
      Users.LoadFromFile(GlobalData.UsersFilePath);
      for i := 0 to Users.Count - 1 do
        begin
          CommaPos := Pos(',', Users[i]);
          if CommaPos > 0 then
          begin
            UserInfo[0] := Copy(Users[i], 1, CommaPos - 1);
            if UserInfo[0] = edtUsername.Text then
            begin
              ShowMessage('Uživatelské jméno již existuje.');
              Exit;
            end;
          end;
        end;
    end;

    Users.Add(edtUsername.Text + ',' + edtPassword.Text);
    Users.SaveToFile(GlobalData.UsersFilePath);
    ShowMessage('Uživatel byl Registrován');
  finally
    Users.Free;
  end;
end;

procedure TForm11.FormActivate(Sender: TObject);

begin
btnAction.Caption := 'Pøihlásit';
btnRegister.Visible := False;
 if GlobalData.IsKesat = True then
 btnRegister.Visible := True;

end;
{
procedure TForm11.btnLoginClick(Sender: TObject);
begin
  GlobalData.LoginSelected := True;
  SelectForm.ModalResult := mrLogin;
  SelectForm.Close;
end;

procedure TForm11.btnRegisterClick;
begin
  GlobalData.LoginSelected := False;
  SelectForm.ModalResult := mrRegister;
  SelectForm.Close;
end;
 }
procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 MainForm.FormLogInstance := nil;
end;

end.
