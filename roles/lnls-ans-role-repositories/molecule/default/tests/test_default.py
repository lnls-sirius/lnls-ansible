import os
import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ["MOLECULE_INVENTORY_FILE"]
).get_hosts("default_group")


@pytest.mark.parametrize("pkg", ["gnupg", "apt-transport-https"])
def test_default_pkgs(host, pkg):
    package = host.package(pkg)

    assert package.is_installed
