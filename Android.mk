LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := timekeep.c
LOCAL_MODULE := timekeep
LOCAL_SHARED_LIBRARIES := libcutils liblog
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -DANDROID_SDK_VERSION=$(PLATFORM_SDK_VERSION)
ifneq ($(call math_gt_or_eq, $(PLATFORM_SDK_VERSION), 25),)
LOCAL_MODULE_OWNER := sony
LOCAL_INIT_RC      := vendor/etc/init/timekeep.rc
ifneq ($(call math_gt_or_eq, $(PLATFORM_SDK_VERSION), 28),)
LOCAL_PROPRIETARY_MODULE := true
endif
endif
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(call all-java-files-under, src)
LOCAL_PACKAGE_NAME := TimeKeep
LOCAL_STATIC_JAVA_LIBRARIES := SonyTimekeepProperties
LOCAL_CERTIFICATE := platform
LOCAL_SDK_VERSION := current
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PROGUARD_ENABLED := disabled
ifneq ($(call math_gt_or_eq, $(PLATFORM_SDK_VERSION), 28),)
LOCAL_PROPRIETARY_MODULE := true
endif
include $(BUILD_PACKAGE)
