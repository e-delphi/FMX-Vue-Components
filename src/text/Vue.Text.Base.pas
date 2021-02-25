// Eduardo - 25/02/2021
unit Vue.Text.Base;

interface

uses
  System.Classes,
  FMX.Forms;

type
  TVueTextBase = class(TFrame)
  private
    class var VueTextStyles: TArray<TPersistentClass>;
  protected
    function GetCaption: String; virtual;
    procedure SetCaption(const Value: String); virtual;
  public
    class procedure RegisterVueTextStyle(FrameClass: TPersistentClass);
    class function VueTextStyle(Index: Integer): TPersistentClass;
  published
    property Caption: String read GetCaption write SetCaption;
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

end.
