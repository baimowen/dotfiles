{ pkgs, config, lib, ... }:

{
  # https://devenv.sh/getting-started/#commands
  # initiallze a new developer environment(bash): devenv init
  environment.systemPackages = with pkgs; [ devenv ];
  # direnv integration: https://devenv.sh/integrations/direnv/#configure-shell-activation
}