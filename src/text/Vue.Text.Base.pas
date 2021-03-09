// Eduardo - 25/02/2021
unit Vue.Text.Base;

interface

uses
  System.Classes,
  System.UITypes,
  FMX.Forms;

type
  TVueTextBase = class(TFrame)
  private
    class var VueTextStyles: TArray<TPersistentClass>;
  protected
    function GetCaption: String; virtual;
    procedure SetCaption(const Value: String); virtual;
    function GetText: String; virtual;
    procedure SetText(const Value: String); virtual;
    function GetFocusColor: TAlphaColor; virtual;
    procedure SetFocusColor(const Value: TAlphaColor); virtual;
  public
    class procedure RegisterVueTextStyle(FrameClass: TPersistentClass);
    class function VueTextStyle(Index: Integer): TPersistentClass;
  published
    property Caption: String read GetCaption write SetCaption;
    property Text: String read GetText write SetText;
    property FocusColor: TAlphaColor read GetFocusColor write SetFocusColor;
  end;

implementation

{$R *.fmx}

{ TVueTextBase }

class procedure TVueTextBase.RegisterVueTextStyle(FrameClass: TPersistentClass);
begin
  SetLength(TVueTextBase.VueTextStyles, Succ(Length(TVueTextBase.VueTextStyles)));
  TVueTextBase.VueTextStyles[Pred(Length(TVueTextBase.VueTextStyles))] := FrameClass;
end;

class function TVueTextBase.VueTextStyle(Index: Integer): TPersistentClass;
begin
  if (Index > Pred(Length(TVueTextBase.VueTextStyles))) or (Index < 0) then
    Index := 0;
  Result := TVueTextBase.VueTextStyles[Index];
end;

function TVueTextBase.GetCaption: String;
begin
end;

procedure TVueTextBase.SetCaption(const Value: String);
begin
end;

function TVueTextBase.GetFocusColor: TAlphaColor;
begin
  Result := 0;
end;

procedure TVueTextBase.SetFocusColor(const Value: TAlphaColor);
begin
end;

function TVueTextBase.GetText: String;
begin
end;

procedure TVueTextBase.SetText(const Value: String);
begin
end;

end.
