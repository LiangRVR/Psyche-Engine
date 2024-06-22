#include <Psyche.h>

class ExampleLayer : public Psyche::Layer {
  public:
    ExampleLayer() : Layer("Example") {

    }

    void OnUpdate() override {
        if (Psyche::Input::IsKeyPressed(PSC_KEY_TAB))
            PSC_TRACE("Tab key is pressed (poll)!");
        ;
    }

    void OnEvent(Psyche::Event &event) override {
        if (event.GetEventType() == Psyche::EventType::KeyPressed) {
            Psyche::KeyPressedEvent &e = (Psyche::KeyPressedEvent &)event;
            if (e.GetKeyCode() == PSC_KEY_TAB)
                PSC_TRACE("Tab key is pressed (event)!");
            PSC_TRACE("{0}", (char)e.GetKeyCode());
        };
    }
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
