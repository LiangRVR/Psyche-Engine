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
        
        virtual void OnAttach() override;
        virtual void OnDetach() override;
        virtual void OnImGuiRender() override;

        void Begin();
        void End();

      private:
        float m_Time = 0.0f;
    };
} // namespace Psyche
