#include "OpenGLContext.h"
#include "psychepch.h"

#include <GLFW/glfw3.h>
#include <glad/glad.h>

namespace Psyche {

    OpenGLContext::OpenGLContext(GLFWwindow *windowHandle) : m_WindowHandle(windowHandle) {
        PSC_CORE_ASSERT(windowHandle, "Window handle is null!");
    }

    void OpenGLContext::Init() {
        glfwMakeContextCurrent(m_WindowHandle);
        int status = gladLoadGLLoader((GLADloadproc)glfwGetProcAddress);
        PSC_CORE_ASSERT(status, "Failed to initialize Glad!");

        PSC_CORE_INFO("OpenGL Info:");
        PSC_CORE_INFO("  Vendor: {0}", (const char *)glGetString(GL_VENDOR));
        PSC_CORE_INFO("  Renderer: {0}", (const char *)glGetString(GL_RENDERER));
        PSC_CORE_INFO("  Version: {0}", (const char *)glGetString(GL_VERSION));
    }

    void OpenGLContext::SwapBuffers() { glfwSwapBuffers(m_WindowHandle); }

} // namespace Psyche
