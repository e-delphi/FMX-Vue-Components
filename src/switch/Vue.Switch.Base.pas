// Eduardo - 09/03/2021
unit Vue.Switch.Base;

interface

uses
  System.Classes,
  System.UITypes,
  FMX.Forms;

type
  TVueSwitchBase = class(TFrame)
  private
    class var VueSwitchStyles: TArray<TPersistentClass>;
  protected
    function GetValue: Boolean; virtual;
    procedure SetValue(const Value: Boolean); virtual;
    function GetCaption: String; virtual;
    procedure SetCaption(const Value: String); virtual;
    function GetFocusColor: TAlphaColor; virtual;
    procedure SetFocusColor(const Value: TAlphaColor); virtual;
    function GetOnChange: TNotifyEvent; virtual;
    procedure SetOnChange(const Value: TNotifyEvent); virtual;
  public
    class procedure RegisterVueSwitchStyle(FrameClass: TPersistentClass);
    class function VueSwitchStyle(Index: Integer): TPersistentClass;
  published
    property Value: Boolean read GetValue write SetValue;
    property Caption: String read GetCaption write SetCaption;
    property FocusColor: TAlphaColor read GetFocusColor write SetFocusColor;
    property OnChange: TNotifyEvent read GetOnChange write SetOnChange;
  end;

implementation

{$R *.fmx}

{ TVueSwitchBase }

class procedure TVueSwitchBase.RegisterVueSwitchStyle(FrameClass: TPersistentClass);
begin
  SetLength(TVueSwitchBase.VueSwitchStyles, Succ(Length(TVueSwitchBase.VueSwitchStyles)));
  TVueSwitchBase.VueSwitchStyles[Pred(Length(TVueSwitchBase.VueSwitchStyles))] := FrameClass;
end;

class function TVueSwitchBase.VueSwitchStyle(Index: Integer): TPersistentClass;
begin
  if (Index > Pred(Length(TVueSwitchBase.VueSwitchStyles))) or (Index < 0) then
    Index := 0;
  Result := TVueSwitchBase.VueSwitchStyles[Index];
end;

function TVueSwitchBase.GetValue: Boolean;
begin
  Result := False;
end;

procedure TVueSwitchBase.SetValue(const Value: Boolean);
begin
end;

function TVueSwitchBase.GetCaption: String;
begin
end;

procedure TVueSwitchBase.SetCaption(const Value: String);
begin
end;

function TVueSwitchBase.GetFocusColor: TAlphaColor;
begin
  Result := 0;
end;

procedure TVueSwitchBase.SetFocusColor(const Value: TAlphaColor);
begin
end;

function TVueSwitchBase.GetOnChange: TNotifyEvent;
begin
end;

procedure TVueSwitchBase.SetOnChange(const Value: TNotifyEvent);
begin
end;

end.
