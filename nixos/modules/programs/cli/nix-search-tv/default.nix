{ pkgs, inputs, ... }:

{
  # [github: 3timeslazy/nix-search-tv](https://github.com/3timeslazy/nix-search-tv?tab=readme-ov-file)
  programs.nix-search-tv = {
    enable = true;
    enableTelevisionIntegration = true;
    # fzf integration: 
    # alias ns="nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history"
  };
}