{ ... }:
{
  programs.yazi = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;

    shellWrapperName = "yy";
  };
}
