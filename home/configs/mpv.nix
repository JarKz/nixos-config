{ pkgs, ... }: {

  programs.mpv = {
    enable = true;

    scripts = with pkgs.mpvScripts; [
      uosc           # Modern inteface
      thumbfast      # Immediate previews on hover
      mpris          # Integration with mpris
    ];
    
    config = {
      osc = "no";             # No old interface
      osd-bar = "no";         # No old volume bar
      border = "no";          # No window frame
      
      profile = "gpu-hq";
      video-sync = "display-resample";
      interpolation = "yes";
    };
  };
}
