# use `nix build` to build the output into ./result
# then add it to your environment with `nix profile add`
#
# ```shell
# nix build --impure --expr '...'
# nix profile add ./result
# ```
#
# or use `nix profile add --impure -f /path/to/*.nix` to build
# and add it to the environment directly
#
# Note:
# Packages installed this way won't update with system updates or rebuilds.
# if you want to update this package,
# you need to rebuild it or declare it in the configuration.
#
# nixpkgs.overlays = [
#   (final: prev: {
#     bookokrat = prev.bookokrat.overrideAttrs (old: {
#       doCheck = false;
#     });
#   })
# ];
let
  bookokratFlake = builtins.getFlake "github:bugzmanov/bookokrat";
in
  bookokratFlake.packages.${builtins.currentSystem}.default.overrideAttrs (old: {
    doCheck = false;
  })
