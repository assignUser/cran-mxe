# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := aws-c-auth
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := aws-c-auth
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.7.14
$(PKG)_CHECKSUM := 93d622cd3cb434b4edcaa48bf278f8bd12fbc4ae18893b07f5b94f8ae93e0bdb
$(PKG)_GH_CONF  := awslabs/aws-c-auth/tags,v
$(PKG)_DEPS     := cc aws-c-cal aws-c-common aws-c-http aws-c-io aws-c-sdkutils

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_SHARED_LIBS='$(CMAKE_SHARED_BOOL)' \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install


endef
