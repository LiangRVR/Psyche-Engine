#include <Psyche.h>

class Sandbox : public Psyche::Application {
  public:
    Sandbox() {}

    ~Sandbox() {}
};

Psyche::Application *Psyche::CreateApplication() { return new Sandbox(); }
