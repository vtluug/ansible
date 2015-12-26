This is a repository of ansible playbooks for hosts on VTLUUG's network. Currently everything assumes that networking is manually setup (internal interface on eth0, external on eth1 if applicable, and a bridged interface for the VM servers).

Add files containing passwords to .gitignore before staging so they are not stored in the repo.

To execute a playbook on all machines, run 
`ansible-playbook site.yml -u ssh_username`

For more info, man ansible-playbook or see http://ansible.cc

The following things must be done manually:
- network setup, including port forwarding/bridging
- full kerberos auth (LDAP/Kerberos auth without keytabs/DNS is possible in
  kerberos.yml)
- static DHCP / DNS entries
