unit unitInformation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmInformation = class(TForm)
    Titel: TLabel;
    Titel2: TLabel;
    Button1: TButton;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmInformation: TfrmInformation;

implementation

{$R *.dfm}

end.