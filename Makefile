# Variables
DNS_SERVER1 ?= 10.0.0.71
DNS_SERVER2 ?= 10.0.0.72
export DNS_SERVER1
export DNS_SERVER2
MOLECULE_DISTRO ?= debian:buster
export MOLECULE_DISTRO
BUILD_TYPE ?= default
export BUILD_TYPE
HOST_GROUPS ?= linac_opi

ifneq ($(REMOTE_USER),)
	EXTRA_OPTS = "-u $(REMOTE_USER)"
else
	EXTRA_OPTS = ""
endif

ROLES_DIR = roles
# Add new roles
ROLES = lnls-ans-role-users \
		lnls-ans-role-nfsserver \
		lnls-ans-role-nfsclient \
		lnls-ans-role-repositories \
		lnls-ans-role-python \
		lnls-ans-role-qt \
		lnls-ans-role-epics \
		lnls-ans-role-java \
		lnls-ans-role-cs-studio \
		lnls-ans-role-sirius-apps \
		lnls-ans-role-desktop-apps

PLAYBOOKS = playbook-nfs-servers.yml \
			playbook-control-room-desktops.yml \
			playbook-ctrl-service.yml

# Test variables
TEST_TARGET = test_
test_TARGETS = $(addprefix $(TEST_TARGET), $(ROLES))

# Playbook variables
playbook_TARGETS = $(basename $(PLAYBOOKS))

all: $(playbook_TARGETS)


$(playbook_TARGETS): %: %.yml
	ansible-playbook -i hosts -l $(HOST_GROUPS) $(EXTRA_OPTS) -k --ask-become-pass $<


-include Makefile_services.mk

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
