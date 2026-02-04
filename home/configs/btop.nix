{ ... }:
{
  programs.btop = {
    enable = true;

    settings = {
      vim_keys = true;
      shown_boxes = "cpu mem gpu net proc";
      update_ms = 500;

      shown_gpus = "nvidia and intel and amd";
      custom_gpu_name0 = "Discrete";
      custom_gpu_name1 = "Integrated";
    };
  };
}
