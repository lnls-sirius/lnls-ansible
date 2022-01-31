## Description

Install packages into a conda environment

## Requirements

```command
pip install \
    ansible==5.2.0 \
    ansible-core==2.12.1 \
    ansible-lint==5.3.2 \
    molecule==3.5.2 \
    molecule-docker==1.1.0
```

## Example Playbook

```yaml
---
- hosts: all
  tasks:
  - import_role:
      name: "{{ playbook_dir }}"
```

## Example Commmand

```bash
ansible-playbook -i host, -u user -k --ask-become-pass playbook.yml
```

## Tests

Python dependencies

```bash
pip install -r molecule/default/requirements.txt
```

Tests are performed using Molecule. It is recommended to use conda or a virtualenv.

Conda:

```bash
conda create --name molecule-py36 python=3.6
conda activate molecule-py36
pip install -r molecule/default/requirements.txt
molecule test
```

Virtualenv:

```bash
    bash -c "\
        cd ../ && \
        virtualenv env --python python3 && \
        source env/bin/activate && \
        cd lnls-ans-role-conda-packages && \
        pip install -r molecule/default/requirements.txt && \
        molecule test"
```

Optionally, you can specify dns servers to be used for both
provisioner create and run (docker in our case), by using
the following variables:

```bash
    export DNS_SEARCH="<DNS Search>"
    export DNS_SERVER1="<DNS server 1>"
    export DNS_SERVER2="<DNS server 2>"
    export APT_PROXY_SERVER="<APT Proxy Address>"
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
