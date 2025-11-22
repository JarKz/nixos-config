{ nixGL, ... }:
{
  nixpkgs.config.allowUnfree = true;
  targets.genericLinux.nixGL.packages = nixGL.packages;
  targets.genericLinux.nixGL.vulkan.enable = true;

  imports = [
    ./configs
    ./programs.nix
  ];
}
