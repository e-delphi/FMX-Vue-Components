program Exemple;

uses
  System.StartUpCopy,
  FMX.Forms,
  Vue.Demo in 'Vue.Demo.pas' {Demo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDemo, Demo);
  Application.Run;
end.
