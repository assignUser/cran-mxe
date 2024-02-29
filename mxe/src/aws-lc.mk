# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := aws-lc
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := aws-lc
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.21.0
$(PKG)_CHECKSUM := 69d4b18f335d0eb3addd16299956af6f7d2913facf10d3d783b845b5459b0771
$(PKG)_GH_CONF  := awslabs/aws-lc/tags,v
$(PKG)_DEPS     := cc

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install


endef
