# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := aws-c-sdkutils
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := aws-c-sdkutils
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.1.14
$(PKG)_CHECKSUM := 5acb6dd916511a3dff14faea43385d117d755f4ad4a9c52314cc74e427398f37
$(PKG)_GH_CONF  := awslabs/aws-c-sdkutils/tags,v
$(PKG)_DEPS     := cc aws-c-common

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DBUILD_SHARED_LIBS='$(CMAKE_SHARED_BOOL)' \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install


endef
