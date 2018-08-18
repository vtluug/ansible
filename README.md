This is a repository of ansible playbooks for hosts on VTLUUG's network


To execute a playbook on all machines, run 
```ansible-playbook main.yml -i hosts.cfg -u <user> -k -K```

If you're executing the freeipa-client or deploy-vms role, also include ```--extra-vars @/path/to/vtluug/accounts/file```


To limit execution to specific hosts, run
```ansible-playbook main.yml -i hosts.cfg -u <user> -k -K --limit=<host group>```

## Client-side config required

In your client's (the host you're running ansible from) config (usually /etc/ansible/ansible.cfg) set the following option to make the playbooks work with a NFS root squashed path

```remote_tmp = /tmp/$USER-ansible/tmp```

## Prerequisites

```ansible-galaxy install geerlingguy.nfs``` for nfs

```ansible-galaxy install git+https://github.com/paulwalko/ansible-sudoers.git``` for sudoers
