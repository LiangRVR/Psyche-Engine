#pragma once

#include "Psyche/Core.h"
#include "Psyche/Events/Event.h"

namespace Psyche {

    class PSYCHE_API Layer {
      public:
        Layer(const std::string &name = "Layer");
        virtual ~Layer() = default;

        virtual void OnAttach() {}
        virtual void OnDetach() {}
        virtual void OnUpdate() {}
        virtual void OnImGuiRender() {}
        virtual void OnEvent(Event &event) {}

        inline const std::string &GetName() const { return m_DebugName; }

      protected:
        std::string m_DebugName;
    };

} // namespace Psyche
