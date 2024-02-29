# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := snappy
$(PKG)_WEBSITE  := github.com/google/snappy
$(PKG)_DESCR    := A fast compressor/decompressor
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.1.10
$(PKG)_CHECKSUM := 49d831bffcc5f3d01482340fe5af59852ca2fe76c3e05df0e67203ebbe0f1d90
$(PKG)_GH_CONF  := google/snappy/releases/latest
$(PKG)_DEPS     := cc

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DSNAPPY_BUILD_TESTS=OFF \
        -DSNAPPY_BUILD_BENCHMARKS=OFF \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install

    # create pkg-config file
    $(INSTALL) -d '$(PREFIX)/$(TARGET)/lib/pkgconfig'
    (echo 'Name: $(PKG)'; \
     echo 'Version: $($(PKG)_VERSION)'; \
     echo 'Description: $($(PKG)_DESCR)'; \
     echo 'Requires:'; \
     echo 'Libs: -lsnappy'; \
     echo 'Cflags.private:';) \
     > '$(PREFIX)/$(TARGET)/lib/pkgconfig/$(PKG).pc'

    # # compile test
    # '$(TARGET)-g++' \
    #     -W -Wall -Werror -ansi -pedantic \
    #     '$(TEST_FILE)' -o '$(PREFIX)/$(TARGET)/bin/test-$(PKG).exe' \
    #     `'$(TARGET)-pkg-config' $(PKG) --cflags --libs`
endef
