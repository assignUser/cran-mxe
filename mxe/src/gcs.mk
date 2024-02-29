# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := gcs
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := gcs
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.20.0
$(PKG)_CHECKSUM := 0f42208ca782249555aac06455b1669c17dfb31d6d8fa4baad29a90f295666bb
$(PKG)_GH_CONF  := googleapis/google-cloud-cpp/tags,v
$(PKG)_DEPS     := cc abseil-cpp curl openssl protobuf crc32c nlohmann-json grpc

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && CXXFLAGS=-DCURL_STATICLIB $(TARGET)-cmake \
        -DBUILD_TESTING=OFF \
        -DGOOGLE_CLOUD_CPP_ENABLE=storage \
        -DGOOGLE_CLOUD_CPP_ENABLE_WERROR=OFF \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install


endef
