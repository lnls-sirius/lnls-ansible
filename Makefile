# Variables
DNS_SERVER1 ?= 10.0.0.71
DNS_SERVER2 ?= 10.0.0.72
export DNS_SERVER1
export DNS_SERVER2
MOLECULE_DISTRO ?= debian:buster
export MOLECULE_DISTRO
BUILD_TYPE ?= default
export BUILD_TYPE
HOST_GROUPS ?=
REMOTE_USER ?= sirius
ASK_FOR_PASS ?= y
ASK_FOR_VAULT_PASS ?= y
ANSIBLE_EXTRA_VARS ?=

EXTRA_OPTS =
ifneq ($(REMOTE_USER),)
	EXTRA_OPTS += -u $(REMOTE_USER)
else
	EXTRA_OPTS +=
endif

ifneq ($(HOST_GROUPS),)
	EXTRA_OPTS += -i hosts -l $(HOST_GROUPS)
else
	EXTRA_OPTS += -i hosts
endif

ASK_FOR_VAULT_PASS_FILTER=$(if $(filter y,${ASK_FOR_VAULT_PASS}),true,false)
ifeq ($(ASK_FOR_VAULT_PASS_FILTER),true)
	EXTRA_OPTS += --ask-vault-pass
else
	EXTRA_OPTS +=
endif

ASK_FOR_PASS_FILTER=$(if $(filter y,${ASK_FOR_PASS}),true,false)
ifeq ($(ASK_FOR_PASS_FILTER),true)
	EXTRA_OPTS += -k --ask-become-pass
else
	EXTRA_OPTS +=
endif

ifneq ($(ANSIBLE_VARS),)
	EXTRA_OPTS += --extra-vars "$(ANSIBLE_VARS)"
else
	EXTRA_OPTS +=
endif



ROLES_DIR = roles

# Roles
ROLES = \
    lnls-ans-role-cs-studio \
    lnls-ans-role-ctrl-service \
    lnls-ans-role-desktop-apps \
    lnls-ans-role-desktop-settings \
    lnls-ans-role-epics \
    lnls-ans-role-epics7 \
    lnls-ans-role-epics-mca \
    lnls-ans-role-java \
    lnls-ans-role-network \
    lnls-ans-role-nfsclient \
    lnls-ans-role-nfsserver \
    lnls-ans-role-ntp \
    lnls-ans-role-nvidia-driver \
    lnls-ans-role-octave \
    lnls-ans-role-phoebus \
    lnls-ans-role-pydm \
    lnls-ans-role-python \
    lnls-ans-role-qt \
    lnls-ans-role-repositories \
    lnls-ans-role-sirius-apps \
    lnls-ans-role-sirius-hla \
    lnls-ans-role-sirius-bbb \
    lnls-ans-role-users \
    lnls-ans-role-visual-studio-code \
    lnls-ans-role-zabbix

# Playbooks
PLAYBOOKS = \
    playbook-servers-nfs.yml \
    playbook-servers-web.yml \
    playbook-servers-ioc.yml \
    playbook-desktops.yml \
    playbook-reboot.yml \
    playbook-setup-ssh-key.yml \
    playbook-ctrl-service.yml \
    playbook-bbb-repos-checkout.yml

# Test variables
TEST_TARGET = test_
test_TARGETS = $(addprefix $(TEST_TARGET), $(ROLES))

# Playbook variables
playbook_TARGETS = $(basename $(PLAYBOOKS))

all: $(playbook_TARGETS)

$(playbook_TARGETS): %: %.yml
	ansible-playbook $(EXTRA_OPTS) $<

-include Makefile_services.mk
-include Makefile_reboot.mk

tests: tests_stretch tests_buster

tests_stretch:
	$(MAKE) tests_all_roles MOLECULE_DISTRO=debian:stretch

tests_buster:
	$(MAKE) tests_all_roles MOLECULE_DISTRO=debian:buster

tests_all_roles: $(test_TARGETS)

$(test_TARGETS): $(TEST_TARGET)%:
	bash -c "\
		echo \"Using distro: \" ${MOLECULE_DISTRO} && \
		echo \"Using DNS server 1: \" ${DNS_SERVER1} && \
		echo \"Using DNS server 2: \" ${DNS_SERVER2} && \
		cd $(ROLES_DIR) && \
		virtualenv env --python python3 && \
		source env/bin/activate && \
		cd $* && \
		pip install molecule docker-py && \
		molecule test \
	"

deploy-servers-nfs: playbook-servers-nfs.yml
	ansible-playbook -u sirius -i hosts --ask-vault-pass -k --ask-become-pass $(ANSIBLE_EXTRA_VARS) \
		playbook-servers-nfs.yml

deploy-servers-web: playbook-servers-web.yml
	ansible-playbook -u sirius -i hosts --ask-vault-pass -k --ask-become-pass $(ANSIBLE_EXTRA_VARS) \
		playbook-servers-web.yml

deploy-servers-ioc: playbook-servers-ioc.yml
	ansible-playbook -u sirius -i hosts --ask-vault-pass -k --ask-become-pass $(ANSIBLE_EXTRA_VARS) \
		playbook-servers-ioc.yml

deploy-desktops: playbook-desktops.yml
	ansible-playbook -u sirius -i hosts --ask-vault-pass -k --ask-become-pass $(ANSIBLE_EXTRA_VARS) \
		playbook-desktops.yml

deploy: playbook-servers-nfs.yml playbook-servers-web.yml playbook-servers-ioc.yml playbook-desktops.yml
	ansible-playbook -u sirius -i hosts --ask-vault-pass -k --ask-become-pass $(ANSIBLE_EXTRA_VARS) \
		playbook-servers-nfs.yml \
		playbook-servers-web.yml \
		playbook-servers-ioc.yml \
		playbook-desktops.yml

deploy-desktops-fac: playbook-desktops.yml
	ansible-playbook -u sirius -i hosts -l fac --ask-vault-pass -k --ask-become-pass $(ANSIBLE_EXTRA_VARS) \
		playbook-desktops.yml

deploy-beagles-si-correctors: playbook-bbb-repos-checkout.yml
	ansible-playbook -u fac -i hosts -l bbb_si_correctors -k --ask-become-pass playbook-bbb-repos-checkout.yml

deploy-beagles: playbook-bbb-repos-checkout.yml
	ansible-playbook -u fac -i hosts -l bbb -k --ask-become-pass playbook-bbb-repos-checkout.yml

server-commons-update: playbook-servers/playbook-servers-commons.yml
	ansible-playbook --user server --inventory hosts --ask-pass --ask-become-pass playbook-servers/playbook-servers-commons.yml

server-gluster-update: playbook-servers/playbook-servers-gluster.yml
	ansible-playbook --user server --inventory hosts --ask-pass --ask-become-pass playbook-servers/playbook-servers-gluster.yml

server-docker-update: playbook-servers/playbook-servers-docker.yml
	ansible-playbook --user server --inventory hosts --ask-pass --ask-become-pass playbook-servers/playbook-servers-docker.yml
