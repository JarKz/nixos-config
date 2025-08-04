{ config, misc, pkgs, ... }:
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
        ${pkgs.swww}/bin/swww img ${misc.background-images.ghost-of-thusima} --output DP-1
        ${pkgs.swww}/bin/swww img ${misc.background-images.melina} --output HDMI-A-1
      '';
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
