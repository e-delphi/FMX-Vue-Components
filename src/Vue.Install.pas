// Eduardo - 25/02/2021
unit Vue.Install;

interface

uses
  System.Classes;

procedure Register;

implementation

uses
  Vue.Text;

procedure Register;
begin
  RegisterComponents('Vue', [TVueText]);
end;

end.
