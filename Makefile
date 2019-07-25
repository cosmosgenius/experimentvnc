TARGET:=experimentvnc
CC:=$(shell xcrun --sdk iphoneos -f clang)
SYSROOT:=$(shell xcrun --sdk iphoneos --show-sdk-path)
CFLAGS:=-Ivnc/build/include -isysroot ${SYSROOT} -arch arm64 -miphoneos-version-min=10.0
LDFLAGS:= \
	-isysroot ${SYSROOT} -arch arm64 -miphoneos-version-min=10.0 \
	-Lvnc/build/lib -lvncserver -lpng -llzo2 -ljpeg -lssl -lcrypto \
	-lz

OBJS += \
	main.o

SRC += \
	main.c

$(TARGET): $(OBJS)
	$(CC) ${LDFLAGS} -o $@ $^

$(SRCS:.c=.d):%.d:%.c
	$(CC) $(CFLAGS) -MM $< >$@

include $(SRCS:.c=.d)

.PHONY: clean
clean:
	-${RM} ${TARGET} ${OBJS} $(LIBVNCSERVER_SRC_FILES:.c=.d) $(LIBVNCSERVER_SRC_FILES:.c=.o)

