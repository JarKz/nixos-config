{ inputs, system, lib, ... }:
{
  environment.systemPackages = lib.mkAfter [
    inputs.zen-browser.packages."${system}".twilight
  ];
}
