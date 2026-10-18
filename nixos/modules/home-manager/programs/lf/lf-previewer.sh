#!/usr/bin/env bash
# author: baimowen
# time: 2026-07-09t16:20:16+08:00
# reference:
#   https://github.com/gokcehan/lf/wiki/Previews
#   https://bbs.archlinux.org/viewtopic.php?id=286398
# depended on: bat timg ffmpegthumbnailer unzip p7zip pdf-cli
# file="${1##*/}"  # get the filename without the path
# file="$(readlink -f "$1")"  # get the absolute path of the file
file="$1"
x="${2:-0}"
y="${3:-0}"
width="${4:-100%}"
height="${5:-100%}"
mime_type=$(file -Lb --mime-type -- "$file")  # get the mime type of the file
identifier="lf_preview"

case "$mime_type" in
  # text files
  text/*)
    bat --color=always --style=plain --paging=never -- "$file"
    ;;

  # multi-media files
  image/*)
    # printf '{"action":"add","identifier":"%s","x":%s,"y":%s,"width":"%s","height":"%s","path":"%s"}\n' \
    #   "$identifier" "$x" "$y" "$width" "$height" "$file" | ueberzugpp layer -o kitty  # --output {x11,wayland,sixel,kitty,iterm2,chafa}
    timg "$file"
    #   -I \  # image preview
    #   -p k \  # protocol kitty
    #   --title=%b-%wx%h  # example-1920x1080
    ;;
  video/*)
    # play the video
    # mpv \
    #   --ao=pipewire \  # use pipewire for audio output
    #   --vo=opengl \  # use opengl for video output
    #   --no-terminal \  # hidden stdout
    #   --force-window=immediate -- "$file"
    # preview the thumbnail of the video
    # thumbnail_path=/tmp/thumbnail_"$(date -Iseconds)".jpg
    thumbnail_path=$(mktemp --tmpdir=/tmp --suffix=.jpg "thumbnail_$(date -Iseconds)_XXX")
    trap 'rm -f "$thumbnail_path"' EXIT
    ffmpegthumbnailer -i "$file" -o "$thumbnail_path" -q8 -t0
      # -s 0 \  # use the origin proportion
      # -a \  # no cropping
      # -q 8 \  # quality level (0-10, 10 is best)
      # -t 0  # screenshot at 0% of the video duration
    kitten icat --silent --stdin=no --transfer-mode=stream "$thumbnail_path"
    ;;
  audio/*)
    mpv --ao=pipewire --no-video --audio-display=no -- "$file"
      # --force-window=immediate
    ;;

  # compressed files
  application/x-7z-compressed) 7z l "$file" | awk '
    /^-{19} -{5} -{12} -{12}  -{24}$/ {
      count++
      if (count == 1) header_sep = nr
    }
    { lines[nr] = $0 }
    end {
      for (i = header_sep - 1; i <= nr; i++) print lines[i]
    }'
    ;;
  application/gzip) tar -tvf "$file";;
  application/zip) unzip -l "$file";;

  # document files
  application/pdf) pdf-cli "$file";;

  # microsoft office files
  application/vnd.openxmlformats-officedocument.*) echo "preview not supported for microsoft office files.";;
esac