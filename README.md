This is a repository of ansible playbooks for hosts on VTLUUG's network


To execute a playbook on all machines, run 
```ansible-playbook main.yml -i hosts.cfg -K -u <user>```


To limit execution to specific hosts, run
```ansible-playbook main.yml -i hosts.cfg --limit=<host group> -k -u <user ```


## Prerequisites

```ansible-galaxy install geerlingguy.ntp``` for ntp

```ansible-galaxy install geerlingguy.nfs``` for nfs

```ansible-galaxy install git+https://github.com/paulwalko/ansible-sudoers.git``` for sudoers

```ansible-galaxy install CTL-Fed-Security.freeipa-client```


We also use a modified version of the proxmox_kvm module because the official version is missing many features. We'll submit a PR in the future to get our changes merged.
