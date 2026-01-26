{ lib, pkgs, ... }:
{
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Minsk";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "be_BY.UTF-8";
    };
  };

  environment.systemPackages = lib.mkBefore (
    with pkgs;
    [
      vim
      wget
    ]
  );

  services = {
    upower.enable = true;

    gvfs.enable = true;
    udisks2.enable = true;
  };

  programs = {
    niri.enable = true;
    thunderbird.enable = true;
    steam.enable = true;

    gnupg.agent = {
      enable = true;
    };
  };

  virtualisation.docker = {
    enable = true;

    # We cannot use minikube with rootless docker. That's sad.
    # rootless = {
    #   enable = true;
    #   setSocketVariable = true;
    # };
  };

  imports = [
    ./gpu.nix
    ./audio.nix
    ./bluetooth.nix
    ./fonts.nix
    ./store.nix
    ./login.nix
    ./users.nix
    ./vpn.nix
  ];
}
