{ ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./configs
    ./programs.nix
  ];
}
