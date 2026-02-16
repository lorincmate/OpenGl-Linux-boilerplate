# OpenGlSandbox

Minimal OpenGL sandbox using GLFW and Premake/Ninja.

Prerequisites
- premake5
- ninja
- clang/clang++ (or your preferred compiler)
- pkg-config
- glfw3 development libraries
- clangd (optional, recommended for IDE)

Quick build
```bash
mkdir -p build
premake5 ninja
ninja -C build
```

Run
- Debug build: `./build/bin/Debug/HelloWorld`
- Release build: `./build/bin/Release/HelloWorld`

VS Code
- Press `Ctrl+Shift+B` to run the workspace "Build All" task (premake, compdb, ninja).
- clangd is configured to use `build/compile_commands.json`.

Notes
- All generated files (ninja files, objects, binaries, compile_commands) live inside `build/`.
- Adjust `premake5.lua` if you need custom include/link paths.
