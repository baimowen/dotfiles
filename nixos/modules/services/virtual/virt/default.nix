# virtualization.nix
{ pkgs, ... }: 

{
  virtualisation = {
    libvirtd = {
      enable = true;  # enable kvm support
      onBoot = "start";
      onShutdown = "shutdown";
      qemu = {
        vhostUserPackages = with pkgs; [ virtiofsd ];
        runAsRoot = false;
        # ovmf submodule REMOVED: All OVMF images are now available by default in nixpkgs-unstable
        swtpm.enable = true; # TPM emulation
        verbatimConfig = ''
          user = "qemu-libvirtd"
          group = "kvm"
          dynamic_ownership = 1
          remember_owner = 0
        '';
      };
      allowedBridges = [
        "virbr0" # Default NAT bridge
        "br0" # Custom bridge if needed
      ];
    };

    # Kernel modules for better VM performance
    spiceUSBRedirection.enable = true;
  };

  programs = {
    virt-manager.enable = true;
    dconf.enable = true; # Required for virt-manager settings
  };

  environment.systemPackages = with pkgs; [
    virt-viewer     # View Virtual Machines
    qemu_kvm        # KVM support
    OVMF            # UEFI firmware
    swtpm           # TPM emulation
    libguestfs      # VM disk tools
    virt-top        # Monitor VM performance
    spice           # SPICE protocol support
    spice-gtk       # SPICE client GTK
    spice-protocol  # SPICE protocol headers
    virglrenderer   # Virtual GPU support
    mesa            # OpenGL support for VMs
  ];

  # Enable necessary kernel modules for VM performance
  # boot.kernelModules = ["kvm-amd" "kvm-intel" "vfio-pci"];
  boot.kernelModules = ["kvm" "vfio-pci"];

  # Add boot kernel parameters for better graphics support
  boot.kernelParams = [
    "intel_iommu=on"
    "iommu=pt"
  ];

  # binfmt_misc for running foreign architecture VMs (e.g. ARM on x86)
  boot.binfmt.emulatedSystems = [ "aarch64-linux" "riscv64-linux" ];

  # Create default ISO and VM directories with correct permissions
  systemd.tmpfiles.rules = [
    "d /var/lib/libvirt/isos 0755 qemu-libvirtd kvm -"
    "d /var/lib/libvirt/images 0755 qemu-libvirtd kvm -"
  ];
}