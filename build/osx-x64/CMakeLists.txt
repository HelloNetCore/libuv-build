project(libuv-darwin)

set(RID osx-x64)

include(../common.cmake)

add_compile_options(-arch x86_64)

add_library(uv SHARED ${SOURCES})
install(TARGETS uv DESTINATION runtimes/${RID}/native)
