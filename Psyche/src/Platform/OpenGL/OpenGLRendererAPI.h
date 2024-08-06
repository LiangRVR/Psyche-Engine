#pragma once

#include "Psyche/Renderer/RendererAPI.h"

namespace Psyche {

    class OpenGLRendererAPI : public RendererAPI {
      public:
        virtual void SetClearColor(const glm::vec4 &color) override;
        virtual void Clear() override;

        virtual void DrawIndexed(const std::shared_ptr<VertexArray> &vertexArray) override;
    };
} // namespace Psyche
