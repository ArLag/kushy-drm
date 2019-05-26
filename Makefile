include $(THEOS)/makefiles/common.mk

ARCHS = arm64 arm64e
TWEAK_NAME = KushyDRM
KushyDRM_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk
	$(TWEAK_NAME)_CFLAGS = -fobjc-arc
after-install::
	install.exec "killall -9 SpringBoard"
