// Eduardo - 09/03/2021
unit Vue.Switch;

interface

uses
  FMX.Controls,
  System.Classes,
  System.UITypes,
  Vue.Utils,
  Vue.Switch.Base,
  // Styles
  Vue.Switch.Style0;

type
  TVueSwitch = class(TControl)
  private
    FFrame: TVueSwitchBase;
    FStyle: Integer;
    FCaption: String;
    FValue: Boolean;
    FFocusColor: TAlphaColor;
    function GetValue: Boolean;
    procedure SetValue(const Value: Boolean);
    function GetCaption: String;
    procedure SetCaption(const Value: String);
    procedure SetStyle(const Value: Integer);
    procedure SetOnChange(const Value: TNotifyEvent);
    function GetOnChange: TNotifyEvent;
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
    property Value: Boolean read GetValue write SetValue;
    property Caption: String read GetCaption write SetCaption;
    property FocusColor: TAlphaColor read FFocusColor write SetFocusColor;
    property Style: Integer read FStyle write SetStyle;
    property OnChange: TNotifyEvent read GetOnChange write SetOnChange;
  end;

implementation

{ TVueSwitch }

constructor TVueSwitch.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Style  := 0;
  Width  := 200;
  Height := 40;
  FocusColor := RGB(34, 106, 191);
end;

destructor TVueSwitch.Destroy;
begin
  FFrame.Free;
  inherited;
end;

function TVueSwitch.GetValue: Boolean;
begin
  Result := FValue;
end;

procedure TVueSwitch.SetValue(const Value: Boolean);
begin
  FValue := Value;
  FFrame.Value := Value;
end;

function TVueSwitch.GetCaption: String;
begin
  Result := FCaption;
end;

procedure TVueSwitch.SetCaption(const Value: String);
begin
  FCaption := Value;
  FFrame.Caption := Value;
end;

procedure TVueSwitch.SetFocusColor(const Value: TAlphaColor);
begin
  FFocusColor := Value;
  FFrame.FocusColor := Value;
end;

function TVueSwitch.GetOnChange: TNotifyEvent;
begin
  Result := FFrame.OnChange;
end;

procedure TVueSwitch.SetOnChange(const Value: TNotifyEvent);
begin
  FFrame.OnChange := Value;
end;

procedure TVueSwitch.SetStyle(const Value: Integer);
begin
  FStyle := Value;

  if Assigned(FFrame) then
    FFrame.Free;

  FFrame := TVueSwitchBase(TVueSwitchBase.VueSwitchStyle(Value).Create).Create(Self);
  FFrame.Stored := False;
  Self.AddObject(FFrame);

  FFrame.Value := FValue;
  FFrame.Caption := FCaption;
  FFrame.FocusColor := FFocusColor;
end;

end.
