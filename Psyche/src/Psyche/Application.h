#pragma once

#include "Core.h"

namespace PSYCHE {

    class PSYCHE_API Application
    {
    public:
        Application();
        virtual ~Application();

        void Run();
    };

    // To be defined in CLIENT
    Application* CreateApplication();

}
