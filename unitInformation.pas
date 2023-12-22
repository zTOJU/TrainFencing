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
    Label1: TLabel;
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
  RoundSize : Integer;

implementation

{$R *.dfm}

procedure TfrmInformation.btnAddNameClick(Sender: TObject);
begin
  if Length(editName.Text) > 0
    then begin
      listNames.Items.Add(editName.Text);
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
begin
  if listNames.Count > 1
    then begin
      editName.Hide;
      btnAddName.Hide;
      btnDelName.Hide;
      btnSubmitNames.Hide;

      case nameCount of
        2 : Label1.Caption := '2er Runden';
        3 : Label1.Caption := '3er Runden';
      end;
    end
    else ShowMessage('Bitte füge erst mindestens 2 Namen hinzu!');
end;

end.
