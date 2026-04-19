{ ... }:
{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = false;
    jack.enable = false;
  };

  services.pipewire.wireplumber.extraConfig = {
    "10-disable-suspend" = {
      "monitor.alsa.rules" = [
        {
          matches = [
            {
              "node.name" = "alsa_output.usb-Sennheiser_Communications_Sennheiser_BTD_800_USB-00.analog-stereo";
            }
          ];
          actions = {
            update-props = {
              "session.suspend-on-idle" = false;
              "device.fixed-profile" = true;
              "api.alsa.disable-batch" = true;
              "channelmix.disable" = false;
            };
          };
        }
      ];
    };
  };

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 1024;
      "default.clock.min-quantum" = 512;
      "default.clock.max-quantum" = 4048;
    };
  };

  # Specific rules for Sennheiser BTD800 to avoid his audio change
  services.udev.extraRules = ''
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="1395", ATTRS{idProduct}=="008e", ENV{LIBINPUT_IGNORE_DEVICE}="1"

    SUBSYSTEM=="input", ATTRS{idVendor}=="1395", ATTRS{idProduct}=="008e", ENV{ID_INPUT}="", ENV{ID_INPUT_KEYBOARD}="", ENV{ID_INPUT_KEY}=""

    SUBSYSTEM=="usb", ATTRS{idVendor}=="1395", ATTRS{idProduct}=="008e", ENV{INTERFACE}=="03", ATTR{authorized}="0"
  '';
}
