import os
import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('default_group')


@pytest.mark.parametrize('pkg', [
    'epics-dev',
])
def test_default_pkgs(host, pkg):
    package = host.package(pkg)

    assert package.is_installed


@pytest.mark.parametrize('tool', [
    'caget',
    'caput',
])
def test_default_tools(host, tool):
    try:
        cmd = host.find_command(tool)
        print('{} tool found in {}'.format(tool, cmd))
    except ValueError:
        assert False
