// Eduardo - 28/02/2021
unit Vue.Tooltip;

interface

uses
  FMX.Controls,
  System.Classes,
  Vue.Tooltip.Base,
  // Styles
  Vue.Tooltip.Style0;

type
  TVueTooltip = class(TControl)
  private
    FFrame: TVueTooltipBase;
    FStyle: Integer;
    FCaption: String;
    function GetCaption: String;
    procedure SetCaption(const Value: String);
    procedure SetStyle(const Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Show; override;
    procedure Hide; override;
  published
    property Align;
    property Anchors;
    property Position;
    property Width;
    property Height;
    property Size;
    property Caption: String read GetCaption write SetCaption;
    property Style: Integer read FStyle write SetStyle;
  end;

implementation

{ TVueTooltip }

constructor TVueTooltip.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Style  := 0;
  Width  := 80;
  Height := 30;
end;

destructor TVueTooltip.Destroy;
begin
  FFrame.Free;
  inherited;
end;

function TVueTooltip.GetCaption: String;
begin
  Result := FCaption;
end;

procedure TVueTooltip.SetCaption(const Value: String);
begin
  FCaption := Value;
  FFrame.Caption := Value;
end;

procedure TVueTooltip.Show;
begin
  FFrame.Show;
end;

procedure TVueTooltip.Hide;
begin
  FFrame.Hide;
end;

procedure TVueTooltip.SetStyle(const Value: Integer);
begin
  FStyle := Value;

  if Assigned(FFrame) then
    FFrame.Free;

  FFrame := TVueTooltipBase(TVueTooltipBase.VueTooltipStyle(Value).Create).Create(Self);
  FFrame.Stored := False;
  Self.AddObject(FFrame);

  FFrame.Caption := FCaption;
end;

end.
