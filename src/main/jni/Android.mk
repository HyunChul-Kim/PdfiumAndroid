LOCAL_PATH := $(call my-dir)
ABI := $(TARGET_ARCH_ABI)

# -- prebuilt libpdfium (SHARED) --
include $(CLEAR_VARS)
LOCAL_MODULE := aospPdfium
LOCAL_SRC_FILES := ../jniLibs/$(ABI)/libpdfium.so
include $(PREBUILT_SHARED_LIBRARY)

# -- prebuilt freetype (SHARED) --
include $(CLEAR_VARS)
LOCAL_MODULE := libmodft2
LOCAL_SRC_FILES := ../jniLibs/$(ABI)/libmodft2.so
include $(PREBUILT_SHARED_LIBRARY)

# -- prebuilt libpng (SHARED) --
include $(CLEAR_VARS)
LOCAL_MODULE := libmodpng
LOCAL_SRC_FILES := ../jniLibs/$(ABI)/libmodpng.so
include $(PREBUILT_SHARED_LIBRARY)

# Main JNI library
include $(CLEAR_VARS)
LOCAL_MODULE := jniPdfium
LOCAL_SRC_FILES := src/mainJNILib.cpp

LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_CFLAGS += -DHAVE_PTHREADS

# 16KB 페이지 사이즈 대비(arm64/x86_64). 32bit에도 무해
LOCAL_LDFLAGS += -Wl,-z,max-page-size=16384

# jniPdfium이 참조하는 공유 라이브러리들
LOCAL_SHARED_LIBRARIES += aospPdfium libmodft2 libmodpng

# 시스템 라이브러리 (libpng가 zlib 심볼 쓰므로 -lz 권장)
LOCAL_LDLIBS += -llog -landroid -ljnigraphics -lz

include $(BUILD_SHARED_LIBRARY)
