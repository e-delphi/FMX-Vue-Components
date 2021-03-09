// Eduardo - 28/02/2021
unit Vue.Checkbox.Base;

interface

uses
  System.Classes,
  System.UITypes,
  FMX.Forms;

type
  TVueCheckboxBase = class(TFrame)
  private
    class var VueCheckboxStyles: TArray<TPersistentClass>;
  protected
    function GetChecked: Boolean; virtual;
    procedure SetChecked(const Value: Boolean); virtual;
    function GetCaption: String; virtual;
    procedure SetCaption(const Value: String); virtual;
    function GetFocusColor: TAlphaColor; virtual;
    procedure SetFocusColor(const Value: TAlphaColor); virtual;
    function GetOnClick: TNotifyEvent; virtual;
    procedure SetOnClick(const Value: TNotifyEvent); virtual;
  public
    class procedure RegisterVueCheckboxStyle(FrameClass: TPersistentClass);
    class function VueCheckboxStyle(Index: Integer): TPersistentClass;
  published
    property Checked: Boolean read GetChecked write SetChecked;
    property Caption: String read GetCaption write SetCaption;
    property FocusColor: TAlphaColor read GetFocusColor write SetFocusColor;
    property OnClick: TNotifyEvent read GetOnClick write SetOnClick;
  end;

implementation

{$R *.fmx}

{ TVueCheckboxBase }

class procedure TVueCheckboxBase.RegisterVueCheckboxStyle(FrameClass: TPersistentClass);
begin
  SetLength(TVueCheckboxBase.VueCheckboxStyles, Succ(Length(TVueCheckboxBase.VueCheckboxStyles)));
  TVueCheckboxBase.VueCheckboxStyles[Pred(Length(TVueCheckboxBase.VueCheckboxStyles))] := FrameClass;
end;

class function TVueCheckboxBase.VueCheckboxStyle(Index: Integer): TPersistentClass;
begin
  if (Index > Pred(Length(TVueCheckboxBase.VueCheckboxStyles))) or (Index < 0) then
    Index := 0;
  Result := TVueCheckboxBase.VueCheckboxStyles[Index];
end;

function TVueCheckboxBase.GetChecked: Boolean;
begin
  Result := False;
end;

procedure TVueCheckboxBase.SetChecked(const Value: Boolean);
begin
end;

function TVueCheckboxBase.GetCaption: String;
begin
end;

procedure TVueCheckboxBase.SetCaption(const Value: String);
begin
end;

function TVueCheckboxBase.GetFocusColor: TAlphaColor;
begin
  Result := 0;
end;

procedure TVueCheckboxBase.SetFocusColor(const Value: TAlphaColor);
begin
end;

function TVueCheckboxBase.GetOnClick: TNotifyEvent;
begin
end;

procedure TVueCheckboxBase.SetOnClick(const Value: TNotifyEvent);
begin
end;

end.
