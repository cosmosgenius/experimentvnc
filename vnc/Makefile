SNAME:=build/libvncserver.a
CFLAGS:= -I. -Ilibvncserver -Icommon -Iopenssl/include -Ilibpng/include -Ilzo/include -DLIBVNCSERVER_HAVE_LZO -DLIBVNCSERVER_HAVE_LIBJPEG -DLIBVNCSERVER_HAVE_LIBPNG -DLIBVNCSERVER_WITH_WEBSOCKETS
LDFLAGS:=

LIBVNCSERVER_DIR:=./libvncserver
COMMON_DIR:=./common

LIBVNCSERVER_SRC_FILES:= \
    $(LIBVNCSERVER_DIR)/main.c \
    $(LIBVNCSERVER_DIR)/rfbserver.c \
    $(LIBVNCSERVER_DIR)/rfbregion.c \
    $(LIBVNCSERVER_DIR)/auth.c \
    $(LIBVNCSERVER_DIR)/sockets.c \
    $(LIBVNCSERVER_DIR)/stats.c \
    $(LIBVNCSERVER_DIR)/corre.c \
    $(LIBVNCSERVER_DIR)/hextile.c \
    $(LIBVNCSERVER_DIR)/rre.c \
    $(LIBVNCSERVER_DIR)/translate.c \
    $(LIBVNCSERVER_DIR)/cutpaste.c \
    $(LIBVNCSERVER_DIR)/httpd.c \
    $(LIBVNCSERVER_DIR)/cursor.c \
    $(LIBVNCSERVER_DIR)/font.c \
    $(LIBVNCSERVER_DIR)/draw.c \
    $(LIBVNCSERVER_DIR)/selbox.c \
    $(COMMON_DIR)/d3des.c \
    $(COMMON_DIR)/vncauth.c \
    $(LIBVNCSERVER_DIR)/cargs.c \
    $(LIBVNCSERVER_DIR)/ultra.c \
    $(LIBVNCSERVER_DIR)/scale.c \
	$(LIBVNCSERVER_DIR)/rfbssl_openssl.c \
	$(LIBVNCSERVER_DIR)/zlib.c \
    $(LIBVNCSERVER_DIR)/zrle.c \
    $(LIBVNCSERVER_DIR)/zrleoutstream.c \
    $(LIBVNCSERVER_DIR)/zrlepalettehelper.c \
	$(LIBVNCSERVER_DIR)/tight.c \
	$(COMMON_DIR)/turbojpeg.c \
    $(LIBVNCSERVER_DIR)/websockets.c \
    $(LIBVNCSERVER_DIR)/ws_decode.c \
    $(COMMON_DIR)/base64.c \
	$(COMMON_DIR)/rfbcrypto_included.c \
	$(COMMON_DIR)/md5.c \
	$(COMMON_DIR)/sha1.c

SRC += \
	$(LIBVNCSERVER_SRC_FILES)

OBJS += $(SRC:.c=.o)

all: $(SNAME)

$(TARGET): $(OBJS)
	$(CC) ${LDFLAGS} -o $@ $^

$(SNAME): $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

$(SRCS:.c=.d):%.d:%.c
	$(CC) $(CFLAGS) -MM $< >$@

include $(SRCS:.c=.d)

.PHONY: clean
clean:
	-${RM} ${TARGET} ${OBJS} $(LIBVNCSERVER_SRC_FILES:.c=.d) $(LIBVNCSERVER_SRC_FILES:.c=.o)
