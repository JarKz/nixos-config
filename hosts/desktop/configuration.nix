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

  networking.hostName = "desktop";

  # Hardware-specific services
  services.hardware.deepcool-digital-linux.enable = true;
  nixpkgs.config.rocmSupport = true;
  hardware.amdgpu.opencl.enable = true;
  hardware.graphics.extraPackages = lib.mkBefore (
    with pkgs;
    [
      rocmPackages.clr.icd
    ]
  );

  services.scx = {
    enable = true;
    scheduler = "scx_rusty";
  };

  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;

    environmentVariables = {
      HSA_OVERRIDE_GFX_VERSION = "11.0.0";
      HIP_VISIBLE_DEVICES = "0";
    };
  };

  system.stateVersion = "25.05";
}
