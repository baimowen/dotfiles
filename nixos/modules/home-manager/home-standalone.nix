{ self, pkgs, inputs, username... }: {
  system.activationScripts.hm.text = ''
    set -e
    HOME_SWITCH="/home/${username}/.cache"
    if [ ! -f "$HOME_SWITCH" ]; then
      mkdir -p /home/${username}/.cache
      chown -R ${username}:users /home/${username}/.cache
      echo "apply home-manager"
      su - ${username} -c '
        ${pkgs.home-manager}/bin/home-manager switch --flake ${self}#${username}
        echo "current generations:" > ~/.cache/.homeswitch
        ${pkgs.home-manager}/bin/home-manager generations >> ~/.cache/.homeswitch
      '
    else:
      echo "home-manager alreade switched, skip"
    fi
  '';
}