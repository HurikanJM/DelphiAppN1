object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Hlavn'#237' Formul'#225#345
  ClientHeight = 504
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = ActivateForm
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 384
    Top = 463
    Width = 350
    Height = 41
  end
  object MenuPanel: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 41
    Align = alTop
    TabOrder = 0
    object BtnPLCCOM: TButton
      Left = 1
      Top = 1
      Width = 97
      Height = 39
      Align = alLeft
      Caption = 'PLC COM'
      TabOrder = 0
      OnClick = PLCMenu
    end
    object BtnSetting: TButton
      Left = 389
      Top = 1
      Width = 97
      Height = 39
      Align = alLeft
      Caption = 'Nastaven'#237' Prom'
      TabOrder = 1
      OnClick = NastaveniClicked
      ExplicitLeft = 292
    end
    object BtnDB: TButton
      Left = 195
      Top = 1
      Width = 97
      Height = 39
      Align = alLeft
      Caption = 'DB'
      TabOrder = 2
      OnClick = DBMenu
    end
    object BtnTest: TButton
      Left = 98
      Top = 1
      Width = 97
      Height = 39
      Align = alLeft
      Caption = 'Test'
      TabOrder = 3
      OnClick = TestMenu
    end
    object Login: TButton
      Left = 592
      Top = 0
      Width = 142
      Height = 41
      Caption = 'Login'
      TabOrder = 4
      OnClick = btnlogin
    end
    object Button2: TButton
      Left = 292
      Top = 1
      Width = 97
      Height = 39
      Align = alLeft
      Caption = 'Files'
      TabOrder = 5
      OnClick = NastaveniClicked
    end
  end
  object TimerPanel: TPanel
    Left = 0
    Top = 463
    Width = 389
    Height = 41
    Align = alCustom
    Color = clMedGray
    ParentBackground = False
    TabOrder = 1
    object Time: TLabel
      Left = 1
      Top = 7
      Width = 387
      Height = 33
      ParentCustomHint = False
      Align = alBottom
      Alignment = taCenter
      BiDiMode = bdLeftToRight
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ExplicitWidth = 8
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 734
    Height = 424
    Align = alCustom
    Color = clInactiveCaption
    ParentBackground = False
    TabOrder = 2
    object TestPripojeniKPLC: TLabel
      Left = 208
      Top = 120
      Width = 86
      Height = 13
      Caption = 'TestPripojeniKPLC'
    end
    object Button1: TButton
      Left = 8
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Zm'#283'na jazyka'
      TabOrder = 0
      OnClick = SelectLanguage
    end
  end
  object Panel2: TPanel
    Left = 395
    Top = 470
    Width = 331
    Height = 26
    Color = clMedGray
    ParentBackground = False
    TabOrder = 3
    object UName: TPanel
      Left = 117
      Top = 0
      Width = 124
      Height = 25
      TabOrder = 0
    end
    object Panel4: TPanel
      Left = 78
      Top = 0
      Width = 33
      Height = 25
      TabOrder = 1
    end
    object Panel15: TPanel
      Left = 0
      Top = 0
      Width = 33
      Height = 25
      ParentColor = True
      TabOrder = 2
    end
    object Panel6: TPanel
      Left = 39
      Top = 0
      Width = 33
      Height = 25
      TabOrder = 3
    end
  end
  object PopupMenuPLC: TPopupMenu
    Left = 536
    Top = 80
    object SNAP71: TMenuItem
      Caption = 'SNAP7'
      OnClick = Snap
    end
    object ModBus1: TMenuItem
      Caption = 'ModBus'
      OnClick = ModBus
    end
  end
  object PopupMenuTest: TPopupMenu
    Left = 592
    Top = 80
    object Unit11: TMenuItem
      Caption = 'Seznam Ukolu'
      OnClick = U1
    end
    object Unit21: TMenuItem
      Caption = 'Unit2'
      OnClick = U2
    end
    object Unit31: TMenuItem
      Caption = 'Unit3'
      OnClick = U3
    end
  end
  object PopupMenuDB: TPopupMenu
    Left = 640
    Top = 80
    object Obsah1: TMenuItem
      Caption = 'Obsah'
      OnClick = Obsah
    end
    object est1: TMenuItem
      Caption = 'Test'
      OnClick = Test
    end
    object DB50511: TMenuItem
      Caption = 'DB50/51'
      OnClick = DB505
    end
  end
  object PopupMenuFiles: TPopupMenu
    Left = 688
    Top = 80
    object Excell1: TMenuItem
      Caption = 'Excell'
      OnClick = Excel
    end
    object xt1: TMenuItem
      Caption = 'Txt'
      OnClick = Txt
    end
    object FileTest1: TMenuItem
      Caption = 'FileTest'
      OnClick = FileTest
    end
  end
  object Timer1: TTimer
    OnTimer = OnTimer
    Left = 480
    Top = 80
  end
  object ImageList1: TImageList
    Left = 520
    Top = 304
  end
  object ActionManager1: TActionManager
    Left = 216
    Top = 264
    StyleName = 'Platform Default'
  end
  object FooterTimer: TTimer
    Interval = 2000
    OnTimer = FooterTimerTimer
    Left = 344
    Top = 471
  end
end
