{ nixGL, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nixGL.packages = nixGL.packages;

  imports = [
    ./configs
    ./programs.nix
  ];
}
