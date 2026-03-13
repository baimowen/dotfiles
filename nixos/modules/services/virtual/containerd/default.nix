{ config, pkgs, ... }:

{
  virtualisation.containerd = {
    enable = true;
    # package = pkgs.containerd;
    settings = {
      version = 2;
      root = "/var/lib/containerd";
      state = "/run/containerd";
      # /etc/containerd/config.toml: 
      # [plugins."io.containerd.cri.v1.images".registry.mirrors."docker.io"]
      #   endpoint: []
      plugins."io.containerd.grpc.v1.cri" = {
        # systemd_cgroup = true;
        # sandbox_image = "registry.k8s.io/pause:latest";
        registry = {
          mirrors = {
            "docker.io" = {
              endpoint = [
                "https://mirror.docker.nju.edu.cn"
              ];
            };
          };
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    nerdctl
    calicoctl
    etcd
  ];
}
