program TrainFencing;

uses
  Forms,
  unitMain in 'unitMain.pas' {frmMain},
  unitStart in 'unitStart.pas' {frmStart},
  unitParticipant in 'unitParticipant.pas' {frmParticipant},
  unitRounds in 'unitRounds.pas' {frmRounds},
  unitResults in 'unitResults.pas' {frmResults},
  unitPrint in 'unitPrint.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'TrainFencing';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmStart, frmStart);
  Application.CreateForm(TfrmParticipant, frmParticipant);
  Application.CreateForm(TfrmRounds, frmRounds);
  Application.CreateForm(TfrmResults, frmResults);
  Application.Run;
end.
