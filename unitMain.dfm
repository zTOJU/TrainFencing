object frmMain: TfrmMain
  Left = 179
  Top = 123
  Width = 818
  Height = 100
  Caption = 'Menu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnParticipant: TButton
    Left = 168
    Top = 16
    Width = 146
    Height = 25
    Caption = 'Teilnehmer'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Montserrat'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnParticipantClick
  end
  object btnInformation: TButton
    Left = 8
    Top = 16
    Width = 146
    Height = 25
    Caption = 'Informationen'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Montserrat'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnInformationClick
  end
  object btnRounds: TButton
    Left = 328
    Top = 16
    Width = 146
    Height = 25
    Caption = 'Runden'#252'bersicht'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Montserrat'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnRoundsClick
  end
  object btnKO: TButton
    Left = 488
    Top = 16
    Width = 146
    Height = 25
    Caption = 'Direktausscheidung'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Montserrat'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnKOClick
  end
  object btnResults: TButton
    Left = 648
    Top = 16
    Width = 146
    Height = 25
    Caption = 'Platzierung'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Montserrat'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnResultsClick
  end
end
