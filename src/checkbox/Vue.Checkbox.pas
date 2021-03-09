// Eduardo - 28/02/2021
unit Vue.Checkbox;

interface

uses
  FMX.Controls,
  System.Classes,
  System.UITypes,
  Vue.Utils,
  Vue.Checkbox.Base,
  // Styles
  Vue.Checkbox.Style0;

type
  TVueCheckbox = class(TControl)
  private
    FFrame: TVueCheckboxBase;
    FStyle: Integer;
    FCaption: String;
    FChecked: Boolean;
    FFocusColor: TAlphaColor;
    function GetChecked: Boolean;
    procedure SetChecked(const Value: Boolean);
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
    property Checked: Boolean read GetChecked write SetChecked;
    property Caption: String read GetCaption write SetCaption;
    property FocusColor: TAlphaColor read FFocusColor write SetFocusColor;
    property Style: Integer read FStyle write SetStyle;
    property OnClick: TNotifyEvent read GetOnClick write SetOnClick;
  end;

implementation

{ TVueCheckbox }

constructor TVueCheckbox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Style  := 0;
  Width  := 200;
  Height := 40;
  FocusColor := RGB(34, 106, 191);
end;

destructor TVueCheckbox.Destroy;
begin
  FFrame.Free;
  inherited;
end;

function TVueCheckbox.GetChecked: Boolean;
begin
  Result := FChecked;
end;

procedure TVueCheckbox.SetChecked(const Value: Boolean);
begin
  FChecked := Value;
  FFrame.Checked := Value;
end;

function TVueCheckbox.GetCaption: String;
begin
  Result := FCaption;
end;

procedure TVueCheckbox.SetCaption(const Value: String);
begin
  FCaption := Value;
  FFrame.Caption := Value;
end;

procedure TVueCheckbox.SetFocusColor(const Value: TAlphaColor);
begin
  FFocusColor := Value;
  FFrame.FocusColor := Value;
end;

function TVueCheckbox.GetOnClick: TNotifyEvent;
begin
  Result := FFrame.OnClick;
end;

procedure TVueCheckbox.SetOnClick(const Value: TNotifyEvent);
begin
  FFrame.OnClick := Value;
end;

procedure TVueCheckbox.SetStyle(const Value: Integer);
begin
  FStyle := Value;

  if Assigned(FFrame) then
    FFrame.Free;

  FFrame := TVueCheckboxBase(TVueCheckboxBase.VueCheckboxStyle(Value).Create).Create(Self);
  FFrame.Stored := False;
  Self.AddObject(FFrame);

  FFrame.Checked := FChecked;
  FFrame.Caption := FCaption;
  FFrame.FocusColor := FFocusColor;
end;

end.
