#pragma once
#include "Core.h"
#include "spdlog/spdlog.h"

namespace Psyche {
    class PSYCHE_API Log {
      public:
        static void Init();

        inline static std::shared_ptr<spdlog::logger> &GetCoreLogger() { return s_CoreLogger; }
        inline static std::shared_ptr<spdlog::logger> &GetClientLogger() { return s_ClientLogger; }

      private:
        static std::shared_ptr<spdlog::logger> s_CoreLogger;
        static std::shared_ptr<spdlog::logger> s_ClientLogger;
    };
} // namespace Psyche

// Core logs macros
#define PSC_CORE_TRACE(...) ::Psyche::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define PSC_CORE_INFO(...)  ::Psyche::Log::GetCoreLogger()->info(__VA_ARGS__)
#define PSC_CORE_WARN(...)  ::Psyche::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define PSC_CORE_ERROR(...) ::Psyche::Log::GetCoreLogger()->error(__VA_ARGS__)
#define PSC_CORE_CRITICAL(...) ::Psyche::Log::GetCoreLogger()->critical(_ARGS__)

// Client logs macros
#define PSC_TRACE(...) ::Psyche::Log::GetClientLogger()->trace(__VA_ARGS__)
#define PSC_INFO(...)  ::Psyche::Log::GetClientLogger()->info(__VA_ARGS__)
#define PSC_WARN(...)  ::Psyche::Log::GetClientLogger()->warn(__VA_ARGS__)
#define PSC_ERROR(...) ::Psyche::Log::GetClientLogger()->error(__VA_ARGS__)
#define PSC_CRITICAL(...) ::Psyche::Log::GetClientLogger()->critical(__VA_ARGS__)
