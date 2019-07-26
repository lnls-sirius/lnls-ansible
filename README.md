LNLS Ansible
=======================

This Ansible roles/playbooks for Sirius Light Source control machines.

## Example Playbook

```yaml
---
- hosts: all
  tasks:
  - import_role:
      name: lnls-ans-role-users
```

## Example Commmand

```bash
ansible-playbook -i host, -u user -k --ask-become-pass playbook.yml
```

## License

BSD 2-clause
