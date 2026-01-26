{ ... }:
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

  networking.hostName = "desktop";

  system.stateVersion = "25.05";
}
