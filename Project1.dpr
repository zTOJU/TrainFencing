program Project1;

uses
  Forms,
  unitMain in 'unitMain.pas' {frmMain},
  unitInformation in 'unitInformation.pas' {frmInformation},
  unitParticipant in 'unitParticipant.pas' {frmParticipant},
  unitRounds in 'unitRounds.pas' {frmRounds},
  unitResults in 'unitResults.pas' {frmResults};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmInformation, frmInformation);
  Application.CreateForm(TfrmParticipant, frmParticipant);
  Application.CreateForm(TfrmRounds, frmRounds);
  Application.CreateForm(TfrmResults, frmResults);
  Application.Run;
end.
