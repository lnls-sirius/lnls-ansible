playbook-beaglebones-repos-checkout.yml: $(PLAYBOOKS_DIR)/beaglebones/repos-checkout.yml
	ansible-playbook $(EXTRA_OPTS)

playbook-generic-setup-ssh-key.yml: $(PLAYBOOKS_DIR)/generic/setup-ssh-key.yml
	ansible-playbook $(EXTRA_OPTS)
playbook-playbook-ctrl-service.yml: $(PLAYBOOKS_DIR)/playbook-ctrl-service.yml
	ansible-playbook $(EXTRA_OPTS)
playbook-playbook-desktops.yml: $(PLAYBOOKS_DIR)/playbook-desktops.yml
	ansible-playbook $(EXTRA_OPTS)

playbook-servers-ioc.yml: $(PLAYBOOKS_DIR)/servers/ioc.yml
	ansible-playbook $(EXTRA_OPTS)
playbook-servers-web.yml: $(PLAYBOOKS_DIR)/servers/web.yml
	ansible-playbook $(EXTRA_OPTS)
