# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := nlohmann-json
$(PKG)_WEBSITE  := json.nlohmann.MAKE
$(PKG)_DESCR    := JSON for Modern C++
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.11.3
$(PKG)_CHECKSUM := d6c65aca6b1ed68e7a182f4757257b107ae403032760ed6ef121c9d55e81757d
$(PKG)_FILE     := json.tar.xz
$(PKG)_SUBDIR   := json
$(PKG)_URL      := https://github.com/nlohmann/json/releases/download/v$($(PKG)_VERSION)/json.tar.xz
$(PKG)_DEPS     := cc

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DJSON_BuildTests=OFF \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install

    # compile test
    # '$(TARGET)-gcc' \
    #     -W -Wall -Werror -ansi -pedantic \
    #     '$(TEST_FILE)' -o '$(PREFIX)/$(TARGET)/bin/test-$(PKG).exe' \
    #     `'$(TARGET)-pkg-config' $(PKG) --cflags --libs`
endef
