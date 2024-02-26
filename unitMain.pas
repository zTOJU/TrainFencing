unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

procedure setTabStatus(tab:Integer; status:Boolean);

type
  TfrmMain = class(TForm)
    btnParticipant: TButton;
    btnInformation: TButton;
    btnRounds: TButton;
    btnResults: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnParticipantClick(Sender: TObject);
    procedure btnInformationClick(Sender: TObject);
    procedure btnRoundsClick(Sender: TObject);
    procedure btnResultsClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

  // Declaration of all custom data types
  TTab = Record
    form : TForm;
    status : Boolean;
  end;

  TRoundResult = Record
    name : String;
    index : Integer;
  end;

var
  frmMain: TfrmMain;
  Tabs : Array[0..3] of TTab;
  currentTab : Integer;

implementation

uses unitInformation, unitParticipant, unitRounds, unitResults;

{$R *.dfm}

{
  Start:              0
  Teilnehmer:         1
  Rundenübersicht:    2
  Platzierung:        3
}

// Check if switching to a new tab is allowed
function allowTab(tab: Integer):Boolean;
begin
  Result := Tabs[tab].status;
end;

// Enable/Disable switching to a tab
procedure setTabStatus(tab: Integer; status: Boolean);
begin
  Tabs[tab].status := status;
end;

// Switch to another tab
procedure changeTab(newTab: Integer);
begin
  if allowTab(newTab) then
    begin
      Tabs[currentTab].form.Hide;
      Tabs[newTab].form.Show;
      currentTab := newTab;
    end
  else ShowMessage('Kein Zugriff aktuell!');
end;

// Init
procedure TfrmMain.FormShow(Sender: TObject);
begin
  Tabs[0].form := frmInformation;
  setTabStatus(0, true);
  Tabs[1].form := frmParticipant;
  setTabStatus(1, false);
  Tabs[2].form := frmRounds;
  setTabStatus(2, false);
  Tabs[3].form := frmResults;
  setTabStatus(3, false);

  changeTab(0);
end;

// Tab Buttons
procedure TfrmMain.btnInformationClick(Sender: TObject);
begin
  changeTab(0);
end;

procedure TfrmMain.btnParticipantClick(Sender: TObject);
begin
  changeTab(1);
end;

procedure TfrmMain.btnRoundsClick(Sender: TObject);
begin
  changeTab(2);
end;

procedure TfrmMain.btnResultsClick(Sender: TObject);
begin
  changeTab(3);
end;

end.
