#pragma once

#if defined(PCH_PLATFORM_WINDOWS) || defined(PSC_PLATFORM_LINUX)
extern Psyche::Application *Psyche::CreateApplication();

int main(int argc, char **argv) {
    Psyche::Log::Init();
    PSC_CORE_WARN("Initialized Log!");
    int a = 5;
    PSC_INFO("Initialized Client! Var={0}", a);
    auto app = Psyche::CreateApplication();
    app->Run();
    delete app;
}
#endif
