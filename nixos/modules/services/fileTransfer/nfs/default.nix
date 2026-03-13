# configurations.nix nfs.enable = true;
{ config, pkgs, lib, ... }:

let
  # 定义默认值
  nfsSharedPath = "/home/nix/shared";  # change your shared directory here
  allowedNetwork = "192.168.6.0/24";  # change your network here
  
  # 从模块参数中覆盖默认值
  sharedPath = if config.nfs ? sharedPath then config.nfs.sharedPath else nfsSharedPath;
  network = if config.nfs ? allowedNetwork then config.nfs.allowedNetwork else allowedNetwork;
in
{
  options.nfs = {
    enable = lib.mkEnableOption "NFS Server";
    
    sharedPath = lib.mkOption {
      type = lib.types.str;
      default = nfsSharedPath;
      description = "Path to the NFS shared directory";
    };
    
    allowedNetwork = lib.mkOption {
      type = lib.types.str;
      default = allowedNetwork;
      description = "Network allowed to access NFS share";
    };
  };

  config = lib.mkIf config.nfs.enable {
    services.nfs.server = {
      enable = true;
      exports = ''
        # 允许指定网络访问
        ${sharedPath} ${network}(rw,no_root_squash,no_subtree_check,insecure)
        
        # 本地访问权限
        # ${sharedPath} 127.0.0.1(rw,sync,no_subtree_check)

        # 如果需要，也可以添加主机名访问
        # ${sharedPath} localhost(rw,sync,no_subtree_check)
      '';
    };

    system.activationScripts.nfs-setup = ''
      if [ ! -d "${sharedPath}" ]; then
        mkdir -p "${sharedPath}"
        chown nix:users "${sharedPath}"
        chmod 777 "${sharedPath}"
        echo "Created NFS share directory: ${sharedPath}"
      else
        chown nix:users "${sharedPath}" || true
        chmod 777 "${sharedPath}" || true
       fi
    '';

    networking.firewall = {
      allowedTCPPorts = [ 
        2049  # NFS
        111  # RPC bind
        20048  # Mountd
      ];
      allowedUDPPorts = [ 
        2049  # NFS
        111  # RPC bind
        20048  # Mountd
      ];
    };

    services.nfs.client.enable = true;

    # 调整内核参数优化NFS性能
    boot.kernel.sysctl = {
      "sunrpc.tcp_slot_table_entries" = 128;
      "sunrpc.udp_slot_table_entries" = 128;
    };
  };
}