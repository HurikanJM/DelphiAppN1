program Project1;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  Snap7Com in 'Snap7Com.pas' {Form1},
  ModBusCom in 'ModBusCom.pas' {Form2},
  Unit1 in 'Unit1.pas' {Form3},
  Unit2 in 'Unit2.pas' {Form4},
  Unit3 in 'Unit3.pas' {Form5},
  Obsah in 'Obsah.pas' {Form6},
  Test in 'Test.pas' {Form7},
  DB5051 in 'DB5051.pas' {Form8},
  Ext in 'Ext.pas' {Form9},
  Txt in 'Txt.pas' {Form10},
  snap7 in 'snap7.pas',
  GlobalData in 'GlobalData.pas',
  Log in 'Log.pas' {Form11},
  GlobalProc in 'GlobalProc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.
