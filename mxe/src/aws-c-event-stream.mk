# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := aws-c-event-stream
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := aws-c-event-stream
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.4.1
$(PKG)_CHECKSUM := f8915fba57c86148f8df4c303ca6f31de6c23375de554ba8d6f9aef2a980e93e
$(PKG)_GH_CONF  := awslabs/aws-c-event-stream/tags,v
$(PKG)_DEPS     := cc aws-c-common aws-checksums aws-c-io

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DBUILD_SHARED_LIBS='$(CMAKE_SHARED_BOOL)' \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install


endef
