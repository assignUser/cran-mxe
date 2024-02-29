# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := aws-c-common
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := aws-c-common
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.9.12
$(PKG)_CHECKSUM := 10ef8f5629fb6ac24aa4893f3bb9a8480997e96a58c81043e019bf6b149f4332
$(PKG)_GH_CONF  := awslabs/aws-c-common/tags,v
$(PKG)_DEPS     := cc

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DBUILD_SHARED_LIBS='$(CMAKE_SHARED_BOOL)' \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install


endef
