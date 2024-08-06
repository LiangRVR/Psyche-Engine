#include "psychepch.h"
#include "Renderer.h"

namespace Psyche {

        void Renderer::BeginScene() {
        }

        void Renderer::EndScene() {
        }

        void Renderer::Submit(const std::shared_ptr<VertexArray> &vertexArray) {
            vertexArray->Bind();
            RenderCommand::DrawIndexed(vertexArray);
        }
} // namespace Psyche
