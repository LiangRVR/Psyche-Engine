#include "psychepch.h"
#include "VertexArray.h"

#include "Renderer.h"
#include "Platform/OpenGL/OpenGLVertexArray.h"

namespace Psyche
{
    VertexArray *VertexArray::Create() {
        switch (Renderer::GetAPI()) {
            case RendererAPI::None:
                PSC_CORE_ASSERT(false, "RendererAPI::None is currently not supported!");
                return nullptr;
            case RendererAPI::OpenGL: return new OpenGLVertexArray();
        }

        PSC_CORE_ASSERT(false, "Unknown RendererAPI!");
        return nullptr;
    }
} // namespace Psyche
