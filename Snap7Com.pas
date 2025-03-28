unit Snap7Com;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, snap7;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtIP: TEdit;
    memData: TListBox;
    BtnConnect: TButton;
    Panel1: TPanel;
    PanelOK: TPanel;
    resetMemClick: TButton;
    CheckBox1: TCheckBox;
    procedure btnConnectClick(Sender: TObject);
    procedure resetList(Sender: TObject);
    procedure CloseForm(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FClient: TS7Client;
   // MaxDB50Address: Integer;
  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

 uses
 Main, GlobalData;

procedure TForm1.btnConnectClick(Sender: TObject);
var
ErrorText: string;
begin
  if Assigned(FClient) then
  begin
    FClient.Free;
    FClient := nil;
  end;
 FClient:= TS7Client.Create;
 try
   if FClient.ConnectTo(edtIP.Text, 0, 2) = 0 then
   begin
     memData.Items.Add('Pøipojení k PLC úspìšné.');
     PanelOK.Color := clGreen;
     ConnectedToPLC := True;

     GlobalData.ConnectedToPLC:=True;
     GlobalData.PLC_IP := edtIP.Text;
     GlobalData.PLC_Rack := 0;
     GlobalData.PLC_Slot := 2;

     if CheckBox1.Checked then
     GlobalData.KeepConnection:=True
     else
     GlobalData.KeepConnection:= False;
   end
 else
  begin
    ErrorText := CliErrorText(FClient.LastError);
    memData.Items.Add('Pøipojení k PLC selhalo: ' + ErrorText);
    PanelOK.Color := clRed;
    ConnectedToPLC := False;
    KeepConnection:= False;
  end;
  except
  on E: Exception do
  memData.Items.Add('Chyba: '+ E.Message);
 end;
 //Uvolní FClient pouze v pøípadì, že bylo vytvoøeno
 if Assigned(FClient) and (not KeepConnection) then
 begin
   FClient.Free;   // Znièí komunikaci pokud není zaškrtnuté checkbox
   FClient := nil;
 end;
end;

procedure TForm1.CloseForm(Sender: TObject; var Action: TCloseAction);
begin
// test pøi zavøení
  MainForm.FormSnap7Instance := nil;
  TypeOfConnection:= True; // Pro zjištìní jaký je druh pøipojení 1 = snap 0 = modbus
  if CheckBox1.Checked then
   EnableCom := True
   else
   EnableCom := False;
end;

procedure TForm1.resetList(Sender: TObject);
begin
  memData.Items.Clear;
end;


end.
