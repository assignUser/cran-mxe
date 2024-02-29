# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := aws-checksums
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := aws-checksums
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.1.17
$(PKG)_CHECKSUM := 83c1fbae826631361a529e9565e64a942c412baaec6b705ae5da3f056b97b958
$(PKG)_GH_CONF  := awslabs/aws-checksums/tags,v
$(PKG)_DEPS     := cc aws-c-common

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DBUILD_SHARED_LIBS='$(CMAKE_SHARED_BOOL)' \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install


endef
