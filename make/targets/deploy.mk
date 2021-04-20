# Deploy Targets
# ==============
#
# Steps of a standard deploy:
#
# 1. make deploy-tag-create        # [create deploy tag with timestamp]
# 2. make deploy-tag-show          # [show timestamp deploy tag created]
# 3. make deploy                   # [run deploy playbooks]
# 4. make deploy-fac-docker-images # [run playbook that creates updated docker images]
# 5. make deploy-tag-lnls-ansible  # [tag deploy version in ansible]
#
# ps: a) at step 4 docker image files 'fac-apps', 'fac-iocs' and 'fac-csconsts' are
#        created with deploy tag shown in step 2. (e.x.: fac-iocs:2021-03-17_16-01-12) and
#        pushed into our local docker registry at "dockerregistry.lnls-sirius.com.br/fac/".
#     b) tag vars in .env files of repos docker-machine-applications and docker-control-system-constants
#        can be then edited according to deploy target and docker services can be restarted with
#         1. cd ~/repos-dev/docker-control-system-constants && make service-stop-fac-csconsts && make service-start-fac-csconsts
#         2. cd ~/repos-dev/docker-machine-applications && make service-stop-highstack-all && make service-start-highstack-all
#            (fac services in docker-machine-applications can be restarted one-by-one too, instead of all at the same time.)

# Variables

TIMESTAMP_TAG ?= $(shell cat /tmp/_ANSIBLE_DEPLOY_TAG_)
ANSIBLE_EXTRA_VARS = "deploy_tag=$(TIMESTAMP_TAG)"

deploy-tag-create:
	date '+%Y-%m-%d_%H-%M-%S' > /tmp/_ANSIBLE_DEPLOY_TAG_

deploy-tag-show:
	@echo deploy_$(TIMESTAMP_TAG)

deploy-tag-lnls-ansible:
	git tag deploy_$(TIMESTAMP_TAG); \
	git push --tags
	
deploy-servers-nfs: playbooks/servers/nfs.yml
	ansible-playbook -u sirius --inventory $(SIRIUS_INVENTORY) --ask-vault-pass -k --ask-become-pass --extra-vars $(ANSIBLE_EXTRA_VARS) \
		playbooks/servers/nfs.yml

deploy-servers-web: playbooks/servers/web.yml
	ansible-playbook -u sirius --inventory $(SIRIUS_INVENTORY) --ask-vault-pass -k --ask-become-pass --extra-vars $(ANSIBLE_EXTRA_VARS) \
		playbooks/servers/web.yml

deploy-servers-ioc: playbooks/servers/ioc.yml
	ansible-playbook -u sirius --inventory $(SIRIUS_INVENTORY) --ask-vault-pass -k --ask-become-pass --extra-vars $(ANSIBLE_EXTRA_VARS) \
		playbooks/servers/ioc.yml

deploy-desktops: playbooks/playbook-desktops.yml
	ansible-playbook -u sirius --inventory $(SIRIUS_INVENTORY) --ask-vault-pass -k --ask-become-pass --extra-vars $(ANSIBLE_EXTRA_VARS) \
		playbooks/playbook-desktops.yml

deploy: playbooks/servers/nfs.yml playbooks/servers/web.yml playbooks/servers/ioc.yml playbooks/playbook-desktops.yml
	ansible-playbook -u sirius --inventory $(SIRIUS_INVENTORY) --ask-vault-pass -k --ask-become-pass --extra-vars $(ANSIBLE_EXTRA_VARS) \
		playbooks/servers/nfs.yml \
		playbooks/servers/web.yml \
		playbooks/servers/ioc.yml \
		playbooks/playbook-desktops.yml

deploy-fac-docker-images: playbooks/playbook-fac-services-docker-images.yml
	ansible-playbook -u sirius --inventory $(SIRIUS_INVENTORY) -k --ask-become-pass --extra-vars $(ANSIBLE_EXTRA_VARS) \
		playbooks/playbook-fac-services-docker-images.yml

deploy-desktops-fac: playbooks/playbook-desktops.yml
	ansible-playbook -u sirius --inventory $(SIRIUS_INVENTORY) -l fac --ask-vault-pass -k --ask-become-pass --extra-vars $(ANSIBLE_EXTRA_VARS) \
		playbooks/playbook-desktops.yml

deploy-beagles-si-correctors: playbooks/beaglebones/repos-checkout.yml
	ansible-playbook -u fac --inventory $(BEAGLEBONE_INVENTORY) --inventory $(BEAGLEBONE_INVENTORY) -l bbb_si_correctors -k --ask-become-pass playbooks/beaglebones/repos-checkout.yml

deploy-beagles: playbooks/beaglebones/repos-checkout.yml
	ansible-playbook -u fac --inventory $(BEAGLEBONE_INVENTORY) --inventory $(BEAGLEBONE_INVENTORY) -l bbb -k --ask-become-pass playbooks/beaglebones/repos-checkout.yml
