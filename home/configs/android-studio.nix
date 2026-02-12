{ pkgs, lib, ... }:
{
  nixpkgs.config.android_sdk.accept_license = true;

  home.packages = lib.mkBefore (with pkgs; [ android-studio ]);

  home.sessionVariables = {
    ANDROID_HOME = "$HOME/.local/share/android-sdk";
    ANDROID_USER_HOME = "$HOME/.local/share/android";
    GRADLE_USER_HOME = "$HOME/.local/share/gradle-cache";
    KOTLIN_REPL_HISTORY = "$HOME/.local/share/kotlin-history";
  };
}
