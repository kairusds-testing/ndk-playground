LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := matoya
LOCAL_SRC_FILES := lib/$(TARGET_ARCH_ABI)/libmatoya.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
# LOCAL_CPPFLAGS := -std=c++17
LOCAL_MODULE := matoya-test
# LOCAL_SRC_FILES := matoya-test.cpp
LOCAL_SRC_FILES := matoya-test.c
LOCAL_LDLIBS = -llog -landroid -lEGL -lGLESv3 -laaudio
LOCAL_STATIC_LIBRARIES := matoya
include $(BUILD_SHARED_LIBRARY)
