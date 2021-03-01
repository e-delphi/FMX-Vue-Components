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
    pthCheck: TPath;
    rtgCheck: TRectangle;
    lytCheck: TLayout;
    crlCheck: TCircle;
    procedure CheckMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure CheckMouseEnter(Sender: TObject);
    procedure CheckMouseLeave(Sender: TObject);
  private
    FChecked: Boolean;
    FOnClick: TNotifyEvent;
    procedure UpdateState;
  protected
    function GetChecked: Boolean; override;
    procedure SetChecked(const Value: Boolean); override;
    function GetCaption: String; override;
    procedure SetCaption(const Value: String); override;
    function GetOnClick: TNotifyEvent; override;
    procedure SetOnClick(const Value: TNotifyEvent); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  Vue.Utils;

{$R *.fmx}

constructor TVueCheckboxStyle0.Create;
begin
  inherited;
  crlCheck.Visible := False;
  FChecked := False;
  UpdateState;
end;

function TVueCheckboxStyle0.GetChecked: Boolean;
begin
  Result := FChecked;
end;

procedure TVueCheckboxStyle0.SetChecked(const Value: Boolean);
begin
  FChecked := Value;
  UpdateState;
end;

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

procedure TVueCheckboxStyle0.CheckMouseEnter(Sender: TObject);
begin
  crlCheck.Visible := True;
end;

procedure TVueCheckboxStyle0.CheckMouseLeave(Sender: TObject);
begin
  crlCheck.Visible := False;
end;

procedure TVueCheckboxStyle0.UpdateState;
begin
  if FChecked then
  begin
    crlCheck.Fill.Color := RGB(34, 106, 191);
    rtgCheck.Fill.Color := RGB(34, 106, 191);
    rtgCheck.Stroke.Color := RGB(34, 106, 191);
    pthCheck.Stroke.Color := RGB(255, 255, 255);
  end
  else
  begin
    crlCheck.Fill.Color := TAlphaColors.Black;
    rtgCheck.Fill.Color := TAlphaColors.Null;
    rtgCheck.Stroke.Color := RGB(117, 117, 117);
    pthCheck.Stroke.Color := TAlphaColors.Null;
  end;

  if Assigned(FOnClick) then
    FOnClick(Self);
end;

procedure TVueCheckboxStyle0.CheckMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  FChecked := not FChecked;
  UpdateState;
end;

initialization
  TVueCheckboxBase.RegisterVueCheckboxStyle(TVueCheckboxStyle0);

end.
