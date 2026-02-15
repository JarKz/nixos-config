{ nixGL, ... }:
{
  nixpkgs.config.allowUnfree = true;
  # TEMPORARY: only for librewolf until upstream caches the build
  nixpkgs.config.permittedInsecurePackages = [
    "librewolf-bin-147.0.2-1"
    "librewolf-bin-unwrapped-147.0.2-1"
  ];
  targets.genericLinux.nixGL.packages = nixGL.packages;
  targets.genericLinux.nixGL.vulkan.enable = true;

  imports = [
    ./configs
    ./programs.nix
  ];
}
