# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
# man 5 configuration.nix

{ config, lib, pkgs, username ? "nix", hostname ? "nixos", ... }:

{
  nix = {
    package = pkgs.nix;
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      access-tokens = config.sops.secrets.github_access_token.path;
    };
  };

  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  # networking.hostName = "nixos"; # Define your hostname.
  networking.hostName = hostname;

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable Mesa/GPU drivers infrastructure
  # hardware.graphics = {
  #   enable = true;
  #   enable32Bit = true;
  # };

  # load NVIDIA modles on initrd
  # boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" ];

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable bluetooth support.
  # hardware.bluetooth.enable = true;
  # Enable bluetooth gui manager.
  # services.blueman.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.nix = {
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "incus-admin" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [];
    # generate hashedPassword: pass=$(openssl passwd -6 -salt SALT PASSWORD)
    # hashedPassword = "$6$YmFpbW93ZW4K$RnKOypvF69Te6spi5UCyHffAmG0XcyHQnoZTl8lgayKem6st74P9t/Y0kWD6bKRYJ7LS/AcVSSonPyxkJtxDE/";
    hashedPasswordFile = config.sops.secrets.password_hash.path;  # required decrypted secrets/password_hash.yaml context is: $6$SALT$HASH
  };

  # users.users.root.hashedPassword = "$6$YmFpbW93ZW4K$RnKOypvF69Te6spi5UCyHffAmG0XcyHQnoZTl8lgayKem6st74P9t/Y0kWD6bKRYJ7LS/AcVSSonPyxkJtxDE/";
  users.users.root.hashedPasswordFile = config.sops.secrets.password_hash.path;

  # programs.firefox.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # if use docker and libvirt, replace nftables to iptables.
  # [how the two firewalls interact:](https://wiki.nftables.org/wiki-nftables/index.php/Troubleshooting#Question_4._How_do_nftables_and_iptables_interact_when_used_on_the_same_system.3F)
  # [nftables cfg](https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/services/networking/nftables.nix)
  networking.nftables.enable = true;
  # networking.nftable.flushRuleset = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}

