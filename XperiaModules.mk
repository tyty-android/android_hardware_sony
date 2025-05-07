#
# Copyright (C) 2024 XperiaLabs Project
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

# Flags
TARGET_SHIPS_XPERIA_SETTINGS ?= false
TARGET_SUPPORTS_IMAGE_ENHANCEMENT ?= false
TARGET_SUPPORTS_BATTERY_CARE ?= false

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)/XperiaModules

# Main Module
ifeq ($(TARGET_SHIPS_XPERIA_SETTINGS),true)
PRODUCT_PACKAGES += XperiaSettings
endif

# Submodules
ifeq ($(TARGET_SUPPORTS_IMAGE_ENHANCEMENT),true)
	PRODUCT_PACKAGES += XperiaDisplay
endif

# Battery Care
ifeq ($(TARGET_SUPPORTS_BATTERY_CARE),true)
include hardware/sony/XperiaModules/Charger/XperiaCharger/sepolicy/SEPolicy.mk
	PRODUCT_PACKAGES += XperiaCharger
endif
