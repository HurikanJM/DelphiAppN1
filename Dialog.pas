unit Dialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, GlobalData;

type
  TForm12 = class(TForm)
    BitBtn1: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Panel1: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    StaticText1: TStaticText;
    Bevel3: TBevel;
    Bevel5: TBevel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox1: TGroupBox;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    FSelectedChartType: Integer;
    FSelectedRadioButton: Integer;
  //  procedure SetSelectedChartType(Value: Integer);
  public
    { Public declarations }
//    property SelectedChartType: Integer read FSelectedChartType write SetSelectedChartType;
//    property SelectedRadioButton: Integer read FSelectedRadioButton write FSelectedRadioButton;
   property SelectedRadioButton: Integer read FSelectedRadioButton;
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}



procedure TForm12.BitBtn1Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  FSelectedRadioButton := 1
  else if RadioButton2.Checked then
  FSelectedRadioButton := 2
  else
  FSelectedRadioButton := 3;

  ModalResult := mrOk;
end;
 {
procedure TForm12.SetSelectedChartType(Value: Integer);
begin
  FSelectedChartType := Value;
  case Value of
    1: RadioButton1.Checked := True;
    2: RadioButton2.Checked := True;
    3: RadioButton3.Checked := True;
  end;
end;
          }
end.
