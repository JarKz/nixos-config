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
    nemo-with-extensions
    nemo-fileroller # For archive actions
    webp-pixbuf-loader # For preview

    onlyoffice-desktopeditors

    yandex-music
    pavucontrol
    blueman
    loupe
    bruno

    discord
    materialgram
    (rust-bin.stable.latest.default.override {
      extensions = [
        "rust-analyzer"
        "rust-src"
        "clippy"
      ];
    })

    trash-cli
  ];

  programs = {
    ghostty = {
      enable = true;
      package = if machineSpecs.is-not-nixos then config.lib.nixGL.wrap pkgs.ghostty else pkgs.ghostty;
    };
    element-desktop.enable = true;
  };
}
