#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
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
FDEVICE="aston"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
   export OF_SCREEN_H=2376
   export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
   export FOX_VERSION="R12.1"
   export FOX_VARIANT="A14"
   export FOX_BUILD_TYPE="Stable"
   export FOX_AB_DEVICE=1
   export FOX_ENABLE_APP_MANAGER=1
   export OF_USE_MAGISKBOOT=1
   export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1

   export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
   export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=0

   # Binaries & tools
   export FOX_USE_NANO_EDITOR=1
   export FOX_USE_BASH_SHELL=1
   export FOX_ASH_IS_BASH=1
   export FOX_USE_TAR_BINARY=1
   export FOX_USE_XZ_UTILS=1
   
   export FOX_ADVANCED_SECURITY=1

   export OF_NO_SPLASH_CHANGE=1

   export OF_QUICK_BACKUP_LIST="/data;/super"
   #export TARGET_DEVICE_ALT="OnePlus12R"

   export FOX_REMOVE_AAPT=1
   #export FOX_DISABLE_APP_MANAGER=1
   export FOX_DELETE_AROMAFM=1

   export OF_STATUS_INDENT_LEFT=48
   export OF_STATUS_INDENT_RIGHT=48

   #export OF_MAINTAINER=1

   #export FOX_BUGGED_AOSP_ARB_WORKAROUND="1546300800"



   lunch twrp_$FDEVICE-eng
   # let's see what are our build VARs
   if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
      export | grep "FOX" >> $FOX_BUILD_LOG_FILE
      export | grep "OF_" >> $FOX_BUILD_LOG_FILE
         export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
      export | grep "TW_" >> $FOX_BUILD_LOG_FILE
   fi
fi
#
