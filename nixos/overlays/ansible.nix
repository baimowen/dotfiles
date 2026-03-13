final: prev: {
  ansible = prev.ansible.overrideAttrs (old: {
    pname = "ansible-declarative";
    postInstall = (old.postInstall or "") + ''
      echo "ansible overlay enabled"
    '';
  });
}