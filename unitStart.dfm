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
  object Titel: TLabel
    Left = 147
    Top = 24
    Width = 528
    Height = 29
    Caption = 'Organisationsprogramm f'#252'r Trainingswettk'#228'mpfe im Fechten'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object Titel2: TLabel
    Left = 306
    Top = 56
    Width = 205
    Height = 20
    Caption = 'Entwickelt von Thore Korte (A24-1)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object labNameCount: TLabel
    Left = 380
    Top = 408
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
  object listNames: TListBox
    Left = 284
    Top = 150
    Width = 249
    Height = 249
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
    Top = 120
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
    Left = 544
    Top = 120
    Width = 75
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
    Left = 544
    Top = 152
    Width = 75
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
    Left = 544
    Top = 184
    Width = 75
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