#pragma once

#include "Psyche/Layer.h"

#include "Psyche/Events/KeyEvent.h"
#include "Psyche/Events/MouseEvent.h"
#include "Psyche/Events/ApplicationEvent.h"

namespace Psyche {
    class PSYCHE_API ImGuiLayer : public Layer {
      public:
        ImGuiLayer();
        ~ImGuiLayer();

        void OnAttach();
        void OnDetach();
        void OnUpdate();
        void OnEvent(Event &event);

    private:
      bool OnMouseButtonPressedEvent(MouseButtonPressedEvent &e);
      bool OnMouseButtonReleasedEvent(MouseButtonReleasedEvent &e);
      bool OnMouseMovedEvent(MouseMovedEvent &e);
      bool OnMouseScrolledEvent(MouseScrolledEvent &e);
      bool OnKeyPressedEvent(KeyPressedEvent &e);
      bool OnKeyReleasedEvent(KeyReleasedEvent &e);
      bool OnKeyTypedEvent(KeyTypedEvent &e);
      bool OnWindowResizedEvent(WindowResizeEvent &e);

    private:
      float m_Time = 0.0f;
    };
} // namespace Psyche
