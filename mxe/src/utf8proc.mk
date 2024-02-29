# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := utf8proc
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := A clean C library for processing UTF-8 Unicode data
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.9.0
$(PKG)_FILE     := utf8proc-$($(PKG)_VERSION).tar.gz
$(PKG)_SUBDIR   := utf8proc-$($(PKG)_VERSION)
$(PKG)_URL      := https://github.com/JuliaStrings/utf8proc/releases/download/v$($(PKG)_VERSION)/utf8proc-$($(PKG)_VERSION).tar.gz
$(PKG)_CHECKSUM := bd215d04313b5bc42c1abedbcb0a6574667e31acee1085543a232204e36384c4
$(PKG)_DEPS     := cc

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install

    #
    # # compile test
    # '$(TARGET)-gcc' \
    #     -W -Wall -Werror -ansi -pedantic \
    #     '$(TEST_FILE)' -o '$(PREFIX)/$(TARGET)/bin/test-$(PKG).exe' \
    #     `'$(TARGET)-pkg-config' $(PKG) --cflags --libs`
endef
