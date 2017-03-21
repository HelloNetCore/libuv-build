project(libuv-linux-arm)

set(RID linux-arm)

# The "arm" target should align with what CoreFX is doing, see
# https://github.com/dotnet/corefx/blob/master/cross/arm/toolchain.cmake#L9

include(../common.cmake)

add_compile_options(
    -target armv7-linux-gnueabihf
    -mfpu=vfpv3
    -B/usr/arm-linux-gnueabihf/bin/
    -B/usr/arm-linux-gnueabihf/lib/
    -isystem /usr/arm-linux-gnueabihf/include )

add_library(uv SHARED ${SOURCES})
install(TARGETS uv DESTINATION runtimes/${RID}/native)
