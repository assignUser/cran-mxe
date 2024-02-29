# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := mimalloc
$(PKG)_WEBSITE  := github.com
$(PKG)_DESCR    := mimalloc is a compact general purpose allocator with excellent performance
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.1.2
$(PKG)_CHECKSUM := 2b1bff6f717f9725c70bf8d79e4786da13de8a270059e4ba0bdd262ae7be46eb
$(PKG)_GH_CONF  := microsoft/mimalloc/tags,v
$(PKG)_DEPS     := cc

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake \
         -DMI_INSTALL_TOPLEVEL=ON \
         -DMI_OVERRIDE=OFF \
         -DMI_LOCAL_DYNAMIC_TLS=ON \
         -DMI_BUILD_OBJECT=OFF \
         -DMI_BUILD_SHARED='$(CMAKE_SHARED_BOOL)' \
         -DMI_BUILD_TESTS=OFF \
        '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install


endef

