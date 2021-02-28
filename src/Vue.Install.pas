// Eduardo - 25/02/2021
unit Vue.Install;

interface

uses
  System.Classes;

procedure Register;

implementation

uses
  Vue.Text,
  Vue.Button,
  Vue.Tooltip,
  Vue.Checkbox;

procedure Register;
begin
  RegisterComponents('Vue', [TVueText, TVueButton, TVueTooltip, TVueCheckbox]);
end;

end.
