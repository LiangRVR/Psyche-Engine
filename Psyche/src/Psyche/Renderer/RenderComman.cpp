#include "psychepch.h"
#include "RenderCommand.h"

#include "Platform/OpenGL/OpenGLRendererAPI.h"

namespace Psyche {

    std::unique_ptr<RendererAPI> RenderCommand::s_RendererAPI = std::make_unique<OpenGLRendererAPI>();

} // namespace Psyche
