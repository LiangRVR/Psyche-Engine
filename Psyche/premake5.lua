project "Psyche"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "psychepch.h"
	pchsource "Psyche/src/psychepch.cpp"

	files {
		"src/**.h",
		"src/**.cpp",
		"vendor/glm/glm/**.hpp",
		"vendor/glm/glm/**.inl"
	}

	defines	{
		"_CRT_SECURE_NO_WARNINGS",
		"PSC_BUILD_DLL",
		"GLFW_INCLUDE_NONE"
	}

	includedirs {
		"src",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.spdlog}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.glm}"
	}

	links {
		"GLFW",
		"Glad",
		"ImGui"
	}

	filter "system:linux"
		--[[ buildoptions {"-fdeclspec", "-fPIC"} ]]
		defines {"PSC_PLATFORM_LINUX"}


	filter "system:windows"
		systemversion "latest"
		--[[ buildoptions {"-Wvarargs", "-Wall", "-Werror"} ]]
		defines {"PSC_PLATFORM_WINDOWS"}

	filter "configurations:Debug"
		defines "PSC_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "PSC_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "PSC_DIST"
		runtime "Release"
		optimize "on"
