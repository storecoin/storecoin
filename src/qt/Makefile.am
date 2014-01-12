include $(top_srcdir)/src/Makefile.include

AM_CPPFLAGS += -I$(top_srcdir)/src \
  -I$(top_builddir)/src/qt \
  -I$(top_builddir)/src/qt/forms \
  $(PROTOBUF_CFLAGS) \
  $(QR_CFLAGS)
bin_PROGRAMS = storecoin-qt
noinst_LIBRARIES = libstorecoinqt.a
SUBDIRS = $(BUILD_TEST_QT)
DIST_SUBDIRS = test

# storecoin qt core #
QT_TS = \
  locale/storecoin_ach.ts \
  locale/storecoin_af_ZA.ts \
  locale/storecoin_ar.ts \
  locale/storecoin_be_BY.ts \
  locale/storecoin_bg.ts \
  locale/storecoin_bs.ts \
  locale/storecoin_ca_ES.ts \
  locale/storecoin_ca.ts \
  locale/storecoin_cs.ts \
  locale/storecoin_cy.ts \
  locale/storecoin_da.ts \
  locale/storecoin_de_AT.ts \
  locale/storecoin_de.ts \
  locale/storecoin_el_GR.ts \
  locale/storecoin_en.ts \
  locale/storecoin_eo.ts \
  locale/storecoin_es_CL.ts \
  locale/storecoin_es_MX.ts \
  locale/storecoin_es.ts \
  locale/storecoin_et.ts \
  locale/storecoin_eu_ES.ts \
  locale/storecoin_fa_IR.ts \
  locale/storecoin_fa.ts \
  locale/storecoin_fi.ts \
  locale/storecoin_fr_CA.ts \
  locale/storecoin_fr.ts \
  locale/storecoin_gl.ts \
  locale/storecoin_gu_IN.ts \
  locale/storecoin_he.ts \
  locale/storecoin_hi_IN.ts \
  locale/storecoin_hr.ts \
  locale/storecoin_hu.ts \
  locale/storecoin_id_ID.ts \
  locale/storecoin_it.ts \
  locale/storecoin_ja.ts \
  locale/storecoin_kk_KZ.ts \
  locale/storecoin_ko_KR.ts \
  locale/storecoin_la.ts \
  locale/storecoin_lt.ts \
  locale/storecoin_lv_LV.ts \
  locale/storecoin_ms_MY.ts \
  locale/storecoin_nb.ts \
  locale/storecoin_nl.ts \
  locale/storecoin_pam.ts \
  locale/storecoin_pl.ts \
  locale/storecoin_pt_BR.ts \
  locale/storecoin_pt_PT.ts \
  locale/storecoin_ro_RO.ts \
  locale/storecoin_ru.ts \
  locale/storecoin_sk.ts \
  locale/storecoin_sl_SI.ts \
  locale/storecoin_sq.ts \
  locale/storecoin_sr.ts \
  locale/storecoin_sv.ts \
  locale/storecoin_th_TH.ts \
  locale/storecoin_tr.ts \
  locale/storecoin_uk.ts \
  locale/storecoin_vi.ts \
  locale/storecoin_vi_VN.ts \
  locale/storecoin_zh_CN.ts \
  locale/storecoin_zh_TW.ts

QT_FORMS_UI = \
  forms/aboutdialog.ui \
  forms/addressbookpage.ui \
  forms/askpassphrasedialog.ui \
  forms/coincontroldialog.ui \
  forms/editaddressdialog.ui \
  forms/intro.ui \
  forms/openuridialog.ui \
  forms/optionsdialog.ui \
  forms/overviewpage.ui \
  forms/receiverequestdialog.ui \
  forms/receivecoinsdialog.ui \
  forms/rpcconsole.ui \
  forms/sendcoinsdialog.ui \
  forms/sendcoinsentry.ui \
  forms/signverifymessagedialog.ui \
  forms/transactiondescdialog.ui

QT_MOC_CPP = \
  moc_aboutdialog.cpp \
  moc_addressbookpage.cpp \
  moc_addresstablemodel.cpp \
  moc_askpassphrasedialog.cpp \
  moc_storecoinaddressvalidator.cpp \
  moc_storecoinamountfield.cpp \
  moc_storecoingui.cpp \
  moc_storecoinunits.cpp \
  moc_clientmodel.cpp \
  moc_coincontroldialog.cpp \
  moc_coincontroltreewidget.cpp \
  moc_csvmodelwriter.cpp \
  moc_editaddressdialog.cpp \
  moc_guiutil.cpp \
  moc_intro.cpp \
  moc_macdockiconhandler.cpp \
  moc_macnotificationhandler.cpp \
  moc_monitoreddatamapper.cpp \
  moc_notificator.cpp \
  moc_openuridialog.cpp \
  moc_optionsdialog.cpp \
  moc_optionsmodel.cpp \
  moc_overviewpage.cpp \
  moc_paymentserver.cpp \
  moc_receiverequestdialog.cpp \
  moc_qvalidatedlineedit.cpp \
  moc_qvaluecombobox.cpp \
  moc_receivecoinsdialog.cpp \
  moc_recentrequeststablemodel.cpp \
  moc_rpcconsole.cpp \
  moc_sendcoinsdialog.cpp \
  moc_sendcoinsentry.cpp \
  moc_signverifymessagedialog.cpp \
  moc_splashscreen.cpp \
  moc_trafficgraphwidget.cpp \
  moc_transactiondesc.cpp \
  moc_transactiondescdialog.cpp \
  moc_transactionfilterproxy.cpp \
  moc_transactiontablemodel.cpp \
  moc_transactionview.cpp \
  moc_walletframe.cpp \
  moc_walletmodel.cpp \
  moc_walletview.cpp

STORECOIN_MM = macdockiconhandler.mm macnotificationhandler.mm

QT_MOC = intro.moc overviewpage.moc rpcconsole.moc storecoin.moc

QT_QRC_CPP = qrc_storecoin.cpp
QT_QRC = storecoin.qrc

PROTOBUF_CC = paymentrequest.pb.cc
PROTOBUF_H = paymentrequest.pb.h
PROTOBUF_PROTO = paymentrequest.proto

STORECOIN_QT_H = \
  aboutdialog.h \
  addressbookpage.h \
  addresstablemodel.h \
  askpassphrasedialog.h \
  storecoinaddressvalidator.h \
  storecoinamountfield.h \
  storecoingui.h \
  storecoinunits.h \
  clientmodel.h \
  coincontroldialog.h \
  coincontroltreewidget.h \
  csvmodelwriter.h \
  editaddressdialog.h \
  guiconstants.h \
  guiutil.h \
  intro.h \
  macdockiconhandler.h \
  macnotificationhandler.h \
  monitoreddatamapper.h \
  notificator.h \
  openuridialog.h \
  optionsdialog.h \
  optionsmodel.h \
  overviewpage.h \
  paymentrequestplus.h \
  paymentserver.h \
  receivecoinsdialog.h \
  recentrequeststablemodel.h \
  receiverequestdialog.h \
  qvalidatedlineedit.h \
  qvaluecombobox.h \
  rpcconsole.h \
  sendcoinsdialog.h \
  sendcoinsentry.h \
  signverifymessagedialog.h \
  splashscreen.h \
  trafficgraphwidget.h \
  transactiondescdialog.h \
  transactiondesc.h \
  transactionfilterproxy.h \
  transactionrecord.h \
  transactiontablemodel.h \
  transactionview.h \
  walletframe.h \
  walletmodel.h \
  walletmodeltransaction.h \
  walletview.h

RES_ICONS = \
  res/icons/storecoin.png \
  res/icons/address-book.png \
  res/icons/quit.png \
  res/icons/send.png \
  res/icons/toolbar.png \
  res/icons/connect0_16.png \
  res/icons/connect1_16.png \
  res/icons/connect2_16.png \
  res/icons/connect3_16.png \
  res/icons/connect4_16.png \
  res/icons/transaction0.png \
  res/icons/transaction2.png \
  res/icons/clock1.png \
  res/icons/clock2.png \
  res/icons/clock3.png \
  res/icons/clock4.png \
  res/icons/clock5.png \
  res/icons/configure.png \
  res/icons/receive.png \
  res/icons/editpaste.png \
  res/icons/editcopy.png \
  res/icons/add.png \
  res/icons/storecoin_testnet.png \
  res/icons/toolbar_testnet.png \
  res/icons/edit.png \
  res/icons/history.png \
  res/icons/overview.png \
  res/icons/export.png \
  res/icons/synced.png \
  res/icons/remove.png \
  res/icons/tx_mined.png \
  res/icons/tx_input.png \
  res/icons/tx_output.png \
  res/icons/tx_inout.png \
  res/icons/lock_closed.png \
  res/icons/lock_open.png \
  res/icons/key.png \
  res/icons/filesave.png \
  res/icons/qrcode.png \
  res/icons/debugwindow.png \
  res/icons/storecoin.ico \
  res/icons/storecoin_testnet.ico

STORECOIN_QT_CPP = \
  aboutdialog.cpp \
  storecoinaddressvalidator.cpp \
  storecoinamountfield.cpp \
  storecoin.cpp \
  storecoingui.cpp \
  storecoinunits.cpp \
  clientmodel.cpp \
  csvmodelwriter.cpp \
  guiutil.cpp \
  intro.cpp \
  monitoreddatamapper.cpp \
  notificator.cpp \
  optionsdialog.cpp \
  optionsmodel.cpp \
  qvalidatedlineedit.cpp \
  qvaluecombobox.cpp \
  rpcconsole.cpp \
  signverifymessagedialog.cpp \
  splashscreen.cpp \
  trafficgraphwidget.cpp

if ENABLE_WALLET
STORECOIN_QT_CPP += \
  addressbookpage.cpp \
  addresstablemodel.cpp \
  askpassphrasedialog.cpp \
  coincontroldialog.cpp \
  coincontroltreewidget.cpp \
  editaddressdialog.cpp \
  openuridialog.cpp \
  overviewpage.cpp \
  paymentrequestplus.cpp \
  paymentserver.cpp \
  receivecoinsdialog.cpp \
  receiverequestdialog.cpp \
  recentrequeststablemodel.cpp \
  sendcoinsdialog.cpp \
  sendcoinsentry.cpp \
  transactiondesc.cpp \
  transactiondescdialog.cpp \
  transactionfilterproxy.cpp \
  transactionrecord.cpp \
  transactiontablemodel.cpp \
  transactionview.cpp \
  walletframe.cpp \
  walletmodel.cpp \
  walletmodeltransaction.cpp \
  walletview.cpp
endif

RES_IMAGES = res/images/about.png res/images/splash.png \
  res/images/splash_testnet.png

RES_MOVIES = res/movies/update_spinner.mng

STORECOIN_RC = res/storecoin-qt-res.rc

libstorecoinqt_a_CPPFLAGS = $(AM_CPPFLAGS) $(QT_INCLUDES) \
  -I$(top_srcdir)/src/qt/forms $(QT_DBUS_INCLUDES)
libstorecoinqt_a_SOURCES = $(STORECOIN_QT_CPP) $(STORECOIN_QT_H) $(QT_FORMS_UI) \
  $(QT_QRC) $(QT_TS) $(PROTOBUF_PROTO) $(RES_ICONS) $(RES_IMAGES) $(RES_MOVIES)

nodist_libstorecoinqt_a_SOURCES = $(QT_MOC_CPP) $(QT_MOC) $(PROTOBUF_CC) \
  $(PROTOBUF_H) $(QT_QRC_CPP)

BUILT_SOURCES = $(nodist_libstorecoinqt_a_SOURCES)

#Generating these with a half-written protobuf header leads to wacky results.
#This makes sure it's done.
$(QT_MOC): $(PROTOBUF_H)
$(QT_MOC_CPP): $(PROTOBUF_H)

if TARGET_DARWIN
  libstorecoinqt_a_SOURCES += $(STORECOIN_MM)
endif
if TARGET_WINDOWS
  libstorecoinqt_a_SOURCES += $(STORECOIN_RC)
endif
#

# storecoin-qt binary #
storecoin_qt_CPPFLAGS = $(AM_CPPFLAGS) $(QT_INCLUDES) \
  -I$(top_srcdir)/src/qt/forms
storecoin_qt_SOURCES = storecoin.cpp
storecoin_qt_LDADD = libstorecoinqt.a $(LIBSTORECOIN_SERVER)
if ENABLE_WALLET
storecoin_qt_LDADD += $(LIBSTORECOIN_WALLET)
endif
storecoin_qt_LDADD += $(LIBSTORECOIN_CLI) $(LIBSTORECOIN_COMMON) $(LIBLEVELDB) $(LIBMEMENV) \
  $(BOOST_LIBS) $(QT_LIBS) $(QT_DBUS_LIBS) $(QR_LIBS) $(PROTOBUF_LIBS) $(BDB_LIBS)

# forms/foo.h -> forms/ui_foo.h
QT_FORMS_H=$(join $(dir $(QT_FORMS_UI)),$(addprefix ui_, $(notdir $(QT_FORMS_UI:.ui=.h))))

#locale/foo.ts -> locale/foo.qm
QT_QM=$(QT_TS:.ts=.qm)

.PHONY: FORCE
.SECONDARY: $(QT_QM)

storecoinstrings.cpp: FORCE
	$(MAKE) -C $(top_srcdir)/src qt/storecoinstrings.cpp

translate: storecoinstrings.cpp $(QT_FORMS_UI) $(QT_FORMS_UI) $(STORECOIN_QT_CPP) $(STORECOIN_QT_H) $(STORECOIN_MM)
	@test -n $(LUPDATE) || echo "lupdate is required for updating translations"
	@QT_SELECT=$(QT_SELECT) $(LUPDATE) $^ -locations relative -no-obsolete -ts locale/storecoin_en.ts

$(QT_QRC_CPP): $(QT_QRC) $(QT_QM) $(QT_FORMS_H) $(RES_ICONS) $(RES_IMAGES) $(RES_MOVIES) $(PROTOBUF_H)
	@cd $(abs_srcdir); test -f $(RCC) && QT_SELECT=$(QT_SELECT) $(RCC) -name storecoin -o $(abs_builddir)/$@ $< || \
	  echo error: could not build $@
	$(SED) -i.bak -e '/^\*\*.*Created:/d' $@ && rm $@.bak
	$(SED) -i.bak -e '/^\*\*.*by:/d' $@ && rm $@.bak

CLEANFILES = $(BUILT_SOURCES) $(QT_QM) $(QT_FORMS_H) *.gcda *.gcno
