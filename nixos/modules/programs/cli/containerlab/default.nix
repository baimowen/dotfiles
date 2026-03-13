{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    containerlab  # 需要将用户添加到 clab_admins 组中
    gh
    cacert
  ];
}