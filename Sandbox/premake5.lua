project "Sandbox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"

	targetdir("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"src/**.h",
		"src/**.cpp"
	}

	includedirs	{
		"%{wks.location}/Psyche/vendor/spdlog/include",
		"%{wks.location}/Psyche/src"
	}

	links	{
		"Psyche",
	}

	links {
		"GLFW",
		"Glad",
	}

	filter "system:linux"
		buildoptions {"-fdeclspec", "-fPIC"}
		defines {"PSC_PLATFORM_LINUX"}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines {
			"PSC_PLATFORM_WINDOWS"
		}

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
