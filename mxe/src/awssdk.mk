# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := awssdk
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := AWS SDK for C++
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.11.255
$(PKG)_CHECKSUM := 6911f6be6159c622852375fcd30936a879db0c6fbd5d2d956c1b2d1892fdf387
$(PKG)_GH_CONF  := aws/aws-sdk-cpp/tags
$(PKG)_DEPS     := cc openssl curl aws-crt-cpp

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DBUILD_DEPS=OFF \
        -DCMAKE_INSTALL_PREFIX='$(PREFIX)/$(TARGET)' \
        -DCMAKE_MODULE_PATH='$(PREFIX)/$(TARGET)'/lib/cmake \
        -DCMAKE_PREFIX_PATH='$(PREFIX)/$(TARGET)' \
        -DBUILD_SHARED_LIBS=OFF \
        -DAWS_SDK_WARNINGS_ARE_ERRORS=OFF \
        -DBUILD_ONLY='config;identity-management;s3;sts;transfer' \
        -DENABLE_TESTING=OFF \
        -DLEGACY_BUILD=ON \
        -DMINIMIZE_SIZE=ON \
        -DSIMPLE_INSTALL=ON \
        -DCPP_STANDARD=17 \
        -DTARGET_ARCH=WINDOWS \
        -Dcrypto_INCLUDE_DIR='$(PREFIX)/include' \
        -Dcrypto_LIBRARY='$(PREFIX)/lib/libcrypto.a' \
        '$(SOURCE_DIR)'
    $(MAKE) VERBOSE=1 -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install


endef

# -DCMAKE_INSTALL_PREFIX='$(PREFIX)' \

        # -DCMAKE_INSTALL_LIBDIR='$(PREFIX)'/lib \
        # -DCMAKE_INSTALL_INCLUDEDIR='$(PREFIX)'/include \

