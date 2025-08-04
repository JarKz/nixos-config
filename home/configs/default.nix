{ username, ... }: {
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  imports = [
    ./ssh-agent.nix
    ./git.nix
    ./bat.nix
    ./btop.nix
    ./yazi.nix
    ./zsh.nix
    ./fastfetch.nix
    ./swww.nix
    ./xwayland-satellite.nix
    ./xdg-portals.nix
    ./browsers.nix

    ./ideavim
    ./hypr
    ./satty
    ./waybar
    ./wezterm
    ./wlr-which-key
    ./wofi
    ./niri
    ./nvim
    ./noti
    ./theming
  ];

  home.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
