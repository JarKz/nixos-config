{ config, xwayland-satellite, ... }:
{
  home.packages = [
    xwayland-satellite.default
  ];

  systemd.user.services.xwayland-satellite = {
    Unit = {
      Description = "XWayland outside your Wayland";
      BindsTo = [ config.wayland.systemd.target ];
      PartOf = [ config.wayland.systemd.target ];
      After = [ config.wayland.systemd.target ];
      Requisite = [ config.wayland.systemd.target ];
    };

    Service = {
      Type = "notify";
      NotifyAccess = "all";
      ExecStart = "${xwayland-satellite.default}/bin/xwayland-satellite";
      StandardOutput = "journal";
    };

    Install = {
      WantedBy = [ config.wayland.systemd.target ];
    };
  };
}
