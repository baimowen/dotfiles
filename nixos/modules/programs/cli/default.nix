{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.nix-index  # search on nixpkgs which command in packages (nix-locate bin/command)
    pkgs.nix-prefetch-git
    pkgs.tree
    pkgs.lf
    pkgs.tldr  # Simplified and community-driven man pages
    pkgs.jq  # Lightweight and flexible command-line JSON processor
    pkgs.yq  # Command-line YAML/XML/TOML processor - jq wrapper for YAML, XML, TOML documents
    pkgs.dos2unix  # Convert text files with DOS or Mac line breaks to Unix line breaks and vice versa
    # pkgs.hyperfine  # Command-line benchmarking tool
    pkgs.nitch  # Incredibly fast system fetch written in nim
    pkgs.duf  # Disk Usage/Free Utility - a better 'df' alternative
    pkgs.ncdu  # Disk usage analyzer with an ncurses interface
    pkgs.rsync  # Fast incremental file transfer utility
    # pkgs.rsyncy  # Progress bar wrapper for rsync
    pkgs.nmap
    pkgs.tcpdump
    pkgs.w3m
  ];
}