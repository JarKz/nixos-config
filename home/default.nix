{ nixGL, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nixGL.packages = nixGL.packages;
  nixGL.vulkan.enable = true;

  imports = [
    ./configs
    ./programs.nix
  ];
}
