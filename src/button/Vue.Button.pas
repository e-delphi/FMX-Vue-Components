// Eduardo - 25/02/2021
unit Vue.Button;

interface

uses
  FMX.Controls,
  System.Classes,
  System.UITypes,
  Vue.Utils,
  Vue.Button.Base,
  // Styles
  Vue.Button.Style0,
  Vue.Button.Style1,
  Vue.Button.Style2;

type
  TVueButton = class(TControl)
  private
    FFrame: TVueButtonBase;
    FStyle: Integer;
    FCaption: String;
    FFocusColor: TAlphaColor;
    function GetCaption: String;
    procedure SetCaption(const Value: String);
    procedure SetStyle(const Value: Integer);
    procedure SetOnClick(const Value: TNotifyEvent);
    function GetOnClick: TNotifyEvent;
    procedure SetFocusColor(const Value: TAlphaColor);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Align;
    property Anchors;
    property Position;
    property Width;
    property Height;
    property Size;
    property Caption: String read GetCaption write SetCaption;
    property Style: Integer read FStyle write SetStyle;
    property FocusColor: TAlphaColor read FFocusColor write SetFocusColor;
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
  FocusColor := RGB(34, 106, 191);
end;

destructor TVueButton.Destroy;
begin
  FFrame.Free;
  inherited;
end;

function TVueButton.GetCaption: String;
begin
  Result := FCaption;
end;

procedure TVueButton.SetCaption(const Value: String);
begin
  FCaption := Value;
  FFrame.Caption := Value;
end;

procedure TVueButton.SetFocusColor(const Value: TAlphaColor);
begin
  FFocusColor := Value;
  FFrame.FocusColor := Value;
end;

function TVueButton.GetOnClick: TNotifyEvent;
begin
  Result := FFrame.OnClick;
end;

procedure TVueButton.SetOnClick(const Value: TNotifyEvent);
begin
  FFrame.OnClick := Value;
end;

procedure TVueButton.SetStyle(const Value: Integer);
begin
  FStyle := Value;

  if Assigned(FFrame) then
    FFrame.Free;

  FFrame := TVueButtonBase(TVueButtonBase.VueButtonStyle(Value).Create).Create(Self);
  FFrame.Stored := False;
  Self.AddObject(FFrame);

  FFrame.Caption := FCaption;
  FFrame.FocusColor := FFocusColor;
end;

end.
