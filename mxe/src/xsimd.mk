# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := xsimd
$(PKG)_WEBSITE  := xsimd.readthedocs.io 
$(PKG)_DESCR    := C++ wrappers for SIMD intrinsics and parallelized, optimized mathematical functions (SSE, AVX, AVX512, NEON, SVE))
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 12.1.1
$(PKG)_CHECKSUM := 73f94a051278ef3da4533b691d31244d12074d5d71107473a9fd8d7be15f0110
$(PKG)_GH_CONF  := xtensor-stack/xsimd/tags
$(PKG)_DEPS     := cc

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install

    # # compile test
    # '$(TARGET)-g++' \
    #     -W -Wall -Werror -std=c++11 \
    #     '$(TEST_FILE)' -o '$(PREFIX)/$(TARGET)/bin/test-$(PKG).exe' \
    #     `'$(TARGET)-pkg-config' $(PKG) --keep-system-cflags --cflags `
endef
