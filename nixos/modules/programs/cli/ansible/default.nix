{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [ ansible ];
  environment.etc."ansible/ansible.cfg".text = ''
    [defaults]
    inventory = /etc/ansible/hosts
    private_key_file = $HOME/.ssh/id_ed25519
    remote_user = ansible
    playbook_dir = $HOME/ansible/playbooks
    [privilege_escalation]
    become = True
    become_method = sudo
    become_user = root
    become_ask_pass = False
    [diff]
    always = True
  '';
  environment.etc."ansible/hosts".text = ''
    [local]
  '';
}