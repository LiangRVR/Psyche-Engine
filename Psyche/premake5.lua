project "Psyche"
	kind "SharedLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "On"

	targetdir("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files {"src/**.h", "src/**.cpp"}

	pchheader "psychepch.h"


	defines {"PSC_BUILD_DLL"}
	linkoptions {"-shared"}
	includedirs {"src", "vendor/spdlog/include/"}
	filter "system:linux"
		buildoptions {"-fdeclspec", "-fPIC"}
		defines {"PSC_PLATFORM_LINUX"}


	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
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
		("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
	}
