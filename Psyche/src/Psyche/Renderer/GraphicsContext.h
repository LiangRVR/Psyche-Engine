#pragma once

namespace Psyche {

    class GraphicsContext {
      public:
        virtual void Init()        = 0;
        virtual void SwapBuffers() = 0;
    };
} // namespace Psyche
