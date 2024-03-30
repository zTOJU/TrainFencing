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
  object labTitel1: TLabel
    Left = 416
    Top = 18
    Width = 328
    Height = 18
    Caption = 'Organization for training competitions in fencing'
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
    Width = 34
    Height = 14
    Caption = 'Total: 0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Montserrat'
    Font.Style = []
    ParentFont = False
  end
  object labTitel: TLabel
    Left = 40
    Top = 8
    Width = 298
    Height = 56
    Caption = 'TrainFencing'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Montserrat Medium'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labTitel2: TLabel
    Left = 416
    Top = 42
    Width = 282
    Height = 18
    Caption = '(Developed by https://github.com/zTOJU)'
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
    ItemHeight = 14
    ParentFont = False
    TabOrder = 0
  end
  object editName: TEdit
    Left = 284
    Top = 112
    Width = 249
    Height = 22
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
    Caption = 'Add'
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
    Caption = 'Delete'
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
    Caption = 'Submit'
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
