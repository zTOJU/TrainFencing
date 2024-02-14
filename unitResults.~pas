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
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmResults: TfrmResults;

implementation

{$R *.dfm}

procedure TfrmResults.FormShow(Sender: TObject);
begin
  // Init StringGrid
  sgResults.Cells[0, 0] := 'Name';
  sgResults.Cells[1, 0] := 'Index';
  sgResults.ColWidths[0] := 600;
  sgResults.ColWidths[1] := 164;
end;

procedure generateList(data : Array of TRoundResult);
var i : Integer;
begin
  // Sort
  

  // Fill list
  for i:=0 to High(data)
    do begin
      frmResults.sgResults.Cells[0, i+1] := IntToStr(i+1) + '. ' + data[i].name;
      frmResults.sgResults.Cells[1, i+1] := IntToStr(data[i].index);
      if i > 0
        then frmResults.sgResults.RowCount := frmResults.sgResults.RowCount + 1;
    end;
end;

end.
