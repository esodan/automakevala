-include $(top_srcdir)/valalib.mk

VALA_TARGET = libatest-@API_VERSION@.la

lib_LTLIBRARIES = $(VALA_TARGET)

VALASOURCES = \
	atest-namespace.vala \
	atest.vala \
	$(NULL)

libatest_@API_VERSION@_la_SOURCES = \
	$(VALA_CSOURCES) \
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

VALAFLAGS = \
	--vapidir=$(VAPIDIR) \
	--thread \
	--target-glib=2.44 \
	--pkg glib-2.0 \
	$(NULL)

VALA_CHEADER = atest.h
VALA_INCLUDEDIR = atest-@API_VERSION@

VALA_VAPI = atest-@API_VERSION@.vapi

atest-@API_VERSION@.deps:
	cp atest.deps atest-@API_VERSION@.deps

VALA_DEPS = atest-@API_VERSION@.deps

if HAVE_INTROSPECTION

-include $(top_srcdir)/valalib_introspection.mk

INTROSPECTION_GIRS = atest-@API_VERSION@.gir
INTROSPECTION_TYPELIBS = atest-@API_VERSION@.typelib

endif

