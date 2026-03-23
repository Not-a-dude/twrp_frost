LOCAL_PATH := device/xiaomi/frost

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd \
    bootctrl.jr510

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

TARGET_RECOVERY_ROOT_OUT := $(DEVICE_PATH)/recovery/root

PRODUCT_COPY_FILES += \
    $(foreach f,$(wildcard $(LOCAL_PATH)/recovery/root/system/etc/firmware/*),$(f):$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/firmware/$(notdir $(f)))

PRODUCT_USE_DYNAMIC_PARTITIONS := true

PRODUCT_SHIPPING_API_LEVEL := 30

TARGET_OTA_ASSERT_DEVICE := frost

TARGET_COPY_OUT_VENDOR := vendor

TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Специфичные для TWRP флаги сборки
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INCLUDE_RESETPROP := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 255
TARGET_USES_MKE2FS := true
TW_NO_LEGACY_PROPS := true
TW_USE_NEW_MINADBD := true
TW_NO_BIND_SYSTEM := true
TW_NO_SCREEN_BLANK := true
TW_EXCLUDE_APEX := true
TW_FRAMERATE := 60

TW_DEVICE_VERSION := frost
TW_Y_OFFSET := 70
TW_H_OFFSET := -70
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Свойства
TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.fingerprint=ro.system.build.fingerprint;ro.build.version.incremental"
