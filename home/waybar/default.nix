{ pkgs, lib, ... }:
let
  importConfig = import ../../tools/import-config.nix;
  vocabulary = with pkgs; {
    wezterm = "${wezterm}/bin/wezterm";
    filelight = "${kdePackages.filelight}/bin/filelight";
    blueberry = "${blueberry}/bin/blueberry";
    pavucontrol = "${pavucontrol}/bin/pavucontrol";
    btop = "${btop}/bin/btop";
  };

  styles = importConfig.import [ ./style.css ./catppuccin-latte.css ] "waybar";
  defaultModules = importConfig.importTemplated vocabulary ./default-modules.json "waybar";
in
{
  home.packages = with pkgs; [
    wezterm
    kdePackages.filelight
    blueberry
    pavucontrol
    btop
    upower
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        margin-top = 0;
        margin-left = 0;
        margin-right = 0;
        margin-bottom = 0;
        spacing = 4;

        include = [
          "$XDG_CONFIG_HOME/waybar/default-modules.json"
        ];

        modules-left = [
          "custom/launcher"
          "custom/separator"
          "cpu"
          "memory"
          "temperature"
          "custom/filler"
          "disk"
          "custom/filler"
          "custom/blueberry"
        ];

        modules-center = [
          "niri/workspaces"
        ];

        modules-right = [
          "battery"
          "custom/filler"
          "upower"
          "custom/filler"
          "pulseaudio"
          "custom/filler"
          "network"
          "custom/filler"
          "niri/language"
          "custom/filler"
          "clock"
        ];
      };
    };
  };

  xdg.configFile = lib.mkMerge [
    styles
    defaultModules
  ];
}
