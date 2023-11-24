unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TfrmMain = class(TForm)
    btnParticipant: TButton;
    btnInformation: TButton;
    btnRounds: TButton;
    btnKO: TButton;
    btnResults: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmMain: TfrmMain;

implementation

uses unitInformation;

{$R *.dfm}

procedure TfrmMain.FormShow(Sender: TObject);
begin
  frmInformation.Show;
end;

end.
