LNLS Ansible Role EPICS development
=======================

References: https://github.com/geerlingguy/ansible-role-php

This Ansible role install EPICS packages.

## Requirements

- ansible >= 2.6
- molecule >= 3.0

## Role Variables

Available variables are listed below, along with default values (see defaults/main.yml):

```yaml
epics_base_dir: /usr/lib/epics
```

EPICS base directory

```yaml
epics_host_arch: linux-x86_64
```

EPICS host architecture


```yaml
    epics_packages_state: present
```

If you have enabled any additional repositories, you may want an easy way to
swap EPICS versions on the fly. By default, this is set to "present".
You can override this variable to "latest" to upgrade to the latest available
version.


```yaml
    epics_install_recommends: true
```

(Debian/Ubuntu only) Whether to install recommended packages when
installing EPICS packages; you might want to set this to no explicitly
if you're installing a PPA that recommends certain packages you don't want.


```yaml
    epics_packages_extra: []
```

A list of extra EPICS packages to install without overriding the default list.

## Example Playbook

```yaml
---
- hosts: all
  become: true
  tasks:
  - import_role:
      name: "{{ playbook_dir }}"

```

## Tests

Tests are performed using Molecule. To run them with python virtualenv, issue:

```bash
    bash -c "\
        cd ../ && \
        virtualenv env --python python3 && \
        source env/bin/activate && \
        cd lnls-ans-role-epics && \
        pip install molecule testinfra \
            yamllint ansible-lint flake8 docker-py && \
        molecule test"
```

Optionally, you can specify dns servers to be used for both
provisioner create and run (docker in our case), by using
the following variables:


```bash
    export DNS_SERVER1="<DNS server 1>"
    export DNS_SERVER2="<DNS server 2>"
```

This can be used, for instance, in hosts that have non-default
DNS configurations that docker can't access, such as when
using local systemd-resolv DNS (e.g., 127.x.y.z) or when DNS
servers are set via DHCP with local non-routable IP addresses
(e.g., 10.x.y.z).

## Troubleshooting

If you use a host system with SELinux enabled you might get an error when using
Ansible like the following:

```bash
    "msg": "Aborting, target uses selinux but python bindings (libselinux-python) aren't installed!"
```

If that happens, it might be because virtualenv does not have access to libselinux
and it can't be installed via pip.

A workaround might be to manually copy the librar files into the virtualenv
so that Ansible has access to it.

On a Fedra 29 system, using python3-7, the following fixes the issue:

```bash
    cp -r /usr/lib64/python3.7/site-packages/selinux env/lib64/python3.7/site-packages/
    cp -r /usr/lib64/python3.7/site-packages/_selinux.cpython-37m-x86_64-linux-gnu.so env/lib64/python3.7/site-packages/
```

Be advised, that the python versions might differ and the library names, as well.

## License

BSD 2-clause
