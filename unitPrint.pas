unit unitPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Printers;

procedure printList(printIndex : Integer; header : String; data : Array of String);

implementation

procedure printList(printIndex : Integer; header : String; data : Array of String);
var i : Integer;
begin
  Printer.PrinterIndex := printIndex;

  for i := 0 to High(data)
    do ShowMessage(data[i]);
end;

end.
