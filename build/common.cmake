set (LIBUV ${REPO_ROOT}/submodules/libuv)
set (LIBUV_SRC ${LIBUV}/src)
include_directories(${LIBUV}/include ${LIBUV_SRC})

set (SOURCES ${LIBUV_SRC}/fs-poll.c
    ${LIBUV_SRC}/inet.c
    ${LIBUV_SRC}/threadpool.c
    ${LIBUV_SRC}/uv-common.c
    ${LIBUV_SRC}/version.c
    ${LIBUV_SRC}/unix/async.c
    ${LIBUV_SRC}/unix/core.c
    ${LIBUV_SRC}/unix/dl.c
    ${LIBUV_SRC}/unix/fs.c
    ${LIBUV_SRC}/unix/getaddrinfo.c
    ${LIBUV_SRC}/unix/getnameinfo.c
    ${LIBUV_SRC}/unix/loop.c
    ${LIBUV_SRC}/unix/loop-watcher.c
    ${LIBUV_SRC}/unix/pipe.c
    ${LIBUV_SRC}/unix/poll.c
    ${LIBUV_SRC}/unix/process.c
    ${LIBUV_SRC}/unix/signal.c
    ${LIBUV_SRC}/unix/stream.c
    ${LIBUV_SRC}/unix/tcp.c
    ${LIBUV_SRC}/unix/thread.c
    ${LIBUV_SRC}/unix/timer.c
    ${LIBUV_SRC}/unix/tty.c
    ${LIBUV_SRC}/unix/udp.c
    ${LIBUV_SRC}/unix/proctitle.c)

if (UNIX)
    # Applies to both Darwin and Linux
    add_compile_options(
        -lm -pthread -fPIC
        -Wall -Wextra -Wno-unused-parameter -Wstrict-aliasing
        -g
        --std=gnu89
        -pedantic
        -D_BUILDING_UV_SHARED=1)

    if (APPLE)
        add_compile_options(
            -D_DARWIN_USE_64_BIT_INODE=1
            -D_DARWIN_UNLIMITED_SELECT=1)

        list (APPEND SOURCES
            ${LIBUV_SRC}/unix/darwin.c
            ${LIBUV_SRC}/unix/darwin-proctitle.c
            ${LIBUV_SRC}/unix/kqueue.c
            ${LIBUV_SRC}/unix/fsevents.c
            ${LIBUV_SRC}/unix/pthread-barrier.c)
    else()
        add_compile_options(
            -ldl -lrt
            -D_GNU_SOURCE
            -D_BUILDING_UV_SHARED=1)

        list(APPEND SOURCES
            ${LIBUV_SRC}/unix/linux-core.c
            ${LIBUV_SRC}/unix/linux-inotify.c
            ${LIBUV_SRC}/unix/linux-syscalls.c)
    endif()
endif()
