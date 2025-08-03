{ xwayland-satellite, ... }:
{
  home.packages = [
    xwayland-satellite.default
  ];

  systemd.user.services.xwayland-satellite.enable = true;
}
