unit unitPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

procedure print();

implementation

procedure print();
begin
  ShowMessage('test print');
end;

end.
