#include <Psyche.h>

class Sandbox : public PSYCHE::Application
{
public:
    Sandbox()
    {

    }

    ~Sandbox()
    {

    }

};

PSYCHE::Application* PSYCHE::CreateApplication()
{
    return new Sandbox();
}

