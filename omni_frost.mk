#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_BUILD_VENDOR_BOOT_IMAGE := true

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from frost device
$(call inherit-product, device/xiaomi/frost/device.mk)

PRODUCT_DEVICE := frost
PRODUCT_NAME := omni_frost
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := frost
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="frost-user 11 RD2A.211001.002 V13.0.26.0.RGFMIXM release-keys"

BUILD_FINGERPRINT := Redmi/frost/frost:11/RD2A.211001.002/V13.0.26.0.RGFMIXM:user/release-keys
