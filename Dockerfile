FROM ubuntu:22.04

RUN echo "Europe/Prague" > /etc/timezone
RUN apt-get update
RUN env DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
# from MXE documentation
RUN apt-get install -y \
	autoconf \
	automake \
	autopoint \
	bash \
	bison \
	bzip2 \
	flex \
	g++ \
	g++-multilib \
	gettext \
	git \
	gperf \
	intltool \
	libc6-dev-i386 \
	libgdk-pixbuf2.0-dev \
	libltdl-dev \
	libgl-dev \
	libpcre3-dev \
	libssl-dev \
	libtool-bin \
	libxml-parser-perl \
	lzip \
	make \
	openssl \
	p7zip-full \
	patch \
	perl \
	python3 \
	python3-distutils \
	python3-mako \
	python3-pkg-resources \
	python3-setuptools \
	python2 \
	python-is-python3 \
	ruby \
	sed \
	unzip \
	wget \
	xz-utils

# texinfo for binutils
# sqlite3 for proj
RUN apt-get install -y texinfo sqlite3 zstd 

# for gnutls
RUN apt-get install -y gtk-doc-tools

# for qt6-qtbase
RUN apt-get install -y libopengl-dev libglu1-mesa-dev

# for dbus
RUN apt-get install -y autoconf-archive

ENV MXE_PREFIX=/usr/lib/mxe/usr
RUN mkdir -p $MXE_PREFIX 

RUN echo 'alias mxe="make MXE_PREFIX=${MXE_PREFIX} R_TOOLCHAIN_TYPE=base"' >> ~/.bashrc
ENV PATH="$PATH:$MXE_PREFIX/bin"
ENV CCACHE_DIR=/mxe/.ccache

