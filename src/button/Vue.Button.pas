// Eduardo - 25/02/2021
unit Vue.Button;

interface

uses
  FMX.Controls,
  System.Classes,
  Vue.Button.Base,
  // Styles
  Vue.Button.Style0;

type
  TVueButton = class(TControl)
  private
    FFrame: TVueButtonBase;
    FStyle: Integer;
    function GetCaption: String;
    procedure SetCaption(const Value: String);
    procedure SetStyle(const Value: Integer);
    procedure SetOnClick(const Value: TNotifyEvent);
    function GetOnClick: TNotifyEvent;
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
    property OnClick: TNotifyEvent read GetOnClick write SetOnClick;
  end;

implementation

{ TVueButton }

constructor TVueButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Style  := 0;
  Width  := 100;
  Height := 42;
end;

destructor TVueButton.Destroy;
begin
  FFrame.Free;
  inherited;
end;

function TVueButton.GetCaption: String;
begin
  Result := FFrame.Caption
end;

procedure TVueButton.SetCaption(const Value: String);
begin
  FFrame.Caption := Value;
end;

procedure TVueButton.SetStyle(const Value: Integer);
begin
  FStyle := Value;

  if Assigned(FFrame) then
    FFrame.Free;

  FFrame := TVueButtonBase(TVueButtonBase.VueButtonStyle(Value).Create).Create(Self);
  FFrame.Stored := False;
  Self.AddObject(FFrame);
end;

function TVueButton.GetOnClick: TNotifyEvent;
begin
  Result := FFrame.OnClick;
end;

procedure TVueButton.SetOnClick(const Value: TNotifyEvent);
begin
  FFrame.OnClick := Value;
end;

end.
