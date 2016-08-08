include $(top_srcdir)/vala_tester.mk

VALA_TARGET=atest_test

noinst_PROGRAMS = $(TEST_PROGS)

VALASOURCES = \
	tests-config.vala \
	atest-test.vala \
	atest-case-test.vala \
	$(NULL)

atest_test_SOURCES = $(VALA_CSOURCES)

VALAFLAGS += \
	--vapidir=$(VAPIDIR) \
	--vapidir=$(top_builddir)/src \
	--pkg atest-@API_VERSION@ \
	-g \
	$(NULL)


atest_test_CFLAGS = \
	-g \
	$(ATEST_CFLAGS) \
	-I$(top_builddir)/src \
	-I$(top_builddir) \
	$(NULL)

atest_test_LDADD = \
	$(ATEST_LIBS) \
	$(top_builddir)/src/libatest-@API_VERSION@.la


atest_test_LDFLAGS = $(AM_LDFLAGS)


DISTCLEANFILES += \
	test-config.vala \
	$(NULL)



