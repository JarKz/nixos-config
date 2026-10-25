{ machineSpecs, ... }:
{
  programs = {
    difftastic = {
      enable = true;
      git.enable = true;
    };

    git = {
      enable = true;

      signing = {
        key = machineSpecs.git.signing_key;
        signByDefault = true;
      };

      settings = {
        alias = {
          cm = "commit";
          st = "status";
          rbi = "rebase -i";
          rbc = "rebase --continue";
          stuno = "status --untracked-files=no";
          unstage = "restore --staged";
        };

        safe.directory = "/etc/nixos";

        user = machineSpecs.git.user;

        init.defaultBranch = "master";
      };
    };
  };
}
