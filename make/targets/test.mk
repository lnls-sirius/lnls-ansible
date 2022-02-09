# Roles
TEST_ROLES = \
	lnls-ans-role-clone-install \
	lnls-ans-role-epics \
	lnls-ans-role-pydm \
	lnls-ans-role-sirius-hla \
	lnls-ans-role-conda \
	lnls-ans-role-epics7 \
	lnls-ans-role-sirius-hlacon \
	lnls-ans-role-cs-studio \
	lnls-ans-role-epics-mca \
	lnls-ans-role-ntp \
	lnls-ans-role-users \
	lnls-ans-role-ctrl-service \
	lnls-ans-role-glusterfs \
	lnls-ans-role-nvidia-driver \
	lnls-ans-role-repositories \
	lnls-ans-role-visual-studio-code \
	lnls-ans-role-desktop-apps \
	lnls-ans-role-octave \
	lnls-ans-role-sirius-apps \
	lnls-ans-role-zabbix \
	lnls-ans-role-desktop-settings \
	lnls-ans-role-network \
	lnls-ans-role-sirius-bbb

# Test variables
TEST_TARGET = test_
test_TARGETS = $(addprefix $(TEST_TARGET), $(TEST_ROLES))

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

