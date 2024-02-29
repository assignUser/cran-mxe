# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := aws-c-http
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := aws-c-http
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.8.0
$(PKG)_CHECKSUM := d0eae3d4b84f10c64ca4c9ba4b143745ad46532fdcac081f1cda90f1e956c98a
$(PKG)_GH_CONF  := awslabs/aws-c-http/tags,v
$(PKG)_DEPS     := cc aws-c-compression aws-c-io

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DBUILD_SHARED_LIBS='$(CMAKE_SHARED_BOOL)' \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install


endef
