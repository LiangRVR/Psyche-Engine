#include <Psyche.h>

class ExampleLayer : public Psyche::Layer {
  public:
    ExampleLayer() : Layer("Example") {}

    void OnUpdate() override { PSC_INFO("ExampleLayer::Update"); }

    void OnEvent(Psyche::Event &event) override { PSC_TRACE("{0}", event); }
};

class Sandbox : public Psyche::Application {
  public:
    Sandbox() {
        PushLayer(new ExampleLayer());
        PushOverlay(new Psyche::ImGuiLayer());
    }

    ~Sandbox() {}
};

Psyche::Application *Psyche::CreateApplication() { return new Sandbox(); }
