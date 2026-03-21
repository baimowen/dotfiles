{ config, pkgs, ... }:

{
  # login to cachix with your token, which can be found at https://cachix.org/account:
  # cachix authtoken <token>
  # create cache: cachix cache create baimowen-dotfiles
  # push to cache: cachix push baimowen-dotfiles ./result
  # show cache info: cachix cache info baimowen-dotfiles
  environment.systemPackages = with pkgs; [ cachix ];
  nix.settings = {
    substituters = [
      "https://baimowen-dotfiles.cachix.org"
      "https://cache.nixos.org"
    ];
    trusted-public-keys = [
      "baimowen-dotfiles.cachix.org-1:iHO5ekVnFzTpoBR68dkZSNDtceiuMdZSFsnCzKO1Kc0="
    ];
  };
}