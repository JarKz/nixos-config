# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports =
    [
      ./hardware-configuration.nix
      ./nvidia.nix

      ../../system
    ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    limine = {
      enable = true;
      efiSupport = true;
    };
  };

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Minsk";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "be_BY.UTF-8";
    };
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  qt.enable = true;

  environment.systemPackages = lib.mkBefore (with pkgs; [
    vim
    wget

    papirus-icon-theme
    gtk-engine-murrine
    gnome-themes-extra
    gnome-icon-theme

    nwg-look

    materia-theme

    adwaita-icon-theme
    adwaita-fonts
    adwaita-qt6
    adwaita-qt

    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-icons

    hicolor-icon-theme
    gtk3
  ]);

  services = {
    hypridle.enable = true;
    upower.enable = true;
  };

  programs = {
    niri.enable = true;
    git.enable = true;
    hyprlock.enable = true;
    waybar.enable = true;
    obs-studio.enable = true;
    thunderbird.enable = true;
    xwayland.enable = true;
    steam.enable = true;

    ssh = {
      startAgent = true;
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        libxkbcommon
        libgit2
        pango
        cairo
        fontconfig
        glib
        glibc
        freetype
        xorg.libX11
        xorg.libxcb
        xcb-util-cursor
        xorg.xcbutil
        xorg.xcbutilimage
        wayland
        gtk3
        gtk4
        libsForQt5.qttools
        kdePackages.qttools
      ];
    };
  };

  system = {
    copySystemConfiguration = true;
    stateVersion = "25.05";
  };
}

