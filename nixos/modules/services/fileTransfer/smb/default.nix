# modules/services/smb/smb.nix
{ config, pkgs, username ? "nix", ... }:

{
  # 启用 Samba 服务
  services.samba = {
    enable = true;
    openFirewall = true;  # 自动打开防火墙端口

    settings = {
      global = {
        workgroup = "WORKGROUP";  # 工作组名称
        "server string" = "NixOS Samba Server";  # 服务器描述
        security = "user";  # 用户级别的安全性
        "map to guest" = "bad user";  # 映射无效用户到访客
      };
    };

    # 共享配置
    shares = {
      shared = {
        comment = "Shared Directory";
        # path = "/home/nix/shared";
        path = "/home/${username}/shared";
        writeable = "yes";
        browseable = "yes";
        "guest ok" = "no";  # 需要认证
        "valid users" = "samba";
        "create mask" = "0644";
        "directory mask" = "0755";
        # "force user" = "nix";
        "force user" = username;
        "force group" = "users";
      };
      # public = {
      #   comment = "Public Directory";
      #   path = "/home/nix/public";
      #   browseable = "yes";
      #   "read only" = "no";
      #   "guest ok" = "yes";  # 允许访客访问
      # };
    };
  };

  # 创建系统用户和组
  users.groups.samba = {};
  users.users.samba = {
    isSystemUser = true;
    group = "samba";
    description = "Samba user";
  };

  # 创建共享目录和设置 SMB 用户
  system.activationScripts.samba-setup = {
    text = ''
      # 创建共享目录
      # mkdir -p /home/nix/shared
      # chmod 777 /home/nix/shared
      mkdir -p /home/${username}/shared
      chmod 777 /home/${username}/shared
      
      # 添加 SMB 用户
      if ! ${pkgs.samba}/bin/pdbedit -L | grep -q "^samba:"; then
        echo "Creating Samba user 'samba'"
        (echo "baimowen"; echo "baimowen") | ${pkgs.samba}/bin/smbpasswd -a -s samba
      else
        echo "Updating Samba user 'samba' password"
        (echo "baimowen"; echo "baimowen") | ${pkgs.samba}/bin/smbpasswd -s samba
      fi
    '';
    deps = [ ];
  };

  environment.systemPackages = with pkgs; [ samba ];
}