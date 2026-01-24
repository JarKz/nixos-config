{ pkgs, ... }:

{
  programs.zsh.enable = true;

  users.users.jarkz = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "input" ];
    shell = pkgs.zsh;
  };

  xdg.portal.enable = true;

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
  ];
}
