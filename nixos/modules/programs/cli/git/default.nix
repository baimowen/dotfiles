{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    # extraConfig = {
    settings = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "local";
        email = "local@localhost.domain";
      };
      pull = {
        rebase = true;
      };
      status = {
        branch = true;
        showStash = true;
      };
      color = {
        ui = "auto";
      };
    };
  };
}
