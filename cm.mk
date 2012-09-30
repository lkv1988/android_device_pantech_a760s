$(call inherit-product, device/pantech/ef33s/full_ef33s.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SKY_IM-A760S BUILD_ID=IMM76I BUILD_DISPLAY_ID=IMM76I BUILD_FINGERPRINT=SKY/SKY_IM-A760S/ef33s:4.0.4/IMM76I/EF33S_ICS_001:user/release-keys PRIVATE_BUILD_DESC="IMM76I-user"

#TARGET_BOOTANIMATION_NAME := vertical-800x1280

PRODUCT_NAME := cm_ef33s
PRODUCT_DEVICE := ef33s
