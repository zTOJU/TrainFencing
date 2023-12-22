unit unitInformation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmInformation = class(TForm)
    Titel: TLabel;
    Titel2: TLabel;
    listNames: TListBox;
    editName: TEdit;
    btnAddName: TButton;
    btnDelName: TButton;
    labNameCount: TLabel;
    btnSubmitNames: TButton;
    procedure btnAddNameClick(Sender: TObject);
    procedure btnDelNameClick(Sender: TObject);
    procedure btnSubmitNamesClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmInformation: TfrmInformation;
  nameCount : Integer;
  roundSize : Integer;

implementation

uses unitMain, unitParticipant;

{$R *.dfm}

procedure TfrmInformation.btnAddNameClick(Sender: TObject);
begin
  if Length(editName.Text) > 0
    then begin
      listNames.Items.Add(editName.Text);
      editName.Text := '';
      nameCount := nameCount + 1;
      labNameCount.Caption := 'Gesamt: ' + IntToStr(nameCount);
    end;
end;

procedure TfrmInformation.btnDelNameClick(Sender: TObject);
begin
  if listNames.ItemIndex > -1
    then begin
      listNames.Items.Delete(listNames.ItemIndex);
      nameCount := nameCount - 1;
      labNameCount.Caption := 'Gesamt: ' + IntToStr(nameCount);
      end
    else ShowMessage('Bitte erst einen Namen auswählen!');
end;

procedure TfrmInformation.btnSubmitNamesClick(Sender: TObject);
var i : Integer;
begin
  if listNames.Count > 1
    then begin
      editName.Hide;
      btnAddName.Hide;
      btnDelName.Hide;
      btnSubmitNames.Hide;

      case nameCount of
        2,4 : roundSize := 2;
        3,5,6 : roundSize := 3;
        7,8 : roundSize := 4;
        9,10 : roundSize := 5;
        11,12 : roundSize := 6;
        13..99 : roundSize := 7;
      end;
      labNameCount.Caption := labNameCount.Caption + ' (Rundengröße: ' + IntToStr(roundSize) + ')';
      unitMain.setTabStatus(1, true);

      for i:=0 to nameCount - 1
        do begin
          frmParticipant.sgNames.Cells[0, i] := frmInformation.listNames.Items[i];
          if i > 0
            then frmParticipant.sgNames.RowCount := frmParticipant.sgNames.RowCount + 1;
        end;
    end
    else ShowMessage('Bitte füge erst mindestens 2 Namen hinzu!');
end;

end.
