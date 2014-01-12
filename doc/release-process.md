Release Process
====================

* update translations (ping wumpus, Diapolo or tcatm on IRC)
* see https://github.com/storecoin/storecoin/blob/master/doc/translation_process.md#syncing-with-transifex

* * *

###update (commit) version in sources


	storecoin-qt.pro
	contrib/verifysfbinaries/verify.sh
	doc/README*
	share/setup.nsi
	src/clientversion.h (change CLIENT_VERSION_IS_RELEASE to true)

###tag version in git

	git tag -s v(new version, e.g. 0.8.0)

###write release notes. git shortlog helps a lot, for example:

	git shortlog --no-merges v(current version, e.g. 0.7.2)..v(new version, e.g. 0.8.0)

* * *

##perform gitian builds

 From a directory containing the storecoin source, gitian-builder and gitian.sigs
  
	export SIGNER=(your gitian key, ie bluematt, sipa, etc)
	export VERSION=(new version, e.g. 0.8.0)
	pushd ./storecoin
	git checkout v${VERSION}
	popd
	pushd ./gitian-builder

 Fetch and build inputs: (first time, or when dependency versions change)

	mkdir -p inputs; cd inputs/
	wget 'http://miniupnp.free.fr/files/download.php?file=miniupnpc-1.6.tar.gz' -O miniupnpc-1.6.tar.gz
	wget 'https://www.openssl.org/source/openssl-1.0.1c.tar.gz'
	wget 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
	wget 'ftp://ftp.simplesystems.org/pub/libpng/png/src/history/zlib/zlib-1.2.6.tar.gz'
	wget 'ftp://ftp.simplesystems.org/pub/libpng/png/src/history/libpng15/libpng-1.5.9.tar.gz'
	wget 'https://fukuchi.org/works/qrencode/qrencode-3.2.0.tar.bz2'
	wget 'https://downloads.sourceforge.net/project/boost/boost/1.54.0/boost_1_54_0.tar.bz2'
	wget 'https://svn.boost.org/trac/boost/raw-attachment/ticket/7262/boost-mingw.patch' -O \ 
	     boost-mingw-gas-cross-compile-2013-03-03.patch
	wget 'https://download.qt-project.org/archive/qt/4.8/4.8.3/qt-everywhere-opensource-src-4.8.3.tar.gz'
	wget 'https://protobuf.googlecode.com/files/protobuf-2.5.0.tar.bz2'
	cd ..
	./bin/gbuild ../storecoin/contrib/gitian-descriptors/boost-win32.yml
	mv build/out/boost-win32-*.zip inputs/
	./bin/gbuild ../storecoin/contrib/gitian-descriptors/deps-win32.yml
	mv build/out/storecoin-deps-*.zip inputs/
	./bin/gbuild ../storecoin/contrib/gitian-descriptors/qt-win32.yml
	mv build/out/qt-win32-*.zip inputs/
	./bin/gbuild ../storecoin/contrib/gitian-descriptors/protobuf-win32.yml
	mv build/out/protobuf-win32-*.zip inputs/

 Build storecoind and storecoin-qt on Linux32, Linux64, and Win32:
  
	./bin/gbuild --commit storecoin=v${VERSION} ../storecoin/contrib/gitian-descriptors/gitian.yml
	./bin/gsign --signer $SIGNER --release ${VERSION} --destination ../gitian.sigs/ ../storecoin/contrib/gitian-descriptors/gitian.yml
	pushd build/out
	zip -r storecoin-${VERSION}-linux-gitian.zip *
	mv storecoin-${VERSION}-linux-gitian.zip ../../../
	popd
	./bin/gbuild --commit storecoin=v${VERSION} ../storecoin/contrib/gitian-descriptors/gitian-win32.yml
	./bin/gsign --signer $SIGNER --release ${VERSION}-win32 --destination ../gitian.sigs/ ../storecoin/contrib/gitian-descriptors/gitian-win32.yml
	pushd build/out
	zip -r storecoin-${VERSION}-win32-gitian.zip *
	mv storecoin-${VERSION}-win32-gitian.zip ../../../
	popd
	popd

  Build output expected:

  1. linux 32-bit and 64-bit binaries + source (storecoin-${VERSION}-linux-gitian.zip)
  2. windows 32-bit binary, installer + source (storecoin-${VERSION}-win32-gitian.zip)
  3. Gitian signatures (in gitian.sigs/${VERSION}[-win32]/(your gitian key)/

repackage gitian builds for release as stand-alone zip/tar/installer exe

**Linux .tar.gz:**

	unzip storecoin-${VERSION}-linux-gitian.zip -d storecoin-${VERSION}-linux
	tar czvf storecoin-${VERSION}-linux.tar.gz storecoin-${VERSION}-linux
	rm -rf storecoin-${VERSION}-linux

**Windows .zip and setup.exe:**

	unzip storecoin-${VERSION}-win32-gitian.zip -d storecoin-${VERSION}-win32
	mv storecoin-${VERSION}-win32/storecoin-*-setup.exe .
	zip -r storecoin-${VERSION}-win32.zip storecoin-${VERSION}-win32
	rm -rf storecoin-${VERSION}-win32

**Perform Mac build:**

  OSX binaries are created by Gavin Andresen on a 32-bit, OSX 10.6 machine.

	qmake RELEASE=1 USE_UPNP=1 USE_QRCODE=1 storecoin-qt.pro
	make
	export QTDIR=/opt/local/share/qt4  # needed to find translations/qt_*.qm files
	T=$(contrib/qt_translations.py $QTDIR/translations src/qt/locale)
	python2.7 share/qt/clean_mac_info_plist.py
	python2.7 contrib/macdeploy/macdeployqtplus Storecoin-Qt.app -add-qt-tr $T -dmg -fancy contrib/macdeploy/fancy.plist

 Build output expected: Storecoin-Qt.dmg

###Next steps:

* Code-sign Windows -setup.exe (in a Windows virtual machine) and
  OSX Storecoin-Qt.app (Note: only Gavin has the code-signing keys currently)

* upload builds to SourceForge

* create SHA256SUMS for builds, and PGP-sign it

* update storecoin.org version
  make sure all OS download links go to the right versions
  
* update download sizes on storecoin.org/_templates/download.html

* update forum version

* update wiki download links

* update wiki changelog: [https://en.storecoin.it/wiki/Changelog](https://en.storecoin.it/wiki/Changelog)

Commit your signature to gitian.sigs:

	pushd gitian.sigs
	git add ${VERSION}/${SIGNER}
	git add ${VERSION}-win32/${SIGNER}
	git commit -a
	git push  # Assuming you can push to the gitian.sigs tree
	popd

-------------------------------------------------------------------------

### After 3 or more people have gitian-built, repackage gitian-signed zips:

From a directory containing storecoin source, gitian.sigs and gitian zips

	export VERSION=(new version, e.g. 0.8.0)
	mkdir storecoin-${VERSION}-linux-gitian
	pushd storecoin-${VERSION}-linux-gitian
	unzip ../storecoin-${VERSION}-linux-gitian.zip
	mkdir gitian
	cp ../storecoin/contrib/gitian-downloader/*.pgp ./gitian/
	for signer in $(ls ../gitian.sigs/${VERSION}/); do
	 cp ../gitian.sigs/${VERSION}/${signer}/storecoin-build.assert ./gitian/${signer}-build.assert
	 cp ../gitian.sigs/${VERSION}/${signer}/storecoin-build.assert.sig ./gitian/${signer}-build.assert.sig
	done
	zip -r storecoin-${VERSION}-linux-gitian.zip *
	cp storecoin-${VERSION}-linux-gitian.zip ../
	popd
	mkdir storecoin-${VERSION}-win32-gitian
	pushd storecoin-${VERSION}-win32-gitian
	unzip ../storecoin-${VERSION}-win32-gitian.zip
	mkdir gitian
	cp ../storecoin/contrib/gitian-downloader/*.pgp ./gitian/
	for signer in $(ls ../gitian.sigs/${VERSION}-win32/); do
	 cp ../gitian.sigs/${VERSION}-win32/${signer}/storecoin-build.assert ./gitian/${signer}-build.assert
	 cp ../gitian.sigs/${VERSION}-win32/${signer}/storecoin-build.assert.sig ./gitian/${signer}-build.assert.sig
	done
	zip -r storecoin-${VERSION}-win32-gitian.zip *
	cp storecoin-${VERSION}-win32-gitian.zip ../
	popd

- Upload gitian zips to SourceForge

- Announce the release:

  - Add the release to storecoin.org: https://github.com/storecoin/storecoin.org/tree/master/_releases

  - Release sticky on storecointalk: https://storecointalk.org/index.php?board=1.0

  - Storecoin-development mailing list

  - Optionally reddit /r/Storecoin, ...

- Celebrate 
