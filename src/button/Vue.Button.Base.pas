// Eduardo - 25/02/2021
unit Vue.Button.Base;

interface

uses
  System.Classes,
  FMX.Forms;

type
  TVueButtonBase = class(TFrame)
  private
    class var VueButtonStyles: TArray<TPersistentClass>;
  protected
    function GetCaption: String; virtual;
    procedure SetCaption(const Value: String); virtual;
    function GetOnClick: TNotifyEvent; virtual;
    procedure SetOnClick(const Value: TNotifyEvent); virtual;
  public
    class procedure RegisterVueButtonStyle(FrameClass: TPersistentClass);
    class function VueButtonStyle(Index: Integer): TPersistentClass;
  published
    property Caption: String read GetCaption write SetCaption;
    property OnClick: TNotifyEvent read GetOnClick write SetOnClick;
  end;

implementation

{$R *.fmx}

{ TVueButtonBase }

class procedure TVueButtonBase.RegisterVueButtonStyle(FrameClass: TPersistentClass);
begin
  SetLength(TVueButtonBase.VueButtonStyles, Succ(Length(TVueButtonBase.VueButtonStyles)));
  TVueButtonBase.VueButtonStyles[Pred(Length(TVueButtonBase.VueButtonStyles))] := FrameClass;
end;

class function TVueButtonBase.VueButtonStyle(Index: Integer): TPersistentClass;
begin
  if (Index > Pred(Length(TVueButtonBase.VueButtonStyles))) or (Index < 0) then
    Index := 0;
  Result := TVueButtonBase.VueButtonStyles[Index];
end;

function TVueButtonBase.GetCaption: String;
begin
end;

procedure TVueButtonBase.SetCaption(const Value: String);
begin
end;

function TVueButtonBase.GetOnClick: TNotifyEvent;
begin
end;

procedure TVueButtonBase.SetOnClick(const Value: TNotifyEvent);
begin
end;

end.
