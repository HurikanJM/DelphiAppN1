object Form11: TForm11
  Left = 0
  Top = 0
  Caption = 'Form11'
  ClientHeight = 437
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 348
    Height = 437
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 56
      Top = 120
      Width = 241
      Height = 185
      Color = clSilver
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 20
        Top = 45
        Width = 86
        Height = 13
        Caption = 'U'#382'ivatelsk'#233' jm'#233'no'
      end
      object Label2: TLabel
        Left = 80
        Top = 72
        Width = 26
        Height = 13
        Caption = 'Heslo'
      end
      object edtUsername: TEdit
        Left = 112
        Top = 42
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'edtUsername'
      end
      object edtPassword: TEdit
        Left = 112
        Top = 69
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'edtPassword'
      end
      object btnAction: TButton
        Left = 126
        Top = 119
        Width = 75
        Height = 25
        Caption = 'btnAction'
        Default = True
        TabOrder = 2
        OnClick = btnActionClick
      end
      object btnRegister: TButton
        Left = 126
        Top = 96
        Width = 75
        Height = 25
        Caption = 'Registrovat'
        TabOrder = 3
        OnClick = btnRegisterClick
      end
    end
  end
end
