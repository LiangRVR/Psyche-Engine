#pragma once

#if defined(PCH_PLATFORM_WINDOWS) || defined(PSC_PLATFORM_LINUX)

extern PSYCHE::Application* PSYCHE::CreateApplication();

int main(int argc, char** argv)
{
    auto app = PSYCHE::CreateApplication();
    app->Run();
    delete app;
}

#endif
