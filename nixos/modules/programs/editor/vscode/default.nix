{ pkgs, ... }:

{
  programs.vscode.enable = true;
  programs.vscode.package = pkgs.vscode;
  # programs.vscode.extensions = pkgs.vscode-extensions; [];
}