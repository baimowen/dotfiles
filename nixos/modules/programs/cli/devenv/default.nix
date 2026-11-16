{ pkgs, config, lib, ... }:

{
  # this module is `install devenv cli`, not devenv environment
  # devenv env is defined in `devenv.lib.mkShell = { inherit inputs, pkgs; modules = [ devenv.nix ]; };`
  # https://devenv.sh/getting-started/#commands
  # initiallze a new developer environment(bash): devenv init
  environment.systemPackages = with pkgs; [ devenv ];
  # direnv integration: https://devenv.sh/integrations/direnv/#configure-shell-activation
  programs.devenv = {
    enable = true;
    enableBashIntegration = true;
  };
}