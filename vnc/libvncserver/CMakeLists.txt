cmake_minimum_required(VERSION 3.5)
project (vncserver)
add_library(${PROJECT_NAME} STATIC
    libvncserver/main.c
    libvncserver/rfbserver.c
    libvncserver/rfbregion.c
    libvncserver/auth.c
    libvncserver/sockets.c
    libvncserver/stats.c
    libvncserver/corre.c
    libvncserver/hextile.c
    libvncserver/rre.c
    libvncserver/translate.c
    libvncserver/cutpaste.c
    libvncserver/httpd.c
    libvncserver/cursor.c
    libvncserver/font.c
    libvncserver/draw.c
    libvncserver/selbox.c
    common/d3des.c
    common/vncauth.c
    libvncserver/cargs.c
    libvncserver/ultra.c
    libvncserver/scale.c
	libvncserver/rfbssl_openssl.c
	libvncserver/zlib.c
    libvncserver/zrle.c
    libvncserver/zrleoutstream.c
    libvncserver/zrlepalettehelper.c
	libvncserver/tight.c
	common/turbojpeg.c
    libvncserver/websockets.c
    libvncserver/ws_decode.c
    common/base64.c
	common/rfbcrypto_included.c
	common/md5.c
	common/sha1.c
)

target_include_directories(${PROJECT_NAME}
    PRIVATE
        ${PROJECT_SOURCE_DIR}
        ${PROJECT_SOURCE_DIR}/libvncserver
        ${PROJECT_SOURCE_DIR}/common

)

target_include_directories(${PROJECT_NAME}
    PUBLIC
        ${PROJECT_SOURCE_DIR}/libjpeg-ios/include
        ${PROJECT_SOURCE_DIR}/openssl-ios/include
)

include_directories(
    ${libpng_SOURCE_DIR}
    ${PROJECT_SOURCE_DIR}/libjpeg-osx/include
)

target_link_libraries(${PROJECT_NAME}
    -L${PROJECT_SOURCE_DIR}/libjpeg-ios/lib
    -L${PROJECT_SOURCE_DIR}/openssl-ios/lib
    lzo_static_lib
    png_static
)

include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME} ARCHIVE DESTINATION ${CMAKE_INSTALL_FULL_LIBDIR})
set(rfbheader
    rfb/default8x16.h
    rfb/keysym.h
    rfb/rfb.h
    rfb/rfbclient.h
    rfb/rfbconfig.h
    rfb/rfbproto.h
    rfb/rfbregion.h
)
install(FILES ${rfbheader} DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR}/rfb)

set(libjpegosxheader
    libjpeg-osx/include/jconfig.h
    libjpeg-osx/include/jerror.h
    libjpeg-osx/include/jmorecfg.h
    libjpeg-osx/include/jpeglib.h
    libjpeg-osx/include/turbojpeg.h
)

set(libjpegiosheader
    libjpeg-ios/include/jconfig.h
    libjpeg-ios/include/jerror.h
    libjpeg-ios/include/jmorecfg.h
    libjpeg-ios/include/jpeglib.h
    libjpeg-ios/include/turbojpeg.h
)

set(libjpegosxlib
    libjpeg-osx/lib/libjpeg.a
    libjpeg-osx/lib/libturbojpeg.a
)

set(libjpegioslib
    libjpeg-ios/lib/libjpeg.a
    libjpeg-ios/lib/libturbojpeg.a
)

set(opensslosxlib
    openssl-osx/lib/libcrypto.a
    openssl-osx/lib/libssl.a
)

set(opensslioslib
    openssl-ios/lib/libcrypto.a
    openssl-ios/lib/libssl.a
)

install(FILES ${libjpegiosheader} DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR})
install(FILES ${libjpegioslib} DESTINATION ${CMAKE_INSTALL_FULL_LIBDIR})
install(DIRECTORY openssl-ios/include/openssl DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR})
install(FILES ${opensslioslib} DESTINATION ${CMAKE_INSTALL_FULL_LIBDIR})
