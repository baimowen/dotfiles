{ pkgs, inputs, ... }:

{
  # see: https://github.com/0xc000022070/zen-browser-flake#with-environmentsystempackages-or-homepackages
  environment.systemPackages = [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  # imports = [ inputs.zen-browser.packages.${currentSystem}.default ];
  # programs.zen-browser = {
  #   enable = true;
  #   # see: https://zen-browser-flake.nshard.com/
  #   # profiles = {};
  # }
}