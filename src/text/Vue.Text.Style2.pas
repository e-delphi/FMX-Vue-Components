// Eduardo - 25/02/2021
unit Vue.Text.Style2;

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
  TVueTextStyle2 = class(TVueTextBase)
    edtText: TEdit;
    lbCaption: TLabel;
    lbPosYAni: TFloatAnimation;
    lytClient: TLayout;
    lbScaleYAni: TFloatAnimation;
    lbScaleXAni: TFloatAnimation;
    lbColorAni: TColorAnimation;
    lneBottom: TLine;
    lneEffect: TLine;
    lytBottom: TLayout;
    lneWidthAni: TFloatAnimation;
    lneStrokeColorAni: TColorAnimation;
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

procedure TVueTextStyle2.edtTextEnter(Sender: TObject);
begin
  lbColorAni.Inverse := False;
  lbColorAni.Start;

  lneWidthAni.Inverse := False;
  lneWidthAni.Start;

  lneStrokeColorAni.Inverse := False;
  lneStrokeColorAni.Start;

  if not edtText.Text.IsEmpty then
    Exit;

  lbPosYAni.Inverse := False;
  lbPosYAni.Start;

  lbScaleYAni.Inverse := False;
  lbScaleYAni.Start;

  lbScaleXAni.Inverse := False;
  lbScaleXAni.Start;
end;

procedure TVueTextStyle2.edtTextExit(Sender: TObject);
begin
  lbColorAni.Inverse := True;
  lbColorAni.Start;

  lneWidthAni.Inverse := True;
  lneWidthAni.Start;

  lneStrokeColorAni.Inverse := True;
  lneStrokeColorAni.Start;

  if not edtText.Text.IsEmpty then
    Exit;

  lbPosYAni.Inverse := True;
  lbPosYAni.Start;

  lbScaleYAni.Inverse := True;
  lbScaleYAni.Start;

  lbScaleXAni.Inverse := True;
  lbScaleXAni.Start;
end;

procedure TVueTextStyle2.rtgClientMouseEnter(Sender: TObject);
begin
  if lbCaption.Position.Y <> 0 then
    lneBottom.Stroke.Color := TAlphaColors.Black;
end;

procedure TVueTextStyle2.rtgClientMouseLeave(Sender: TObject);
begin
  if lbCaption.Position.Y <> 0 then
    lneBottom.Stroke.Color := RGB(127, 127, 127);
end;

function TVueTextStyle2.GetCaption: String;
begin
  Result := lbCaption.Text;
end;

procedure TVueTextStyle2.SetCaption(const Value: String);
begin
  lbCaption.Text := Value;
end;

initialization
  TVueTextBase.RegisterVueTextStyle(TVueTextStyle2);

end.
