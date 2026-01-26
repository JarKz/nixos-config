{ nixGL, ... }:
{
  nixpkgs.config.allowUnfree = true;
  # TEMPORARY: only for librewolf until upstream caches the build
  nixpkgs.config.permittedInsecurePackages = [
    "librewolf-bin-146.0.1-1"
    "librewolf-bin-unwrapped-146.0.1-1"
  ];
  targets.genericLinux.nixGL.packages = nixGL.packages;
  targets.genericLinux.nixGL.vulkan.enable = true;

  imports = [
    ./configs
    ./programs.nix
  ];
}
