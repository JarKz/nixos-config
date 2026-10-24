{ config, misc, pkgs, machineSpecs, ... }:
{
  services.awww.enable = true;

  systemd.user.services.awww-wallpaper = {
    Unit = {
      Description = "Set wallpapers with awww";
      ConditionEnvironment="WAYLAND_DISPLAY";
      After = [ "awww.service" ];
      PartOf = [ config.wayland.systemd.target ];
    };
    Service = {
      Type = "oneshot";
      ExecStartPre = "${pkgs.awww}/bin/awww img ${misc.background-images.ghost-of-thusima} --outputs ${machineSpecs.outputs.main.name}";
      ExecStart = "${pkgs.awww}/bin/awww img ${misc.background-images.melina} --outputs ${machineSpecs.outputs.secondary.name}";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
