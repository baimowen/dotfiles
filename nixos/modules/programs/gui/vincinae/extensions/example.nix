{ lib, pkgs, inputs }:

inputs.vicinae.mkVicinaeExtension.${pkgs.system} {
  inherit pkgs;
  name = "example1-theme-pack";
  src = pkgs.fetchFromGitHub {
    owner = "vicinaehq";
    repo = "theme-pack";
    rev = "v1.0.0";
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };
}