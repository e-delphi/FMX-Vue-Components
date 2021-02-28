// Eduardo - 28/02/2021
unit Vue.Tooltip.Style0;

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
  Vue.Tooltip.Base,
  FMX.Effects;

type
  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TVueTooltipStyle0 = class(TVueTooltipBase)
    lytClient: TLayout;
    rtgClient: TRectangle;
    lbCaption: TLabel;
    lytScaleXAni: TFloatAnimation;
    lytScaleYAni: TFloatAnimation;
    lytPositionXAni: TFloatAnimation;
    lytPositionYAni: TFloatAnimation;
    lytOpacityAni: TFloatAnimation;
  private
    FShowing: Boolean;
  protected
    function GetCaption: String; override;
    procedure SetCaption(const Value: String); override;
  published
    procedure Show; override;
    procedure Hide; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  Vue.Utils;

{$R *.fmx}

constructor TVueTooltipStyle0.Create(AOwner: TComponent);
begin
  inherited;
  Visible := (csDesigning in ComponentState);
  FShowing := False;
end;

function TVueTooltipStyle0.GetCaption: String;
begin
  Result := lbCaption.Text;
end;

procedure TVueTooltipStyle0.SetCaption(const Value: String);
begin
  lbCaption.Text := Value;
end;

procedure TVueTooltipStyle0.Show;
begin
  if FShowing then
    Exit;

  FShowing := True;

  lytClient.Opacity := 1;

  Visible := True;

  lytScaleXAni.Start;
  lytScaleYAni.Start;

  lytPositionYAni.StartValue := Self.Height / 2;
  lytPositionYAni.StopValue  := 0;
  lytPositionYAni.Start;


  lytPositionXAni.StartValue := Self.Width / 2;
  lytPositionXAni.StopValue  := 0;
  lytPositionXAni.Start;
end;

procedure TVueTooltipStyle0.Hide;
begin
  if not FShowing then
    Exit;

  FShowing := False;

  lytOpacityAni.Start;
end;

initialization
  TVueTooltipBase.RegisterVueTooltipStyle(TVueTooltipStyle0);

end.
