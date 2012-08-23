$(call inherit-product, device/pantech/ef39s/full_ef39s.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SKY_IM-A800S BUILD_ID=IMM76I BUILD_DISPLAY_ID=IMM76I BUILD_FINGERPRINT=SKY/SKY_IM-A800S/ef39s:4.0.4/IMM76I/EF39S_ICS_001:user/release-keys PRIVATE_BUILD_DESC="IMM76I-user"

TARGET_BOOTANIMATION_NAME := vertical-800x1280

PRODUCT_NAME := cm_ef39s
PRODUCT_DEVICE := ef39s
