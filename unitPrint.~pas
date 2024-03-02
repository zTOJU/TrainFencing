unit unitPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Printers;

procedure printList(printIndex : Integer; header : String; data : Array of String);
procedure printRound(printIndex : Integer; grid : TStringgrid);

implementation

procedure addHeader(header : String);
var dateString : String;
begin
  // Get current date
  ShortDateFormat := 'dd.mm.yyyy';
  dateString := DateToStr(Date);

  // Header
  Printer.Canvas.Font.Name := 'Times New Roman';
  Printer.Canvas.Font.Size := 30;
  Printer.Canvas.Font.Color := clBlack;
  Printer.Canvas.TextOut(300, 600 - Printer.Canvas.TextHeight(header), header);
  // Date
  Printer.Canvas.Font.Size := 12;
  Printer.Canvas.TextOut(Printer.PageWidth - Printer.Canvas.TextWidth(dateString) - 300, 600 - Printer.Canvas.TextHeight(dateString), dateString);
  // Line
  Printer.Canvas.Pen.Width := 5;
  Printer.Canvas.MoveTo(300, 600);
  Printer.Canvas.LineTo(Printer.PageWidth - 300, 600);
end;

procedure printList(printIndex : Integer; header : String; data : Array of String);
var i          : Integer;
    dateString : String;
begin
  // Set printer
  Printer.PrinterIndex := printIndex;

  // Get current date
  ShortDateFormat := 'dd.mm.yyyy';
  dateString := DateToStr(Date);

  // Print
  Printer.BeginDoc;
  // Header
  addHeader(header);
  // Participants
  Printer.Canvas.Font.Size := 12;
  for i := 0 to High(data)
    do Printer.Canvas.TextOut(350, 650 + i * 120, data[i]);
  Printer.EndDoc;

  // Done message
  ShowMessage(header + ' erfolgreich gedruckt!');
end;

procedure printRound(printIndex : Integer; grid : TStringgrid);
var i, j       : Integer;
    cellRect   : TRect;
    x, y, scaleFactor : Integer;
begin
  // Set printer
  Printer.PrinterIndex := printIndex;

  Printer.BeginDoc;
  // Header
  addHeader('Runde');
  // Round Settings
  Printer.Canvas.Font.Size := 25;
  Printer.Canvas.Pen.Width := 3;
  scaleFactor := 9;
  x := 350;
  y := 650;
  // Round printing
  for i := 0 to grid.ColCount - 1 do
  begin
    for j := 0 to grid.RowCount - 1 do
      begin
        // Get the rectangle of the current cell
        cellRect := grid.CellRect(i, j);

        // Scale and offset the rectangle
        cellRect.Left := Round(cellRect.Left * scaleFactor) + x;
        cellRect.Top := Round(cellRect.Top * scaleFactor) + y;
        cellRect.Right := Round(cellRect.Right * scaleFactor) + x;
        cellRect.Bottom := Round(cellRect.Bottom * scaleFactor) + y;

        // Check if it's a non-existing match
        if grid.Cells[i, j] = 'xxx'
          then begin
            Printer.Canvas.Brush.Color := clBlack;
            Printer.Canvas.FillRect(cellRect);
            Printer.Canvas.Brush.Color := clWhite;
          end
        // Overwrite already filled results
        else if (i > 0) and (j > 0)
          then begin
            Printer.Canvas.Brush.Color := clWhite;
            Printer.Canvas.FillRect(cellRect);
          end
        // Print text
        else Printer.Canvas.TextRect(cellRect, cellRect.Left + 15, cellRect.Top + 15, grid.Cells[i, j]);

        // Draw grid lines
        Printer.Canvas.MoveTo(cellRect.Left, cellRect.Top);
        Printer.Canvas.LineTo(cellRect.Right, cellRect.Top);
        Printer.Canvas.LineTo(cellRect.Right, cellRect.Bottom);
        Printer.Canvas.LineTo(cellRect.Left, cellRect.Bottom);
        Printer.Canvas.LineTo(cellRect.Left, cellRect.Top);
    end;
  end;
  Printer.EndDoc;

  // Done message
  ShowMessage('Runde erfolgreich gedruckt!');
end;

end.
