{ pkgs, ... }:
{
  programs.bat = {
    enable = true;

    config = {
      theme = "catppuccin-latte";
    };

    themes = {
      catppuccin-latte = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "6810349b28055dce54076712fc05fc68da4b8ec0";
          hash = "sha256-lJapSgRVENTrbmpVyn+UQabC9fpV1G1e+CdlJ090uvg=";
        };
        file = "themes/Catppuccin\ Latte.tmTheme";
      };
    };
  };
}
