program Project1;

uses
  Forms,
  unitMain in 'unitMain.pas' {frmMain},
  unitInformation in 'unitInformation.pas' {frmInformation},
  unitParticipant in 'unitParticipant.pas' {frmParticipant},
  unitRounds in 'unitRounds.pas' {frmRounds},
  unitResults in 'unitResults.pas' {frmResults},
  unitPrint in 'unitPrint.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Training competition fencing';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmInformation, frmInformation);
  Application.CreateForm(TfrmParticipant, frmParticipant);
  Application.CreateForm(TfrmRounds, frmRounds);
  Application.CreateForm(TfrmResults, frmResults);
  Application.Run;
end.
