object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 513
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = CloseForm
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 382
    Height = 513
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 30
      Width = 57
      Height = 13
      Caption = 'IP ADRESA:'
    end
    object edtIP: TEdit
      Left = 112
      Top = 27
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'edtIP'
    end
    object memData: TListBox
      Left = 32
      Top = 64
      Width = 313
      Height = 97
      ItemHeight = 13
      TabOrder = 1
    end
    object BtnConnect: TButton
      Left = 239
      Top = 25
      Width = 75
      Height = 25
      Caption = 'P'#345'ipojit'
      TabOrder = 2
      OnClick = btnConnectClick
    end
    object resetMemClick: TButton
      Left = 320
      Top = 25
      Width = 25
      Height = 25
      TabOrder = 3
      OnClick = resetList
    end
    object CheckBox1: TCheckBox
      Left = 32
      Top = 232
      Width = 105
      Height = 17
      Caption = 'Ponechat Spojen'#237
      TabOrder = 4
    end
  end
  object PanelOK: TPanel
    Left = 32
    Top = 184
    Width = 313
    Height = 25
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
  end
end
