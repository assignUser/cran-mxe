# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := crc32c
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := CRC32C implementation with support for CPU-specific acceleration instructions
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.1.2
$(PKG)_SUBDIR   := crc32c-$($(PKG)_VERSION)
$(PKG)_CHECKSUM := ac07840513072b7fcebda6e821068aa04889018f24e10e46181068fb214d7e56
$(PKG)_GH_CONF  := google/crc32c/tags
$(PKG)_DEPS     := cc

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DCRC32C_BUILD_TESTS=OFF \
        -DCRC32C_BUILD_BENCHMARKS=OFF \
        -DCRC32C_USE_GLOG=OFF \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install

    # create pkg-config file
    $(INSTALL) -d '$(PREFIX)/$(TARGET)/lib/pkgconfig'
    (echo 'Name: $(PKG)'; \
     echo 'Version: $($(PKG)_VERSION)'; \
     echo 'Description: $($(PKG)_DESCR)'; \
     echo 'Requires:'; \
     echo 'Libs: -lcrc32c'; \
     echo 'Cflags.private:';) \
     > '$(PREFIX)/$(TARGET)/lib/pkgconfig/$(PKG).pc'

    # compile test
    # '$(TARGET)-gcc' \
    #     -W -Wall -Werror -ansi -pedantic \
    #     '$(TEST_FILE)' -o '$(PREFIX)/$(TARGET)/bin/test-$(PKG).exe' \
    #     `'$(TARGET)-pkg-config' $(PKG) --cflags --libs`
endef
