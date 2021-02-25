// Eduardo - 25/02/2021
unit Vue.Text;

interface

uses
  FMX.Controls,
  System.Classes,
  Vue.Text.Base,
  // Styles
  Vue.Text.Style0,
  Vue.Text.Style1,
  Vue.Text.Style2,
  Vue.Text.Style3;

type
  TVueText = class(TControl)
  private
    FFrame: TVueTextBase;
    FStyle: Integer;
    function GetCaption: String;
    procedure SetCaption(const Value: String);
    procedure SetStyle(const Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Align;
    property Position;
    property Width;
    property Height;
    property Size;
    property Caption: String read GetCaption write SetCaption;
    property Style: Integer read FStyle write SetStyle;
  end;

implementation

{ TVueText }

constructor TVueText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Style  := 0;
  Width  := 350;
  Height := 50;
end;

destructor TVueText.Destroy;
begin
  FFrame.Free;
  inherited;
end;

function TVueText.GetCaption: String;
begin
  Result := FFrame.Caption
end;

procedure TVueText.SetCaption(const Value: String);
begin
  FFrame.Caption := Value;
end;

procedure TVueText.SetStyle(const Value: Integer);
begin
  FStyle := Value;

  if Assigned(FFrame) then
    FFrame.Free;

  FFrame := TVueTextBase(TVueTextBase.VueTextStyle(Value).Create).Create(Self);
  FFrame.Stored := False;
  Self.AddObject(FFrame);
end;

end.
