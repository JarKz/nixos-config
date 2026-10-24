{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    ./hardware-configuration.nix

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

  networking.hostName = "old-desktop";

  services.scx = {
    enable = true;
    scheduler = "scx_rusty";
  };

  services.desktopManager = {
    plasma6 = {
      enable = true;
    };
  };

  # Default to plasma, niri uses when it needed.
  services.displayManager.defaultSession = lib.mkForce "plasma";

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;

  system.stateVersion = "25.05";
}
