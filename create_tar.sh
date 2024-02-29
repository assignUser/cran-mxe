#! /bin/bash
cd $MXE_PREFIX
MXETARGET="x86_64-w64-mingw32.static.posix"

find ${MXETARGET} -printf "%k %p\n" | sort -n | sed -e 's/^[0-9]\+ //g' | \
    tar --exclude="*-tests" --exclude="test*.exe" --exclude="*gdal*.exe" \
      --exclude="*rtmp*.exe" --exclude="*gnutls*.exe" --exclude="hb-*.exe" \
      --exclude="ogr*.exe" --exclude="certtool.exe" --exclude="gnmmanage.exe" \
      --exclude="nearblack.exe" \
      --exclude="projsync.exe" --exclude="projinfo.exe" --exclude="gie.exe" \
      --exclude="cs2cs.exe" --exclude="cct.exe" --exclude="invproj.exe" \
      --exclude="proj.exe" --exclude="geod.exe" --exclude="invgeod.exe" \
      --exclude="gnmanalyse.exe" --exclude="curl.exe" \
      --exclude="h5*.exe" \
      --exclude="ffmpeg.exe" --exclude="ffprobe.exe" --exclude="ffplay.exe" \
      --exclude="rdfproc.exe" \
      --exclude="play.exe" --exclude="rec.exe" --exclude="sox.exe" --exclude="soxi.exe" \
      --exclude="openssl.exe" --exclude="brotli.exe" --exclude="mirror_server.exe" \
      --exclude="mirror_server_stop.exe" --exclude="sozip.exe" \
      --create --dereference --no-recursion --files-from - --file /mxe/arrow_win.tar
