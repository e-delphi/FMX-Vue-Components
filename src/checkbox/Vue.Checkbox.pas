// Eduardo - 28/02/2021
unit Vue.Checkbox;

interface

uses
  FMX.Controls,
  System.Classes,
  Vue.Checkbox.Base,
  // Styles
  Vue.Checkbox.Style0;

type
  TVueCheckbox = class(TControl)
  private
    FFrame: TVueCheckboxBase;
    FStyle: Integer;
    function GetChecked: Boolean;
    procedure SetChecked(const Value: Boolean);
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
    property Checked: Boolean read GetChecked write SetChecked;
    property Caption: String read GetCaption write SetCaption;
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
end;

destructor TVueCheckbox.Destroy;
begin
  FFrame.Free;
  inherited;
end;

function TVueCheckbox.GetChecked: Boolean;
begin
  Result := FFrame.Checked
end;

procedure TVueCheckbox.SetChecked(const Value: Boolean);
begin
  FFrame.Checked := Value;
end;

function TVueCheckbox.GetCaption: String;
begin
  Result := FFrame.Caption
end;

procedure TVueCheckbox.SetCaption(const Value: String);
begin
  FFrame.Caption := Value;
end;

procedure TVueCheckbox.SetStyle(const Value: Integer);
begin
  FStyle := Value;

  if Assigned(FFrame) then
    FFrame.Free;

  FFrame := TVueCheckboxBase(TVueCheckboxBase.VueCheckboxStyle(Value).Create).Create(Self);
  FFrame.Stored := False;
  Self.AddObject(FFrame);
end;

function TVueCheckbox.GetOnClick: TNotifyEvent;
begin
  Result := FFrame.OnClick;
end;

procedure TVueCheckbox.SetOnClick(const Value: TNotifyEvent);
begin
  FFrame.OnClick := Value;
end;

end.
