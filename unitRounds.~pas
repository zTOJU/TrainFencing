unit unitRounds;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TfrmRounds = class(TForm)
    editRoundNum: TEdit;
    btnSubmitRN: TButton;
    sgRound: TStringGrid;
    procedure btnSubmitRNClick(Sender: TObject);
    procedure sgRoundDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
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



procedure TfrmRounds.btnSubmitRNClick(Sender: TObject);
var roundNum : Integer;
    i : Integer;
begin
  roundNum := StrToInt(editRoundNum.Text);

  if roundNum > 0 // TODO: IsNumber Check??
    then begin
      sgRound.ColWidths[0] := 150;
      sgRound.Cells[0,0] := 'Runde Nr. ' + IntToStr(roundNum);

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
    end
    else ShowMessage('Diese Runde existiert nicht!');
end;

procedure TfrmRounds.sgRoundDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if sgRound.Cells[ACol, ARow] = 'xxx'
    then begin
      sgRound.Canvas.Brush.Color := clBlack;
      sgRound.Canvas.FillRect(Rect);
    end
    else begin
      sgRound.Canvas.FillRect(Rect);
      sgRound.Canvas.TextOut(Rect.Left+2, Rect.Top+2, sgRound.Cells[ACol, ARow]);
    end;
end;

end.
