# # manual load overlays/overlay-for-program.nix
final: prev:

# let
#   dynamicIslandOverlay = import ./dynamic-island-on-hyprland.nix;
# in
#   dynamicIslandOverlay final prev

let
  overlays = [
    ./dynamic-island-on-hyprland.nix
    # ./overlay-for-program.nix
  ];
in
builtins.foldl' (acc: overlay:
  acc // (import overlay final prev)
) {} overlays

# # autoload overlays/*.nix
# final: prev:
# let
#   dir = builtins.readDir ./.;
#
#   overlayFiles = builtins.filter (n:
#     n != "default.nix" &&
#     builtins.match ".*\\.nix" n != null &&
#     !builtins.match "^_" n
#   ) (builtins.attrNames dir);
# 
#   loadOverlays =
#     let
#       overlay = import (./. + "/${name}");
#     in
#       if builtins.isFunction overlay then
#         overlay final prev
#       else
#         throw "Overlay ${name} is not a function";
# in
# builtins.foldl'
#   (acc: name: acc // loadOverlay name)
#   {}
#   overlayFiles