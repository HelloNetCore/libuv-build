project(libuv-linux-armel)

set(RID linux-armel)

# The "armel" target should align with what CoreFX is doing, see
# https://github.com/dotnet/corefx/blob/master/cross/arm/toolchain.cmake#L9

include(../common.cmake)

add_compile_options(
    -target armv7-linux-gnueabi
    -mfpu=vfpv3
    -mfloat-abi=softfp
    -B/usr/arm-linux-gnueabi/bin/
    -B/usr/arm-linux-gnueabi/lib/
    -isystem /usr/arm-linux-gnueabi/include )

add_library(uv SHARED ${SOURCES})
install(TARGETS uv DESTINATION runtimes/${RID}/native)
