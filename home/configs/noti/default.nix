{ machineSpecs, ... }:
let
  enabled = machineSpecs.use-custom-services;
in
{
  programs.noti-rs = {
    enable = enabled;
    service = true;
  };
}
