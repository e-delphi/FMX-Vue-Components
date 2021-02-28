// Eduardo - 28/02/2021
unit Vue.Tooltip.Base;

interface

uses
  System.Classes,
  FMX.Forms;

type
  TVueTooltipBase = class(TFrame)
  private
    class var VueTooltipStyles: TArray<TPersistentClass>;
  protected
    function GetCaption: String; virtual;
    procedure SetCaption(const Value: String); virtual;
  public
    class procedure RegisterVueTooltipStyle(FrameClass: TPersistentClass);
    class function VueTooltipStyle(Index: Integer): TPersistentClass;
  published
    property Caption: String read GetCaption write SetCaption;
    procedure Show; reintroduce; virtual;
    procedure Hide; reintroduce; virtual;
  end;

implementation

{$R *.fmx}

{ TVueTooltipBase }

class procedure TVueTooltipBase.RegisterVueTooltipStyle(FrameClass: TPersistentClass);
begin
  SetLength(TVueTooltipBase.VueTooltipStyles, Succ(Length(TVueTooltipBase.VueTooltipStyles)));
  TVueTooltipBase.VueTooltipStyles[Pred(Length(TVueTooltipBase.VueTooltipStyles))] := FrameClass;
end;

class function TVueTooltipBase.VueTooltipStyle(Index: Integer): TPersistentClass;
begin
  if (Index > Pred(Length(TVueTooltipBase.VueTooltipStyles))) or (Index < 0) then
    Index := 0;
  Result := TVueTooltipBase.VueTooltipStyles[Index];
end;

function TVueTooltipBase.GetCaption: String;
begin
end;

procedure TVueTooltipBase.SetCaption(const Value: String);
begin
end;

procedure TVueTooltipBase.Show;
begin
end;

procedure TVueTooltipBase.Hide;
begin
end;

end.
