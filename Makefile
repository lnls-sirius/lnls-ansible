# Variables
DNS_SERVER1 ?= 10.0.0.71
DNS_SERVER2 ?= 10.0.0.72
export DNS_SERVER1
export DNS_SERVER2
MOLECULE_DISTRO ?= debian:buster
export MOLECULE_DISTRO

ROLES_DIR = roles
# Add new roles
ROLES = lnls-ans-role-users \
		lnls-ans-role-nfsclient \
		lnls-ans-role-repositories \
		lnls-ans-role-epics \
		lnls-ans-role-python \
		lnls-ans-role-java \
		lnls-ans-role-cs-studio

# Test variables
PREFIX_TARGET = test_
test_TARGETS = $(addprefix $(PREFIX_TARGET), $(ROLES))

linac-opi:
	ansible-playbook -i hosts -l linac-opi -u sirius -k --ask-become-pass playbook.yml

tests: tests_stretch tests_buster

tests_stretch:
	$(MAKE) tests_all_roles MOLECULE_DISTRO=debian:stretch

tests_buster:
	$(MAKE) tests_all_roles MOLECULE_DISTRO=debian:buster

tests_all_roles: $(test_TARGETS)

$(test_TARGETS): $(PREFIX_TARGET)%:
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
