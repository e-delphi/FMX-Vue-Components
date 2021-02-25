// Eduardo - 25/02/2021
unit Vue.Text.Style3;

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
  Vue.Text.Base,
  FMX.Effects;

type
  TVueTextStyle3 = class(TVueTextBase)
    edtText: TEdit;
    lbCaption: TLabel;
    lytClient: TLayout;
    rtgClient: TRectangle;
    rtgShadow: TShadowEffect;
    procedure edtTextEnter(Sender: TObject);
    procedure edtTextExit(Sender: TObject);
  protected
    function GetCaption: String; override;
    procedure SetCaption(const Value: String); override;
  end;

implementation

uses
  Vue.Utils;

{$R *.fmx}

procedure TVueTextStyle3.edtTextEnter(Sender: TObject);
begin
  lbCaption.Visible := False;
end;

procedure TVueTextStyle3.edtTextExit(Sender: TObject);
begin
  if edtText.Text.IsEmpty then
    lbCaption.Visible := True
end;

function TVueTextStyle3.GetCaption: String;
begin
  Result := lbCaption.Text;
end;

procedure TVueTextStyle3.SetCaption(const Value: String);
begin
  lbCaption.Text := Value;
end;

initialization
  TVueTextBase.RegisterVueTextStyle(TVueTextStyle3);

end.
