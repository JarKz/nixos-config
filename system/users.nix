{ pkgs, ... }:

{
  programs.zsh.enable = true;

  users.users.test = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.zsh;
  };

  users.users.jarkz = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" ];

    shell = pkgs.zsh;

    packages = with pkgs; [
      # Cli
      tree
      neovim
      yazi
      bat
      bc
      jq
      fzf
      ripgrep
      btop
      unzip
      trash-cli
      fastfetch
      pinentry-tty

      # Gui
      ghostty
      wezterm
      wofi
      swww
      grim
      satty

      pavucontrol
      kdePackages.filelight
      kdePackages.dolphin

      element-desktop
      firefox
      librewolf
      telegram-desktop
      yandex-music
    ];
  };
}
