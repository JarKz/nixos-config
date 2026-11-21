{ pkgs, lib, ... }:
{
  # Windows compatibility layer.
  #
  # Here placed configurations that helps to
  # use NTFS drives without going to windows.

  environment.systemPackages = lib.mkAfter (
    with pkgs;
    [
      ntfs3g
    ]
  );
}
