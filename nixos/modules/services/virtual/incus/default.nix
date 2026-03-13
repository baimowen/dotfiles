{ config, pkgs, lib, ... }:

{
  # [incus](https://wiki.nixos.org/wiki/Incus#VMs)
  # [incus](https://linuxcontainers.org/incus/docs/main/howto/initialize/)
  virtualisation.incus = {
    enable = true;
    ui.enable = true;
    # or use `incus admin init`
    preseed = {
      config = {
        "core.https_address" = "0.0.0.0:17171";
      };
      networks = [
        {
          config = {
            "ipv4.address" = "172.10.0.1/24";
            "ipv4.nat" = "true";
          };
          name = "incusbr0";
          type = "bridge";
        }
      ];
      storage_pools = [
        {
          config = {
            source = "/var/lib/incus/storage-pools/default";
          };
          driver = "dir";  # zsf/btrfs is also supported
          name = "default";
        }
      ];
      profiles = [
        {
          devices = {
            eth0 = { name = "eth0"; network = "incusbr0"; type = "nic"; };
            root = { path = "/"; pool = "default"; size = "256GiB"; type = "disk"; };
          };
          name = "default";
        }
      ];
    };
  };

  # This interface name should match the name given during initialization or configured through the incus interfaces.
  networking.firewall.trustedInterfaces = [ "incusbr0" ];
  networking.firewall.allowedTCPPorts = [ 17171 ];  # allow incus webui port
  # or
  # networking.firewall.interfaces.incusbr0.allowedTCPPorts = [ 53 67 ];
  # networking.firewall.interfaces.incusbr0.allowedUDPPorts = [ 53 67 ];

  environment.systemPackages = with pkgs; [
    incus  # import image use `incus import /path/to/image --alias image_tag`
    nixos-generators  # generate nixos configuration for incus VMs, use `nixos-generate -f lxc -c /path/to/configuration.nix -o ./output`
  ];
  # incus default remote response is "image:" (from Linux Containers offical)
  # list available images with `incus image list images:<distro_name>`
  # launch a lxc container with `incus launch images:<distro_name>/<version> <custom_container_name> -c security.nesting=true`
  # and exec a container terminal with `incus shell <custom_container_name>`
  # stop and delete a container with `incus stop <custom_container_name>` and `incus delete <custom_container_name>`
}