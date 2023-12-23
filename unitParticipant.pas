unit unitParticipant;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TfrmParticipant = class(TForm)
    sgNames: TStringGrid;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmParticipant: TfrmParticipant;

implementation

{$R *.dfm}

end.
