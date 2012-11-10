# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# We need the kernel version
-include device/pantech/a760s/BoardConfig.mk

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US:system/etc/gps.conf

## ramdisk stuffs
PRODUCT_COPY_FILES += \
	device/pantech/a760s/ramdisk/init.pantech.usb.rc:root/init.pantech.usb.rc \
	device/pantech/a760s/ramdisk/init.qcom.rc:root/init.qcom.rc \
	device/pantech/a760s/ramdisk/init.qcom.sh:root/init.qcom.sh \
	device/pantech/a760s/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
	device/pantech/a760s/ramdisk/init.rc:root/init.rc \
	device/pantech/a760s/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc \
	device/pantech/a760s/ramdisk/ueventd.rc:root/ueventd.rc

# BT firmware
PRODUCT_COPY_FILES += \
    device/pantech/a760s/firmware/BCM43291A0_003.001.013.0141.0000_Pantech_EF33S_EF34K_extLNA_TestOnly.hcd:system/bin/BCM43291A0_003.001.013.0141.0000_Pantech_EF33S_EF34K_extLNA_TestOnly.hcd

# WIFI
PRODUCT_COPY_FILES += \
	device/pantech/a760s/wifi/bcm43291.bin:system/etc/wl/bcm43291.bin \
	device/pantech/a760s/wifi/bcm43291_apsta.bin:system/etc/wl/bcm43291_apsta.bin \
	device/pantech/a760s/wifi/nvram.txt:system/etc/wl/nvram.txt

# modules
PRODUCT_COPY_FILES += \
	device/pantech/a760s/modules/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
	device/pantech/a760s/modules/cls_flow.ko:system/lib/modules/cls_flow.ko \
	device/pantech/a760s/modules/dal_remotetest.ko:system/lib/modules/dal_remotetest.ko \
	device/pantech/a760s/modules/dma_test.ko:system/lib/modules/dma_test.ko \
	device/pantech/a760s/modules/evbug.ko:system/lib/modules/evbug.ko \
	device/pantech/a760s/modules/gspca_main.ko:system/lib/modules/gspca_main.ko \
	device/pantech/a760s/modules/ksapi.ko:system/lib/modules/ksapi.ko \
	device/pantech/a760s/modules/lcd.ko:system/lib/modules/lcd.ko \
	device/pantech/a760s/modules/librasdioif.ko:system/lib/modules/librasdioif.ko \
	device/pantech/a760s/modules/msm-buspm-dev.ko:system/lib/modules/msm-buspm-dev.ko \
	device/pantech/a760s/modules/qce.ko:system/lib/modules/qce.ko \
	device/pantech/a760s/modules/qcedev.ko:system/lib/modules/qcedev.ko \
	device/pantech/a760s/modules/qcrypto.ko:system/lib/modules/qcrypto.ko \
	device/pantech/a760s/modules/sch_dsmark.ko:system/lib/modules/sch_dsmark.ko \
	device/pantech/a760s/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
	device/pantech/a760s/modules/spidev.ko:system/lib/modules/spidev.ko \
	device/pantech/a760s/modules/wlan.ko:system/lib/modules/wlan.ko

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/pantech/a760s/a760s-vendor.mk)

## misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

## overlays
DEVICE_PACKAGE_OVERLAYS += device/pantech/a760s/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Audio
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
	libOmxEvrcEnc \
	libOmxQcelp13Enc \
    audio.a2dp.default \
    audio_policy.msm8660 \
    audio.primary.msm8660 \
    libaudioutils \
	audio_policy.conf

# Display
PRODUCT_PACKAGES += \
    copybit.msm8660 \
    gralloc.msm8660 \
    hwcomposer.msm8660 \
	libhwcexternal \
	libhwcservice \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer

# GPS
PRODUCT_PACKAGES += \
	gps.msm8660

# Media
PRODUCT_PACKAGES += \
	libOmxCore \
	libmm-omxcore \
	libstagefrighthw \
    libdivxdrmdecrypt \
	libOmxVdec \
	libOmxVenc \
	libI420colorconvert

# HDMI
PRODUCT_PACKAGES += \
    hdmid
## misc
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

## cm dsp manager
PRODUCT_PACKAGES += \
    DSPManager \
    libcyanogen-dsp \
	Torch

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# iptables
PRODUCT_PACKAGES += \
	iptables \
	ip6tables

# Firmware
PRODUCT_COPY_FILES += \
	device/pantech/a760s/firmware/cyttsp_8660_ffa.hex:system/etc/firmware/cyttsp_8660_ffa.hex \
	device/pantech/a760s/firmware/cyttsp_8660_fluid_p2.hex:system/etc/firmware/cyttsp_8660_fluid_p2.hex \
	device/pantech/a760s/firmware/cyttsp_8660_fluid_p3.hex:system/etc/firmware/cyttsp_8660_fluid_p3.hex \
	device/pantech/a760s/firmware/dsps_fluid.b00:system/etc/firmware/dsps_fluid.b00 \
	device/pantech/a760s/firmware/dsps_fluid.b01:system/etc/firmware/dsps_fluid.b01 \
	device/pantech/a760s/firmware/dsps_fluid.b02:system/etc/firmware/dsps_fluid.b02 \
	device/pantech/a760s/firmware/dsps_fluid.b03:system/etc/firmware/dsps_fluid.b03 \
	device/pantech/a760s/firmware/dsps_fluid.mdt:system/etc/firmware/dsps_fluid.mdt \
	device/pantech/a760s/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
	device/pantech/a760s/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
	device/pantech/a760s/firmware/modem.b00:system/etc/firmware/modem.b00 \
	device/pantech/a760s/firmware/modem.b01:system/etc/firmware/modem.b01 \
	device/pantech/a760s/firmware/modem.b02:system/etc/firmware/modem.b02 \
	device/pantech/a760s/firmware/modem.b03:system/etc/firmware/modem.b03 \
	device/pantech/a760s/firmware/modem.b04:system/etc/firmware/modem.b04 \
	device/pantech/a760s/firmware/modem.b05:system/etc/firmware/modem.b05 \
	device/pantech/a760s/firmware/modem.b06:system/etc/firmware/modem.b06 \
	device/pantech/a760s/firmware/modem.b07:system/etc/firmware/modem.b07 \
	device/pantech/a760s/firmware/modem.b08:system/etc/firmware/modem.b08 \
	device/pantech/a760s/firmware/modem.b09:system/etc/firmware/modem.b09 \
	device/pantech/a760s/firmware/modem.b10:system/etc/firmware/modem.b10 \
	device/pantech/a760s/firmware/modem.mdt:system/etc/firmware/modem.mdt \
	device/pantech/a760s/firmware/q6.b00:system/etc/firmware/q6.b00 \
	device/pantech/a760s/firmware/q6.b01:system/etc/firmware/q6.b01 \
	device/pantech/a760s/firmware/q6.b02:system/etc/firmware/q6.b02 \
	device/pantech/a760s/firmware/q6.b03:system/etc/firmware/q6.b03 \
	device/pantech/a760s/firmware/q6.b04:system/etc/firmware/q6.b04 \
	device/pantech/a760s/firmware/q6.b05:system/etc/firmware/q6.b05 \
	device/pantech/a760s/firmware/q6.b06:system/etc/firmware/q6.b06 \
	device/pantech/a760s/firmware/q6.b07:system/etc/firmware/q6.b07 \
	device/pantech/a760s/firmware/q6.mdt:system/etc/firmware/q6.mdt \
	device/pantech/a760s/firmware/vidc_1080p.fw:system/etc/firmware/vidc_1080p.fw \
	device/pantech/a760s/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw


# Common Qualcomm scripts
PRODUCT_COPY_FILES += \
    device/pantech/a760s/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    device/pantech/a760s/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
	device/pantech/a760s/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
	device/pantech/a760s/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
	device/pantech/a760s/50setcpu:system/etc/init.d/50setcpu

# idc
PRODUCT_COPY_FILES += \
	device/pantech/a760s/idc/cyttsp-i2c.idc:system/usr/idc/cyttsp-i2c.idc

# keylayouts
PRODUCT_COPY_FILES += \
	device/pantech/a760s/keylayout/8660_handset.kl:system/usr/keylayout/8660_handset.kl \
	device/pantech/a760s/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/pantech/a760s/keylayout/ffa-keypad.kl:system/usr/keylayout/ffa-keypad.kl \
	device/pantech/a760s/keylayout/fluid-keypad.kl:system/usr/keylayout/fluid-keypad.kl \
	device/pantech/a760s/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
	device/pantech/a760s/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	device/pantech/a760s/keylayout/matrix-keypad.kl:system/usr/keylayout/matrix-keypad.kl

# Keychars
PRODUCT_COPY_FILES += \
	device/pantech/a760s/keychars/ffa-keypad_numeric.kcm.bin:system/usr/keychars/ffa-keypad_numeric.kcm.bin \
	device/pantech/a760s/keychars/ffa-keypad_qwerty.kcm.bin:system/usr/keychars/ffa-keypad_qwerty.kcm.bin \
	device/pantech/a760s/keychars/fluid-keypad_numeric.kcm.bin:system/usr/keychars/fluid-keypad_numeric.kcm.bin \
	device/pantech/a760s/keychars/fluid-keypad_qwerty.kcm.bin:system/usr/keychars/fluid-keypad_qwerty.kcm.bin \
	device/pantech/a760s/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
	device/pantech/a760s/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
	device/pantech/a760s/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
	device/pantech/a760s/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
	device/pantech/a760s/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
	device/pantech/a760s/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm

# QC thermald config
PRODUCT_COPY_FILES += device/pantech/a760s/thermald.conf:system/etc/thermald.conf

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_LOCALES += hdpi

# misc
PRODUCT_COPY_FILES += \
    device/pantech/a760s/vold.fstab:system/etc/vold.fstab \

$(call inherit-product-if-exists, vendor/pantech/a760s/a760s-vendor.mk)

PRODUCT_COPY_FILES += \
     device/pantech/a760s/media_profiles.xml:system/etc/media_profiles.xml

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product, build/target/product/full_base_telephony.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_NAME := sky_a760s
PRODUCT_DEVICE := a760s
