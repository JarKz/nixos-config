{ pkgs, ... }:

{
  programs.zsh.enable = true;

  users.groups.ntfs-share = {};

  users.users.jarkz = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "docker" "input" "kvm" "networkmanager" "ntfs-share" ];
    shell = pkgs.zsh;
  };

  users.users.alex = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "docker" "input" "kvm" "networkmanager" "ntfs-share" ];
    shell = pkgs.zsh;
  };

  xdg.portal.enable = true;

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
  ];
}
