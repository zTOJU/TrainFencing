unit unitPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Printers;

procedure printList(printIndex : Integer; header : String; data : Array of String);

implementation

procedure printList(printIndex : Integer; header : String; data : Array of String);
var i          : Integer;
    dateString : String;
begin
  // Set printer
  Printer.PrinterIndex := printIndex;

  // Get current date
  ShortDateFormat := 'dd.mm.yyyy';
  dateString := DateToStr(Date);

  Printer.BeginDoc;
  // Header
  Printer.Canvas.Font.Name := 'Times New Roman';
  Printer.Canvas.Font.Size := 30;
  Printer.Canvas.Font.Color := clBlack;
  Printer.Canvas.TextOut(300, 300, header);
  // Date
  Printer.Canvas.Font.Size := 12;
  Printer.Canvas.TextOut(Printer.PageWidth - Printer.Canvas.TextWidth(dateString) - 300, 450, dateString);
  // Line
  Printer.Canvas.Pen.Width := 5;
  Printer.Canvas.MoveTo(300, 600);
  Printer.Canvas.LineTo(Printer.PageWidth - 300, 600);
  // Participants
  Printer.Canvas.Font.Size := 12;
  for i := 0 to High(data)
    do Printer.Canvas.TextOut(350, 650 + i * 120, data[i]);
  Printer.EndDoc;
end;

end.
