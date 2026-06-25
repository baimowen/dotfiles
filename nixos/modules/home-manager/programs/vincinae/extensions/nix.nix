{ config, pkgs, ... }:

{
  programs.vincinae.extensions = [
    (config.lib.vicinae.mkExtension {
      name = "nix";

      src = pkgs.fetchFromGitHub {
        owner = "vicinaehq";
        repo = "extensions";
        # `# main`: point branch `# pin`: pin the commit 
        rev = "20bc4f85f5736f76a7866600f865713a3bdbf598"; # main
        sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
      } + "/extensions/nix";  # point the sub directory in the repo
    })
  ];
}