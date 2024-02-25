unit unitParticipant;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

procedure generateList(data : TStrings);

type
  TfrmParticipant = class(TForm)
    sgNames: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmParticipant: TfrmParticipant;

implementation

{$R *.dfm}

procedure TfrmParticipant.FormCreate(Sender: TObject);
begin
  sgNames.Cells[0, 0] := 'Name';
end;

procedure generateList(data : TStrings);
var i : Integer;
begin
  // Fill list
  frmParticipant.sgNames.RowCount := data.Count + 1;
  for i := 1 to data.Count
    do frmParticipant.sgNames.Cells[0, i] := IntToStr(i) + '. ' + data[i-1];
end;

end.
