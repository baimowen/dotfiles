{ pkgs, ... }:

let
  previewScript = pkgs.writeShellScript "lf-previewer" (builtins.readFile ./lf-previewer.sh);
in
{
  programs.lf = {
    enable = true;
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
    #   #!/usr/bin/env bash
    #   # author: baimowen
    #   # time: 2026-07-09T16:20:16+08:00
    #   # depended on: bat ueberzugpp ffmpegthumbnailer unzip p7zip pdf-cli
    #   file="$${1##*/}"  # get the filename without the path
    #   x="$${2:-0}"
    #   y="$${3:-0}"
    #   width="$${4:-100%}"
    #   height="$${5:-100%}"
    #   mime_type=$$(file -Lb --mime-type -- "$$file")  # get the mime type of the file
    #   identifier="lf_preview"

    #   case "$$mime_type" in
    #     # text files
    #     text/*)
    #       bat --color=always --style=plain --paging=never -- "$$file"
    #       ;;

    #     # multi-media files
    #     image/*)
    #       printf '{"action":"add","identifier":"%s","x":%s,"y":%s,"width":"%s","height":"%s","path":"%s"}\n' \
    #         "$$identifier" "$$x" "$$y" "$$width" "$$height" "$$file" | ueberzugpp layer -o kitty  # --output {x11,wayland,sixel,kitty,iterm2,chafa}
    #       ;;
    #     video/*)
    #       # play the video
    #       # mpv \
    #       #   --ao=pipewire \  # use pipewire for audio output
    #       #   --vo=opengl \  # use opengl for video output
    #       #   --no-terminal \  # hidden stdout
    #       #   --force-window=immediate -- "$$file"
    #       # preview the thumbnail of the video
    #       trap 'rm -f "$$thumbnail_path"' EXIT
    #       thumbnail_path="/tmp/thumbnail_$$(date +%s).jpg"
    #       ffmpegthumbnailer -i "$$file" -o "$$thumbnail_path" \
    #         -a \  # no cropping
    #         -q 8 \  # quality level (0-10, 10 is best)
    #         -t 0  # screenshot at 0% of the video duration
    #       ;;
    #     audio/*)
    #       mpv --ao=pipewire --no-terminal --force-window=immediate -- "$$file"
    #       ;;

    #     # compressed files
    #     application/x-7z-compressed) 7z l "$$file" | awk '
    #       /^-{19} -{5} -{12} -{12}  -{24}$/ {
    #         count++
    #         if (count == 1) header_sep = NR
    #       }
    #       { lines[NR] = $0 }
    #       END {
    #         for (i = header_sep - 1; i <= NR; i++) print lines[i]
    #       }'
    #       ;;
    #     application/gzip) tar -tvf "$$file";;
    #     application/zip) unzip -l "$$file";;

    #     # document files
    #     application/pdf) pdf-cli "$$file";;

    #     # microsoft office files
    #     application/vnd.openxmlformats-officedocument.*) echo "Preview not supported for Microsoft Office files.";;
    #   esac
    # '';
  };
}