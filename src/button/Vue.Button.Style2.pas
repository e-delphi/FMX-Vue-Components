// Eduardo - 27/02/2021
unit Vue.Button.Style2;

interface

uses
  System.SysUtils,
  System.UITypes,
  System.Classes,
  System.Math,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.StdCtrls,
  FMX.Ani,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.Layouts,
  Vue.Button.Base,
  FMX.Effects;

type
  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TVueButtonStyle2 = class(TVueButtonBase)
    lytClient: TLayout;
    rtgClient: TRectangle;
    lbCaption: TLabel;
    crlEffect: TCircle;
    crlOpacityAni: TFloatAnimation;
    crlEffectAni: TFloatAnimation;
    crlOpacityRAni: TFloatAnimation;
    procedure rtgClientMouseDown(Sender: TObject;  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure crlEffectAniProcess(Sender: TObject);
    procedure crlOpacityRAniFinish(Sender: TObject);
    procedure rtgClientMouseEnter(Sender: TObject);
    procedure rtgClientMouseLeave(Sender: TObject);
  private
    FOnClick: TNotifyEvent;
    FX: Single;
    FY: Single;
  protected
    function GetCaption: String; override;
    procedure SetCaption(const Value: String); override;
    function GetOnClick: TNotifyEvent; override;
    procedure SetOnClick(const Value: TNotifyEvent); override;
  end;

implementation

uses
  Vue.Utils;

{$R *.fmx}

function TVueButtonStyle2.GetCaption: String;
begin
  Result := lbCaption.Text;
end;

procedure TVueButtonStyle2.SetCaption(const Value: String);
begin
  lbCaption.Text := Value;
end;

function TVueButtonStyle2.GetOnClick: TNotifyEvent;
begin
  Result := FOnClick;
end;

procedure TVueButtonStyle2.SetOnClick(const Value: TNotifyEvent);
begin
  FOnClick := Value;
end;

procedure TVueButtonStyle2.crlOpacityRAniFinish(Sender: TObject);
begin
  crlEffect.Visible := False;
end;

procedure TVueButtonStyle2.crlEffectAniProcess(Sender: TObject);
begin
  crlEffect.Width := crlEffect.Height;
  crlEffect.Position.X := FX - (crlEffect.Width / 2);
  crlEffect.Position.Y := FY - (crlEffect.Height / 2);
end;

procedure TVueButtonStyle2.rtgClientMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  FX := X;
  FY := Y;

  crlEffect.Position.X := X - (crlEffect.Width / 2);
  crlEffect.Position.Y := Y - (crlEffect.Height / 2);

  crlEffect.Width := 0;
  crlEffect.Height := 0;
  crlEffect.Visible := True;
  crlEffectAni.StopValue := Max(rtgClient.Width, rtgClient.Height) * 2;

  crlEffectAni.Start;
  crlOpacityAni.Start;
  crlOpacityRAni.Start;

  if Assigned(FOnClick) then
    FOnClick(Sender);
end;

procedure TVueButtonStyle2.rtgClientMouseEnter(Sender: TObject);
begin
  rtgClient.Stroke.Color := TAlphaColors.Black;
end;

procedure TVueButtonStyle2.rtgClientMouseLeave(Sender: TObject);
begin
  rtgClient.Stroke.Color := RGB(127, 127, 127);
end;

initialization
  TVueButtonBase.RegisterVueButtonStyle(TVueButtonStyle2);

end.
