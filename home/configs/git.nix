{...}:
{
  programs.git = {
    enable = true;
    difftastic.enable = true;

    aliases = {
      cm = "commit";
      st = "status";
      rbi = "rebase -i";
      rbc = "rebase --continue";
      stuno = "status --untracked-files=no";
      unstage = "restore --staged";
    };
  };
}
