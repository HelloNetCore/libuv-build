project(libuv-linux-x64)

set(RID linux-x64)

include(../common.cmake)

add_library(uv SHARED ${SOURCES})
install(TARGETS uv DESTINATION runtimes/${RID}/native)
