Vagrant Testing
=======================

This Vagrant directory contains the necessary infrastructure to test
ansible roles in Vagrant boxes.

Four environments are provided: Debian Stretch, Debian Jessie, Ubuntu Trusty
and Ubuntu Xenial.

## Instructions

Start vagrant boxes by issuing:

```bash
    vagrant up
```

Or by selecting only one of them:

```bash
    vagrant up debian.stretch
```

Run a basic ansible playbook to configure the SSH keys on the vagrant box:

```bash
    ansible-playbook -i hosts -u vagrant setup.yml
```

Or by selecting only one of them:

```bash
    ansible-playbook -i hosts -l debian.stretch -u vagrant setup.yml
```

Run the playbook agains the boxes:

```bash
    ansible-playbook -i hosts -u vagrant ../molecule/default/playbook.yml
```

Or by selecting only one of them:

```bash
    ansible-playbook -i hosts -l debian.stretch -u vagrant ../molecule/default/playbook.yml
```
