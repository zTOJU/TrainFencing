object frmRounds: TfrmRounds
  Left = 179
  Top = 220
  Width = 818
  Height = 504
  Caption = 'Runden'#252'bersicht'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object editRoundNum: TEdit
    Left = 16
    Top = 16
    Width = 49
    Height = 25
    TabOrder = 0
  end
  object btnSubmitRN: TButton
    Left = 72
    Top = 16
    Width = 65
    Height = 25
    Caption = #214'ffnen'
    TabOrder = 1
    OnClick = btnSubmitRNClick
  end
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
    TabOrder = 2
    OnDrawCell = sgRoundDrawCell
  end
end
