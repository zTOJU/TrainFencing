object frmStart: TfrmStart
  Left = 179
  Top = 220
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Start'
  ClientHeight = 465
  ClientWidth = 802
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Titel1: TLabel
    Left = 371
    Top = 24
    Width = 401
    Height = 22
    Caption = 'Organisationsprogramm f'#252'r Trainingswettk'#228'mpfe'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Montserrat'
    Font.Style = []
    ParentFont = False
  end
  object labNameCount: TLabel
    Left = 380
    Top = 432
    Width = 55
    Height = 15
    Caption = 'Gesamt: 0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Montserrat'
    Font.Style = []
    ParentFont = False
  end
  object Titel: TLabel
    Left = 16
    Top = 8
    Width = 331
    Height = 66
    Caption = 'TrainFencing'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Montserrat Medium'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 368
    Top = 48
    Width = 377
    Height = 22
    Caption = 'im Fechten (Entwickelt von Thore Korte  A24-1)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Montserrat'
    Font.Style = []
    ParentFont = False
  end
  object listNames: TListBox
    Left = 284
    Top = 176
    Width = 249
    Height = 215
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Montserrat'
    Font.Style = []
    ItemHeight = 15
    ParentFont = False
    TabOrder = 0
  end
  object editName: TEdit
    Left = 284
    Top = 112
    Width = 249
    Height = 23
    Hint = 'Name des Teilnehmers'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Montserrat'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnAddName: TButton
    Left = 284
    Top = 144
    Width = 125
    Height = 25
    Caption = 'Hinzuf'#252'gen'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Montserrat'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnAddNameClick
  end
  object btnDelName: TButton
    Left = 408
    Top = 144
    Width = 125
    Height = 25
    Caption = 'L'#246'schen'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Montserrat'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnDelNameClick
  end
  object btnSubmitNames: TButton
    Left = 284
    Top = 400
    Width = 249
    Height = 25
    Caption = 'Best'#228'tigen'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Montserrat'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnSubmitNamesClick
  end
end
