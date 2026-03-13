# clear system caches and user caches
rm -rf ~/.cache/*
sudo rm -rf /var/cache/*
sudo rm -rf /tmp/*
sudo rm -rf /nix/var/nix/gcroots/tmp/*

# clear systemd journal logs
sudo journalctl --rotate
sudo journalctl --vacuum-time=1d

# clear nix generatation
# sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +2
sudo nix-env -p /nix/var/nix/profiles/system --delete-generations old
nix-env --list-generations
home-manager expire-generations 0

# clear nix store garbage
sudo nix-collect-garbage -d
# clear nix store unused paths
# sudo nix-store --gc --delete-older-than 1d
sudo nix-store --gc