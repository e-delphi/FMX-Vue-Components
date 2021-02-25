// Eduardo - 25/02/2021
unit Vue.Utils;

interface

uses
  System.UITypes;

function RGB(R, G, B: Byte; A: Byte = 255): TAlphaColor;

implementation

function RGB(R, G, B: Byte; A: Byte = 255): TAlphaColor;
begin
  TAlphaColorRec(Result).R := R;
  TAlphaColorRec(Result).G := G;
  TAlphaColorRec(Result).B := B;
  TAlphaColorRec(Result).A := A;
end;

end.
