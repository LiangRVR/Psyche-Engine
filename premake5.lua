workspace "Psyche"
	architecture "x64"
	startproject "Sandbox"

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
IncludeDir["glm"] = "%{wks.location}/Psyche/vendor/glm/"

group "Dependencies"
	include "Psyche/vendor/GLFW"
	include "Psyche/vendor/Glad"
	include "Psyche/vendor/imgui"
group ""

include "Psyche"
include "Sandbox"
