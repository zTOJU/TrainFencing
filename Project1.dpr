program Project1;

uses
  Forms,
  unitMain in 'unitMain.pas' {frmMain},
  unitInformation in 'unitInformation.pas' {frmInformation};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmInformation, frmInformation);
  Application.Run;
end.
