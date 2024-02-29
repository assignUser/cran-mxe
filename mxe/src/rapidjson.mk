# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := rapidjson
$(PKG)_WEBSITE  := rapidjson.org
$(PKG)_DESCR    := A fast JSON parser/generator for C++ with both SAX/DOM style API
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 6089180
$(PKG)_CHECKSUM := b7fd19d66a586acdde9fb2bbf34405d717b39cd8bdb372d66fe889c12fe3788e
$(PKG)_GH_CONF  := Tencent/rapidjson/branches/master
$(PKG)_DEPS     := cc

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DRAPIDJSON_BUILD_DOC=OFF \
        -DRAPIDJSON_BUILD_EXAMPLES=OFF \
        -DRAPIDJSON_BUILD_TESTS=OFF \
        -DRAPIDJSON_ENABLE_INSTRUMENTATION_OP=OFF \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install

    # # compile test
    # '$(TARGET)-gcc' \
    #     -W -Wall -Werror -ansi -pedantic \
    #     '$(TEST_FILE)' -o '$(PREFIX)/$(TARGET)/bin/test-$(PKG).exe' \
    #     `'$(TARGET)-pkg-config' $(PKG) --cflags --libs`
endef
