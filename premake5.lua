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
IncludeDir["GLFW"] = "%{wks.location}/Psyche/vendor/GLFW/include/"
IncludeDir["spdlog"] = "%{wks.location}/Psyche/vendor/spdlog/include/"

include "Psyche/vendor/GLFW"
include "Psyche"
include "Sandbox"
