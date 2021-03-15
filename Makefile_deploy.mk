# Deploy Targets
# ==============
#
# Standard deploy steps:
#
# 1. make deploy-tag-create [create deploy tag with timestamp]
# 2. make deploy [run deploy playbooks]
# 3. make deploy-fac-iocs-image [run playbook that creates updated IOC docker image]
# 4. make deply-tag-lnls-ansible [tag deploy version in ansible]
#
# step 3 tags repo 'docker-machine-applications' with same deploy timestamp as 'lnls-ansible'

# Variables

TIMESTAMP_TAG ?= $(shell cat /tmp/_ANSIBLE_DEPLOY_TAG_)
ANSIBLE_EXTRA_VARS = "deploy_tag=deploy_$(TIMESTAMP_TAG)"

deploy-tag-create:
	date '+%Y-%m-%d_%H-%M-%S' > /tmp/_ANSIBLE_DEPLOY_TAG_

deploy-tag-show:
	@echo deploy_$(TIMESTAMP_TAG)

deploy-tag-lnls-ansible:
	git tag deploy_$(TIMESTAMP_TAG); \
	git push --tags
	
deploy-servers-nfs: playbook-servers-nfs.yml
	ansible-playbook -u sirius -i hosts --ask-vault-pass -k --ask-become-pass --extra-vars $(ANSIBLE_EXTRA_VARS) \
		playbook-servers-nfs.yml

deploy-servers-web: playbook-servers-web.yml
	ansible-playbook -u sirius -i hosts --ask-vault-pass -k --ask-become-pass --extra-vars $(ANSIBLE_EXTRA_VARS) \
		playbook-servers-web.yml

deploy-servers-ioc: playbook-servers-ioc.yml
	ansible-playbook -u sirius -i hosts --ask-vault-pass -k --ask-become-pass --extra-vars $(ANSIBLE_EXTRA_VARS) \
		playbook-servers-ioc.yml

deploy-desktops: playbook-desktops.yml
	ansible-playbook -u sirius -i hosts --ask-vault-pass -k --ask-become-pass --extra-vars $(ANSIBLE_EXTRA_VARS) \
		playbook-desktops.yml

deploy: playbook-servers-nfs.yml playbook-servers-web.yml playbook-servers-ioc.yml playbook-desktops.yml
	ansible-playbook -u sirius -i hosts --ask-vault-pass -k --ask-become-pass --extra-vars $(ANSIBLE_EXTRA_VARS) \
		playbook-servers-nfs.yml \
		playbook-servers-web.yml \
		playbook-servers-ioc.yml \
		playbook-desktops.yml

deploy-fac-iocs-image: playbook-fac-services-docker-images.yml
	ansible-playbook -u sirius -i hosts -k --ask-become-pass --extra-vars $(ANSIBLE_EXTRA_VARS) \
		playbook-fac-services-docker-images.yml

deploy-desktops-fac: playbook-desktops.yml
	ansible-playbook -u sirius -i hosts -l fac --ask-vault-pass -k --ask-become-pass --extra-vars $(ANSIBLE_EXTRA_VARS) \
		playbook-desktops.yml

deploy-beagles-si-correctors: playbook-bbb-repos-checkout.yml
	ansible-playbook -u fac -i hosts -l bbb_si_correctors -k --ask-become-pass playbook-bbb-repos-checkout.yml

deploy-beagles: playbook-bbb-repos-checkout.yml
	ansible-playbook -u fac -i hosts -l bbb -k --ask-become-pass playbook-bbb-repos-checkout.yml
