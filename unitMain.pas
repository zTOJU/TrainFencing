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
    procedure btnRoundsClick(Sender: TObject);
    procedure btnKOClick(Sender: TObject);
    procedure btnResultsClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmMain: TfrmMain;
  currentTab : TForm;

implementation

uses unitInformation, unitParticipant, unitRounds, unitKO, unitResults;

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

procedure TfrmMain.btnRoundsClick(Sender: TObject);
begin
  changeTab(frmRounds);
end;

procedure TfrmMain.btnKOClick(Sender: TObject);
begin
  changeTab(frmKO);
end;

procedure TfrmMain.btnResultsClick(Sender: TObject);
begin
  changeTab(frmResults);
end;

end.