{ inputs, pkgs, ... }:

{
  home.packages = [
    # inputs.bookokrat.packages.${pkgs.system}.default
    pkgs.bookokrat
  ];
}