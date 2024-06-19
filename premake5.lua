workspace "Psyche"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"


IncludeDir = {}
IncludeDir["spdlog"] = "%{wks.location}/Psyche/vendor/spdlog/include/"
IncludeDir["GLFW"] = "%{wks.location}/Psyche/vendor/GLFW/include/"
IncludeDir["Glad"] = "%{wks.location}/Psyche/vendor/Glad/include/"
IncludeDir["ImGui"] = "%{wks.location}/Psyche/vendor/imgui/"

include "Psyche/vendor/GLFW"
include "Psyche/vendor/Glad"
include "Psyche/vendor/imgui"
include "Psyche"
include "Sandbox"
