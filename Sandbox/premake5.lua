project "Sandbox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"


	targetdir("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"src/**.h",
		"src/**.cpp"
	}

	includedirs	{
		"%{IncludeDir.spdlog}",
		"%{IncludeDir.glm}",
		"%{wks.location}/Psyche/src",
		"%{wks.location}/Psyche/vendor"
	}

	libdirs {
		"%{LibDirs.GLFW}"
	}

	links {
		"Psyche"
	}

	filter "system:linux"
	--[[ buildoptions {"-fdeclspec", "-fPIC"} ]]
		defines {"PSC_PLATFORM_LINUX"}
		links {
			"glfw3",
			"Glad",
			"ImGui"
		}

	filter "system:windows"
		systemversion "latest"

		defines {
			"PSC_PLATFORM_WINDOWS"
		}

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
