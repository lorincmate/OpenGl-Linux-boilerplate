if not _ACTION then
    _ACTION = "gmake2"
end

workspace "OpenGlSandbox"
    location "build"
    toolset "clang"
    configurations { "Debug", "Release" }

project "HelloWorld"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    warnings "Extra"
    location "build"
    targetdir "build/bin/%{cfg.buildcfg}"
    objdir "build/obj/%{prj.name}/%{cfg.buildcfg}"
    
    files { "src/**.hpp", "src/**.cpp" }  -- ** is more flexible
    
    -- GLFW detection
    local glfw_cflags = os.outputof("pkg-config --cflags glfw3 2>/dev/null")
    local glfw_libs = os.outputof("pkg-config --libs glfw3 2>/dev/null")
    
    if glfw_cflags ~= "" then
        buildoptions { glfw_cflags }
    end
    
    if glfw_libs ~= "" then
        linkoptions { glfw_libs }
    else
        links { "glfw", "GL" }
    end
    
    filter "system:linux"
        links { "GL", "m", "dl", "pthread", "glfw" }
    
    filter "system:macosx"
        links { "Cocoa.framework", "IOKit.framework", "CoreVideo.framework" }
    
    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"
    
    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"