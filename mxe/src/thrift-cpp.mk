# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := thrift-cpp
$(PKG)_WEBSITE  := dlcdn.apache.org
$(PKG)_DESCR    := thrift
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.19.0
$(PKG)_CHECKSUM := d49c896c2724a78701e05cfccf6cf70b5db312d82a17efe951b441d300ccf275
$(PKG)_SUBDIR   := thrift-$($(PKG)_VERSION)
$(PKG)_FILE     := thrift-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://dlcdn.apache.org/thrift/$($(PKG)_VERSION)/thrift-$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := cc boost zlib libevent 

define $(PKG)_UPDATE
    $(call GET_LATEST_VERSION, https://dlcdn.apache.org/thrift/0.19.0)
endef
# $(call GET_LATEST_VERSION, base url[, prefix, ext, filter, separator])
#  base url : required page returning list of versions
#               e.g https://ftp.gnu.org/gnu/libfoo
#  prefix   : segment before version
#               defaults to lastword of url with dash i.e. `libfoo-`
#  ext      : segment ending version - default `\.tar`
#  filter   : `grep -i` filter-out pattern - default alpha\|beta\|rc
#  separator: transform char to `.` - typically `_`

# test with make check-update-package-thrift and delete comments

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        -DBUILD_TESTING=OFF \
        -DBUILD_COMPILER=OFF \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_TUTORIALS=OFF \
        -DWITH_AS3=OFF \
        -DWITH_QT5=OFF \
        -DWITH_CPP=ON \
        -DWITH_C_GLIB=OFF \
        -DWITH_JAVA=OFF \
        -DWITH_JAVASCRIPT=OFF \
        -DWITH_KOTLIN=OFF \
        -DWITH_NODEJS=OFF \
        -DBUILD_NODEJS=OFF \
        -DWITH_PYTHON=OFF \
        --trace-source=CMakeLists.txt \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install

    # # compile test
    # '$(TARGET)-gcc' \
    #     -W -Wall -Werror -ansi -pedantic \
    #     '$(TEST_FILE)' -o '$(PREFIX)/$(TARGET)/bin/test-$(PKG).exe' \
    #     `'$(TARGET)-pkg-config' $(PKG) --cflags --libs`
endef
