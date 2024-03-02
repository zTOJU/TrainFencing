unit unitRounds;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Printers;

procedure generateRound(data : TStrings);

type
  TfrmRounds = class(TForm)
    sgRound: TStringGrid;
    editMResult: TEdit;
    btnMResult: TButton;
    rbtnWin: TRadioButton;
    rbtnLoose: TRadioButton;
    btnEndRound: TButton;
    btnDelResult: TButton;
    btnPrint: TButton;
    cbPrinters: TComboBox;
    procedure sgRoundDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnMResultClick(Sender: TObject);
    procedure editMResultKeyPress(Sender: TObject; var Key: Char);
    procedure btnEndRoundClick(Sender: TObject);
    procedure btnDelResultClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbPrintersDropDown(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmRounds: TfrmRounds;

implementation

uses unitInformation, unitMain, unitResults, unitPrint;

{$R *.dfm}

// Draw results (cells)
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

// Generate round overview
procedure generateRound(data : TStrings);
var i : Integer;
begin
  frmRounds.sgRound.ColWidths[0] := 150;

  // Add names
  frmRounds.sgRound.RowCount := data.Count + 1;
  frmRounds.sgRound.ColCount := data.Count + 1;
  for i := 0 to data.Count - 1
    do begin
      frmRounds.sgRound.Cells[0, i+1] := IntToStr(i+1) + ' ' + data[i];
      frmRounds.sgRound.Cells[i+1, 0] := IntToStr(i+1); 
    end;

  // Add empty matches
  for i := 1 to frmRounds.sgRound.RowCount
    do frmRounds.sgRound.Cells[i, i] := 'xxx';
end;

// Add new result
procedure TfrmRounds.btnMResultClick(Sender: TObject);
var mResult : String;
    winLoosePrefix : String;
    sameResult : Boolean;
begin
  mResult := editMResult.Text;
  sameResult := false;

  // Choose V (win) or D (loose)
  if (rbtnWin.Checked = false) and (rbtnLoose.Checked = false)
    then ShowMessage('Bitte w�hle Sieg (V) oder Niederlage (D) aus!')
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
        then ShowMessage('Bei einer Niederlage k�nnen nur maximal vier Treffer erzielt worden sein.')
      // Check sameResult
      else if sameResult
        then ShowMessage('Du hast bereits an zugeh�riger Stelle den gleichen Ausgang (Sieg bzw. Niederlage) des Gefechts eingetragen.')
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
  else ShowMessage('Ung�ltiges Ergebnis oder kein Feld ausgew�hlt.');
end;

// Allow only numbers between 0-5 and backspace
procedure TfrmRounds.editMResultKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'5', #8])
    then Key := #0
  else if (Key in ['0'..'5']) and (Length(editMResult.Text) >= 1)
    then Key := #0;
end;

// Delete result
procedure TfrmRounds.btnDelResultClick(Sender: TObject);
begin
  if sgRound.Cells[sgRound.Col, sgRound.Row][1] <> 'x'
    then sgRound.Cells[sgRound.Col, sgRound.Row] := ''
    else ShowMessage('Kein g�ltiges Feld ausgew�hlt.');
end;

// End Round and calc results
procedure TfrmRounds.btnEndRoundClick(Sender: TObject);
var x,y : Integer;
    emptyMatches : Integer;

    results : Array of TRoundResult;
    tempName : String;
    iName, iResult : Integer;
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
      btnDelResult.Hide;
      btnEndRound.Hide;

      // Get data (calc index)
      SetLength(results, sgRound.RowCount - 1);
      for iName := 0 to High(results)
        do begin
          tempName := sgRound.Cells[0, iName + 1];
          results[iName].name := Copy(tempName, 3, length(tempName));
          for iResult := 1 to sgRound.ColCount - 1 // + points
            do if sgRound.Cells[iResult, iName+1][1] <> 'x'
              then results[iName].index := results[iName].index + StrToInt(sgRound.Cells[iResult, iName+1][2]);
          for iResult := 1 to sgRound.RowCount - 1 // - points
            do if sgRound.Cells[iName+1, iResult][1] <> 'x'
              then results[iName].index := results[iName].index - StrToInt(sgRound.Cells[iName+1, iResult][2]);
        end;

      // Generate result list & allow result tab
      unitResults.generateList(results);
      unitMain.setTabStatus(3, true);
    end
    else ShowMessage('Es fehlen noch ' + IntToStr(emptyMatches) + ' Ergebnisse!');
end;

// Add printers and select "Microsoft Print to PDF" as default
procedure TfrmRounds.FormCreate(Sender: TObject);
begin
  cbPrinters.Items := Printer.Printers;
  cbPrinters.ItemIndex := cbPrinters.Items.IndexOf('Microsoft Print to PDF');
end;

// Reload printers
procedure TfrmRounds.cbPrintersDropDown(Sender: TObject);
begin
  cbPrinters.Items := Printer.Printers;
end;

// Print round
procedure TfrmRounds.btnPrintClick(Sender: TObject);
begin
  unitPrint.printRound(cbPrinters.ItemIndex, sgRound);
end;

end.
