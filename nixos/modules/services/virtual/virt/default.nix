{ pkgs, ... }: 

{
  # Enable necessary kernel modules for VM performance
  # boot.kernelModules = ["kvm-amd" "kvm-intel" "vfio-pci"];
  boot.kernelModules = ["kvm" "vfio-pci"];
  # Add boot kernel parameters for better graphics support
  boot.kernelParams = [ "intel_iommu=on" "iommu=pt" ];
  # binfmt_misc for running foreign architecture VMs (e.g. ARM on x86)
  boot.binfmt.emulatedSystems = [ "aarch64-linux" "riscv64-linux" ];
  virtualisation.libvirtd = {
    enable = true;  # enable kvm support
    onBoot = "start";
    onShutdown = "shutdown";
    qemu = {
      # true: qemu:///system; false: qemu:///session
      # see: https://wiki.archlinux.org/title/Libvirt#Configuration
      runAsRoot = true;
      # ovmf submodule REMOVED: All OVMF images are now available by default in nixpkgs-unstable
      swtpm.enable = true;  # tpm emulation
      vhostUserPackages = with pkgs; [ virtiofsd ];
      # when `runAsRoot = false;`:
      # verbatimConfig = ''
      #   user = "qemu-libvirtd"
      #   group = "kvm"
      #   dynamic_ownership = 1
      #   remember_owner = 0
      # '';
    };
    allowedBridges = [
      "virbr0" # Default NAT bridge
      "br0"    # Custom bridge if needed
    ];
  };
  # Kernel modules for better VM performance
  virtualisation.spiceUSBRedirection.enable = true;
  # enable dnsmasq for network address translation and DHCP for VMs
  services.dnsmasq.enable = true;
  networking.firewall.trustedInterfaces = [ "virbr0" ];

  programs.virt-manager.enable = true;
  programs.systemtap.enable = true;
  programs.dconf.enable = true;  # Required for virt-manager settings

  environment.systemPackages = with pkgs; [
    virt-viewer     # View Virtual Machines
    qemu_kvm        # KVM support
    OVMF            # UEFI firmware
    swtpm           # TPM emulation
    libguestfs      # VM disk tools
    virt-v2v        # Convert guests from foreign hypervisors to run on KVM
    virt-top        # Watch the CPU, memory, network and disk utilization of all virtual machines running on a host.
    virt-what       # A shell script for detecting if the program is running in a virtual machine. It prints out a list of facts about the virtual machine, derived from heuristics.
    spice           # SPICE protocol support
    spice-gtk       # SPICE client GTK
    spice-protocol  # SPICE protocol headers
    virglrenderer   # Virtual GPU support
  ];

  # Create shared directories
  systemd.tmpfiles.rules = [
    # default iso and image directories for libvirt
    # "d /var/lib/libvirt/isos 0755 qemu-libvirtd kvm -"
    # "d /var/lib/libvirt/images 0755 qemu-libvirtd kvm -"

    # custom shared directories
    "d /home/nix/shared/iso 0755 qemu-libvirtd kvm -"  # ensure username is nix
  ];
}