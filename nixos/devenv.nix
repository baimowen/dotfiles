{ ... }:

{
  # this operation can automatically push the built result to cachix, 
  # which can be configured in the cachix section below.
  # devenv build
  cachix.push = "baimowen-dotfiles";
  cachix.pull = [ "baimowen-dotfiles" ];
  enterShell = ''
  '';
}