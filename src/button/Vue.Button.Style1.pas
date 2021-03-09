// Eduardo - 26/02/2021
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
    procedure rtgClientClientMouseDown(Sender: TObject;  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
  private
    FOnClick: TNotifyEvent;
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

procedure TVueButtonStyle1.rtgClientClientMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if Assigned(FOnClick) then
    FOnClick(Sender);
end;

initialization
  TVueButtonBase.RegisterVueButtonStyle(TVueButtonStyle1);

end.
