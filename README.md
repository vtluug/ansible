This is a repository of ansible playbooks for hosts on VTLUUG's network


To execute a playbook on all machines, run 
```ansible-playbook main.yml -i hosts.cfg -u <user> -k -K```


To limit execution to specific hosts, run
```ansible-playbook main.yml -i hosts.cfg -u <user> -k -K --limit=<host group>```

## Client-side config required

In your client's config (usually /etc/ansible/ansible.cfg) set the following many playbooks work with a NFS root squashed path

```remote_tmp = /tmp/$USER-ansible/tmp```

## Prerequisites

```ansible-galaxy install geerlingguy.nfs``` for nfs

```ansible-galaxy install git+https://github.com/paulwalko/ansible-sudoers.git``` for sudoers


We also use a modified version of the proxmox_kvm module because the official version is missing many features. We'll submit a PR in the future to get our changes merged.
