object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Form13'
  ClientHeight = 537
  ClientWidth = 641
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
    Width = 641
    Height = 537
    Align = alClient
    TabOrder = 0
    object permGrid: TNiceGrid
      Left = 16
      Top = 82
      Width = 553
      Height = 439
      Cursor = 101
      ColCount = 0
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -11
      HeaderFont.Name = 'Tahoma'
      HeaderFont.Style = []
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      Columns = <>
      GutterFont.Charset = DEFAULT_CHARSET
      GutterFont.Color = clWindowText
      GutterFont.Height = -11
      GutterFont.Name = 'Tahoma'
      GutterFont.Style = []
      ShowFooter = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 16
      Top = 16
      Width = 617
      Height = 41
      TabOrder = 1
      object Bevel2: TBevel
        Left = 576
        Top = 0
        Width = 34
        Height = 34
      end
      object Bevel1: TBevel
        Left = 536
        Top = 0
        Width = 34
        Height = 34
      end
      object BigStatic: TStaticText
        Left = 8
        Top = 8
        Width = 45
        Height = 17
        Caption = 'BigStatic'
        TabOrder = 0
      end
      object PermStatic: TStaticText
        Left = 536
        Top = 8
        Width = 34
        Height = 17
        Caption = 'StaticText1'
        TabOrder = 1
      end
      object ConStatic: TStaticText
        Left = 576
        Top = 8
        Width = 35
        Height = 17
        Caption = 'StaticText1'
        TabOrder = 2
      end
    end
  end
  object ButtonSave: TButton
    Left = 144
    Top = 51
    Width = 75
    Height = 25
    Caption = 'ButtonSave'
    TabOrder = 1
    OnClick = ButtonSaveClick
  end
end
