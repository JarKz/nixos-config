{
  pkgs,
  lib,
  mainUsername,
  machineSpecs,
  ...
}:
let
  configGenerator = pkgs.formats.toml { };
  tuigreetConfigurationFile = configGenerator.generate "config.toml" {
    display = {
      show_time = true;
      greeting = "You're fucked up.";
      align_greeting = "center";
      issue = false;
    };

    layout = {
      width = 60;
      window_padding = 2;
      container_padding = 1;
      prompt_padding = 1;

      widgets = {
        time_position = "top";
        status_position = "bottom";
      };
    };

    remember = {
      username = true;
      session = false;
      user_session = true;
    };

    secret = {
      mode = "characters";
      characters = "*";
    };

    background = {
      kind = "matrix";
      fps = 30;
    };

    outputs = [
      {
        connector = machineSpecs.outputs.main.name;
        primary = true;
      }
      {
        connector = machineSpecs.outputs.secondary.name;
        enabled = false;
      }
    ];
  };
in
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.getExe pkgs.tuigreet} --user ${mainUsername} --time --cmd niri-session";
        user = "greeter";
      };
    };
  };

  environment.etc."tuigreet/config.toml".source = tuigreetConfigurationFile;

  # Just lifesaver
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
