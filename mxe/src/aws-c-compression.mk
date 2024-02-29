# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := aws-c-compression
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := aws-c-compression
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.2.17
$(PKG)_CHECKSUM := 703d1671e395ea26f8b0b70d678ed471421685a89e127f8aa125e2b2ecedb0e0
$(PKG)_GH_CONF  := awslabs/aws-c-compression/tags,v
$(PKG)_DEPS     := cc aws-c-common

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DBUILD_SHARED_LIBS='$(CMAKE_SHARED_BOOL)' \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install


endef
