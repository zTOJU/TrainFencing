object frmRounds: TfrmRounds
  Left = 179
  Top = 220
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Runden'#252'bersicht'
  ClientHeight = 465
  ClientWidth = 802
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sgRound: TStringGrid
    Left = 16
    Top = 56
    Width = 769
    Height = 393
    ColCount = 2
    DefaultColWidth = 30
    DefaultRowHeight = 30
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnDrawCell = sgRoundDrawCell
  end
  object editMResult: TEdit
    Left = 48
    Top = 16
    Width = 33
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyPress = editMResultKeyPress
  end
  object btnMResult: TButton
    Left = 88
    Top = 16
    Width = 75
    Height = 33
    Caption = 'Eintragen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnMResultClick
  end
  object rbtnWin: TRadioButton
    Left = 16
    Top = 16
    Width = 33
    Height = 17
    Caption = 'V'
    TabOrder = 3
  end
  object rbtnLoose: TRadioButton
    Left = 16
    Top = 32
    Width = 33
    Height = 17
    Caption = 'D'
    TabOrder = 4
  end
  object btnEndRound: TButton
    Left = 248
    Top = 16
    Width = 137
    Height = 33
    Caption = 'Runde beenden'
    TabOrder = 5
    OnClick = btnEndRoundClick
  end
  object btnDelResult: TButton
    Left = 168
    Top = 16
    Width = 75
    Height = 33
    Caption = 'L'#246'schen'
    TabOrder = 6
    OnClick = btnDelResultClick
  end
  object btnPrint: TButton
    Left = 392
    Top = 16
    Width = 137
    Height = 33
    Caption = 'Drucken'
    TabOrder = 7
    OnClick = btnPrintClick
  end
  object cbPrinters: TComboBox
    Left = 536
    Top = 16
    Width = 249
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 25
    ParentFont = False
    TabOrder = 8
    Text = 'cbPrinters'
    OnDropDown = cbPrintersDropDown
  end
end
