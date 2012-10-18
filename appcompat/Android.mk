# Copyright (C) 2012 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

# Note: the source code is in java/, not src/, because this code is also part of
# the framework library, and build/core/pathmap.mk expects a java/ subdirectory.

# A helper sub-library that makes direct use of Eclair APIs.
include $(CLEAR_VARS)
LOCAL_MODULE := android-support-appcompat-eclair
LOCAL_SDK_VERSION := 9
LOCAL_SRC_FILES := $(call all-java-files-under,eclair)
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v4
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res            # Include /res in build
LOCAL_KEEP_R_CLASS_IN_STATIC_JAVA_LIBRARY := true  #
include $(BUILD_STATIC_JAVA_LIBRARY)

# A helper sub-library that makes direct use of honeycomb APIs.
include $(CLEAR_VARS)
LOCAL_MODULE := android-support-appcompat-honeycomb
LOCAL_SDK_VERSION := 11
LOCAL_SRC_FILES := $(call all-java-files-under,honeycomb)
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v4 \
                               android-support-appcompat-eclair
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res            # Include /res in build
LOCAL_KEEP_R_CLASS_IN_STATIC_JAVA_LIBRARY := true  #
include $(BUILD_STATIC_JAVA_LIBRARY)

# A helper sub-library that makes direct use of ICS APIs.
include $(CLEAR_VARS)
LOCAL_MODULE := android-support-appcompat-ics
LOCAL_SDK_VERSION := 14
LOCAL_SRC_FILES := $(call all-java-files-under,ics)
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v4 \
                               android-support-appcompat-eclair \
                               android-support-appcompat-honeycomb
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res            # Include /res in build
LOCAL_KEEP_R_CLASS_IN_STATIC_JAVA_LIBRARY := true  #
include $(BUILD_STATIC_JAVA_LIBRARY)

# -----------------------------------------------------------------------

# Here is the final static library that apps can link against.
include $(CLEAR_VARS)
LOCAL_MODULE := android-support-appcompat
LOCAL_SDK_VERSION := 4
LOCAL_SRC_FILES := $(call all-java-files-under, java)
LOCAL_STATIC_JAVA_LIBRARIES += android-support-appcompat-eclair \
                               android-support-appcompat-honeycomb \
                               android-support-appcompat-ics
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res            # Include /res in build
LOCAL_KEEP_R_CLASS_IN_STATIC_JAVA_LIBRARY := true
include $(BUILD_STATIC_JAVA_LIBRARY)

# Include this library in the build server's output directory
$(call dist-for-goals, droidcore sdk, $(LOCAL_BUILT_MODULE):android-support-appcompat.jar)
