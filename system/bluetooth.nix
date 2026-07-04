{ ... }:
{
  boot.extraModprobeConfig = ''
    options bluetooth enable_ecred=1
  '';

  security.rtkit.enable = true; # Highly recommended for low-latency real-time scheduling

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;

    settings = {
      General = {
        Experimental = true; # Required to unlock ASHA and BLE Audio plugins
      };
      LE = {
        MinConnectionInterval = 8;
        MaxConnectionInterval = 16;
        ConnectionLatency = 0;
        ConnectionSupervisionTimeout = 200;
      };
    };
  };
  services.blueman.enable = true;
}
