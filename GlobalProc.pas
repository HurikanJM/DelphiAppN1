unit GlobalProc;

interface

uses
GlobalData, Vcl.Forms, Vcl.StdCtrls;

function GetCurrentTime: string;
procedure SetLoginSelected(Value: Boolean);
procedure SetButtonCaption(Form: TForm; Caption: string);
procedure HandleLoginClick(SelectForm: TForm);
procedure HandleRegisterClick(SelectForm: TForm);


implementation

uses
System.SysUtils;

procedure SetLoginSelected(Value: Boolean);
begin
  GlobalData.LoginSelected := Value;
end;

procedure SetButtonCaption(Form: TForm; Caption: string);
var
Btn: TButton;
begin
  Btn := Form.FindComponent('btnAction') as TButton;
  if Assigned(Btn) then
  begin
    Btn.Caption := Caption;
  end;
end;

procedure HandleLoginClick(SelectForm: TForm);
begin
  SetLoginSelected(True);
  SelectForm.ModalResult := 1;//Nastavení na 1 (mrLogin)
end;

procedure HandleRegisterClick(SelectForm: TForm);
begin
  SetLoginSelected(False);
  SelectForm.ModalResult := 2;//Nastavení na 2 (mrRegister)
end;

function GetCurrentTime: string;
begin
  Result := FormatDateTime('dd.mm.yyyy hh:mm:ss', Now);
end;
end.
