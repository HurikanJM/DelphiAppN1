object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 541
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 541
    Align = alClient
    TabOrder = 0
    object ListView1: TListView
      Left = 144
      Top = 24
      Width = 410
      Height = 449
      Columns = <>
      TabOrder = 0
    end
    object ButtonAdd: TBitBtn
      Left = 153
      Top = 492
      Width = 75
      Height = 25
      Caption = 'ButtonAdd'
      TabOrder = 1
      OnClick = ButtonAddClick
    end
    object ButtonDelete: TBitBtn
      Left = 234
      Top = 492
      Width = 75
      Height = 25
      Caption = 'ButtonDelete'
      TabOrder = 2
      OnClick = ButtonDeleteClick
    end
    object TreeView1: TTreeView
      Left = 40
      Top = 176
      Width = 121
      Height = 97
      Indent = 19
      TabOrder = 3
      OnClick = TreeView1Click
    end
    object EditTask: TEdit
      Left = 17
      Top = 400
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'EditTask'
    end
  end
end
