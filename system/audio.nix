{ ... }:
{
  services.pulseaudio = {
    enable = true;
  };

  # Only for screencast
  services.pipewire = {
    enable = true;
    audio.enable = false;
    pulse.enable = false;
    alsa.enable = false;
    jack.enable = false;
  };
}
