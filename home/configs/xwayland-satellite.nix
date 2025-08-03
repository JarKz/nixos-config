{ xwayland-satellite, ... }:
{
  home.packages = [
    xwayland-satellite.default
  ];

  systemd.user.units.xwayland-satellite.enable = true;
}
