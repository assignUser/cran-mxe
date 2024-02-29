# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := aws-crt-cpp
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := aws-crt-cpp
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.26.1
$(PKG)_CHECKSUM := ae497f66a6894aada9fa09f4bc1a8edac859614108e0bd41cc44017eeb6f8598
$(PKG)_GH_CONF  := awslabs/aws-crt-cpp/tags,v
$(PKG)_DEPS     := cc aws-c-auth aws-c-cal aws-c-common aws-c-event-stream aws-checksums aws-c-http aws-c-io aws-c-mqtt aws-c-s3

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DBUILD_DEPS=OFF \
        -DBUILD_SHARED_LIBS=OFF \
        -DBYO_CRYPTO=ON \
        -DUSE_OPENSSL=ON \
        -DBUILD_TESTING=OFF \
        -DBUILD_SHARED_LIBS='$(CMAKE_SHARED_BOOL)' \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install


endef
