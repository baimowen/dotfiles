{ pkgs, ... }:

let
  previewScript = pkgs.writeShellScript "lf-previewer" (builtins.readFile ./lf-previewer.sh);
in
{
  programs.lf = {
    enable = true;
    # see:
    #   https://wiki.archlinux.org/title/Lf
    #   https://man.archlinux.org/man/lf.1
    settings = {
      hidden = true;
      preview = true;
      sixel = true;
      ignorecase = true;

      ratios = [ 2 2 3 ];
      info = "size";
      shell = "${pkgs.bash}/bin/bash";
      shellopts = "-euo pipefail";

      number = true;
      tabstop = 4;
    };
    extraConfig = ''
      # nested instances warning
      &[ "$LF_LEVEL" -eq 1 ] || lf -remote "send $id echoerr \"Warning: You're in a nested lf instance!\""
    '';
    # commands = {
    #   get-mime-type = "%xdg-mime query filetype \"$f\"";
    #   open = "$$OPENER $f";
    # };
    # previewer.keybinding = "ctrl-p";
    previewer.source = "${previewScript}";
    # previewer.source = pkgs.writeShellScript "lf-previewer" (builtins.readFile ./lf-previewer.sh);
    # previewer.source = pkgs.writeShellScriptBin "lf-previewer" ''
    # '';
  };
}