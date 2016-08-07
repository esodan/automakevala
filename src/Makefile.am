--include $(top_srcdir)/vala.mk

lib_LTLIBRARIES = libatest-@API_VERSION@.la

libatest_@API_VERSION@_la_SOURCES = \
	atest-namespace.vala \
	atest.vala \
	$(NULL)

libatest_@API_VERSION@_la_CFLAGS = \
	$(ATEST_CFLAGS) \
	$(WARN_CFLAGS) \
	$(NULL)

libatest_@API_VERSION@_la_LIBADD = \
	$(ATEST_LIBS) \
	$(NULL)

libatest_@API_VERSION@_la_LDFLAGS = \
	$(WARN_LDFLAGS) \
	$(NULL)

libatest_@API_VERSION@_la_VALAFLAGS = \
	--vapidir=$(VAPIDIR) \
	--thread \
	--target-glib=2.44 \
	--pkg glib-2.0 \
	-H atest.h \
	--library atest-@API_VERSION@ \
	$(NULL)

atest.h : libatest-@API_VERSION@.la
header_DATA=atest.h
headerdir=$(includedir)/atest-@API_VERSION@/atest

atest-@API_VERSION@.vapi : libatest-@API_VERSION@.la

atest-@API_VERSION@.deps:
	cp atest.deps atest-@API_VERSION@.deps

vapi_DATA=atest-@API_VERSION@.vapi atest-@API_VERSION@.deps
vapidir=$(VAPIDIR)

CLEANFILES=\
	atest-@API_VERSION@.vapi \
	atest-@API_VERSION@.deps \
	atest.h \
	$(NULL)

-include $(top_srcdir)/git.mk
