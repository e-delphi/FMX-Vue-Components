// Eduardo - 28/02/2021
unit Vue.Checkbox.Style0;

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
  Vue.Checkbox.Base,
  FMX.Effects;

type
  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TVueCheckboxStyle0 = class(TVueCheckboxBase)
    lytClient: TLayout;
    lbCaption: TLabel;
    Path1: TPath;
    Rectangle1: TRectangle;
    Layout1: TLayout;
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

function TVueCheckboxStyle0.GetCaption: String;
begin
  Result := lbCaption.Text;
end;

procedure TVueCheckboxStyle0.SetCaption(const Value: String);
begin
  lbCaption.Text := Value;
end;

function TVueCheckboxStyle0.GetOnClick: TNotifyEvent;
begin
  Result := FOnClick;
end;

procedure TVueCheckboxStyle0.SetOnClick(const Value: TNotifyEvent);
begin
  FOnClick := Value;
end;

procedure TVueCheckboxStyle0.rtgClientClientMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  Rectangle1.Fill.Color := RGB(34, 106, 191);
  Rectangle1.Stroke.Color := RGB(34, 106, 191);
  Path1.Stroke.Color := RGB(255, 255, 255);

  if Assigned(FOnClick) then
    FOnClick(Sender);
end;

initialization
  TVueCheckboxBase.RegisterVueCheckboxStyle(TVueCheckboxStyle0);

end.
