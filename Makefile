# Default installation prefix
PREFIX=/usr/local

# System's libraries directory (where binary libraries are installed)
LUA_LIBDIR= $(PREFIX)/lib/lua/5.1

# Lua includes directory
LUA_INC= $(PREFIX)/include

# OS dependent
LIB_OPTION= -shared #for Linux
#LIB_OPTION= -bundle -undefined dynamic_lookup #for MacOS X

T= int64

# Compilation directives
WARN= -g -Wall -fPIC
INCS= -I$(LUA_INC)
CFLAGS= $(WARN) $(INCS)
CC= gcc

SRCS= src/$T.c

src/lfs.so: $(OBJS)
	$(CC) $(CFLAGS) $(LIB_OPTION) -o src/int64.so $(SRCS)

install:
	mkdir -p $(LUA_LIBDIR)
	cp src/int64.so $(LUA_LIBDIR)

clean:
	rm -f src/int64.so
