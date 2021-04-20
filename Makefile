TOP = .

include $(TOP)/make/configure/dir
include $(TOP)/make/configure/opts
include $(TOP)/make/configure/dns

include $(TOP)/make/targets/test.mk

include $(TOP)/make/targets/control_room.mk
include $(TOP)/make/targets/deploy.mk
include $(TOP)/make/targets/reboot.mk
include $(TOP)/make/targets/server.mk
include $(TOP)/make/targets/services.mk
