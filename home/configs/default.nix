{ username, ... }:
let
  sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";

    # For XWayland application is urgent
    DISPLAY = ":0";
    # Fixes java-based applications like IntelliJ
    _JAVA_AWT_WM_NONREPARENTING = "1";

    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    WLR_NO_HARDWARE_CURSOR = "1";

    MOZ_ENABLE_WAYLAND = "1";
    MOZ_USE_XINPUT2 = "1";
  };
in
{
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
    ./obs.nix

    ./ideavim
    ./hypr
    ./satty
    ./waybar
    ./wezterm
    ./wlr-which-key
    ./wofi
    ./niri
    ./nvim
    ./zed
    ./noti
    ./theming
  ];

  home.sessionVariables = sessionVariables;
  systemd.user.sessionVariables = sessionVariables;

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
