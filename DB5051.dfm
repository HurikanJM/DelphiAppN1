object Form8: TForm8
  Left = 0
  Top = 0
  Caption = 'Form8'
  ClientHeight = 367
  ClientWidth = 561
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 51
    Top = 8
    Width = 93
    Height = 13
    Caption = 'P'#345'ipojen'#237' k DB50/51'
  end
  object lstDataDB50: TListBox
    Left = 191
    Top = 40
    Width = 339
    Height = 289
    ItemHeight = 13
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 8
    Top = 40
    Width = 177
    Height = 289
    TabOrder = 1
    object Label4: TLabel
      Left = 64
      Top = 109
      Width = 27
      Height = 13
      Caption = 'Po'#269'et'
    end
    object Label3: TLabel
      Left = 56
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Adresa od'
    end
    object Label2: TLabel
      Left = 32
      Top = 55
      Width = 104
      Height = 13
      Caption = 'Z'#225'pis hodnoty do PLC'
    end
    object adressSpin50: TSpinEdit
      Left = 24
      Top = 27
      Width = 121
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object PocetDB: TSpinEdit
      Left = 24
      Top = 128
      Width = 121
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
    object edtWriteValue: TSpinEdit
      Left = 24
      Top = 81
      Width = 121
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
    object checkTrvaleCteni: TCheckBox
      Left = 32
      Top = 254
      Width = 97
      Height = 17
      Caption = 'Trval'#233' '#269'ten'#237
      TabOrder = 3
      OnClick = checkTrvaleCteniClick
    end
  end
  object ComIsOK: TPanel
    Left = 368
    Top = 8
    Width = 185
    Height = 26
    Color = clGrayText
    ParentBackground = False
    TabOrder = 2
    object ComIsOKLabel: TLabel
      Left = 1
      Top = 1
      Width = 183
      Height = 24
      Align = alClient
      Alignment = taCenter
      Caption = 'Komunikace OK?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 136
      ExplicitHeight = 19
    end
  end
  object ResetList: TButton
    Left = 143
    Top = 290
    Width = 26
    Height = 25
    TabOrder = 3
    OnClick = ResetListClick
  end
  object CtiPoleByte: TBitBtn
    Left = 8
    Top = 196
    Width = 75
    Height = 25
    Caption = 'CtiPoleByte'
    TabOrder = 4
    OnClick = CtiPoleByteClick
  end
  object CtiPoleWord: TBitBtn
    Left = 8
    Top = 227
    Width = 75
    Height = 25
    Caption = 'CtiPoleWord'
    TabOrder = 5
    OnClick = CtiPoleWordClick
  end
  object CtiPoleDWBtn: TBitBtn
    Left = 8
    Top = 258
    Width = 75
    Height = 25
    Caption = 'CtiPoleDW'
    TabOrder = 6
    OnClick = CtiPoleDWBtnClick
  end
  object ZapisPoleByte: TBitBtn
    Left = 89
    Top = 196
    Width = 80
    Height = 25
    Caption = 'ZapisPoleByte'
    TabOrder = 7
  end
  object ZapisPoleWord: TBitBtn
    Left = 89
    Top = 227
    Width = 80
    Height = 25
    Caption = 'ZapisPoleWord'
    TabOrder = 8
  end
  object ZapisPoleDWBtn: TBitBtn
    Left = 89
    Top = 258
    Width = 80
    Height = 25
    Caption = 'ZapisPoleDWBtn'
    TabOrder = 9
  end
  object rbDB50: TRadioButton
    Left = 8
    Top = 342
    Width = 113
    Height = 17
    Caption = 'DB50'
    TabOrder = 10
    OnClick = rbDB50Click
  end
  object rbDB51: TRadioButton
    Left = 120
    Top = 342
    Width = 113
    Height = 17
    Caption = 'DB51'
    TabOrder = 11
    OnClick = rbDB51Click
  end
  object TimerDB50: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TimerDB50Timer
    Left = 240
  end
end
