This is a repository of ansible playbooks for hosts on VTLUUG's network


To execute a playbook on all machines, run 
```ansible-playbook main.yml -i hosts.cfg -K -u <user>```


To limit execution to specific hosts, run
```ansible-playbook main.yml -i hosts.cfg --limit=<host group> -k -u <user ```


## Prerequisites

```ansible-galaxy install geerlingguy.ntp``` for ntp

```ansible-galaxy install geerlingguy.nfs``` for nfs


### Additonal Configuration
In /usr/lib/python3.6/site-packages/ansible/modules/cloud/misc/proxmox_kvm.py:
    - On line 1147, change the return value so the newid is also returned:
        - ... % (name, newid, vmid) changes to ... % (name, newid, vmid), newid=newid) 
