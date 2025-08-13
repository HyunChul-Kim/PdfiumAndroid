APP_CPPFLAGS += -fexceptions
# 최소 지원 플랫폼 (NDK r27+는 21 이상 권장/사실상 강제)
APP_PLATFORM := android-21
# 빌드할 ABI만 명시 (필요한 것만 남겨도 OK)
APP_ABI := arm64-v8a armeabi-v7a x86_64 x86
# (선택) 최적화
APP_OPTIM := release
# ★ C++ 런타임을 공유 라이브러리로 사용 (자동 링크/패키징)
APP_STL := c++_shared
APP_CPPFLAGS += -fexceptions
