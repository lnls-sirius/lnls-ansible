# === BeagleBones ===

REBOOT_BEAGLEBONE_OPTS =\
	--inventory $(BEAGLEBONE_INVENTORY)\
	--user fac\
	--ask-pass\
	--ask-become-pass

reboot-bbb-as-ps-dclinks-tbts:
	ansible-playbook \
		$(REBOOT_BEAGLEBONE_OPTS)\
		-l bbb_as_dclinks_tbts playbooks/generic/reboot.yml

reboot-bbb-as-ps-dclinks-ia:
	ansible-playbook \
		$(REBOOT_BEAGLEBONE_OPTS)\
		-l bbb_as_dclinks_ia playbooks/generic/reboot.yml

reboot-bbb-tb-ps:
	ansible-playbook \
		$(REBOOT_BEAGLEBONE_OPTS)\
		-l bbb_tb playbooks/generic/reboot.yml

reboot-bbb-tb-ps-fams:
	ansible-playbook \
		$(REBOOT_BEAGLEBONE_OPTS)\
		-l bbb_tb_fams playbooks/generic/reboot.yml

reboot-bbb-tb-ps-corrs:
	ansible-playbook \
		$(REBOOT_BEAGLEBONE_OPTS)\
		-l bbb_tb_correctors playbooks/generic/reboot.yml

reboot-bbb-bo-ps:
	ansible-playbook \
		$(REBOOT_BEAGLEBONE_OPTS)\
		-l bbb_bo playbooks/generic/reboot.yml

reboot-bbb-bo-ps-fams:
	ansible-playbook \
		$(REBOOT_BEAGLEBONE_OPTS)\
		-l bbb_bo_fams playbooks/generic/reboot.yml

reboot-bbb-bo-ps-corrs:
	ansible-playbook \
		$(REBOOT_BEAGLEBONE_OPTS)\
		-l bbb_bo_correctors playbooks/generic/reboot.yml

reboot-bbb-ts-ps:
	ansible-playbook \
		$(REBOOT_BEAGLEBONE_OPTS)\
		-l bbb_ts playbooks/generic/reboot.yml

reboot-bbb-ts-ps-fams:
	ansible-playbook \
		$(REBOOT_BEAGLEBONE_OPTS)\
		-l bbb_ts_fams playbooks/generic/reboot.yml

reboot-bbb-ts-ps-corrs:
	ansible-playbook \
		$(REBOOT_BEAGLEBONE_OPTS)\
		-l bbb_ts_correctors playbooks/generic/reboot.yml

reboot-bbb-si-ps:
	ansible-playbook \
		$(REBOOT_BEAGLEBONE_OPTS)\
		-l bbb_si playbooks/generic/reboot.yml

reboot-bbb-si-ps-fams:
	ansible-playbook \
		$(REBOOT_BEAGLEBONE_OPTS)\
		-l bbb_si_fams playbooks/generic/reboot.yml

reboot-bbb-si-ps-corrs:
	ansible-playbook \
		$(REBOOT_BEAGLEBONE_OPTS)\
		-l bbb_si_correctors playbooks/generic/reboot.yml

reboot-bbb-si-ps-trims:
	ansible-playbook \
		$(REBOOT_BEAGLEBONE_OPTS)\
		-l bbb_si_trims_qs playbooks/generic/reboot.yml
