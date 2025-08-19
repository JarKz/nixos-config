{
  config,
  pkgs,
  machineSpecs,
  overlays,
  ...
}:
{
  nixpkgs.overlays = [ overlays.rust-overlay.overlays.default ];

  home.packages = with pkgs; [
    kdePackages.filelight
    kdePackages.dolphin

    # yandex-music
    pavucontrol
    blueman
    fim

    discord
    telegram-desktop
    (rust-bin.stable.latest.default.override {
      extensions = [
        "rust-analyzer"
        "rust-src"
        "clippy"
      ];
    })

    # Temporary for checking the stability of usage
    materialgram

    trash-cli
  ];

  programs = {
    mpv.enable = true;
    ghostty = {
      enable = true;
      package = if machineSpecs.is-laptop then config.lib.nixGL.wrap pkgs.ghostty else pkgs.ghostty;
    };
    element-desktop.enable = true;
  };
}
