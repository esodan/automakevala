# vala.mk
# Copyright (C) 2015  Daniel Espinosa <esodan@gmail.com>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, see <http://www.gnu.org/licenses/>.
#
# Authors:
#      Daniel Espinosa <esodan@gmail.com>
#
# For libraries you should define VALA_CHEADER for its C header and VALA_VAPI
# for its VAPI file and its VALA_DEPS as its library dependencies
#
# For GObject Introspection optional generation support you should use
# --enable-instrospection switch on configure and define INTROSPECTION_GIRS
# and INTROSPECTION_TYPELIBS. VALA_TARGET should be a library.

-include $(top_srcdir)/vala.mk


VALAFLAGS += \
	-H $(VALA_CHEADER) \
	--library $(VALA_VAPI) \
	$(NULL)

# .h header file
$(VALA_CHEADER).h: $(VALA_TARGET)
vala_cheaderdir= $(includedir)/pcfdi-$(API_VERSION)
vala_cheader_HEADERS = pcfdi.h

# .vapi Vala API file
$(VALA_VAPI): $(VALA_TARGET)
vala_vapidir = $(datadir)/vala/vapi
dist_vala_vapi_DATA = \
	$(VALA_VAPI) \
	$(VALA_DEPS) \
	$(NULL)

CLEANFILES += \
	vala-stamp \
	$(VALA_SOURCES:.vala=.c) \
	$(VALA_VAPI) \
	$(VALA_CHEADER) \
	$(NULL)

if HAVE_INTROSPECTION

### GObject Introspection
# dlname:
#   Extract our dlname like libfolks does, see bgo#658002 and bgo#585116
#   This is what g-ir-scanner does.
dlname=\
	`$(SED) -nE "s/^dlname='([A-Za-z0-9.+-]+)'/\1/p" $(VALA_TARGET)`

VALAFLAGS += \
	--gir=$(INTROSPECTION_GIRS)

INTROSPECTION_COMPILER_ARGS += --includedir=. -l $(dlname)

$(INTROSPECTION_GIRS): $(VALA_TARGET)

$(INTROSPECTION_TYPELIBS): $(INTROSPECTION_GIRS)
	$(INTROSPECTION_COMPILER) $(INTROSPECTION_COMPILER_ARGS)  $< -o $@

girdir = $(INTROSPECTION_GIRDIR)
gir_DATA = $(INTROSPECTION_GIRS)
typelibdir = $(INTROSPECTION_TYPELIBDIR)
typelib_DATA = $(INTROSPECTION_TYPELIBS)
CLEANFILES += $(gir_DATA) $(typelib_DATA)

endif
