#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2023 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#


# Release name
PRODUCT_RELEASE_NAME := aston

# Inherit from our custom product configuration
$(call inherit-product, vendor/twrp/config.common.mk)

# Device identifier. This must come after all inclusions
# PRODUCT_DEVICE := $(PRODUCT_RELEASE_NAME)
PRODUCT_DEVICE := OP5D35L1
# PRODUCT_NAME := twrp_$(PRODUCT_DEVICE)
PRODUCT_NAME := twrp_$(PRODUCT_RELEASE_NAME)
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := CPH2609
PRODUCT_MANUFACTURER := OnePlus



# OrangeFox GUI settings
OF_SCREEN_H := 2376
OF_STATUS_H := 100
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48
OF_HIDE_NOTCH := 1
OF_CLOCK_POS := 1
OF_OPTIONS_LIST_NUM := 6

# Settings
# export TARGET_ARCH=arm64
FOX_AB_DEVICE := 1
OF_AB_DEVICE_WITH_RECOVERY_PARTITION := 1
OF_HIDE_NOTCH := 1
OF_USE_GREEN_LED := 0
OF_FLASHLIGHT_ENABLE := 1
OF_ALLOW_DISABLE_NAVBAR := 0
OF_QUICK_BACKUP_LIST := /data;/boot;
OF_SKIP_MULTIUSER_FOLDERS_BACKUP := 1
OF_ENABLE_USB_STORAGE := 1
OF_IGNORE_LOGICAL_MOUNT_ERRORS := 1
OF_BIND_MOUNT_SDCARD_ON_FORMAT := 1
OF_FORCE_CASEFOLDING := 1

# Recovery additional features	
OF_ENABLE_LPTOOLS := 1
OF_AB_DEVICE_WITH_RECOVERY_PARTITION := 1
OF_RECOVERY_AB_FULL_REFLASH_RAMDISK := 1
OF_DYNAMIC_FULL_SIZE := 9126805504
