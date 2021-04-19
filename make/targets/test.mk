# Roles
TEST_ROLES = \
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

