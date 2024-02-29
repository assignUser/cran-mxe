# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := aws-c-mqtt
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := aws-c-mqtt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.10.1
$(PKG)_CHECKSUM := 63c402b8b81b107e5c1b9b6ae0065bc025b6ad4347518bf30fbd958f999e037e
$(PKG)_GH_CONF  := awslabs/aws-c-mqtt/tags,v
$(PKG)_DEPS     := cc aws-c-http

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DBUILD_SHARED_LIBS='$(CMAKE_SHARED_BOOL)' \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install


endef
