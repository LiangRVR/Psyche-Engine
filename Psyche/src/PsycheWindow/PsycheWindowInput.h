#pragma once

#include "Psyche/Input.h"

namespace Psyche {

    class PSYCHE_API WindowsInput : public Input {
      protected:
        bool IsKeyPressedImpl(int keycode) override;
        bool IsMouseButtonPressedImpl(int button) override;
        std::pair<float, float> GetMousePositionImpl() override;
        float GetMouseXImpl() override;
        float GetMouseYImpl() override;
    };

} // namespace Psyche
