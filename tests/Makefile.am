
VALA_TARGET=pwmc_test

noinst_PROGRAMS = $(TEST_PROGS)

VALASOURCES = \
	tests-config.vala \
	pwmc-test.vala \
	pcfdi-polizas-test.vala \
	$(NULL)

pwmc_test_SOURCES = $(VALA_CSOURCES)

VALAFLAGS = \
	--vapidir=$(VAPIDIR) \
	--vapidir=$(top_builddir)/src \
	--pkg atest-@API_VERSION@ \
	-g \
	$(NULL)

if DEBUG
AM_VALAFLAGS+= -D DEBUG
endif

pwmc_test_CFLAGS = \
	-g \
	$(PCFDI_CFLAGS) \
	-I$(top_builddir)/src \
	-I$(top_builddir) \
	$(NULL)

pwmc_test_LDADD = \
	$(PCFDI_LIBS) \
	$(top_builddir)/src/libpcfdi-@API_VERSION@.la


pwmc_test_LDFLAGS = $(AM_LDFLAGS)


DISTCLEANFILES += \
	test-config.vala \
	$(NULL)



