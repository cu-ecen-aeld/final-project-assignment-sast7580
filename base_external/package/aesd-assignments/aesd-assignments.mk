##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 4d09f2cfe49734275c06a98da8d3d1efaf016091
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-5013/final-project-assignment-MacRush7.git
AESD_ASSIGNMENTS_SITE_METHOD= git
AESD_ASSIGNMENTS_LDFLAGS = $(LDFLAGS_FOR_BUILD) -lwiringPi -lwiringPiDev -lpthread -lm -lcrypt -lrt
AESD_ASSIGNMENTS_MODULE_SUBDIRS = aesd-char-driver/

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) LDFLAGS="$(AESD_ASSIGNMENTS_LDFLAGS)" all
endef

#TODO: Add required executables or scripts below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/buzzer-init.sh $(TARGET_DIR)/etc/init.d/S99buzzer
	$(INSTALL) -m 0755 $(@D)/fingerprintModule $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/buzzerModule $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/terminal.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/init.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/buzzerTest $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/mysql-driver/mysql.py $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/rfid-driver/Read.py $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/rfid-driver/Write.py $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/rfid-driver/rfidtest.sh $(TARGET_DIR)/bin

endef

$(eval $(kernel-module))
$(eval $(generic-package))
