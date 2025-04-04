unit Settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GlobalData, Vcl.StdCtrls, Vcl.ExtCtrls,
  NiceGrid;

type
  TForm13 = class(TForm)
    Panel1: TPanel;
    permGrid: TNiceGrid;
    Panel2: TPanel;
    BigStatic: TStaticText;
    PermStatic: TStaticText;
    Bevel2: TBevel;
    Bevel1: TBevel;
    ConStatic: TStaticText;
    ButtonSave: TButton;
   // procedure Bevel1Gesture(Sender: TObject; const EventInfo: TGestureEventInfo;
    //  var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
 //   procedure GridMouseDown(Sender: TObject; Button: TMouseButton;
 //     Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

uses
Main;


procedure TForm13.ButtonSaveClick(Sender: TObject);
var
  i: Integer;
begin
// Ulo�en� nastaven� z permGrid do GlobalData nebo jin�ho zdroje
  // Zde m��ete p�idat k�d pro zpracov�n� dat z permGrid
  // a ulo�en� do prom�nn�ch v GlobalData nebo do souboru.

  // P��klad: Ulo�en� hodnot z permGrid do prom�nn�ch
  for i := 0 to permGrid.RowCount - 1 do
  begin
    // Zde m��ete p�idat logiku pro zpracov�n� dat z ka�d�ho ��dku
    // Nap��klad:
    // GlobalData.TimerEnabled := StrToBool(permGrid.Cells[2, i]);
    // GlobalData.TimerInterval := StrToInt(permGrid.Cells[2, i]);
  end;

  ModalResult := mrOK;
end;

procedure TForm13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
MainForm.FormSettingsInstance := nil;
end;

procedure TForm13.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  // Nastaven� permGrid
  permGrid.ColCount := 4;  // Po�et sloupc�
  permGrid.RowCount := 30; // Po�et ��dk� pro nastaven�

  // Nastaven� z�hlav� sloupc�
  permGrid.Cells[0, 0] := '��slo';
  permGrid.Cells[1, 0] := 'Popis';
  permGrid.Cells[2, 0] := 'Hodnota';
  permGrid.Cells[3, 0] := 'Buttony';

  // Nastaven� dat pro permGrid (p��klad)
  for i := 1 to permGrid.RowCount - 1 do
  begin
    permGrid.Cells[0, i] := IntToStr(i); // ��slo polo�ky
  end;

  permGrid.Cells[1, 1] := 'Povolen� Timeru v Main.pas';
  permGrid.Cells[2, 1] := '1'; // V�choz� hodnota
  permGrid.Cells[3, 1] := 'Povolit'; // Text tla��tka
  permGrid.Cells[1, 2] := 'Interval Timeru v Main.pas';
  permGrid.Cells[2, 2] := '1000'; // V�choz� hodnota

  //Nastaven� pevn�ch ���ek sloupc�
  permGrid.Columns[0].Width := 50; // ��slo
  permGrid.Columns[1].Width := 250; // popis
  permGrid.Columns[2].Width := 150; // hodnota
  permGrid.Columns[3].Width := 80; // Buttony
  //zak�z�n� zm�ny velikosti sloupc�
end;


end.
