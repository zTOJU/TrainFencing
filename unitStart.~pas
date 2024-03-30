unit unitStart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmStart = class(TForm)
    labTitel1: TLabel;
    listNames: TListBox;
    editName: TEdit;
    btnAddName: TButton;
    btnDelName: TButton;
    labNameCount: TLabel;
    btnSubmitNames: TButton;
    labTitel: TLabel;
    labTitel2: TLabel;
    procedure btnAddNameClick(Sender: TObject);
    procedure btnDelNameClick(Sender: TObject);
    procedure btnSubmitNamesClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmStart: TfrmStart;
  nameCount : Integer;

implementation

uses unitMain, unitParticipant, unitRounds;

{$R *.dfm}

{
  AddName
    description:
      Add new name
}
procedure TfrmStart.btnAddNameClick(Sender: TObject);
var i : Integer;
begin
  // Check if the text field isn't empty
  if Length(editName.Text) > 0
    then begin
      // Check if the name already exists
      for i := 0 to listNames.Items.Count - 1
        do begin
          if listNames.Items[i] = editName.Text
            then begin
              ShowMessage('You have already added this name!');
              editName.Text := '';
              Exit;
            end;
        end;

      // If the name doesn't exist, add it
      listNames.Items.Add(editName.Text);
      editName.Text := '';
      Inc(nameCount);
      labNameCount.Caption := 'Total: ' + IntToStr(nameCount);
    end
  else ShowMessage('Please enter a name first!');
end;

{
  DelName
    description:
      Delete selected name
}
procedure TfrmStart.btnDelNameClick(Sender: TObject);
begin
  if listNames.ItemIndex > -1
    then begin
      listNames.Items.Delete(listNames.ItemIndex);
      Dec(nameCount);
      labNameCount.Caption := 'Total: ' + IntToStr(nameCount);
      end
    else ShowMessage('Please select a name first!');
end;

{
  SubmitNames
    description:
      Hide name list and create participants list and rounds
}
procedure TfrmStart.btnSubmitNamesClick(Sender: TObject);
begin
  if listNames.Count > 1
    then begin
      // Hide old elements
      editName.Hide;
      btnAddName.Hide;
      btnDelName.Hide;
      btnSubmitNames.Hide;
      listNames.Hide;
      labNameCount.Hide;

      // Create participants list
      unitParticipant.generateList(frmStart.listNames.Items);
      unitMain.setTabStatus(1, true);

      // Create rounds
      unitRounds.generateRound(frmStart.listNames.Items);
      unitMain.setTabStatus(2, true);
    end
    else ShowMessage('Please add at least two names first!');
end;

end.
