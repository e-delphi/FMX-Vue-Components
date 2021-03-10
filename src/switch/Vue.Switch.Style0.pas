// Eduardo - 09/03/2021
unit Vue.Switch.Style0;

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
  Vue.Switch.Base,
  FMX.Effects;

type
  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TVueSwitchStyle0 = class(TVueSwitchBase)
    lytClient: TLayout;
    lbCaption: TLabel;
    lytCheck: TLayout;
    crlShadow: TCircle;
    rrtScroll: TRoundRect;
    crlValue: TCircle;
    ShadowEffect1: TShadowEffect;
    crlValuePositionXAni: TFloatAnimation;
    crlShadowPositionXAni: TFloatAnimation;
    procedure CheckMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure CheckMouseEnter(Sender: TObject);
    procedure CheckMouseLeave(Sender: TObject);
  private
    FValue: Boolean;
    FFocusColor: TAlphaColor;
    FOnChange: TNotifyEvent;
    procedure UpdateState;
  protected
    function GetValue: Boolean; override;
    procedure SetValue(const Value: Boolean); override;
    function GetCaption: String; override;
    procedure SetCaption(const Value: String); override;
    function GetFocusColor: TAlphaColor; override;
    procedure SetFocusColor(const Value: TAlphaColor); override;
    function GetOnChange: TNotifyEvent; override;
    procedure SetOnChange(const Value: TNotifyEvent); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  Vue.Utils;

{$R *.fmx}

constructor TVueSwitchStyle0.Create;
begin
  inherited;
  crlShadow.Visible := False;
  FValue := False;
  UpdateState;
end;

function TVueSwitchStyle0.GetValue: Boolean;
begin
  Result := FValue;
end;

procedure TVueSwitchStyle0.SetValue(const Value: Boolean);
begin
  FValue := Value;
  UpdateState;
end;

function TVueSwitchStyle0.GetCaption: String;
begin
  Result := lbCaption.Text;
end;

procedure TVueSwitchStyle0.SetCaption(const Value: String);
begin
  lbCaption.Text := Value;
end;

function TVueSwitchStyle0.GetFocusColor: TAlphaColor;
begin
  Result := FFocusColor;
end;

procedure TVueSwitchStyle0.SetFocusColor(const Value: TAlphaColor);
begin
  FFocusColor := Value;
end;

function TVueSwitchStyle0.GetOnChange: TNotifyEvent;
begin
  Result := FOnChange;
end;

procedure TVueSwitchStyle0.SetOnChange(const Value: TNotifyEvent);
begin
  FOnChange := Value;
end;

procedure TVueSwitchStyle0.CheckMouseEnter(Sender: TObject);
begin
  crlShadow.Visible := True;
end;

procedure TVueSwitchStyle0.CheckMouseLeave(Sender: TObject);
begin
  crlShadow.Visible := False;
end;

procedure TVueSwitchStyle0.UpdateState;
begin
  crlValuePositionXAni.Inverse := not FValue;
  crlShadowPositionXAni.Inverse := not FValue;

  if FValue then
  begin
    crlValue.Fill.Color  := FFocusColor;
    crlShadow.Fill.Color := FFocusColor;
    rrtScroll.Fill.Color := FFocusColor;
    rrtScroll.Opacity    := 0.6;
  end
  else
  begin
    crlValue.Fill.Color  := TAlphaColors.White;
    crlShadow.Fill.Color := TAlphaColors.Black;
    rrtScroll.Fill.Color := TAlphaColors.Black;
    rrtScroll.Opacity    := 0.3;
  end;

  crlValuePositionXAni.Start;
  crlShadowPositionXAni.Start;

  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TVueSwitchStyle0.CheckMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  FValue := not FValue;
  UpdateState;
end;

initialization
  TVueSwitchBase.RegisterVueSwitchStyle(TVueSwitchStyle0);

end.
