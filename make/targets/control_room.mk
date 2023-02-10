ANSIBLE_EXTRA_VARS = "inventory=$(SIRIUS_INVENTORY)"

control-room-setup-glusterfs: playbooks/playbook-control-room-glusterfs.yml
	ansible-playbook \
		--user server \
		--inventory $(SIRIUS_INVENTORY) \
		--extra-vars $(ANSIBLE_EXTRA_VARS) \
		--ask-pass \
		--ask-become-pass \
		playbooks/playbook-control-room-glusterfs.yml
