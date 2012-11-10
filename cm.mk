$(call inherit-product, device/pantech/a760s/a760s.mk)

PRODUCT_RELEASE_NAME := A760S

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=sky_a760s BUILD_ID=IMM76D BUILD_FINGERPRINT="SKY/SKY_IM-A760S/ef33s:4.0.4/IMM76D/S0211221.EF33S_003:user/release-keys" PRIVATE_BUILD_DESC="S0211221.EF33S_003:user/release-keys"

TARGET_BOOTANIMATION_NAME := vertical-480x800

PRODUCT_NAME := cm_a760s
PRODUCT_DEVICE := a760s
PRODUCT_MODEL := IM-A760S
PRODUCT_MANUFACTURER := SKY
PRODUCT_RELEASE_NAME := A760S
# Release name and versioning
-include vendor/cm/config/common_versions.mk
