{ pkgs, ... }:
let
  mpvDesktop = "mpv.desktop";
  loupeDesktop = "org.gnome.Loupe.desktop";

  associations = {
    "video/mp4" = [ mpvDesktop ];
    "video/x-matroska" = [ mpvDesktop ];
    "video/webm" = [ mpvDesktop ];

    "image/jpeg" = [ loupeDesktop ];
    "image/png" = [ loupeDesktop ];
    "image/gif" = [ loupeDesktop ];
    "image/webp" = [ loupeDesktop ];
    "image/bmp" = [ loupeDesktop ];

    "application/pdf" = [ "org.pwmt.zathura.desktop" ];
  };
in
{
  xdg = {
    desktopEntries = {
      btop = {
        name = "Btop (WezTerm)";
        genericName = "System Monitor";
        exec = "wezterm start --class=\"btop-monitor\" -e ${pkgs.btop}/bin/btop";
        icon = "btop";
        terminal = false;
        categories = [
          "System"
          "Monitor"
        ];
      };
    };

    mimeApps = {
      enable = true;

      associations.added = associations;
      defaultApplications = associations;
    };

    portal = {
      enable = true;
      xdgOpenUsePortal = true;

      config = {
        common = {
          default = [
            "gnome"
            "gtk"
          ];
          "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
          "org.freedesktop.impl.portal.AppChooser" = [ "gtk" ];
        };
      };

      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };
  };
}
