unit unitParticipant;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Printers;

procedure generateList(data : TStrings);

type
  TfrmParticipant = class(TForm)
    sgNames: TStringGrid;
    btnPrint: TButton;
    cbPrinters: TComboBox;
    procedure btnPrintClick(Sender: TObject);
    procedure cbPrintersDropDown(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmParticipant: TfrmParticipant;

implementation

uses unitPrint;

{$R *.dfm}

{
  generateList
    description:
      Generate participants list
    args:
      data - List of names
}
procedure generateList(data : TStrings);
var i : Integer;
begin
  // Init StringGrid
  frmParticipant.sgNames.Cells[0, 0] := 'Name';

  // Fill list
  frmParticipant.sgNames.RowCount := data.Count + 1;
  for i := 1 to data.Count
    do frmParticipant.sgNames.Cells[0, i] := IntToStr(i) + '. ' + data[i-1];
end;

{
  frmParticipant.FormCreate
    description:
      Add printers and select "Microsoft Print to PDF" as default
}
procedure TfrmParticipant.FormCreate(Sender: TObject);
begin
  cbPrinters.Items := Printer.Printers;
  cbPrinters.ItemIndex := cbPrinters.Items.IndexOf('Microsoft Print to PDF');
end;

{
  PrintersDropDown
    description:
      Reload printers
}
procedure TfrmParticipant.cbPrintersDropDown(Sender: TObject);
begin
  cbPrinters.Items := Printer.Printers;
end;

{
  Print
    description:
      Print participants list
}
procedure TfrmParticipant.btnPrintClick(Sender: TObject);
var data : Array of String;
    i    : Integer;
begin
  // Get data
  SetLength(data, sgNames.RowCount - 1);
  for i := 0 to High(data)
    do data[i] := sgNames.Cells[0, i + 1];

  // Print
  unitPrint.printList(cbPrinters.ItemIndex, 'Participants', data);
end;

end.
