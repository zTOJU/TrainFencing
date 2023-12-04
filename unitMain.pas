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
    procedure btnParticipantClick(Sender: TObject);
    procedure btnInformationClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmMain: TfrmMain;
  currentTab : TForm;

implementation

uses unitInformation, unitParticipant;

{$R *.dfm}

procedure changeTab(newTab:TForm);
begin
  if Assigned(currentTab)
    then currentTab.Hide;
  newTab.Show;
  currentTab := newTab;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  changeTab(frmInformation);
end;

procedure TfrmMain.btnInformationClick(Sender: TObject);
begin
  changeTab(frmInformation);
end;

procedure TfrmMain.btnParticipantClick(Sender: TObject);
begin
  changeTab(frmParticipant);
end;

end.
