#include "psychepch.h"

#if !defined(IMGUI_IMPL_OPENGL_LOADER_CUSTOM)
#    define IMGUI_IMPL_OPENGL_LOADER_CUSTOM
#    include <glad/glad.h>
#endif
#include "backends/imgui_impl_glfw.cpp"
#include "backends/imgui_impl_opengl3.cpp"
