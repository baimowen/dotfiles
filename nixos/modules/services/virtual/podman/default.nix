{ ... }:

{
  virtualisation.podman = {
    enable = true;
    dockerCompat = false;  # avoid conflicts with containerd
    dockerSocket.enable = true;
    # networkSocket = {
    #   enable = true;
    #   port = 2376;
    #   openFirewall = true;
    #   listenAddress = "0.0.0.0";
    # };
  };
}