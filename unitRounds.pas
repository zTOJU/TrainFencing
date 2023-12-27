unit unitRounds;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TfrmRounds = class(TForm)
    sgRound: TStringGrid;
    editMResult: TEdit;
    btnMResult: TButton;
    rbtnWin: TRadioButton;
    rbtnLoose: TRadioButton;
    procedure sgRoundDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure btnMResultClick(Sender: TObject);
    procedure editMResultKeyPress(Sender: TObject; var Key: Char);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmRounds: TfrmRounds;

implementation

uses unitInformation;

{$R *.dfm}

procedure TfrmRounds.sgRoundDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var text : String;
begin
  text := sgRound.Cells[ACol, ARow];

  if text = 'xxx'
    then begin
      sgRound.Canvas.Brush.Color := clBlack;
      sgRound.Canvas.FillRect(Rect);
    end
  else if (Length(text) <> 0) and (text[1] = 'V')
    then begin
      sgRound.Canvas.Brush.Color := RGB(94, 219, 128);
      sgRound.Canvas.FillRect(Rect);
      sgRound.Canvas.Font.Color := clWhite;
      sgRound.Canvas.TextOut(Rect.Left+2, Rect.Top+2, text);
    end
  else if (Length(text) <> 0) and (text[1] = 'D')
    then begin
      sgRound.Canvas.Brush.Color := RGB(219, 94, 94);
      sgRound.Canvas.FillRect(Rect);
      sgRound.Canvas.Font.Color := clWhite;
      sgRound.Canvas.TextOut(Rect.Left+2, Rect.Top+2, text);
    end;
end;

procedure TfrmRounds.FormShow(Sender: TObject);
var i : Integer;
begin
  if sgRound.RowCount < 3
    then begin
      sgRound.ColWidths[0] := 150;

      // Add names
      for i:=0 to frmInformation.listNames.Count - 1
        do begin
          sgRound.Cells[0, i+1] := IntToStr(i+1) + ' ' + frmInformation.listNames.Items[i];
          sgRound.Cells[i+1, 0] := IntToStr(i+1);
          if i > 0
            then begin
              sgRound.RowCount := sgRound.RowCount + 1;
              sgRound.ColCount := sgRound.ColCount + 1;
            end;
          end;

        // Add empty matches
        for i:=1 to sgRound.RowCount
          do sgRound.Cells[i,i] := 'xxx';
    end;
end;

procedure TfrmRounds.btnMResultClick(Sender: TObject);
var mResult : String;
    winLoosePrefix : String;
begin
  mResult := editMResult.Text;

  if (rbtnWin.Checked = false) and (rbtnLoose.Checked = false)
    then ShowMessage('Bitte w�hle Sieg (V) oder Niederlage (D) aus!')
  else if rbtnWin.Checked
    then winLoosePrefix := 'V'
  else if rbtnLoose.Checked
    then winLoosePrefix := 'D';

  // Double check if the result is legal
  if (Length(mResult) = 1) and (sgRound.Col <> sgRound.Row) and (winLoosePrefix <> '')
    then begin
      // TODO: Check if there is already a other result for this opp and D5?
      sgRound.Cells[sgRound.Col, sgRound.Row] := winLoosePrefix + mResult;
    end
    else ShowMessage('Ung�ltiges Ergebnis oder kein Feld ausgew�hlt!');
end;

procedure TfrmRounds.editMResultKeyPress(Sender: TObject; var Key: Char);
begin
  // Allow only numbers between 0-5 and backspace
  if not (Key in ['0'..'5', #8])
    then Key := #0
  else if (Key in ['0'..'5']) and (Length(editMResult.Text) >= 1)
    then Key := #0;
end;

end.
