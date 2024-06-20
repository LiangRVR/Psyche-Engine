project "Psyche"
	kind "SharedLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"

	targetdir("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files {"src/**.h", "src/**.cpp"}

	pchheader "psychepch.h"


	defines {
		"PSC_BUILD_DLL",
		"GLFW_INCLUDE_NONE"
	}

	linkoptions {"-shared"}
	includedirs {
		"src",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.spdlog}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}"
	}

	links {
		"GLFW",
		"Glad",
		"ImGui"
	}

	defines
		{
			"HZ_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}

	filter "system:linux"
		buildoptions {"-fdeclspec", "-fPIC"}
		defines {"PSC_PLATFORM_LINUX"}


	filter "system:windows"
		cppdialect "C++17"
		systemversion "latest"
		buildoptions {"-Wvarargs", "-Wall", "-Werror"}
		pchsource "Psyche/src/psychepch.cpp"
		defines {"PSC_PLATFORM_WINDOWS"}

	filter "configurations:Debug"
		defines "PSC_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "PSC_RELEASE"
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		defines "PSC_DIST"
		runtime "Release"
		optimize "On"

	postbuildcommands
	{
		("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Sandbox/\"")
	}
