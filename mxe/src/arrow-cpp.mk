# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := arrow-cpp
$(PKG)_WEBSITE  := arrow.apache.org
$(PKG)_DESCR    := arrow-cpp
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 15.0.0
$(PKG)_CHECKSUM := 01dd3f70e85d9b5b933ec92c0db8a4ef504a5105f78d2d8622e84279fb45c25d
$(PKG)_SUBDIR   := apache-arrow-$($(PKG)_VERSION)/cpp
$(PKG)_FILE     := apache-arrow-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://dlcdn.apache.org/arrow/arrow-$($(PKG)_VERSION)/apache-arrow-$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := cc abseil-cpp boost lz4 zlib zstd brotli bzip2 xsimd re2 snappy rapidjson thrift-cpp utf8proc grpc nlohmann-json gcs mimalloc awssdk

define $(PKG)_UPDATE
    $(call GET_LATEST_VERSION, https://dlcdn.apache.org/arrow/arrow-15.0.0)
endef
# $(call GET_LATEST_VERSION, base url[, prefix, ext, filter, separator])
#  base url : required page returning list of versions
#               e.g https://ftp.gnu.org/gnu/libfoo
#  prefix   : segment before version
#               defaults to lastword of url with dash i.e. `libfoo-`
#  ext      : segment ending version - default `\.tar`
#  filter   : `grep -i` filter-out pattern - default alpha\|beta\|rc
#  separator: transform char to `.` - typically `_`

# test with make check-update-package-arrow-cpp and delete comments

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && ARROW_MIMALLOC_URL=/mxe/mxe/mimalloc-2.0.6 $(TARGET)-cmake \
        -DARROW_DEPENDENCY_SOURCE='SYSTEM' \
        -DARROW_DEPENDENCY_USE_SHARED=OFF \
        -DARROW_POSITION_INDEPENDENT_CODE=ON \
        -DARROW_BUILD_TESTS=OFF \
        -DARROW_BUILD_SHARED=OFF \
        -DARROW_BUILD_STATIC=ON \
        -DARROW_ACERO=ON \
        -DARROW_COMPUTE=ON \
        -DARROW_CSV=ON \
        -DARROW_DATASET=ON \
        -DARROW_FILESYSTEM=ON \
        -DARROW_GCS=ON \
        -DARROW_HDFS=OFF \
        -DARROW_JEMALLOC=OFF \
        -DARROW_JSON=ON \
        -DARROW_MIMALLOC=ON \
        -DARROW_PARQUET=ON \
        -DARROW_S3=ON \
        -DARROW_USE_GLOG=OFF \
        -DARROW_WITH_LZ4=ON \
        -DARROW_LZ4_USE_SHARED=OFF \
        -DARROW_WITH_RE2=ON \
        -DARROW_WITH_SNAPPY=ON \
        -DARROW_WITH_ZLIB=ON \
        -DARROW_WITH_ZSTD=ON \
        -DARROW_ZSTD_USE_SHARED=OFF \
        -DARROW_WITH_BROTLI=ON \
        -DARROW_WITH_BZ2=ON \
        -DCMAKE_UNITY_BUILD=OFF \
        -DARROW_UTF8PROC_USE_SHARED=OFF \
        -Dutf8proc_ROOT=$(PREFIX)/$(TARGET) \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install

#     # compile test
#     '$(TARGET)-g++' \
#         -W -Wall -Werror -ansi -pedantic \
#         '$(TEST_FILE)' -o '$(PREFIX)/$(TARGET)/bin/test-$(PKG).exe' \
#         `'$(TARGET)-pkg-config' $(PKG) --cflags --libs`
endef
