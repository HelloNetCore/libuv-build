project(libuv-linux-arm64)

set(RID linux-arm64)

include(../common.cmake)

# The "arm64" target should align with what CoreFX is doing, see
# https://github.com/dotnet/corefx/blob/master/cross/arm64/toolchain.cmake

add_compile_options(
    -target aarch64-linux-gnu
    -B/usr/aarch64-linux-gnu/bin/
    -B/usr/aarch64-linux-gnu/lib/
    -isystem /usr/aarch64-linux-gnu/include)

add_library(uv SHARED ${SOURCES})
install(TARGETS uv DESTINATION runtimes/${RID}/native)
