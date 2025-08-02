{ pkgs, ... }:
let
  importConfig = import ../../tools/import-config.nix;
  vocabulary = {
    wlr-which-key = "${pkgs.wlr-which-key}/bin/wlr-which-key";
  };

  wkConfigurations = importConfig.importTemplated vocabulary [
    ./config.yaml
    ./focus.yaml
    ./move-workspace.yaml
    ./move.yaml
    ./resize.yaml
  ] "wlr-which-key";
in
{
  home.packages = with pkgs; [
    wlr-which-key
  ];

  xdg.configFile = wkConfigurations;
}
