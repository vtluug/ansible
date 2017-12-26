This is a repository of ansible playbooks for hosts on VTLUUG's network. TODO

To execute a playbook on all machines, run 
"ansible-playbook all main.yml -i hosts.cfg -K"
For more info, man ansible-playbook or see http://ansible.cc

The following things must be done manually:
- ZFS pool creation (zfs preparation & mount configuration are automated)
TODO
