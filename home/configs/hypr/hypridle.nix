{ config, pkgs, machineSpecs, ... }:
let
  hyprlock = if machineSpecs.is-not-nixos then config.lib.nixGL.wrap pkgs.hyprlock else pkgs.hyprlock;
in
{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof ${hyprlock}/bin/hyprlock || ${hyprlock}/bin/hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "niri msg action power-on-monitors";
      };

      listener = [
        {
          timeout = 150; # 2.5min.
          on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -s set 10"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
          on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -r"; # monitor backlight restore.
        }

        # turn off keyboard backlight, comment out this section if you dont have a keyboard backlight.
        {
          timeout = 150; # 2.5min.
          on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -sd rgb:kbd_backlight set 0"; # turn off keyboard backlight.
          on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -rd rgb:kbd_backlight"; # turn on keyboard backlight.
        }

        {
          timeout = 300; # 5min.
          on-timeout = "loginctl lock-session"; # lock screen when timeout has passed.
        }

        {
          timeout = 330; # 5.5min.
          on-timeout = "niri msg action power-off-monitors"; # screen off when timeout has passed
          after_sleep_cmd = "niri msg action power-on-monitors";
        }

        {
          timeout = 1800; # 30min.
          on-timeout = "systemctl suspend"; # suspend pc.
        }
      ];
    };
  };
}
