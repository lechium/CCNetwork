target = appletv:12.1
DEBUG=0
include $(THEOS)/makefiles/common.mk

INSTALL_TARGET_PROCESSES = TVSystemMenuService 

BUNDLE_NAME = CCNetwork

CCNetwork_FILES = CCNTCCNetworkModule.m
CCNetwork_INSTALL_PATH = /Library/TVSystemMenuModules
CCNetwork_FRAMEWORKS = UIKit
CCNetwork_PRIVATE_FRAMEWORKS = TVSystemMenuUI CoreServices
CCNetwork_CFLAGS = -fobjc-arc  -F. -I.
CCNetwork_LDFLAGS +=  -F. -I.

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/TVSystemMenuModules$(ECHO_END)
	
