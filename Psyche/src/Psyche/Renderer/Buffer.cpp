#include "Buffer.h"
#include "psychepch.h"

#include "Renderer.h"

#include "Platform/OpenGL/OpenGLBuffer.h"

namespace Psyche {
    VertexBuffer *VertexBuffer::Create(float *vertices, uint32_t size) {
        switch (Renderer::GetAPI()) {
            case RendererAPI::API::None:
                PSC_CORE_ASSERT(false, "RendererAPI::None is currently not supported!");
                return nullptr;
            case RendererAPI::API::OpenGL: return new OpenGLVertexBuffer(vertices, size);
        }

        PSC_CORE_ASSERT(false, "Unknown RendererAPI!");
        return nullptr;
    }

    IndexBuffer *IndexBuffer::Create(uint32_t *indices, uint32_t size) {
        switch (Renderer::GetAPI()) {
            case RendererAPI::API::None:
                PSC_CORE_ASSERT(false, "RendererAPI::None is currently not supported!");
                return nullptr;
            case RendererAPI::API::OpenGL: return new OpenGLIndexBuffer(indices, size);
        }

        PSC_CORE_ASSERT(false, "Unknown RendererAPI!");
        return nullptr;
    }
} // namespace Psyche
