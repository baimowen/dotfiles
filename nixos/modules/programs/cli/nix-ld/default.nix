{ pkgs, inputs, ... }:

{
  # see: https://github.com/nix-community/nix-ld
  programs.nix-ld.enable = true;
  # Precompiled binaries that were not created for NixOS usually
  # have a so-called link-loader hardcoded into them. On
  # Linux/x86_64 this is for example /lib64/ld-linux-x86-64.so.2.
  # for glibc. NixOS, on the other hand, usually has its dynamic
  # linker in the glibc package in the Nix store and therefore
  # cannot run these binaries. Nix-ld provides a shim layer for
  # these types of binaries. It is installed in the same location
  # where other Linux distributions install their link loader,
  # ie. /lib64/ld-linux-x86-64.so.2 and then loads the actual link
  # loader as specified in the environment variable NIX_LD. In
  # addition, it also accepts a colon-separated path from library
  # lookup paths in NIX_LD_LIBRARY_PATH. This environment variable
  # is rewritten to LD_LIBRARY_PATH before passing execution to the 
  # actual ld. This allows you to specify additional libraries that
  # the executable needs to run.
}