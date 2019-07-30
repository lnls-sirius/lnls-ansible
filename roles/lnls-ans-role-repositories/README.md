LNLS Ansible Role Repository
=======================

References: https://bitbucket.org/europeanspallationsource/ics-ans-role-repository

This Ansible role enables the Debian NSLS-II repositories.

## Requirements

- ansible >= 2.4
- molecule >= 2.20

Role Variables

```yaml
repository_installroot: "/"
```

The `repository_installroot` variable allows to specify an alternative installroot, e.g. /export/nfsroots/debian9/rootfs

## Example Playbook

```yaml
- hosts: servers
  roles:
    - role: lnls-ans-role-repository
```

## Tests

Tests are performed using Molecule. To run them with python virtualenv, issue:

```bash
    bash -c "\
        cd ../ && \
        virtualenv env --python python3 && \
        source env/bin/activate && \
        cd lnls-ans-role-repository && \
        pip install molecule docker-py && \
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
