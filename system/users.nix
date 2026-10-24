{ pkgs, ... }:

{
  programs.zsh.enable = true;

  users.users.jarkz = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "docker" "input" "kvm" "networkmanager" ];
    shell = pkgs.zsh;
  };

  users.users.alex = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "docker" "input" "kvm" "networkmanager" ];
    shell = pkgs.zsh;
  };

  xdg.portal.enable = true;

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
  ];
}
