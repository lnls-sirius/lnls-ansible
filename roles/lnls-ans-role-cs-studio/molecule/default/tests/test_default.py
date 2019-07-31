import os
# import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('default_group')


def test_import_connect2j(host):
    cmd = host.run('/opt/conda/envs/csstudio/bin/python -c "import connect2j"')
    assert cmd.rc == 0
