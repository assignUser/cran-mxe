# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := aws-c-io
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := aws-c-io
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.14.3
$(PKG)_CHECKSUM := 48399610981f4be0a54136674085f43c697a21f65c7523441ff56aeea0ad5a78
$(PKG)_GH_CONF  := awslabs/aws-c-io/tags,v
$(PKG)_DEPS     := cc aws-c-cal aws-c-common

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DCMAKE_SHARED_LINKER_FLAGS=-Wl,--no-undefined \
        -DBUILD_SHARED_LIBS='$(CMAKE_SHARED_BOOL)' \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    mv '$(BUILD_DIR)/compile_commands.json' '$(PREFIX)/../compile_commands-aws-c-io.json'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install


endef
