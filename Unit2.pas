unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  VclTee.TeeGDIPlus, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus,
  VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.ValEdit, Vcl.Menus, Vcl.PlatformDefaultStyleActnCtrls,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, VCLTee.Series,
  NiceGrid, Data.DB, VCLTee.TeeData, Dialog, Settings;

type
  TForm4 = class(TForm)
    Bevel1: TBevel;
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Panel3: TPanel;
    ActionManager1: TActionManager;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action7: TAction;
    Action6: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    ZvetsitGraf: TAction;
    ZmensitGraf: TAction;
    Action15: TAction;
    Action16: TAction;
    Action17: TAction;
    ImageList1: TImageList;
    ActionToolBar1: TActionToolBar;
    ActionToolBar2: TActionToolBar;
    Chart1: TChart;
    NiceGrid1: TNiceGrid;
    Image1: TImage;
    DateTimePicker1: TDateTimePicker;
    MonthCalendar1: TMonthCalendar;
    Time: TStaticText;
    Bevel10: TBevel;
    Panel4: TPanel;
    Bevel11: TBevel;
    ZmenitGraf: TBitBtn;
    ChartDataSet1: TChartDataSet;
    Chart2: TChart;
    AktuTimer: TTimer;
    Chart3: TChart;
    procedure ZmensitGrafExecute(Sender: TObject);
    procedure ZvetsitGrafExecute(Sender: TObject);
 //   procedure Action8Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  //  procedure Exit(Sender: TObject);
    procedure NiceGridCellChange(Sender: TObject; Col, Row: Integer;
      var Str: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action17Execute(Sender: TObject);
    procedure Action16Execute(Sender: TObject);
    procedure NicerGrid1DrawCell(Sender: TObject; ACanvas: TCanvas; X,
      Y: Integer; Rc: TRect; var Handled: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure Action10Execute(Sender: TObject);
    procedure NiceGrid1DrawGutter(Sender: TObject; ACanvas: TCanvas; Rc: TRect;
      Str: string; var Handled: Boolean);
    procedure Action8Execute(Sender: TObject);
    procedure ZmenitGrafClick(Sender: TObject);
    procedure AktuTimerTimer(Sender: TObject);
    procedure Action12Execute(Sender: TObject);
    procedure Action11Execute(Sender: TObject);
  //  procedure NiceGrid1Click(Sender: TObject);
  private
    { Private declarations }
    Series: TPieSeries;
 //   FCurrentChartType: Integer;
    procedure UpdateChart; // aktualizace po zmìnì v ValueListEdit
    procedure UpdateBarChart2;
    //  procedure ValueListEditor1Change(Sender: TObject);
    //  procedure SaveDataToFile;
    procedure WMUpdateChart(var Message: TMessage); message WM_USER + 1;
    function CalculateColumnWidth(ColumnIndex: Integer): Integer;
  //  procedure UpdatePieChart;
  //  procedure UpdateBarChart;
  //  procedure UpdateLineChart;
  //  procedure UpdateChartType(ChartType: Integer); // Slouží jako informace který graf je v Unit2 zobrazený a podle toho se nastavuji RadioButton v Dialog
  public
    { Public declarations }
  //  PieSeries: TPieSeries;
  //  BarSeries: TBarSeries;
  //  LineSeries: TLineSeries;

  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses
Main, System.IOUtils, GlobalData, GlobalProc;

const
  WM_UPDATE_CHART = WM_USER + 1;
  RIGHT_MARGIN = 10; // Velikost pravého okraje TNiceGrid
  CHART_PIE = 1;
  CHART_BAR = 2;
  CHART_LINE = 3;

//DataFilePath = 'data.txt';  // poté pøesunout do global


     {
procedure TForm4.Action8Execute(Sender: TObject);
begin
if Chart1.SeriesCount > 0 then
  begin
  // Chart1.Series.Clear; nefunguje nevím proè ?
  Chart1.Repaint;
  end;
end;
    }

procedure TForm4.UpdateBarChart2;      // Pøidal jsem i Chart3 jsem
var
i: Integer;
Name, ValueStr: string;
ValueDouble: Double;
begin
 try
   Chart2.Series[0].Clear;
   Chart3.Series[0].Clear;
   for i := 0 to NiceGrid1.RowCount - 1 do
     begin
       Name := NiceGrid1.Cells[0,i];
       ValueStr := NiceGrid1.Cells[1,i];
      // ShowMessage('Name: ' + Name + ', ValueStr: ' + ValueStr); // Ladicí výpis
       if TryStrToFloat(ValueStr, ValueDouble) then
       begin
       //ShowMessage('ValueDouble: ' + FloatToStr(ValueDouble)); // Ladicí výpis
       Chart2.Series[0].AddXY(i,ValueDouble, Name);
       Chart3.Series[0].AddXY(i,ValueDouble, Name);
       end
       else
       ShowMessage('Neplatná hodnota: ' + ValueStr);
     end;
     Chart2.Repaint;
     Chart3.Repaint;
     except
     on E: Exception do
     ShowMessage('Chyba: ' +E.Message);
 end;
end;

procedure TForm4.Action10Execute(Sender: TObject);
begin
//Viditelnost grafu
end;

procedure TForm4.Action11Execute(Sender: TObject);
begin
// Nastavení neboli výbìr z možností pøepnutí dat z TNiceGrid

end;

procedure TForm4.Action12Execute(Sender: TObject);
var
SettingsForm:TForm13;
begin
// Ovládací Panel
SettingsForm := TForm13.Create(Self);

end;

procedure TForm4.Action16Execute(Sender: TObject);
begin
  //Info

end;

procedure TForm4.Action17Execute(Sender: TObject);
begin
 Close;
end;

procedure TForm4.Action8Execute(Sender: TObject);
begin
// Vymazání dat z TNiceGridu
ShowMessage('Vymazání z Gridu');
end;

procedure TForm4.AktuTimerTimer(Sender: TObject);
begin
 AktuTimer.Enabled := False;
 UpdateChart;
 UpdateBarChart2;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
MainForm.FormUnit2Instance := nil;
end;

procedure TForm4.UpdateChart;

var
i: Integer;
Name, ValueStr: string;
ValueDouble, Total: Double;
begin
 try
 if Series = nil then

  begin
  ShowMessage('Nepodaøilo se vytvoøit TPieSeries');
  raise Exception.Create('Ukonèiji proceduru');
  end;
 Series.Clear;
 Total := 0;
 for i := 0 to NiceGrid1.RowCount - 1 do // Procházíme øádky NiceGrid1
  begin
    try
    Name := NiceGrid1.Cells[0, i]; // Název ze sloupce 0
    ValueStr := NiceGrid1.Cells[1, i]; // Hodnota ze sloupce 1
    if TryStrToFloat(ValueStr, ValueDouble) then
      begin
      Series.Add(ValueDouble, Name);
      Total := Total+ValueDouble;
      end
    else
      begin
      //  ShowMessage('Neplatná hodnota v NiceGrid1: ' + ValueStr);
      Raise Exception.Create('Ukonèuji proceduru');
      end;
    except
    on E: Exception do
    //ShowMessage('Chyba pøi zpracování øádku ' + IntToStr(i) + ': ' + E.Message);
    end;

  end;

  if Total > 100 then
  begin
  ShowMessage('Souèet hodnot nesmí pøesáhnout 100');
  Series.Clear;
  end
  else if Total < 100 then
  begin
  Series.Add(100 - Total, 'Prázdný');
  end;
  Series.PercentFormat := '0.0%';
  Series.Marks.Visible := true;
  Series.Marks.Style := smsPercent;
  Chart1.Repaint;
  except
  on E: Exception do
  ShowMessage('Chyba: ' + E.Message);
  end;

end;

function TForm4.CalculateColumnWidth(ColumnIndex: Integer):Integer; // Výstup pøidán
var
Canvas: TCanvas;
TextWidth: Integer;
Lines: TStringList;
Line: string;
MaxWidth: Integer;
i: Integer;
begin
 Canvas := Self.Canvas;
 Canvas.Font := NiceGrid1.Font;
 Lines := TStringList.Create;
 try
   Lines.Delimiter := '|';
   Lines.DelimitedText := NiceGrid1.Columns[ColumnIndex].Title;
   MaxWidth :=0;
   for i := 0 to Lines.Count - 1 do
     begin
      TextWidth := Canvas.TextWidth(Lines[i]);
      if TextWidth > MaxWidth then
      begin
        MaxWidth := TextWidth;
      end;
     end;
     Result := MaxWidth + 10; // +10 je pøidání malého okraje
 finally
  Lines.Free;
 end;
end;

procedure TForm4.FormCreate(Sender: TObject);
var
FileList: TStringList;
FilePath: string;
i: Integer;
ColumnWidth: Integer; // Pro nastavení .Title šíøka
SL : TStringList;
Line: string;
PosPipe: Integer;
TextPart, ValuePart: string;

begin
  Time.Alignment := taCenter; // Horizontální zarovnání na støed
 // Time.Layout := tlCenter; // Vertikální zarovnání na støed
 // FCurrentChartType := 1; // Výchozí typ grafu Koláèový
 // UpdateChartType(FCurrentChartType);
 // GrafInfo:=CHART_PIE; // Výchozí hodnota je koláèový graf
//  UpdateChartType(GrafInfo);

// Inic Chart2
 // Chart2.Parent := Self;
  Chart2.AddSeries(TBarSeries.Create(Chart2));
  Chart3.AddSeries(TBarSeries.Create(Chart3));
  Chart3.Visible := False;
  Chart2.Visible := False;
  Chart1.Visible := True;
  NiceGrid1.TabStop := false;
  NiceGrid1.Width := GridWidth;
  NiceGrid1.Height := GridHeight;
  NiceGrid1.HeaderLine := 2; // Pro nadpis
  //NiceGrid1.RowCount := 10; // Nastavíme poèet øádkù
  NiceGrid1.ColCount := 2; // Nastavíme poèet sloupcù
  NiceGrid1.Columns[0].Title := 'Graf|Text';
  NiceGrid1.Columns[1].Title := 'Graf|Hodnoty[%]';
 {
  NiceGrid1.Cells[0, 0] := 'Segment 1';
  NiceGrid1.Cells[1, 0] := '20';
  NiceGrid1.Cells[0, 1] := 'Segment 2';
  NiceGrid1.Cells[1, 1] := '40';
  NiceGrid1.Cells[0, 2] := 'Segment 3';
  NiceGrid1.Cells[1, 2] := '35';
  NiceGrid1.Cells[0, 3] := 'Segment 4';
  NiceGrid1.Cells[1, 3] := '5';
    }

  // Naètení dat z TXT
  SL := TStringList.Create;
  try
    SL.LoadFromFile(GridFilePath);
    NiceGrid1.RowCount := SL.Count;

    for i := 0 to SL.Count - 1 do
      begin
        Line := SL[i];
        PosPipe := Pos('|', Line);
        if PosPipe > 0 then
        begin
          TextPart := Copy(Line, 1, PosPipe - 1);
          ValuePart := Copy(Line, PosPipe + 1, Length(Line) - PosPipe);
          NiceGrid1.Cells[0,i] := TextPart;
          NiceGrid1.Cells[1,i] := ValuePart;
        end;
      end;
  finally
    SL.Free;
  end;

  //Nastavení šíøky sloupcù na základì šíøky textu
  ColumnWidth := (GridWidth - RIGHT_MARGIN) div NiceGrid1.ColCount;
  for i := 0 to NiceGrid1.ColCount - 1 do
    begin
      NiceGrid1.Columns[i].Width := ColumnWidth;
    end;

  // Nastavení zarovnání textu na støed pro sloupec s hodnotami
 // NiceGrid1.Columns[1].Alignment := taCenter;

  Series := TPieSeries.Create(Chart1);
  Series.ParentChart := Chart1;
  UpdateChart;
  UpdateBarChart2;
end;



procedure TForm4.NiceGrid1DrawGutter(Sender: TObject; ACanvas: TCanvas;
  Rc: TRect; Str: string; var Handled: Boolean);
var
Text: string;
TextWidth, TextHeight: Integer;
X,Y: Integer;
RowIndex: Integer;
begin
 //Výpoèet indexu øádku
 RowIndex := Rc.Top div NiceGrid1.DefRowHeight;

 //Vykreslení èísla øádku
 Text := IntToStr(RowIndex);
 TextWidth := ACanvas.TextWidth(Text);
 TextHeight := ACanvas.TextHeight(Text);

 X := Rc.Left + (Rc.Right - Rc.Left - TextWidth) div 2;
 Y := Rc.Top + (Rc.Bottom - Rc.Top - TextHeight) div 2;

 ACanvas.TextOut(X,Y,Text);
 Handled := True;
end;

procedure TForm4.NiceGridCellChange(Sender: TObject; Col, Row: Integer;
  var Str: string);
begin
PostMessage(Handle, WM_USER + 1, 0, 0);
UpdateBarChart2;
// Pøidáno kvùli TNiceGrid protože pøi zmìnì textu tak se nezobrazuje
//v grafu poslední znak textu z NiceGrid

//UpdateChart;
end;

procedure TForm4.NicerGrid1DrawCell(Sender: TObject; ACanvas: TCanvas; X,
  Y: Integer; Rc: TRect; var Handled: Boolean);
var
Text: string;
TextWidth: Integer;
FontSize: Integer;
ACol, ARow : Integer;
ColumnLeft, RowTop: Integer;
begin

  ACol := 0;
  ColumnLeft := 0;
  while ColumnLeft + NiceGrid1.Columns[ACol].Width < Rc.Left do
  begin
    ColumnLeft := ColumnLeft + NiceGrid1.Columns[ACol].Width;
    Inc(ACol);
  end;

  ARow := 0;
  RowTop := 0;
  while RowTop + NiceGrid1.DefRowHeight < Rc.Top do
  begin
    RowTop := RowTop + NiceGrid1.DefRowHeight;
    Inc(ARow);
  end;

   if (ACol >= 0) and (ACol < NiceGrid1.ColCount) and
     (ARow >= 0) and (ARow < NiceGrid1.RowCount) then
     begin
       Text := NiceGrid1.Cells[ACol, ARow];
       TextWidth := ACanvas.TextWidth(Text);
       FontSize := NiceGrid1.Font.Size;

       // Kontrola, zda text není dlouhý
       if TextWidth > Rc.Right - Rc.Left then
       begin
        while (TextWidth > Rc.Right - Rc.Left) and (FontSize > 6) do
         begin
         FontSize := FontSize - 1;
         ACanvas.Font.Size := FontSize;
         TextWidth := ACanvas.TextWidth(Text);
         end;
       end;

       //Zarovnání textu na støed pro druhý sloupec
       if ACol = 1 then
       begin
         ACanvas.TextRect(Rc, Text, [tfCenter, tfVerticalCenter]);
       end
       else
       begin
        ACanvas.TextRect(Rc, Text, [tfCenter, tfVerticalCenter]);     // Zarovníná do leva pro 1.Sloupec
       end;
     end;
 // Text := NiceGrid1.Cells[NiceGrid1.];
 // TextWidth := Canvas.TextWidth(Text);
//  FontSize := NiceGrid1.Font.Size;
  // Kontrola zda text není dlouhý
 // if TextWidth > Rect.Right - Rect.Left then
 // begin
    //Zmìna velikosti písma
 // end;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
 Time.Caption := GetCurrentTime;
end;

procedure TForm4.WMUpdateChart(var Message: TMessage);
begin
  UpdateChart;
  UpdateBarChart2
end;

procedure TForm4.ZmenitGrafClick(Sender: TObject);
var
DialofForm: TForm12;
SelectedValue: Integer;
begin
DialofForm := TForm12.Create(Self);
  try
//  DialofForm.SelectedChartType:= GrafInfo;
  if DialofForm.ShowModal = mrOk then
    begin
    SelectedValue := DialofForm.SelectedRadioButton;
     case SelectedValue of
        1:
        begin
          Chart1.Visible := True;
          Chart2.Visible := False;
          Chart3.Visible := False;
        end;
        2:
        begin
          Chart1.Visible := False;
          Chart2.Visible := True;
          Chart3.Visible := False;
        end;
        3:
        begin
          Chart1.Visible := False;
          Chart2.Visible := False;
          Chart3.Visible := True;
        end;
     end;
    // if SelectedValue <> GrafInfo then
    // UpdateChartType(SelectedValue);
    end;
  finally
    DialofForm.Free;
  end;
end;


procedure TForm4.ZmensitGrafExecute(Sender: TObject);
begin
  if Chart1.Visible=True then
Chart1.View3DOptions.Zoom := Chart1.View3DOptions.Zoom - 10;
 if Chart2.Visible=True then
 Chart2.View3DOptions.Zoom := Chart2.View3DOptions.Zoom - 10;
 if Chart3.Visible=True then
 Chart3.View3DOptions.Zoom := Chart3.View3DOptions.Zoom - 10;
end;



procedure TForm4.ZvetsitGrafExecute(Sender: TObject);
begin
  if Chart1.Visible=True then
Chart1.View3DOptions.Zoom := Chart1.View3DOptions.Zoom + 10;
 if Chart2.Visible=True then
 Chart2.View3DOptions.Zoom := Chart2.View3DOptions.Zoom + 10;
 if Chart3.Visible=True then
 Chart3.View3DOptions.Zoom := Chart3.View3DOptions.Zoom + 10;

end;
  {
procedure TForm4.ValueListEditor1Change(Sender: TObject);
begin
  UpdateChart;
  SaveDataToFile;
end;

procedure TForm4.SaveDataToFile;
var
i : Integer;
SL: TStringList;
begin
  SL := TStringList.Create;
  try
    for i := 0 to ValueListEditor1.Strings.Count - 1 do
      SL.Add(ValueListEditor1.Strings[i]);
      SL.SaveToFile(DataFilePath);
  finally
    SL.Free;
  end;
end;
          }
end.
