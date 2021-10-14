playbook-beaglebones-repos-checkout.yml: $(PLAYBOOKS_DIR)/beaglebones/repos-checkout.yml
	ansible-playbook $(EXTRA_OPTS) --extra-vars "inventory=$(BEAGLEBONE_INVENTORY)"

playbook-generic-setup-ssh-key.yml: $(PLAYBOOKS_DIR)/generic/setup-ssh-key.yml
	ansible-playbook $(EXTRA_OPTS)

playbook-servers-ioc.yml: $(PLAYBOOKS_DIR)/servers/ioc.yml
	ansible-playbook $(EXTRA_OPTS) --extra-vars "inventory=$(SIRIUS_INVENTORY)"
playbook-servers-nfs.yml: $(PLAYBOOKS_DIR)/servers/nfs.yml
	ansible-playbook $(EXTRA_OPTS) --extra-vars "inventory=$(SIRIUS_INVENTORY)"
playbook-servers-web.yml: $(PLAYBOOKS_DIR)/servers/web.yml
	ansible-playbook $(EXTRA_OPTS) --extra-vars "inventory=$(SIRIUS_INVENTORY)"
