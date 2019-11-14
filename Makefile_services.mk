# === AS AP IOC services ===

service-ioc-as-ap-stop:
	@echo "Stopping AS AP IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-as-ap.yml

service-ioc-as-ap-start:
	@echo "Starting AS AP IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-as-ap.yml

service-ioc-as-ap-sofb-stop:
	@echo "Stopping AS AP SOFB IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-as-ap-sofb.yml

service-ioc-as-ap-sofb-start:
	@echo "Starting AS AP SOFB IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-as-ap-sofb.yml


# === EthPRUserial485 services ===


# --- AS DCLinks ---

service-ethbridge-as-dclinks-tbts-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_as_dclinks_tbts \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-as-dclinks-tbts-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_as_dclinks_tbts \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-as-dclinks-ia-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_as_dclinks_ia \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-as-dclinks-ia-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_as_dclinks_ia \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

# --- TB ---

service-ethbridge-tb-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_tb_ps \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-tb-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_tb_ps \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-tb-dipoles-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_tb_ps_dipoles \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-tb-dipoles-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_tb_ps_dipoles \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-tb-quadrupoles-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_tb_ps_quadrupoles \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-tb-quadrupoles-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_tb_ps_quadrupoles \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-tb-correctors-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_tb_ps_correctors \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-tb-correctors-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_tb_ps_correctors \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

# --- BO ---

service-ethbridge-bo-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_bo_ps \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-bo-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_bo_ps \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-bo-fams-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_bo_ps_fams \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-bo-fams-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_bo_ps_fams \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-bo-correctors-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_bo_ps_correctors \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-bo-correctors-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_bo_ps_correctors \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

# --- TS ---

service-ethbridge-ts-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_ts_ps \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-ts-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_ts_ps \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-ts-dipoles-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_ts_ps_dipoles \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-ts-dipoles-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_ts_ps_dipoles \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-ts-quadrupoles-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_ts_ps_quadrupoles \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-ts-quadrupoles-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_ts_ps_quadrupoles \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-ts-correctors-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_ts_ps_correctors \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-ts-correctors-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_ts_ps_correctors \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

# --- SI ---

service-ethbridge-si-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_si_ps \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-si-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_si_ps \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-si-fams-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_si_ps_fams \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-si-fams-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_si_ps_fams \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-si-correctors-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_si_ps_correctors \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-si-correctors-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_si_ps_correctors \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-si-trims-qs-stop:
	@echo "Stopping EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=stopped" \
		-l bbb_si_ps_trims_qs \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml

service-ethbridge-si-trims-qs-start:
	@echo "Starting EthPRUserial485 services in Beaglebones [hosts]"
	@echo "Please enter password for fac user."
	ansible-playbook \
		--extra-vars "ctrl_service_name=eth-bridge-pru-serial485 ctrl_service_state=started" \
		-l bbb_si_ps_trims_qs \
		-u fac -k --ask-become-pass playbook-ctrl-service.yml


# === PS IOC services ===

# -- LI

service-ioc-li-ps-stop:
	@echo "Stopping LI PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-li-ps.yml

service-ioc-li-ps-start:
	@echo "Starting LI PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-li-ps.yml

# -- AS DCLinks

service-ioc-as-ps-dclinks-tbts-stop:
	@echo "Stopping AS PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-as-ps-dclinks-tbts.yml

service-ioc-as-ps-dclinks-tbts-start:
	@echo "Stopping AS PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-as-ps-dclinks-tbts.yml

service-ioc-as-ps-dclinks-ia-stop:
	@echo "Stopping AS PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-as-ps-dclinks-ia.yml

service-ioc-as-ps-dclinks-ia-start:
	@echo "Stopping AS PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-as-ps-dclinks-ia.yml

# -- AS PM

service-ioc-as-pm-stop:
	@echo "Stopping AS PM IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-as-pm.yml

service-ioc-as-pm-start:
	@echo "Starting AS PM IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-as-pm.yml


# -- TB

service-ioc-tb-ps-stop:
	@echo "Stopping TB PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-tb-ps.yml

service-ioc-tb-ps-start:
	@echo "Starting TB PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-tb-ps.yml

service-ioc-tb-ma-stop:
	@echo "Stopping TB MA IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-tb-ma.yml

service-ioc-tb-ma-start:
	@echo "Starting TB MA IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-tb-ma.yml

# -- BO

service-ioc-bo-ps-stop:
	@echo "Stopping BO PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-bo-ps.yml

service-ioc-bo-ps-start:
	@echo "Starting BO PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-bo-ps.yml

service-ioc-bo-ps-fams-stop:
	@echo "Stopping BO PS Fams IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-bo-ps-fams.yml

service-ioc-bo-ps-fams-start:
	@echo "Starting BO PS Fams IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-bo-ps-fams.yml

service-ioc-bo-ps-corrs-stop:
	@echo "Stopping BO PS Correctors IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-bo-ps-corrs.yml

service-ioc-bo-ps-corrs-start:
	@echo "Starting BO PS Correctors IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-bo-ps-corrs.yml

service-ioc-bo-ma-stop:
	@echo "Stopping BO MA IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-bo-ma.yml

service-ioc-bo-ma-start:
	@echo "Starting BO MA IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-bo-ma.yml

service-ioc-bo-ma-fams-stop:
	@echo "Stopping BO MA Fams IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-bo-ma-fams.yml

service-ioc-bo-ma-fams-start:
	@echo "Starting BO MA Fams IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-bo-ma-fams.yml

service-ioc-bo-ma-corrs-stop:
	@echo "Stopping BO MA Correctors IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-bo-ma-corrs.yml

service-ioc-bo-ma-corrs-start:
	@echo "Starting BO MA Correctors IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-bo-ma-corrs.yml

# -- TS

service-ioc-ts-ps-stop:
	@echo "Stopping TS PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-ts-ps.yml

service-ioc-ts-ps-start:
	@echo "Starting TS PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-ts-ps.yml

service-ioc-ts-ma-stop:
	@echo "Stopping TS MA IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-ts-ma.yml

service-ioc-ts-ma-start:
	@echo "Starting TS MA IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-ts-ma.yml

# -- SI

service-ioc-si-ps-stop:
	@echo "Stopping SI PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-si-ps.yml

service-ioc-si-ps-start:
	@echo "Starting SI PS IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-si-ps.yml

service-ioc-si-ps-fams-stop:
	@echo "Stopping SI PS Fams IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-si-ps-fams.yml

service-ioc-si-ps-fams-start:
	@echo "Starting SI PS Fams IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-si-ps-fams.yml

service-ioc-si-ps-corrs-stop:
	@echo "Stopping SI PS Correctors IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-si-ps-corrs.yml

service-ioc-si-ps-corrs-start:
	@echo "Starting SI PS Correctors IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-si-ps-corrs.yml

service-ioc-si-ps-trims-stop:
	@echo "Stopping SI PS Trims IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-si-ps-trims.yml

service-ioc-si-ps-trims-start:
	@echo "Starting SI PS Trims IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-si-ps-trims.yml

service-ioc-si-ma-stop:
	@echo "Stopping SI MA IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-si-ma.yml

service-ioc-si-ma-start:
	@echo "Starting SI MA IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-si-ma.yml

service-ioc-si-ma-fams-stop:
	@echo "Stopping SI MA Fams IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-si-ma-fams.yml

service-ioc-si-ma-fams-start:
	@echo "Starting SI MA Fams IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-si-ma-fams.yml

service-ioc-si-ma-corrs-stop:
	@echo "Stopping SI MA Correctors IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-si-ma-corrs.yml

service-ioc-si-ma-corrs-start:
	@echo "Starting SI MA Correctors IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-si-ma-corrs.yml

service-ioc-si-ma-trims-stop:
	@echo "Stopping SI MA Trims IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=stopped" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-si-ma-trims.yml

service-ioc-si-ma-trims-start:
	@echo "Starting SI MA Trims IOC services"
	@echo "Please enter password for sirius user."
	ansible-playbook \
		--extra-vars "ctrl_service_state=started" \
		-u sirius -k --ask-become-pass playbooks-services/playbook-service-ioc-si-ma-trims.yml
