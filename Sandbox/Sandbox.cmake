add_executable("Sandbox"
"Sandbox/src/main.cpp"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  add_dependencies("Sandbox"
    "Psyche"
  )
  set_target_properties("Sandbox" PROPERTIES
    OUTPUT_NAME "Sandbox"
    ARCHIVE_OUTPUT_DIRECTORY "bin/Debug-linux-x86_64/Sandbox"
    LIBRARY_OUTPUT_DIRECTORY "bin/Debug-linux-x86_64/Sandbox"
    RUNTIME_OUTPUT_DIRECTORY "bin/Debug-linux-x86_64/Sandbox"
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Debug) # Include dirs
  target_include_directories("Sandbox" PRIVATE
    Psyche/vendor/spdlog/include
    Psyche/src
  )
endif()
target_compile_definitions("Sandbox" PRIVATE
  $<$<CONFIG:Debug>:PSC_PLATFORM_LINUX>
  $<$<CONFIG:Debug>:PSC_DEBUG>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug) # Lib dirs
endif()
target_link_libraries("Sandbox"
  $<$<CONFIG:Debug>:Psyche>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("Sandbox" PROPERTIES COMPILE_FLAGS -fdeclspec -fPIC )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  if (NOT MSVC)
  endif()
endif()
if (MSVC)
  target_compile_options("Sandbox" PRIVATE
    $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:/MDd>
    $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:/Z7>
    $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:/MDd>
    $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:/Z7>
    $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:/EHsc>
  )
else()
  target_compile_options("Sandbox" PRIVATE
    $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-m64>
    $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-g>
    $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-m64>
    $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-g>
    $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("Sandbox" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release)
  add_dependencies("Sandbox"
    "Psyche"
  )
  set_target_properties("Sandbox" PROPERTIES
    OUTPUT_NAME "Sandbox"
    ARCHIVE_OUTPUT_DIRECTORY "bin/Release-linux-x86_64/Sandbox"
    LIBRARY_OUTPUT_DIRECTORY "bin/Release-linux-x86_64/Sandbox"
    RUNTIME_OUTPUT_DIRECTORY "bin/Release-linux-x86_64/Sandbox"
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release) # Include dirs
  target_include_directories("Sandbox" PRIVATE
    Psyche/vendor/spdlog/include
    Psyche/src
  )
endif()
target_compile_definitions("Sandbox" PRIVATE
  $<$<CONFIG:Release>:PSC_PLATFORM_LINUX>
  $<$<CONFIG:Release>:PSC_RELEASE>
)
if(CMAKE_BUILD_TYPE STREQUAL Release) # Lib dirs
endif()
target_link_libraries("Sandbox"
  $<$<CONFIG:Release>:Psyche>
)
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("Sandbox" PROPERTIES COMPILE_FLAGS -fdeclspec -fPIC )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release)
  if (NOT MSVC)
  endif()
endif()
if (MSVC)
  target_compile_options("Sandbox" PRIVATE
    $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:/Ot>
    $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:/MD>
    $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:/Ot>
    $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:/MD>
    $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:/EHsc>
  )
else()
  target_compile_options("Sandbox" PRIVATE
    $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-m64>
    $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-O2>
    $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-m64>
    $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-O2>
    $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("Sandbox" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  add_dependencies("Sandbox"
    "Psyche"
  )
  set_target_properties("Sandbox" PROPERTIES
    OUTPUT_NAME "Sandbox"
    ARCHIVE_OUTPUT_DIRECTORY "bin/Dist-linux-x86_64/Sandbox"
    LIBRARY_OUTPUT_DIRECTORY "bin/Dist-linux-x86_64/Sandbox"
    RUNTIME_OUTPUT_DIRECTORY "bin/Dist-linux-x86_64/Sandbox"
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Dist) # Include dirs
  target_include_directories("Sandbox" PRIVATE
    Psyche/vendor/spdlog/include
    Psyche/src
  )
endif()
target_compile_definitions("Sandbox" PRIVATE
  $<$<CONFIG:Dist>:PSC_PLATFORM_LINUX>
  $<$<CONFIG:Dist>:PSC_DIST>
)
if(CMAKE_BUILD_TYPE STREQUAL Dist) # Lib dirs
endif()
target_link_libraries("Sandbox"
  $<$<CONFIG:Dist>:Psyche>
)
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("Sandbox" PROPERTIES COMPILE_FLAGS -fdeclspec -fPIC )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  if (NOT MSVC)
  endif()
endif()
if (MSVC)
  target_compile_options("Sandbox" PRIVATE
    $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:/Ot>
    $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:/MD>
    $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:/Ot>
    $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:/MD>
    $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:/EHsc>
  )
else()
  target_compile_options("Sandbox" PRIVATE
    $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:-m64>
    $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:-O2>
    $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-m64>
    $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-O2>
    $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("Sandbox" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()