{ pkgs }:

derivation {
  name = "hello";
  system = builtins.currentSystem;
  builder = "${pkgs.bash}/bin/bash";
  args = [ "-c" "mkdir -p $out/share\necho 'Hello, World!' > $out/share/hello.txt" ];
}