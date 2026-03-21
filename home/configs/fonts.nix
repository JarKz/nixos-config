{ pkgs, lib, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = lib.mkBefore (
    with pkgs;
    [
      corefonts
    ]
  );

  # Dumb placing microsoft fonts because OnlyOffice ignores fontconfig for some reason.
  home.activation = {
    copyMicrosoftFonts = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD mkdir -p $HOME/.local/share/fonts/microsoft-corefonts
      $DRY_RUN_CMD cp -fL ${pkgs.corefonts}/share/fonts/truetype/*.ttf $HOME/.local/share/fonts/microsoft-corefonts/
      $DRY_RUN_CMD chmod 644 $HOME/.local/share/fonts/microsoft-corefonts/*.ttf
    '';
  };
}
