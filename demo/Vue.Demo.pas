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
  FMX.Dialogs,
  Vue.Text,
  Vue.Button;

type
  TDemo = class(TForm)
    VueText1: TVueText;
    VueText2: TVueText;
    VueText3: TVueText;
    VueText4: TVueText;
    VueButton1: TVueButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Demo: TDemo;

implementation

{$R *.fmx}

end.
