{ config, misc, pkgs, machineSpecs, ... }:
{
  services.swww.enable = true;

  systemd.user.services.swww-wallpaper = {
    Unit = {
      Description = "Set wallpapers with swww";
      After = [ "swww.service" ];
      PartOf = [ config.wayland.systemd.target ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = ''
        ${pkgs.swww}/bin/swww img ${misc.background-images.ghost-of-thusima} --outputs ${machineSpecs.outputs.main.name}
        ${pkgs.swww}/bin/swww img ${misc.background-images.melina} --outputs ${machineSpecs.outputs.secondary.name}
      '';
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
