#pragma once

#include "Core.h"
#include "Events/ApplicationEvent.h"
#include "Events/Event.h"
#include "LayerStack.h"
#include "Window.h"

#include "Psyche/ImGui/ImGuiLayer.h"

#include "Psyche/Renderer/Buffer.h"
#include "Psyche/Renderer/Shader.h"
#include "Psyche/Renderer/VertexArray.h"

namespace Psyche {

    class PSYCHE_API Application {
      public:
        Application();
        virtual ~Application() = default;

        void Run();

        void OnEvent(Event &e);

        void PushLayer(Layer *layer);
        void PushOverlay(Layer *layer);

        inline Window &GetWindow() { return *m_Window; }

        inline static Application &Get() { return *s_Instance; }

      private:
        bool OnWindowClose(WindowCloseEvent &e);

        std::unique_ptr<Window> m_Window;
        ImGuiLayer *m_ImGuiLayer;
        bool m_Running = true;
        LayerStack m_LayerStack;

        std::shared_ptr<Shader> m_Shader;
        std::shared_ptr<VertexArray> m_VertexArray;

        std::shared_ptr<VertexArray> m_SquareVA;
        std::shared_ptr<Shader> m_BlueShader;

      private:
        static Application *s_Instance;
    };

    // To be defined in CLIENT
    Application *CreateApplication();
} // namespace Psyche
