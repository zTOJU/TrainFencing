unit unitResults;

interface

// Already defined unitMain here to use my custom data types and make the generateList func accessible from anywhere
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, unitMain;

procedure generateList(data : Array of TRoundResult);

type
  TfrmResults = class(TForm)
    sgResults: TStringGrid;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmResults: TfrmResults;

implementation

{$R *.dfm}

// Generate results list
procedure generateList(data : Array of TRoundResult);
var iSort, jSort, iList : Integer;
    tempData : TRoundResult;
begin
  // Init StringGrid
  frmResults.sgResults.Cells[0, 0] := 'Name';
  frmResults.sgResults.Cells[1, 0] := 'Index';
  frmResults.sgResults.ColWidths[0] := 600;
  frmResults.sgResults.ColWidths[1] := 164;

  // Sort (Bubble-Sort algorithm)
  for iSort := High(data) downto Low(data) + 1
    do for jSort := Low(data) to iSort - 1
      do if data[jSort].index < data[jSort + 1].index
          then begin
            tempData := data[jSort];
            data[jSort] := data[jSort + 1];
            data[jSort + 1] := tempData;
          end;

  // Fill list
  frmResults.sgResults.RowCount := High(data) + 2;
  for iList := 0 to High(data)
    do begin
      frmResults.sgResults.Cells[0, iList+1] := IntToStr(iList+1) + '. ' + data[iList].name;
      frmResults.sgResults.Cells[1, iList+1] := IntToStr(data[iList].index);
    end;
end;

end.
