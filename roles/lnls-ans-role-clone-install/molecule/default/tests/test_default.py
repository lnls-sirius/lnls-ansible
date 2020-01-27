import os
# import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('default_group')


# @pytest.mark.parametrize('', [
# ])
def test_default(host):

    assert True
