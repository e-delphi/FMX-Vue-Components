﻿// Eduardo - 26/02/2021
unit Vue.Button.Style1;

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
  FMX.Effects,
  FMX.Graphics,
  System.Types;

type
  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TVueButtonStyle1 = class(TVueButtonBase)
    lytClient: TLayout;
    rtgClient: TCircle;
    rtgClientClient: TCircle;
    rtgShadow: TShadowEffect;
    crlEffect: TCircle;
    crlOpacityAni: TFloatAnimation;
    crlEffectAni: TFloatAnimation;
    crlOpacityRAni: TFloatAnimation;
    procedure rtgClientClientMouseDown(Sender: TObject;  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure crlEffectAniProcess(Sender: TObject);
    procedure crlOpacityRAniFinish(Sender: TObject);
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

function TVueButtonStyle1.GetCaption: String;
begin
//  Result := lbCaption.Text;
end;

procedure TVueButtonStyle1.SetCaption(const Value: String);
begin
//  lbCaption.Text := Value;
end;

function TVueButtonStyle1.GetOnClick: TNotifyEvent;
begin
  Result := FOnClick;
end;

procedure TVueButtonStyle1.SetOnClick(const Value: TNotifyEvent);
begin
  FOnClick := Value;
end;

procedure TVueButtonStyle1.crlOpacityRAniFinish(Sender: TObject);
begin
  crlEffect.Visible := False;
end;

procedure TVueButtonStyle1.crlEffectAniProcess(Sender: TObject);
begin
  crlEffect.Width := crlEffect.Height;
  crlEffect.Position.X := FX - (crlEffect.Width / 2);
  crlEffect.Position.Y := FY - (crlEffect.Height / 2);
end;

procedure TVueButtonStyle1.rtgClientClientMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  FX := X;
  FY := Y;

  crlEffect.Position.X := X - (crlEffect.Width / 2);
  crlEffect.Position.Y := Y - (crlEffect.Height / 2);

  crlEffect.Width := 0;
  crlEffect.Height := 0;
  crlEffect.Visible := True;
  crlEffectAni.StopValue := Max(rtgClientClient.Width, rtgClientClient.Height) * 2;

  crlEffectAni.Start;
  crlOpacityAni.Start;
  crlOpacityRAni.Start;

  if Assigned(FOnClick) then
    FOnClick(Sender);
end;

initialization
  TVueButtonBase.RegisterVueButtonStyle(TVueButtonStyle1);

end.
