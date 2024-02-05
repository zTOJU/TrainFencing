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
    btnEndRound: TButton;
    procedure sgRoundDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure btnMResultClick(Sender: TObject);
    procedure editMResultKeyPress(Sender: TObject; var Key: Char);
    procedure btnEndRoundClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmRounds: TfrmRounds;

implementation

uses unitInformation, unitMain;

{$R *.dfm}

procedure TfrmRounds.sgRoundDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var text : String;
begin
  text := sgRound.Cells[ACol, ARow];

  // Draw empty matches
  if text = 'xxx'
    then begin
      sgRound.Canvas.Brush.Color := clBlack;
      sgRound.Canvas.FillRect(Rect);
    end
  // Draw wins
  else if (Length(text) <> 0) and (text[1] = 'V')
    then begin
      sgRound.Canvas.Brush.Color := RGB(94, 219, 128);
      sgRound.Canvas.FillRect(Rect);
      sgRound.Canvas.Font.Color := clWhite;
      sgRound.Canvas.TextOut(Rect.Left+2, Rect.Top+2, text);
    end
  // Draw looses
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
    sameResult : Boolean;
begin
  mResult := editMResult.Text;
  sameResult := false;

  // Choose V (win) or D (loose)
  if (rbtnWin.Checked = false) and (rbtnLoose.Checked = false)
    then ShowMessage('Bitte wähle Sieg (V) oder Niederlage (D) aus!')
  else if rbtnWin.Checked
    then winLoosePrefix := 'V'
  else if rbtnLoose.Checked
    then winLoosePrefix := 'D';

  // Double check if the result is legal (1 num, not non-existing match, set wLprefix)
  if (Length(mResult) = 1) and (sgRound.Col <> sgRound.Row) and (winLoosePrefix <> '')
    then begin
      // Check if there is already a other result for this opponent (maybe not the best way)
      if length(sgRound.Cells[sgRound.Row, sgRound.Col]) > 0
        then if sgRound.Cells[sgRound.Row, sgRound.Col][1] = winLoosePrefix
            then sameResult := true;

      // Check if D > 4 (not possible result)
      if (winLoosePrefix[1] = 'D') and (StrToInt(mResult) > 4)
        then ShowMessage('Bei einer Niederlage können nur maximal vier Treffer erzielt worden sein.')
      // Check sameResult
      else if sameResult
        then ShowMessage('Du hast bereits an zugehöriger Stelle den gleichen Ausgang (Sieg bzw. Niederlage) des Gefechts eingetragen.')
      // Check if D result > V Result
      else if (winLoosePrefix[1] = 'D') and (length(sgRound.Cells[sgRound.Row, sgRound.Col]) > 0)
        then if StrToInt(mResult) > StrToInt(sgRound.Cells[sgRound.Row, sgRound.Col][2])
          then ShowMessage('Der Fechter, der verloren hat, kann nicht mehr Treffer als der Gewinner erzielt haben.')
          else sgRound.Cells[sgRound.Col, sgRound.Row] := winLoosePrefix + mResult
      // Check if V result < D Result
      else if (winLoosePrefix[1] = 'V') and (length(sgRound.Cells[sgRound.Row, sgRound.Col]) > 0)
        then if StrToInt(mResult) < StrToInt(sgRound.Cells[sgRound.Row, sgRound.Col][2])
          then ShowMessage('Der Fechter, der gewonnen hat, kann nicht weniger Treffer als der Verlierer erzielt haben.')
          else sgRound.Cells[sgRound.Col, sgRound.Row] := winLoosePrefix + mResult
      // Set result (final step)
      else sgRound.Cells[sgRound.Col, sgRound.Row] := winLoosePrefix + mResult;
    end
  else ShowMessage('Ungültiges Ergebnis oder kein Feld ausgewählt.');
end;

procedure TfrmRounds.editMResultKeyPress(Sender: TObject; var Key: Char);
begin
  // Allow only numbers between 0-5 and backspace
  if not (Key in ['0'..'5', #8])
    then Key := #0
  else if (Key in ['0'..'5']) and (Length(editMResult.Text) >= 1)
    then Key := #0;
end;

procedure TfrmRounds.btnEndRoundClick(Sender: TObject);
var x,y : Integer;
    emptyMatches : Integer;
begin
  emptyMatches := 0;
  // Check if all results are entered
  for x:=1 to sgRound.ColCount - 1
    do for y:=1 to sgRound.RowCount - 1
      do if sgRound.Cells[x,y] = ''
        then Inc(emptyMatches);

  if emptyMatches = 0
    then begin
      // Hide unneeded elements
      rbtnWin.Hide;
      rbtnLoose.Hide;
      editMResult.Hide;
      btnMResult.Hide;
      btnEndRound.Hide;

      // Allow all tabs
      unitMain.setTabStatus(3, true);
      unitMain.setTabStatus(4, true);
    end
    else ShowMessage('Es fehlen noch ' + IntToStr(emptyMatches) + ' Ergebnisse!');
end;

end.
