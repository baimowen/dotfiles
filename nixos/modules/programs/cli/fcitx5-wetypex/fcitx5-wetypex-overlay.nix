# https://github.com/panxuc/fcitx5-wetypex/blob/main/docs/installation.md#nixos
# fcitx5-wetypex-setup --download --accept-upstream-license
# fcitx5-wetypex-setup --check --transport
# fcitx5 -r -d
{ inputs, ... }:

final: prev: {
  wetypex = inputs.wetypex.packages.${final.stdenv.hostPlatform.system}.fcitx5-wetypex.override (old: {
    enableAI = false;
    enableVoice = false;
    enableWeTypeTheme = false;
    defaultSettings = {
      page_size = 5;
      vertical = false;
    };
  });
}