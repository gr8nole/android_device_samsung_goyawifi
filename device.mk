$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Enable higher-res drawables while keeping mdpi as primary source
PRODUCT_AAPT_CONFIG := large mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.carrier=wifi-only

# Kernel - Pre-Built
#LOCAL_PATH := device/samsung/goyawifi
 ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
 else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
 endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Init files
PRODUCT_PACKAGES += \
    fstab.pxa988 \
    init_charging.rc \
    ueventd.pxa988.rc \
    lpm.rc

# Recovery rootdir
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/init.recovery.pxa988.rc:root/init.recovery.pxa988.rc \
    $(LOCAL_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab \
    $(LOCAL_PATH)/rootdir/etc/extra.fstab:recovery/root/etc/extra.fstab \
    

# Enable repeatable keys in cwm
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true \
    ro.cwm.repeatable_keys=114,115

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

DEFAULT_PROPERTY_OVERRIDES += \
	ro.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	persist.service.adb.enable=1 \
	persist.sys.usb.config=mtp,adb

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    charger

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
