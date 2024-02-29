# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := aws-c-s3
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := aws-c-s3
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.5.0
$(PKG)_CHECKSUM := 8289b2c560ebf49fe9b3d163ebcd284a2083976637d9aa9f8d5e59e0d19836fb
$(PKG)_GH_CONF  := awslabs/aws-c-s3/tags,v
$(PKG)_DEPS     := cc aws-c-auth aws-checksums aws-c-http

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DBUILD_SHARED_LIBS='$(CMAKE_SHARED_BOOL)' \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install


endef
