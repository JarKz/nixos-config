{ config, ... }:
{
  programs.zsh = {
    enable = true;

    dotDir = "${config.xdg.configHome}/zsh";

    oh-my-zsh = {
      enable = true;

      plugins = [
        "git"
        "archlinux"
        "rust"
        "gradle"
      ];
    };

    sessionVariables = {
      VISUAL = "nvim";
    };

    setOptions = [
      "vi"
    ];

    shellAliases = {
      v = "nvim";
      rm = "trash";
    };
  };
}
