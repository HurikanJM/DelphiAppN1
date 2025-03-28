unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, GlobalData;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    ListView1: TListView;
    ButtonAdd: TBitBtn;
    ButtonDelete: TBitBtn;
    TreeView1: TTreeView;
    EditTask: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoadTasks;
    procedure SaveTasks;
    function GetTasksForDate(DateStr: string): TStringList;
    procedure DisplayTasks(DateStr: string);
    function FindNodeByText(Node: TTreeNode; Text: string): TTreeNode; // TTreeNode je jen v novìjších proto si jí tady dávám sám
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
 uses
 Main;
{$R *.dfm}

procedure TForm3.ButtonAddClick(Sender: TObject);
var
DateStr: string;
Tasks: TStringList;
begin
  if TreeView1.Selected = nil then Exit;
  DateStr := TreeView1.Selected.Text;
  Tasks := GetTasksForDate(DateStr);
  Tasks.Add(EditTask.Text);
  EditTask.Clear;
  DisplayTasks(DateStr);
end;

procedure TForm3.ButtonDeleteClick(Sender: TObject);
var
DateStr: string;
begin
  if ListView1.Selected = nil then Exit;
  if TreeView1.Selected = nil then Exit;
  DateStr := TreeView1.Selected.Text;
  GetTasksForDate(DateStr).Delete(ListView1.Selected.Index);
  DisplayTasks(DateStr);
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
MainForm.FormUnit1Instance := nil;
SaveTasks;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
LoadTasks;
end;

procedure TForm3.TreeView1Click(Sender: TObject);
begin
if TreeView1.Selected = nil then Exit;
DisplayTasks(TreeView1.Selected.Text);
end;

procedure TForm3.LoadTasks;
var
TasksFile: TextFile;
Line: string;
DateStr, TaskStr: string;
DateNode: TTreeNode;
begin
  if not FileExists(taskSoubor) then Exit;
  AssignFile(TasksFile, taskSoubor);
  Reset(TasksFile);
  while not Eof(TasksFile) do
  begin
    Readln(TasksFile, Line);
    if Pos('|', Line) > 0 then
    begin
      DateStr := Copy(Line, 1, Pos('|', Line) -1);
      TaskStr := Copy(Line, Pos('|', Line) +1, Length(Line));
      DateNode := FindNodeByText(nil, DateStr);
      if DateNode = nil then
      begin
        DateNode := TreeView1.Items.Add(nil, DateStr);
      end;
      GetTasksForDate(DateStr).Add(TaskStr);
    end;
  end;
  CloseFile(TasksFile);
end;

procedure TForm3.SaveTasks;
var
TasksFile: TextFile;
DateNode: TTreeNode;
Tasks: TStringList;
i: Integer;
begin
  AssignFile(TasksFile, taskSoubor);
  Rewrite(TasksFile);
  DateNode := TreeView1.Items.GetFirstNode;
  while DateNode <> nil do
  begin
    Tasks := GetTasksForDate(DateNode.Text);
    for i := 0 to Tasks.Count - 1 do
      begin
        Writeln(TasksFile, DateNode.Text + '|' + Tasks[i]);
      end;
      DateNode := DateNode.GetNext; // GetNextSibling neexistuje ve starší verzi delphi
  end;
  CloseFile(TasksFile);
end;
function TForm3.GetTasksForDate(DateStr: string): TStringList;
var
DateNode: TTreeNode;
begin
  DateNode := FindNodeByText(nil, DateStr);
  if DateNode = nil then
  begin
    DateNode := TreeView1.Items.Add(nil, DateStr);
  end;
  if DateNode.Data = nil then
  begin
    DateNode.Data := TStringList.Create;
  end;
  Result := TStringList(DateNode.Data);
end;

procedure TForm3.DisplayTasks(DateStr: string);
var
Tasks: TStringList;
i: Integer;
Item: TListItem;
begin
ListView1.Items.Clear;
Tasks := GetTasksForDate(DateStr);
for i := 0 to Tasks.Count - 1 do
  begin
    Item := ListView1.Items.Add;
    Item.Caption := Tasks[i];
  end;
end;

function TForm3.FindNodeByText(Node: TTreeNode; Text: string): TTreeNode;
var
i: Integer;
ChildNode: TTreeNode;
begin
  if Node = nil then
  begin
    for i := 0 to TreeView1.Items.Count - 1 do
      begin
        ChildNode := TreeView1.Items[i];
        if ChildNode.Text = Text then
        begin
          Result := ChildNode;
          Exit;
        end;
      end;
  end
  else
  begin
    ChildNode := Node.getFirstChild;
    while ChildNode <> nil do
    begin
      if ChildNode.Text = Text then
      begin
      Result := ChildNode;
      Exit;
      end;
    ChildNode := ChildNode.GetNext;
    end;
  Result := nil;
  end;
end;



end.
