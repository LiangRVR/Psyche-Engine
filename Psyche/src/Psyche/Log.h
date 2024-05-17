#pragma once
#include <memory>
#include "Core.h"
#include "spdlog/spdlog.h"


namespace PSYCHE {
    class PSYCHE_API Log {
    public:
        static void Init();

        inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
        inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
    private:


        static std::shared_ptr<spdlog::logger> s_CoreLogger;
        static std::shared_ptr<spdlog::logger> s_ClientLogger;
    };
}

//Core logs macros
#define PSC_CORE_TRACE(...)    ::PSYCHE::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define PSC_CORE_INFO(...)     ::PSYCHE::Log::GetCoreLogger()->info(__VA_ARGS__)
#define PSC_CORE_WARN(...)     ::PSYCHE::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define PSC_CORE_ERROR(...)    ::PSYCHE::Log::GetCoreLogger()->error(__VA_ARGS__)
#define PSC_CORE_FATAL(...)    ::PSYCHE::Log::GetCoreLogger()->critical(_ARGS__)

//Client logs macros
#define PSC_TRACE(...)         ::PSYCHE::Log::GetClientLogger()->trace(__VA_ARGS__)
#define PSC_INFO(...)          ::PSYCHE::Log::GetClientLogger()->info(__VA_ARGS__)
#define PSC_WARN(...)          ::PSYCHE::Log::GetClientLogger()->warn(__VA_ARGS__)
#define PSC_ERROR(...)         ::PSYCHE::Log::GetClientLogger()->error(__VA_ARGS__)
#define PSC_FATAL(...)         ::PSYCHE::Log::GetClientLogger()->critical(__VA_ARGS__)
