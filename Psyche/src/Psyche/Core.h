#pragma once

// Platform detection
#if defined(WIN32) || defined(_WIN32) || defined(__WIN32__)
#    define PSC_PLATFORM_WINDOWS 1
#    ifndef _WIN64
#        error "64-bit is required on Windows!"
#    endif
#elif defined(__linux__) || defined(__gnu_linux__)
// Linux OS
#    define PSC_PLATFORM_LINUX 1
#    if defined(__ANDROID__)
#        define PSC_PLATFORM_ANDROID 1
#    endif
#elif defined(__unix__)
// Catch anything not caught by the above.
#    define PSC_PLATFORM_UNIX 1
#elif defined(_POSIX_VERSION)
// Posix
#    define PSC_PLATFORM_POSIX 1
#elif __APPLE__
// Apple platforms
#    define PSC_PLATFORM_APPLE 1
#    include <TargetConditionals.h>
#    if TARGET_IPHONE_SIMULATOR
// iOS Simulator
#        define PSC_PLATFORM_IOS           1
#        define PSC_PLATFORM_IOS_SIMULATOR 1
#    elif TARGET_OS_IPHONE
#        define PSC_PLATFORM_IOS 1
// iOS device
#    elif TARGET_OS_MAC
// Other kinds of Mac OS
#    else
#        error "Unknown Apple platform"
#    endif
#else
#    error "Unknown platform!"
#endif

#ifdef PSC_BUILD_DLL
// Exports
#    ifdef _MSC_VER
#        define PSYCHE_API __declspec(dllexport)
#    else
#        define PSYCHE_API __attribute__((visibility("default")))
#    endif
#else
// Imports
#    ifdef _MSC_VER
#        define PSYCHE_API __declspec(dllimport)
#    else
#        define PSYCHE_API
#    endif
#endif

#define BIT(x) (1 << x)

#ifdef PSC_DEBUG
#    if defined(PSC_PLATFORM_WINDOWS)
#        define PSC_DEBUGBREAK() __debugbreak()
#    elif defined(PSC_PLATFORM_LINUX)
#        include <signal.h>
#        define PSC_DEBUGBREAK() raise(SIGTRAP)
#    else
#        error "Platform doesn't support debugbreak yet!"
#    endif
#    define PSC_ENABLE_ASSERTS
#else
#    define PSC_DEBUGBREAK()
#endif

#ifdef PSC_ENABLE_ASSERTS
#    define PSC_ASSERT(x, ...)                                                                     \
        if (!(x)) {                                                                                \
            PSC_ERROR("Assertion Failed: {0}", __VA_ARGS__);                                       \
            PSC_DEBUGBREAK();                                                                      \
        }
#    define PSC_CORE_ASSERT(x, ...)                                                                \
        if (!(x)) {                                                                                \
            PSC_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__);                                  \
            PSC_DEBUGBREAK();                                                                      \
        }
#else
#    define PSC_ASSERT(x, ...)
#    define PSC_CORE_ASSERT(x, ...)
#endif
