// Eduardo - 25/02/2021
unit Vue.Text.Style1;

interface

uses
  System.SysUtils,
  System.UITypes,
  System.Classes,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.StdCtrls,
  FMX.Ani,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.Layouts,
  Vue.Text.Base;

type
  TVueTextStyle1 = class(TVueTextBase)
    edtText: TEdit;
    lbCaption: TLabel;
    lbPosYAni: TFloatAnimation;
    lytClient: TLayout;
    rtgClient: TRectangle;
    lneEffect: TLine;
    lneWidthAni: TFloatAnimation;
    lbScaleYAni: TFloatAnimation;
    lbScaleXAni: TFloatAnimation;
    lbColorAni: TColorAnimation;
    rtgStrokeColorAni: TColorAnimation;
    procedure edtTextEnter(Sender: TObject);
    procedure edtTextExit(Sender: TObject);
    procedure rtgClientMouseEnter(Sender: TObject);
    procedure rtgClientMouseLeave(Sender: TObject);
  protected
    function GetCaption: String; override;
    procedure SetCaption(const Value: String); override;
  end;

implementation

uses
  Vue.Utils;

{$R *.fmx}

procedure TVueTextStyle1.edtTextEnter(Sender: TObject);
begin
  lbColorAni.Inverse := False;
  lbColorAni.Start;

  rtgStrokeColorAni.Inverse := False;
  rtgStrokeColorAni.Start;

  rtgClient.Stroke.Thickness := 2;

  if not edtText.Text.IsEmpty then
    Exit;

  lbPosYAni.Inverse := False;
  lbPosYAni.Start;

  lneEffect.Stroke.Color := RGB(235, 235, 235);
  lneWidthAni.StopValue := lbCaption.Width + 10;
  lneWidthAni.Inverse := False;
  lneWidthAni.Start;

  lbScaleYAni.Inverse := False;
  lbScaleYAni.Start;

  lbScaleXAni.Inverse := False;
  lbScaleXAni.Start;
end;

procedure TVueTextStyle1.edtTextExit(Sender: TObject);
begin
  lbColorAni.Inverse := True;
  lbColorAni.Start;

  rtgStrokeColorAni.Inverse := True;
  rtgStrokeColorAni.Start;

  rtgClient.Stroke.Thickness := 0.5;

  if not edtText.Text.IsEmpty then
    Exit;

  lbPosYAni.Inverse := True;
  lbPosYAni.Start;

  lneWidthAni.Inverse := True;
  lneWidthAni.Start;

  lbScaleYAni.Inverse := True;
  lbScaleYAni.Start;

  lbScaleXAni.Inverse := True;
  lbScaleXAni.Start;
end;

procedure TVueTextStyle1.rtgClientMouseEnter(Sender: TObject);
begin
  if lbCaption.Position.Y <> 0 then
    rtgClient.Stroke.Color := TAlphaColors.Black;
end;

procedure TVueTextStyle1.rtgClientMouseLeave(Sender: TObject);
begin
  if lbCaption.Position.Y <> 0 then
    rtgClient.Stroke.Color := RGB(127, 127, 127);
end;

function TVueTextStyle1.GetCaption: String;
begin
  Result := lbCaption.Text;
end;

procedure TVueTextStyle1.SetCaption(const Value: String);
begin
  lbCaption.Text := Value;
end;

initialization
  TVueTextBase.RegisterVueTextStyle(TVueTextStyle1);

end.
