unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TForm1 = class(TForm)
    BtnParticipant: TButton;
    BtnInformation: TButton;
    BtnRounds: TButton;
    BtnKO: TButton;
    BtnResults: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
  Form2.Show;
end;

end.
 