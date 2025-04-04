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
// Uložení nastavení z permGrid do GlobalData nebo jiného zdroje
  // Zde mùžete pøidat kód pro zpracování dat z permGrid
  // a uložení do promìnných v GlobalData nebo do souboru.

  // Pøíklad: Uložení hodnot z permGrid do promìnných
  for i := 0 to permGrid.RowCount - 1 do
  begin
    // Zde mùžete pøidat logiku pro zpracování dat z každého øádku
    // Napøíklad:
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
  // Nastavení permGrid
  permGrid.ColCount := 4;  // Poèet sloupcù
  permGrid.RowCount := 30; // Poèet øádkù pro nastavení

  // Nastavení záhlaví sloupcù
  permGrid.Cells[0, 0] := 'Èíslo';
  permGrid.Cells[1, 0] := 'Popis';
  permGrid.Cells[2, 0] := 'Hodnota';
  permGrid.Cells[3, 0] := 'Buttony';

  // Nastavení dat pro permGrid (pøíklad)
  for i := 1 to permGrid.RowCount - 1 do
  begin
    permGrid.Cells[0, i] := IntToStr(i); // Èíslo položky
  end;

  permGrid.Cells[1, 1] := 'Povolení Timeru v Main.pas';
  permGrid.Cells[2, 1] := '1'; // Výchozí hodnota
  permGrid.Cells[3, 1] := 'Povolit'; // Text tlaèítka
  permGrid.Cells[1, 2] := 'Interval Timeru v Main.pas';
  permGrid.Cells[2, 2] := '1000'; // Výchozí hodnota

  //Nastavení pevných šíøek sloupcù
  permGrid.Columns[0].Width := 50; // èíslo
  permGrid.Columns[1].Width := 250; // popis
  permGrid.Columns[2].Width := 150; // hodnota
  permGrid.Columns[3].Width := 80; // Buttony
  //zakázání zmìny velikosti sloupcù
end;


end.
