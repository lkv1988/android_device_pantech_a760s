#
# Copyright (C) 2011 The CyanogenMod Project
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

## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US_SUPL:system/etc/gps.conf

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/pantech/ef33s/ef33s-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/pantech/ef33s/overlay



ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/pantech/ef33s/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/pantech/ef33s/modules/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
    device/pantech/ef33s/modules/cpaccess.ko:system/lib/modules/cpaccess.ko \
    device/pantech/ef33s/modules/dal_remotetest.ko:system/lib/modules/dal_remotetest.ko \
    device/pantech/ef33s/modules/dma_test.ko:system/lib/modules/dma_test.ko \
    device/pantech/ef33s/modules/evbug.ko:system/lib/modules/evbug.ko \
    device/pantech/ef33s/modules/gspca_main.ko:system/lib/modules/gspca_main.ko \
    device/pantech/ef33s/modules/ksapi.ko:system/lib/modules/ksapi.ko \
    device/pantech/ef33s/modules/lcd.ko:system/lib/modules/lcd.ko \
    device/pantech/ef33s/modules/librasdioif.ko:system/lib/modules/librasdioif.ko \
    device/pantech/ef33s/modules/msm_tsif.ko:system/lib/modules/msm_tsif.ko \
    device/pantech/ef33s/modules/mwlan_aarp.ko:system/lib/modules/mwlan_aarp.ko \
    device/pantech/ef33s/modules/oprofile.ko:system/lib/modules/oprofile.ko \
    device/pantech/ef33s/modules/qcedev.ko:system/lib/modules/qcedev.ko \
    device/pantech/ef33s/modules/qce.ko:system/lib/modules/qce.ko \
    device/pantech/ef33s/modules/qcrypto.ko:system/lib/modules/qcrypto.ko \
    device/pantech/ef33s/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/pantech/ef33s/modules/tsif_chrdev.ko:system/lib/modules/tsif_chrdev.ko

# Ramdisk
PRODUCT_COPY_FILES += \
	device/pantech/ef33s/ramdisk/init.pantech.usb.rc:root/init.pantech.usb.rc \
	device/pantech/ef33s/ramdisk/init.qcom.rc:root/init.qcom.rc \
	device/pantech/ef33s/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
	device/pantech/ef33s/ramdisk/init.rc:root/init.rc \
	device/pantech/ef33s/ramdisk/ueventd.rc:root/ueventd.rc \
	device/pantech/ef33s/ramdisk/init.qcom.sh:root/init.qcom.sh

# IDC
PRODUCT_COPY_FILES += \
	device/pantech/ef33s/idc/cyttsp-i2c.idc:system/usr/idc/cyttsp-i2c.idc

# WIFI
PRODUCT_COPY_FILES += \
	device/pantech/ef33s/wifi/bcm43291.bin:system/etc/wl/bcm43291.bin \
	device/pantech/ef33s/wifi/bcm43291_apsta.bin:system/etc/wl/bcm43291_apsta.bin \
	device/pantech/ef33s/wifi/bcm43291_p2p.bin:system/etc/wl/bcm43291_p2p.bin \
	device/pantech/ef33s/wifi/nvram.txt:system/etc/wl/nvram.txt \
	device/pantech/ef33s/wifi/wlan.ko:system/lib/modules/wlan.ko

PRODUCT_COPY_FILES += \
	device/pantech/ef33s/prebuilt/01_qcomm_omx.cfg:system/etc/01_qcomm_omx.cfg \
	device/pantech/ef33s/prebuilt/dlextractor.cfg:system/etc/dlextractor.cfg

# Vold configuration
PRODUCT_COPY_FILES += \
    device/pantech/ef33s/prebuilt/vold.fstab:system/etc/vold.fstab

# Set default USB interface
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
#    persist.sys.usb.config=mass_storage

# common msm8660
$(call inherit-product, device/pantech/msm8660-common/msm8660.mk)

$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)
