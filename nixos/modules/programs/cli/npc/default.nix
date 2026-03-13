{ pkgs, inputs, ... }:

# let
#   package = npc.packages.${pkgs.system}.default
# in
{
  home.packages = [ 
    inputs.npc.packages.${pkgs.system}.default 
  ];
}