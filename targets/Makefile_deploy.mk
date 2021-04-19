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

deploy-fac-docker-images: playbook-fac-services-docker-images.yml
	ansible-playbook -u sirius -i hosts -k --ask-become-pass --extra-vars $(ANSIBLE_EXTRA_VARS) \
		playbook-fac-services-docker-images.yml

deploy-desktops-fac: playbook-desktops.yml
	ansible-playbook -u sirius -i hosts -l fac --ask-vault-pass -k --ask-become-pass --extra-vars $(ANSIBLE_EXTRA_VARS) \
		playbook-desktops.yml

deploy-beagles-si-correctors: playbook-bbb-repos-checkout.yml
	ansible-playbook -u fac -i hosts -l bbb_si_correctors -k --ask-become-pass playbook-bbb-repos-checkout.yml

deploy-beagles: playbook-bbb-repos-checkout.yml
	ansible-playbook -u fac -i hosts -l bbb -k --ask-become-pass playbook-bbb-repos-checkout.yml
