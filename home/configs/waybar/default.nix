{
  pkgs,
  flake-pkgs,
  tools,
  machineSpecs,
  ...
}:
let
  vocabulary = with pkgs; {
    wezterm = "${wezterm}/bin/wezterm";
    filelight = "${kdePackages.filelight}/bin/filelight";
    blueman-manager = "${blueman}/bin/blueman-manager";
    pavucontrol = "${pavucontrol}/bin/pavucontrol";
    btop = "${btop}/bin/btop";
    lc-niri = "${flake-pkgs.lc-niri.default}/bin/lc-niri";
  };

  defaultModules = tools.importConfig.importTemplated vocabulary ./default-modules.json "waybar";

  makeBar =
    {
      output-name,
      modules-left,
      modules-center,
      modules-right,
    }:
    {
      layer = "top";
      margin-top = 0;
      margin-left = 0;
      margin-right = 0;
      margin-bottom = 0;
      spacing = 4;

      include = [
        "$XDG_CONFIG_HOME/waybar/default-modules.json"
      ];

      output = [ output-name ];

      inherit modules-left modules-center modules-right;
    };
in
{
  home.packages = with pkgs; [
    wezterm
    kdePackages.filelight
    pavucontrol
    btop
    upower
    blueman
  ];

  services.blueman-applet.enable = true;

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    style = builtins.readFile ./style.css;

    settings = {
      mainBar = makeBar {
        output-name = machineSpecs.outputs.main.name;

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
      secondaryBar = makeBar {
        output-name = machineSpecs.outputs.secondary.name;

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
          "pulseaudio"
          "custom/filler"
          "niri/language"
          "custom/filler"
          "clock"
        ];
      };
    };
  };

  xdg.configFile = defaultModules;
}
