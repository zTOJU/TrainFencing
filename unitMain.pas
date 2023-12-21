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

  TTab = Record
    form : TForm;
    status : Boolean;
  end;

var
  frmMain: TfrmMain;
  Tabs : Array[0..4] of TTab;
  currentTab : TForm;

implementation

uses unitInformation, unitParticipant, unitRounds, unitKO, unitResults;

{$R *.dfm}

function allowTab(tab:TForm):Boolean;
begin

end;

procedure setTabStatus(tab:TForm; status:Boolean); // Int?ß?
begin

end;

procedure changeTab(newTab:TForm);
begin
  if Assigned(currentTab)
    then currentTab.Hide;
  newTab.Show;
  currentTab := newTab;
end;

// Init
procedure TfrmMain.FormShow(Sender: TObject);
begin
  Tabs[0].form := frmInformation;
  Tabs[1].form := frmParticipant;
  Tabs[2].form := frmRounds;
  Tabs[3].form := frmKO;
  Tabs[4].form := frmResults;

  changeTab(Tabs[0].form);
end;

// Buttons
procedure TfrmMain.btnInformationClick(Sender: TObject);
begin
  changeTab(Tabs[0].form);
end;

procedure TfrmMain.btnParticipantClick(Sender: TObject);
begin
  changeTab(Tabs[1].form);
end;

procedure TfrmMain.btnRoundsClick(Sender: TObject);
begin
  changeTab(Tabs[2].form);
end;

procedure TfrmMain.btnKOClick(Sender: TObject);
begin
  changeTab(Tabs[3].form);
end;

procedure TfrmMain.btnResultsClick(Sender: TObject);
begin
  changeTab(Tabs[4].form);
end;

end.
