cmake_minimum_required(VERSION 3.10)
project(labssh2-superbuild VERSION 0.1.0 LANGUAGES C)
set(PROJECT_URL "https://github.com/fieldrndservices/labssh2-superbuild")
set(PROJECT_DESCRIPTION "A CMake Super Build for the labssh2-c project")

include(ExternalProject)

set(OPENSSL "openssl")
set(LABSSH2 "labssh2")

if(WIN32)
    if("${CMAKE_GENERATOR}" MATCHES "(Win64|IA64)")
        set(OPENSSL_CONFIGURE_COMMAND perl ./Configure VC-WIN64A no-shared no-asm no-stdio)
        set(LABSSH2_CMAKE_GENERATOR "Visual Studio 15 2017 Win64")
    else()
        set(OPENSSL_CONFIGURE_COMMAND perl ./Configure VC-WIN32 no-shared no-asm no-stdio)
        set(LABSSH2_CMAKE_GENERATOR "Visual Studio 15 2017")
    endif()
    set(OPENSSL_BUILD_COMMAND nmake)
else()
    set(OPENSSL_CONFIGURE_COMMAND ./config no-shared no-stdio)
    set(OPENSSL_BUILD_COMMAND ${MAKE})
endif()

ExternalProject_Add(${OPENSSL}
    PREFIX ${OPENSSL}
    URL https://github.com/openssl/openssl/archive/OpenSSL_1_1_0g.zip
    UPDATE_DISCONNECTED YES
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${OPENSSL_CONFIGURE_COMMAND}
    BUILD_IN_SOURCE YES
    BUILD_COMMAND ${OPENSSL_BUILD_COMMAND}
    TEST_COMMAND ""
    INSTALL_COMMAND ""
)

ExternalProject_Get_Property(${OPENSSL} BINARY_DIR)
set(OPENSSL_BINARY_DIR ${BINARY_DIR})

ExternalProject_Add(${LABSSH2}
    PREFIX ${LABSSH2}
    DEPENDS ${OPENSSL}
    GIT_REPOSITORY https://github.com/fieldrndservices/labssh2-c.git
    CMAKE_GENERATOR ${LABSSH2_CMAKE_GENERATOR}
    CMAKE_ARGS -DBUILD_SHARED_LIBS=YES -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -DBUILD_DOCS=OFF -DCRYPTO_BACKEND=OpenSSL -DOPENSSL_ROOT_DIR=${OPENSSL_BINARY_DIR} -DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_BINARY_DIR}/${LABSSH2}  -DCMAKE_INSTALL_BINDIR=${CMAKE_CURRENT_BINARY_DIR}/bin
    BUILD_IN_SOURCE NO
    TEST_COMMAND ""
)

