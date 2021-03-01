// Eduardo - 25/02/2021
unit Vue.Demo;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  Vue.Text,
  Vue.Button,
  Vue.Tooltip,
  Vue.Checkbox;

type
  TDemo = class(TForm)
    VueText1: TVueText;
    VueText2: TVueText;
    VueText3: TVueText;
    VueText4: TVueText;
    VueButton1: TVueButton;
    VueButton2: TVueButton;
    VueTooltip1: TVueTooltip;
    VueCheckbox1: TVueCheckbox;
    procedure VueButton1Click(Sender: TObject);
    procedure VueButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Demo: TDemo;

implementation

{$R *.fmx}

procedure TDemo.VueButton1Click(Sender: TObject);
begin
  VueTooltip1.Show;
end;

procedure TDemo.VueButton2Click(Sender: TObject);
begin
  VueTooltip1.Hide;
end;

end.
