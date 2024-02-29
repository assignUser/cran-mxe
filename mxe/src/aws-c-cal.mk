# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := aws-c-cal
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := aws-c-cal
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.6.9
$(PKG)_CHECKSUM := 46defd807034ca9d873cc1459bc60f0bb4662029f7120db1af464421907fb480
$(PKG)_GH_CONF  := awslabs/aws-c-cal/tags,v
$(PKG)_DEPS     := cc aws-c-common

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DBUILD_SHARED_LIBS='$(CMAKE_SHARED_BOOL)' \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install


endef
