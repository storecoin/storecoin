include Makefile.include

AM_CPPFLAGS += -I$(top_srcdir)/src/leveldb/helpers/memenv \
  -I$(builddir)

noinst_LIBRARIES = \
  libstorecoin_server.a \
  libstorecoin_common.a \
  libstorecoin_cli.a
if ENABLE_WALLET
noinst_LIBRARIES += libstorecoin_wallet.a
endif

bin_PROGRAMS = storecoind storecoin-cli

SUBDIRS = . $(BUILD_QT) $(BUILD_TEST)
DIST_SUBDIRS = . qt test
.PHONY: FORCE
# storecoin core #
STORECOIN_CORE_H = \
  addrman.h \
  alert.h \
  allocators.h \
  base58.h bignum.h \
  bloom.h \
  chainparams.h \
  checkpoints.h \
  checkqueue.h \
  clientversion.h \
  coincontrol.h \
  coins.h \
  compat.h \
  core.h \
  crypter.h \
  db.h \
  hash.h \
  init.h \
  key.h \
  keystore.h \
  leveldbwrapper.h \
  limitedmap.h \
  main.h \
  miner.h \
  mruset.h \
  netbase.h \
  net.h \
  noui.h \
  protocol.h \
  rpcclient.h \
  rpcprotocol.h \
  rpcserver.h \
  script.h \
  serialize.h \
  sync.h \
  threadsafety.h \
  txdb.h \
  txmempool.h \
  ui_interface.h \
  uint256.h \
  util.h \
  version.h \
  walletdb.h \
  wallet.h

JSON_H = \
  json/json_spirit.h \
  json/json_spirit_error_position.h \
  json/json_spirit_reader.h \
  json/json_spirit_reader_template.h \
  json/json_spirit_stream_reader.h \
  json/json_spirit_utils.h \
  json/json_spirit_value.h \
  json/json_spirit_writer.h \
  json/json_spirit_writer_template.h

obj/build.h: FORCE
	@$(MKDIR_P) $(abs_top_builddir)/src/obj
	@$(top_srcdir)/share/genbuild.sh $(abs_top_builddir)/src/obj/build.h \
	  $(abs_top_srcdir)
version.o: obj/build.h

libstorecoin_server_a_SOURCES = \
  addrman.cpp \
  alert.cpp \
  rpcserver.cpp \
  bloom.cpp \
  chainparams.cpp \
  checkpoints.cpp \
  coins.cpp \
  init.cpp \
  keystore.cpp \
  leveldbwrapper.cpp \
  main.cpp \
  miner.cpp \
  net.cpp \
  noui.cpp \
  rpcblockchain.cpp \
  rpcmining.cpp \
  rpcmisc.cpp \
  rpcnet.cpp \
  rpcrawtransaction.cpp \
  txdb.cpp \
  txmempool.cpp \
  $(JSON_H) \
  $(STORECOIN_CORE_H)

libstorecoin_wallet_a_SOURCES = \
  db.cpp \
  crypter.cpp \
  rpcdump.cpp \
  rpcwallet.cpp \
  wallet.cpp \
  walletdb.cpp \
  $(STORECOIN_CORE_H)

libstorecoin_common_a_SOURCES = \
  allocators.cpp \
  chainparams.cpp \
  core.cpp \
  hash.cpp \
  key.cpp \
  netbase.cpp \
  protocol.cpp \
  rpcprotocol.cpp \
  script.cpp \
  sync.cpp \
  util.cpp \
  version.cpp \
  $(STORECOIN_CORE_H)

libstorecoin_cli_a_SOURCES = \
  rpcclient.cpp \
  $(STORECOIN_CORE_H)

nodist_libstorecoin_common_a_SOURCES = $(top_srcdir)/src/obj/build.h
#

# storecoind binary #
storecoind_LDADD = \
  libstorecoin_server.a \
  libstorecoin_cli.a \
  libstorecoin_common.a \
  leveldb/libleveldb.a \
  leveldb/libmemenv.a
if ENABLE_WALLET
storecoind_LDADD += libstorecoin_wallet.a
endif
storecoind_SOURCES = storecoind.cpp
#

if TARGET_WINDOWS
storecoind_SOURCES += storecoind-res.rc
endif

AM_CPPFLAGS += $(BDB_CPPFLAGS)
storecoind_LDADD += $(BOOST_LIBS) $(BDB_LIBS)

# storecoin-cli binary #
storecoin_cli_LDADD = \
  libstorecoin_cli.a \
  libstorecoin_common.a \
  $(BOOST_LIBS)
storecoin_cli_SOURCES = storecoin-cli.cpp
#

if TARGET_WINDOWS
storecoin_cli_SOURCES += storecoin-cli-res.rc
endif

leveldb/libleveldb.a: leveldb/libmemenv.a

leveldb/%.a:
	@echo "Building LevelDB ..." && $(MAKE) -C $(@D) $(@F) CXX="$(CXX)" \
	  CC="$(CC)" PLATFORM=$(TARGET_OS) AR="$(AR)" $(LEVELDB_TARGET_FLAGS) \
	  OPT="$(CXXFLAGS) $(CPPFLAGS)"

qt/storecoinstrings.cpp: $(libstorecoin_server_a_SOURCES) $(libstorecoin_common_a_SOURCES) $(libstorecoin_cli_a_SOURCES)
	@test -n $(XGETTEXT) || echo "xgettext is required for updating translations"
	@cd $(top_srcdir); XGETTEXT=$(XGETTEXT) share/qt/extract_strings_qt.py

CLEANFILES = leveldb/libleveldb.a leveldb/libmemenv.a *.gcda *.gcno

DISTCLEANFILES = obj/build.h

EXTRA_DIST = leveldb Makefile.include

clean-local:
	-$(MAKE) -C leveldb clean
	rm -f leveldb/*/*.gcno leveldb/helpers/memenv/*.gcno
