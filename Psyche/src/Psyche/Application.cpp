#include "Application.h"

#include "Events/ApplicationEvent.h"
#include "Log.h"

namespace PSYCHE {

    Application::Application()
    {
    }


    Application::~Application()
    {
    }

    void Application::Run()
    {
        WindowResizeEvent e(1280, 720);
        if (e.IsInCategory(EventCategoryApplication))
        {
            PSC_TRACE(e);
        }
        if (e.IsInCategory(EventCategoryInput))
        {
            PSC_TRACE(e);
        }
        while (true);
    }

}
