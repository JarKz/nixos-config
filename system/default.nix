{
  lib,
  pkgs,
  machineSpecs,
  ...
}:
# TODO: uncomment this on next kmscon release
# let
#   primaryOutput = machineSpecs.outputs.main;
#   secondaryOutput = machineSpecs.outputs.secondary;
# in
{
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Minsk";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "be_BY.UTF-8";
    };
  };

  environment.systemPackages = lib.mkBefore (
    with pkgs;
    [
      vim
      wget
    ]
  );

  services = {
    upower.enable = true;

    gvfs.enable = true;
    udisks2.enable = true;

    kmscon = {
      enable = true;

      config = {
        hwaccel = true;
        libseat = true;
        mouse = true;
        use-original-mode = false;

        xkb-layout = machineSpecs.keyboard.layouts;
        xkb-variant = machineSpecs.keyboard.variants;
        xkb-options = machineSpecs.keyboard.options;

        # TODO: uncomment this on next kmscon release
        # mode = "[${primaryOutput.name}]${primaryOutput.width}x${primaryOutput.height}@${primaryOutput.framerate}";
        # screen = "[${secondaryOutput.name}]disabled";

        font-engine = "freetype";
        font-size = 16;
        font-name = "JetBrainsMono NFM";
      };
    };
  };

  programs = {
    niri.enable = true;
    steam.enable = true;
    dconf.enable = true;

    gnupg.agent = {
      enable = true;
    };
  };

  virtualisation.docker = {
    enable = true;

    # We cannot use minikube with rootless docker. That's sad.
    # rootless = {
    #   enable = true;
    #   setSocketVariable = true;
    # };
  };

  imports = [
    ./gpu.nix
    ./audio.nix
    ./bluetooth.nix
    ./fonts.nix
    ./store.nix
    ./login.nix
    ./users.nix
    # ./vpn.nix
  ];
}
