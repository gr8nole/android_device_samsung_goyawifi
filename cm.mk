# Release name
PRODUCT_RELEASE_NAME := goyawifi

# Boot animation
TARGET_SCREEN_HEIGHT := 1024
TARGET_SCREEN_WIDTH := 600

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/goyawifi/full_goyawifi.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := goyawifi
PRODUCT_NAME := cm_goyawifi
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SM-T110
PRODUCT_MANUFACTURER := samsung
