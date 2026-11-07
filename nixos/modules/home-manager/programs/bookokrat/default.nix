{ inputs, pkgs, ... }:

let
  bookokrat_skip_check = inputs.bookokrat.packages.${pkgs.system}.default.overrideAttrs (old: {
    doCheck = false;
  });
in
{
  home.packages = [
    # inputs.bookokrat.packages.${pkgs.system}.default
    bookokrat_skip_check
  ];
}