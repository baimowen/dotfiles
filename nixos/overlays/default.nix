# # manual load overlays/overlay-for-program.nix
# final: prev:
# 
# let
#   # ansibleOverlay = import ./ansible.nix final prev;
# in
# {
#   ansible = ansibleOverlay.ansible;
# }

# # autoload overlays/*.nix
# final: prev:
# let
#   overlayFiles =
#     builtins.filter
#       (n: n != "default.nix")
#       (builtins.attrNames (builtins.readDir ./.));
#   overlays =
#     map (f: import (./. + "/${f}") final prev) overlayFiles;
# in
# builtins.foldl' (a: b: a // b) {} overlays