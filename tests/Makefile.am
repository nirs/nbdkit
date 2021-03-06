# nbdkit
# Copyright (C) 2013-2019 Red Hat Inc.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution.
#
# * Neither the name of Red Hat nor the names of its contributors may be
# used to endorse or promote products derived from this software without
# specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY RED HAT AND CONTRIBUTORS ''AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL RED HAT OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
# USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
# OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

include $(top_srcdir)/common-rules.mk

EXTRA_DIST = \
	generate-file-data.sh \
	make-pki.sh \
	make-psk.sh \
	python-exception.py \
	README.tests \
	shebang.pl \
	shebang.py \
	shebang.rb \
	ssh/sshd_config.in \
	test-ansi-c.sh \
	test-blocksize.sh \
	test-cache.sh \
	test-cache-max-size.sh \
	test-cache-on-read.sh \
	test-cacheextents.sh \
	test-captive.sh \
	test-cow.sh \
	test-cow-null.sh \
	test-cxx.sh \
	test-data-7E.sh \
	test-data-base64.sh \
	test-data-extents.sh \
	test-data-file.sh \
	test-data-raw.sh \
	test-debug-flags.sh \
	test-dump-config.sh \
	test-dump-plugin.sh \
	test-dump-plugin-example4.sh \
	test-eflags.sh \
	test-error0.sh \
	test-error10.sh \
	test-error100.sh \
	test-error-triggered.sh \
	test-eval.sh \
	test-export-name.sh \
	test-file-extents.sh \
	test-floppy.sh \
	test-foreground.sh \
	test-fua.sh \
	test-full.sh \
	test-help.sh \
	test-help-plugin.sh \
	test-info-address.sh \
	test-info-base64.sh \
	test-info-raw.sh \
	test-info-time.sh \
	test-info-uptime.sh \
	test-info-conntime.sh \
	test-ip.sh \
	test-ip-filter.sh \
	test-iso.sh \
	test-layers.sh \
	test-linuxdisk.sh \
	test-linuxdisk-copy-out.sh \
	test-log.sh \
	test-long-name.sh \
	test.lua \
	test-memory-largest.sh \
	test-memory-largest-for-qemu.sh \
	test-nbd-extents.sh \
	test-nbd-tls.sh \
	test-nbd-tls-psk.sh \
	test-nozero.sh \
	test-null-extents.sh \
	test_ocaml_plugin.ml \
	test-ocaml.c \
	test-offset2.sh \
	test-offset-extents.sh \
	test-parallel-file.sh \
	test-parallel-nbd.sh \
	test-parallel-sh.sh \
	test-partition1.sh \
	test-partition2.sh \
	test-partitioning1.sh \
	test-partitioning2.sh \
	test-partitioning3.sh \
	test-partitioning4.sh \
	test-partitioning5.sh \
	test-partitioning6.sh \
	test-pattern.sh \
	test-pattern-largest.sh \
	test-pattern-largest-for-qemu.sh \
	test-python-exception.sh \
	test.pl \
	test.py \
	test-rate.sh \
	test-rate-dynamic.sh \
	test.rb \
	test-readahead-copy.sh \
	test-retry.sh \
	test-retry-extents.sh \
	test-retry-size.sh \
	test-retry-readonly.sh \
	test-retry-reopen-fail.sh \
	test-retry-zero-flags.sh \
	test-shutdown.sh \
	test-ssh.sh \
	test-swap.sh \
	test.tcl \
	test-shebang-perl.sh \
	test-shebang-python.sh \
	test-shebang-ruby.sh \
	test-shell.sh \
	test-sh-errors.sh \
	test-sh-extents.sh \
	test-single.sh \
	test-single-from-file.sh \
	test-start.sh \
	test-random-sock.sh \
	test-tls.sh \
	test-tls-psk.sh \
	test-truncate1.sh \
	test-truncate2.sh \
	test-truncate3.sh \
	test-truncate4.sh \
	test-truncate-extents.sh \
	test-vddk.sh \
	test-vddk-real.sh \
	test-version.sh \
	test-version-filter.sh \
	test-version-plugin.sh \
	test-zero.sh \
	$(NULL)

# Use 'make check' to run the ordinary tests.  To run all the tests
# under valgrind, use the following rule:
check-valgrind:
	NBDKIT_VALGRIND=1 $(MAKE) check

# To run only tests which require root, use:
check-root:
	$(MAKE) check TESTS="test-file-block test-swap.sh"

if HAVE_VDDK
# Run a basic check against a real copy of VDDK.  You must set
# vddkdir to point to the library location, eg:
#
#   make check-vddk vddkdir=vmware-vix-disklib-distrib
check-vddk:
	$(MAKE) check TESTS=test-vddk-real.sh
endif HAVE_VDDK

#----------------------------------------------------------------------
# Basic test variables.
#
# TESTS: Tests that don't have any special requirements.
#
# LIBNBD_TESTS: Tests that link to the libnbd C library should be
# added to this variable.
#
# LIBGUESTFS_TESTS: Tests that link to libguestfs C library should be
# added to this variable.
#
# check_*, noinst_*, EXTRA_PROGRAMS: Usual automake variables.
# Consult the automake manual for the meaning of these.

TESTS =
LIBNBD_TESTS =
LIBGUESTFS_TESTS =

check_PROGRAMS =
check_DATA =
check_SCRIPTS =
check_LTLIBRARIES =
noinst_LTLIBRARIES =
EXTRA_PROGRAMS =

# Ensure we're testing the local copy by running everything through
# the nbdkit helper script in the top build directory.
#
# Use the 'direct' backend, and ensure maximum libguestfs debugging.
#
# Enable libnbd debugging.
TESTS_ENVIRONMENT = \
	PATH=$(abs_top_builddir):$(PATH) \
	SRCDIR=$(srcdir) \
	LIBGUESTFS_ATTACH_METHOD=appliance \
	LIBGUESTFS_DEBUG=1 \
	LIBGUESTFS_TRACE=1 \
	LIBNBD_DEBUG=1 \
	$(NULL)

#----------------------------------------------------------------------
# Basic server command line and start-up tests.

TESTS += \
	test-help.sh \
	test-version.sh \
	test-dump-config.sh \
	$(NULL)

if HAVE_PLUGINS

TESTS += \
	test-help-plugin.sh \
	test-version-plugin.sh \
	test-version-filter.sh \
	test-dump-plugin.sh \
	test-start.sh \
	test-single.sh \
	test-single-from-file.sh \
	test-captive.sh \
	test-random-sock.sh \
	test-tls.sh \
	test-tls-psk.sh \
	test-ip.sh \
	test-socket-activation \
	test-foreground.sh \
	test-debug-flags.sh \
	test-long-name.sh \
	test-swap.sh \
	$(NULL)

check_PROGRAMS += \
	test-socket-activation \
	$(NULL)

test_socket_activation_SOURCES = test-socket-activation.c
test_socket_activation_CPPFLAGS = \
	-I$(top_srcdir)/common/include \
	-I$(top_srcdir)/common/protocol \
	$(NULL)
test_socket_activation_CFLAGS = $(WARNINGS_CFLAGS)

endif HAVE_PLUGINS

# Test the header files can be included on their own.
check_PROGRAMS += \
	test-just-plugin-header \
	test-just-filter-header
	$(NULL)
TESTS += \
	test-just-plugin-header \
	test-just-filter-header
	$(NULL)

test_just_plugin_header_SOURCES = \
	test-just-plugin-header.c \
	$(NULL)
test_just_plugin_header_CPPFLAGS = \
	-I$(top_srcdir)/include \
	$(NULL)
test_just_plugin_header_CFLAGS = $(WARNINGS_CFLAGS)

test_just_filter_header_SOURCES = \
	test-just-filter-header.c \
	$(NULL)
test_just_filter_header_CPPFLAGS = \
	-I$(top_srcdir)/include \
	$(NULL)
test_just_filter_header_CFLAGS = $(WARNINGS_CFLAGS)

if CAN_TEST_ANSI_C
# This builds a plugin using an ANSI (ISO C90) compiler to ensure that
# the header file is compatible.  The plugin does nothing very
# interesting, it's mainly a compile test.
TESTS += \
	test-ansi-c.sh \
	$(NULL)
# check_LTLIBRARIES won't build a shared library (see automake manual).
# So we have to do this and add a dependency.
noinst_LTLIBRARIES += test-ansi-c-plugin.la
test-ansi-c.sh: test-ansi-c-plugin.la

test_ansi_c_plugin_la_SOURCES = \
	test-ansi-c-plugin.c \
	$(top_srcdir)/include/nbdkit-plugin.h \
	$(NULL)
test_ansi_c_plugin_la_CPPFLAGS = \
	-std=c90 -pedantic \
	-I$(top_srcdir)/include \
	$(NULL)
test_ansi_c_plugin_la_CFLAGS = $(WARNINGS_CFLAGS)
# For use of the -rpath option, see:
# https://lists.gnu.org/archive/html/libtool/2007-07/msg00067.html
test_ansi_c_plugin_la_LDFLAGS = \
	-module -avoid-version -shared -rpath /nowhere \
	$(NULL)
endif CAN_TEST_ANSI_C

if HAVE_CXX
# This builds a plugin and a filter using the C++ compiler.  They
# don't do anything interesting when run.
TESTS += \
	test-cxx.sh \
	$(NULL)
# check_LTLIBRARIES won't build a shared library (see automake manual).
# So we have to do this and add a dependency.
noinst_LTLIBRARIES += test-cxx-plugin.la test-cxx-filter.la
test-cxx.sh: test-cxx-plugin.la test-cxx-filter.la

test_cxx_plugin_la_SOURCES = \
	test-cxx-plugin.cpp \
	$(top_srcdir)/include/nbdkit-plugin.h \
	$(NULL)
test_cxx_plugin_la_CPPFLAGS = \
	-I$(top_srcdir)/include \
	$(NULL)
test_cxx_plugin_la_CXXFLAGS = $(WARNINGS_CFLAGS)
# For use of the -rpath option, see:
# https://lists.gnu.org/archive/html/libtool/2007-07/msg00067.html
test_cxx_plugin_la_LDFLAGS = \
	-module -avoid-version -shared -rpath /nowhere \
	$(NULL)

test_cxx_filter_la_SOURCES = \
	test-cxx-filter.cpp \
	$(top_srcdir)/include/nbdkit-filter.h \
	$(NULL)
test_cxx_filter_la_CPPFLAGS = \
	-I$(top_srcdir)/include \
	$(NULL)
test_cxx_filter_la_CXXFLAGS = $(WARNINGS_CFLAGS)
# For use of the -rpath option, see:
# https://lists.gnu.org/archive/html/libtool/2007-07/msg00067.html
test_cxx_filter_la_LDFLAGS = \
	-module -avoid-version -shared -rpath /nowhere \
	$(NULL)
endif HAVE_CXX

# Exit with parent test.
check_PROGRAMS += test-exit-with-parent
TESTS += test-exit-with-parent

test_exit_with_parent_SOURCES = \
	test-exit-with-parent.c test.h \
	$(NULL)
test_exit_with_parent_CPPFLAGS = \
	-I$(top_srcdir)/common/include \
	$(NULL)
test_exit_with_parent_CFLAGS = \
	$(WARNINGS_CFLAGS) \
	$(LIBGUESTFS_CFLAGS) \
	$(NULL)

# PKI files for the TLS tests.
check_DATA += pki/.stamp
pki/.stamp: $(srcdir)/make-pki.sh
	SRCDIR=$(srcdir) $(srcdir)/make-pki.sh

# PSK keys for the TLS-PSK tests.
check_DATA += keys.psk
keys.psk: $(srcdir)/make-psk.sh
	SRCDIR=$(srcdir) $(srcdir)/make-psk.sh

# Keys are expensive to recreate so only delete them when we do
# ‘make distclean’.
DISTCLEANFILES = keys.psk
distclean-local: distclean-local-tls
distclean-local-tls:
	rm -rf pki

#----------------------------------------------------------------------
# Tests of C plugins or tests which require plugins.

if HAVE_PLUGINS

# Common data shared by multiple tests
check_DATA += file-data
CLEANFILES += file-data
file-data: generate-file-data.sh
	$(srcdir)/generate-file-data.sh $@

# While most tests need libguestfs, testing parallel I/O is easier when
# using qemu-io to kick off asynchronous requests.
TESTS += \
	test-parallel-file.sh \
	test-parallel-nbd.sh \
	test-parallel-sh.sh \
	$(NULL)

# Common test library.
check_LTLIBRARIES += libtest.la
libtest_la_SOURCES = test.c test.h
libtest_la_CFLAGS = $(WARNINGS_CFLAGS)

# Basic connection test.
LIBNBD_TESTS += test-connect

test_connect_SOURCES = test-connect.c
test_connect_CFLAGS = $(WARNINGS_CFLAGS) $(LIBNBD_CFLAGS)
test_connect_LDADD = $(LIBNBD_LIBS)

# newstyle protocol test.
LIBNBD_TESTS += test-newstyle

test_newstyle_SOURCES = test-newstyle.c
test_newstyle_CFLAGS = $(WARNINGS_CFLAGS) $(LIBNBD_CFLAGS)
test_newstyle_LDADD = $(LIBNBD_LIBS)

# oldstyle protocol test.
LIBNBD_TESTS += test-oldstyle

test_oldstyle_SOURCES = test-oldstyle.c
test_oldstyle_CFLAGS = $(WARNINGS_CFLAGS) $(LIBNBD_CFLAGS)
test_oldstyle_LDADD = $(LIBNBD_LIBS)

# Test export flags.
TESTS += test-eflags.sh

# Test export name.
TESTS += test-export-name.sh

# common disk image shared with several tests
check_DATA += disk
CLEANFILES += disk

disk:
	rm -rf disk.tmp $@ $@-t
	mkdir disk.tmp
	echo -n "hello,world" > disk.tmp/hello.txt
	$(top_builddir)/nbdkit -fv -U - linuxdisk disk.tmp size=100M \
	    --run 'qemu-img convert $$nbd $@-t'
	rm -rf disk.tmp
	mv $@-t $@

# curl plugin test.
if HAVE_CURL
LIBGUESTFS_TESTS += test-curl

test_curl_SOURCES = \
	test-curl.c \
	web-server.c \
	web-server.h \
	test.h \
	$(NULL)
test_curl_CPPFLAGS = \
	-I$(top_srcdir)/common/utils
test_curl_CFLAGS = \
	$(WARNINGS_CFLAGS) \
	$(LIBGUESTFS_CFLAGS) \
	$(PTHREAD_CFLAGS) \
	$(NULL)
test_curl_LDFLAGS = \
	$(top_builddir)/common/utils/libutils.la \
	$(PTHREAD_LIBS) \
	$(NULL)
test_curl_LDADD = \
	libtest.la \
	$(LIBGUESTFS_LIBS) \
	$(NULL)
endif HAVE_CURL

# data plugin test.
LIBGUESTFS_TESTS += test-data
TESTS += \
	test-data-7E.sh \
	test-data-base64.sh \
	test-data-extents.sh \
	test-data-file.sh \
	test-data-raw.sh \
	$(NULL)

test_data_SOURCES = test-data.c test.h
test_data_CPPFLAGS = -I$(top_srcdir)/common/include
test_data_CFLAGS = $(WARNINGS_CFLAGS) $(LIBGUESTFS_CFLAGS)
test_data_LDADD = libtest.la $(LIBGUESTFS_LIBS)

# eval plugin test.
TESTS += test-eval.sh

# ext2 plugin test.
if HAVE_EXT2
if HAVE_GUESTFISH

LIBGUESTFS_TESTS += test-ext2
check_DATA += ext2.img
CLEANFILES += ext2.img

ext2.img: disk
	rm -f $@ $@-t
	guestfish \
	    sparse $@-t 2G : \
	    run : \
	    mkfs ext4 /dev/sda : \
	    mount /dev/sda / : \
	    mkdir /disks : \
	    upload $< /disks/disk.img
	mv $@-t $@

test_ext2_SOURCES = test-ext2.c test.h
test_ext2_CFLAGS = $(WARNINGS_CFLAGS) $(LIBGUESTFS_CFLAGS)
test_ext2_LDADD = libtest.la $(LIBGUESTFS_LIBS)

endif HAVE_GUESTFISH
endif HAVE_EXT2

# file plugin test.
LIBNBD_TESTS += test-file
LIBGUESTFS_TESTS += test-file-block

test_file_SOURCES = test-file.c
test_file_CFLAGS = $(WARNINGS_CFLAGS) $(LIBNBD_CFLAGS)
test_file_LDADD = $(LIBNBD_LIBS)

test_file_block_SOURCES = test-file-block.c test.h
test_file_block_CFLAGS = $(WARNINGS_CFLAGS) $(LIBGUESTFS_CFLAGS)
test_file_block_LDADD = libtest.la $(LIBGUESTFS_LIBS)

TESTS += test-file-extents.sh

# floppy plugin test.
TESTS += test-floppy.sh

# full plugin test.
TESTS += test-full.sh

# gzip plugin test.
if HAVE_ZLIB
LIBGUESTFS_TESTS += test-gzip
check_DATA += disk.gz
CLEANFILES += disk.gz

test_gzip_SOURCES = test-gzip.c test.h
test_gzip_CFLAGS = $(WARNINGS_CFLAGS) $(LIBGUESTFS_CFLAGS)
test_gzip_LDADD = libtest.la $(LIBGUESTFS_LIBS)

disk.gz: disk
	rm -f $@
	gzip -9 -c disk > $@
endif HAVE_ZLIB

# info plugin test.
TESTS += \
	test-info-address.sh \
	test-info-base64.sh \
	test-info-raw.sh \
	test-info-time.sh \
	test-info-uptime.sh \
	test-info-conntime.sh \
	$(NULL)

# iso plugin test.
if HAVE_ISO
TESTS += test-iso.sh
endif HAVE_ISO

# linuxdisk plugin test.
TESTS += \
	test-linuxdisk.sh \
	test-linuxdisk-copy-out.sh \
	$(NULL)

# memory plugin test.
LIBGUESTFS_TESTS += test-memory
TESTS += test-memory-largest.sh test-memory-largest-for-qemu.sh

test_memory_SOURCES = test-memory.c test.h
test_memory_CFLAGS = $(WARNINGS_CFLAGS) $(LIBGUESTFS_CFLAGS)
test_memory_LDADD = libtest.la $(LIBGUESTFS_LIBS)

# partitioning plugin test.
TESTS += \
	test-partitioning1.sh \
	test-partitioning2.sh \
	test-partitioning3.sh \
	test-partitioning4.sh \
	test-partitioning5.sh \
	test-partitioning6.sh \
	$(NULL)

# pattern plugin test.
TESTS += \
	test-pattern.sh \
	test-pattern-largest.sh \
	test-pattern-largest-for-qemu.sh \
	$(NULL)

if HAVE_NBD_PLUGIN
# nbd plugin test.
LIBGUESTFS_TESTS += test-nbd
TESTS += \
	test-nbd-extents.sh \
	test-nbd-tls.sh \
	test-nbd-tls-psk.sh \
	$(NULL)

test_nbd_SOURCES = test-nbd.c test.h
test_nbd_CFLAGS = $(WARNINGS_CFLAGS) $(LIBGUESTFS_CFLAGS)
test_nbd_LDADD = libtest.la $(LIBGUESTFS_LIBS)
endif HAVE_NBD_PLUGIN

# null plugin test.
LIBNBD_TESTS += test-null
TESTS += test-null-extents.sh

test_null_SOURCES = test-null.c
test_null_CFLAGS = $(WARNINGS_CFLAGS) $(LIBNBD_CFLAGS)
test_null_LDADD = $(LIBNBD_LIBS)

# random plugin test.
LIBNBD_TESTS += test-random

test_random_SOURCES = test-random.c
test_random_CPPFLAGS = -I $(top_srcdir)/common/include
test_random_CFLAGS = $(WARNINGS_CFLAGS) $(LIBNBD_CFLAGS)
test_random_LDADD = $(LIBNBD_LIBS)

# split files plugin test.
check_DATA += split1 split2 split3
CLEANFILES += split1 split2 split3
split1: file-data
	rm -f $@ $@-t
	dd if=$< of=$@-t bs=1 count=100
	mv $@-t $@
split2: file-data
	rm -f $@ $@-t
	dd if=$< of=$@-t bs=1 count=100 skip=100
	mv $@-t $@
split3: file-data
	rm -f $@ $@-t
	dd if=$< of=$@-t bs=1 skip=200
	mv $@-t $@
LIBNBD_TESTS += test-split

test_split_SOURCES = test-split.c
test_split_CFLAGS = $(WARNINGS_CFLAGS) $(LIBNBD_CFLAGS)
test_split_LDADD = $(LIBNBD_LIBS)

# ssh plugin test.
if HAVE_SSH
# Uses ‘disk’ so we have to make it conditional on guestfish.
TESTS += test-ssh.sh
check_DATA += \
	ssh/sshd_config \
	ssh/ssh_host_rsa_key ssh/ssh_host_rsa_key.pub \
	ssh/authorized_keys \
	$(NULL)
SSH_RANDOM_PORT := $(shell bash -c 'echo $$(( 10000 + $$RANDOM ))')
CLEANFILES += \
	ssh/*~ \
	ssh/sshd_config \
	ssh/authorized_keys \
	$(NULL)
DISTCLEANFILES += \
	ssh/ssh_host_rsa_key ssh/ssh_host_rsa_key.pub \
	ssh/id_rsa ssh/id_rsa.pub \
	stamp-ssh-host-key stamp-ssh-user-key \
	$(NULL)

ssh/sshd_config: ssh/sshd_config.in Makefile
	rm -f $@ $@-t
	$(SED) \
	    -e 's,__abs_builddir__,$(abs_builddir),g' \
	    -e 's,__RANDOM_PORT__,$(SSH_RANDOM_PORT),g' \
	    < $< > $@-t
	mv $@-t $@

ssh/ssh_host_rsa_key ssh/ssh_host_rsa_key.pub: stamp-ssh-host-key
stamp-ssh-host-key:
	rm -f $@
	rm -f ssh/ssh_host_rsa_key
	rm -f ssh/ssh_host_rsa_key.pub
	ssh-keygen -t rsa -f ssh/ssh_host_rsa_key -N ''
	touch $@

ssh/authorized_keys: ssh/id_rsa.pub
	rm -f $@ $@-t
	cp $< $@-t
	mv $@-t $@

ssh/id_rsa ssh/id_rsa.pub: stamp-ssh-user-key
stamp-ssh-user-key:
	rm -f $@
	rm -f ssh/id_rsa
	rm -f ssh/id_rsa.pub
	ssh-keygen -t rsa -f ssh/id_rsa -N ''
	touch $@
endif HAVE_SSH

# streaming plugin test.
# Doesn't work:
LIBNBD_TESTS += test-streaming

test_streaming_SOURCES = test-streaming.c
test_streaming_CFLAGS = $(WARNINGS_CFLAGS) $(LIBNBD_CFLAGS)
test_streaming_LDADD = $(LIBNBD_LIBS)

if HAVE_VDDK
# VDDK plugin test.
# This only tests that the plugin can be loaded against a
# dummy VDDK library, it is not a detailed test.

# check_LTLIBRARIES won't build a shared library (see automake manual).
# So we have to do this and add a dependency.
noinst_LTLIBRARIES += libvixDiskLib.la
TESTS += \
	test-vddk.sh \
	test-vddk-real.sh \
	$(NULL)

libvixDiskLib_la_SOURCES = \
	dummy-vddk.c \
	$(NULL)
libvixDiskLib_la_CPPFLAGS = \
	-I$(top_srcdir)/plugins/vddk \
	$(NULL)
libvixDiskLib_la_CXXFLAGS = $(WARNINGS_CFLAGS)
# For use of the -rpath option, see:
# https://lists.gnu.org/archive/html/libtool/2007-07/msg00067.html
libvixDiskLib_la_LDFLAGS = \
	-shared -version-number 6:0:0 -rpath /nowhere \
	$(NULL)
endif HAVE_VDDK

# zero plugin test.
TESTS += test-zero.sh

#----------------------------------------------------------------------
# Tests of language plugins.

# OCaml plugin test.
if HAVE_OCAML

LIBGUESTFS_TESTS += test-ocaml

# This is somewhat different from the other tests because we have
# to build an actual plugin here.
test_ocaml_SOURCES = test-ocaml.c test.h
test_ocaml_CFLAGS = \
	$(WARNINGS_CFLAGS) \
	$(LIBGUESTFS_CFLAGS) \
	$(NULL)
test_ocaml_LDADD = libtest.la $(LIBGUESTFS_LIBS)

check_SCRIPTS += test-ocaml-plugin.so
test-ocaml-plugin.so: test_ocaml_plugin.cmx ../plugins/ocaml/libnbdkitocaml.la ../plugins/ocaml/NBDKit.cmi ../plugins/ocaml/NBDKit.cmx
	$(OCAMLOPT) $(OCAMLOPTFLAGS) -I ../plugins/ocaml \
	  -output-obj -runtime-variant _pic -o $@ \
	  NBDKit.cmx $< \
	  -cclib -L../plugins/ocaml/.libs -cclib -lnbdkitocaml
test_ocaml_plugin.cmx: test_ocaml_plugin.ml ../plugins/ocaml/NBDKit.cmi
	$(OCAMLOPT) $(OCAMLOPTFLAGS) -I ../plugins/ocaml -c $< -o $@

endif HAVE_OCAML

# perl plugin test.
if HAVE_PERL

TESTS += \
	test-dump-plugin-example4.sh \
	test-shebang-perl.sh \
	$(NULL)
LIBGUESTFS_TESTS += test-perl

test_perl_SOURCES = test-lang-plugins.c test.h
test_perl_CFLAGS = \
	-DLANG='"perl"' -DSCRIPT='"$(srcdir)/test.pl"' \
	$(WARNINGS_CFLAGS) \
	$(LIBGUESTFS_CFLAGS) \
	$(NULL)
test_perl_LDADD = libtest.la $(LIBGUESTFS_LIBS)

endif HAVE_PERL

# python plugin test.
if HAVE_PYTHON

TESTS += \
	test-python-exception.sh \
	test-shebang-python.sh \
	$(NULL)
LIBGUESTFS_TESTS += test-python

test_python_SOURCES = test-lang-plugins.c test.h
test_python_CFLAGS = \
	-DLANG='"python"' -DSCRIPT='"$(srcdir)/test.py"' \
	$(WARNINGS_CFLAGS) \
	$(LIBGUESTFS_CFLAGS) \
	$(NULL)
test_python_LDADD = libtest.la $(LIBGUESTFS_LIBS)

endif HAVE_PYTHON

# Ruby plugin test.
if HAVE_RUBY

# Ruby tests are disabled.  See "WARNING" section in
# plugins/ruby/nbdkit-ruby-plugin.pod

#LIBGUESTFS_TESTS += \
#	test-ruby \
#	$(NULL)
#TESTS += test-shebang-ruby.sh
EXTRA_PROGRAMS += test-ruby

test_ruby_SOURCES = test-lang-plugins.c test.h
test_ruby_CFLAGS = \
	-DLANG='"ruby"' -DSCRIPT='"$(srcdir)/test.rb"' \
	$(WARNINGS_CFLAGS) \
	$(LIBGUESTFS_CFLAGS) \
	$(NULL)
test_ruby_LDADD = libtest.la $(LIBGUESTFS_LIBS)

endif HAVE_RUBY

# Shell (sh) plugin test.
LIBGUESTFS_TESTS += test-shell
check_DATA += test-shell.img
CLEANFILES += test-shell.img

test_shell_SOURCES = test-lang-plugins.c test.h
test_shell_CFLAGS = \
	-DLANG='"sh"' -DSCRIPT='"$(srcdir)/test-shell.sh"' \
	$(WARNINGS_CFLAGS) \
	$(LIBGUESTFS_CFLAGS) \
	$(NULL)
test_shell_LDADD = libtest.la $(LIBGUESTFS_LIBS)

test-shell.img:
	truncate -s 1048576 $@

TESTS += \
	test-sh-errors.sh \
	test-sh-extents.sh \
	$(NULL)

# Tcl plugin test.
if HAVE_TCL

LIBGUESTFS_TESTS += test-tcl

test_tcl_SOURCES = test-lang-plugins.c test.h
test_tcl_CFLAGS = \
	-DLANG='"tcl"' -DSCRIPT='"$(srcdir)/test.tcl"' \
	$(WARNINGS_CFLAGS) \
	$(LIBGUESTFS_CFLAGS) \
	$(NULL)
test_tcl_LDADD = libtest.la $(LIBGUESTFS_LIBS)

endif HAVE_TCL

# Lua plugin test.
if HAVE_LUA

LIBGUESTFS_TESTS += test-lua

test_lua_SOURCES = test-lang-plugins.c test.h
test_lua_CFLAGS = \
	-DLANG='"lua"' -DSCRIPT='"$(srcdir)/test.lua"' \
	$(WARNINGS_CFLAGS) \
	$(LIBGUESTFS_CFLAGS) \
	$(NULL)
test_lua_LDADD = libtest.la $(LIBGUESTFS_LIBS)

endif HAVE_LUA

#----------------------------------------------------------------------
# Tests of filters.

# Generic test of filter layers.
check_PROGRAMS += test-layers
TESTS += test-layers.sh test-layers

test_layers_SOURCES = \
	test-layers.c \
	$(NULL)
test_layers_CPPFLAGS = \
	-I$(top_srcdir)/common/include \
	-I$(top_srcdir)/common/protocol \
	-I$(top_srcdir)/common/utils \
	-I$(top_srcdir)/server \
	$(NULL)
test_layers_CFLAGS = \
	$(WARNINGS_CFLAGS) \
	$(PTHREAD_CFLAGS) \
	$(NULL)
test_layers_LDFLAGS = \
	$(PTHREAD_LIBS) \
	$(NULL)
test_layers_LDADD = \
	$(top_builddir)/common/utils/libutils.la \
	$(NULL)
test_layers_DEPENDENCIES = \
	test-layers-plugin.la \
	test-layers-filter1.la \
	test-layers-filter2.la \
	test-layers-filter3.la \
	$(NULL)

# check_LTLIBRARIES won't build a shared library (see automake manual).
# So we have to do this and add a dependency.
noinst_LTLIBRARIES += \
	test-layers-plugin.la \
	test-layers-filter1.la \
	test-layers-filter2.la \
	test-layers-filter3.la \
	$(NULL)

test_layers_plugin_la_SOURCES = \
	test-layers-plugin.c \
	$(top_srcdir)/include/nbdkit-plugin.h \
	$(NULL)
test_layers_plugin_la_CPPFLAGS = -I$(top_srcdir)/include
test_layers_plugin_la_CFLAGS = $(WARNINGS_CFLAGS)
# For use of the -rpath option, see:
# https://lists.gnu.org/archive/html/libtool/2007-07/msg00067.html
test_layers_plugin_la_LDFLAGS = \
	-module -avoid-version -shared -rpath /nowhere \
	$(NULL)

test_layers_filter1_la_SOURCES = \
	test-layers-filter.c \
	$(top_srcdir)/include/nbdkit-filter.h \
	$(NULL)
test_layers_filter1_la_CPPFLAGS = -I$(top_srcdir)/include
test_layers_filter1_la_CFLAGS = $(WARNINGS_CFLAGS) -Dlayer='"filter1"'
# For use of the -rpath option, see:
# https://lists.gnu.org/archive/html/libtool/2007-07/msg00067.html
test_layers_filter1_la_LDFLAGS = \
	-module -avoid-version -shared -rpath /nowhere \
	$(NULL)

test_layers_filter2_la_SOURCES = \
	test-layers-filter.c \
	$(top_srcdir)/include/nbdkit-filter.h \
	$(NULL)
test_layers_filter2_la_CPPFLAGS = -I$(top_srcdir)/include
test_layers_filter2_la_CFLAGS = $(WARNINGS_CFLAGS) -Dlayer='"filter2"'
# For use of the -rpath option, see:
# https://lists.gnu.org/archive/html/libtool/2007-07/msg00067.html
test_layers_filter2_la_LDFLAGS = \
	-module -avoid-version -shared -rpath /nowhere \
	$(NULL)

test_layers_filter3_la_SOURCES = \
	test-layers-filter.c \
	$(top_srcdir)/include/nbdkit-filter.h \
	$(NULL)
test_layers_filter3_la_CPPFLAGS = -I$(top_srcdir)/include
test_layers_filter3_la_CFLAGS = $(WARNINGS_CFLAGS) -Dlayer='"filter3"'
# For use of the -rpath option, see:
# https://lists.gnu.org/archive/html/libtool/2007-07/msg00067.html
test_layers_filter3_la_LDFLAGS = \
	-module -avoid-version -shared -rpath /nowhere \
	$(NULL)

# blocksize filter test.
TESTS += test-blocksize.sh

# cache filter test.
TESTS += \
	test-cache.sh \
	test-cache-on-read.sh \
	$(NULL)
TESTS += test-cache-max-size.sh

# cacheextents filter test.
TESTS += test-cacheextents.sh

# cow filter test.
TESTS += \
	test-cow.sh \
	test-cow-null.sh \
	$(NULL)

# delay filter tests.
TESTS += test-shutdown.sh
LIBNBD_TESTS += test-delay

test_delay_SOURCES = test-delay.c
test_delay_CFLAGS = $(WARNINGS_CFLAGS) $(LIBNBD_CFLAGS)
test_delay_LDADD = $(LIBNBD_LIBS)

# error filter test.
TESTS += \
	test-error0.sh \
	test-error10.sh \
	test-error100.sh \
	test-error-triggered.sh \
	$(NULL)

# fua filter test.
TESTS += test-fua.sh

# ip filter test.
TESTS += test-ip-filter.sh

# log filter test.
TESTS += test-log.sh

if HAVE_NBD_PLUGIN
# nozero filter test.
TESTS += test-nozero.sh
endif HAVE_NBD_PLUGIN

# offset filter test.
LIBGUESTFS_TESTS += test-offset

test_offset_SOURCES = test-offset.c test.h
test_offset_CFLAGS = $(WARNINGS_CFLAGS) $(LIBGUESTFS_CFLAGS)
test_offset_LDADD = libtest.la $(LIBGUESTFS_LIBS)

TESTS += \
	test-offset2.sh \
	test-offset-extents.sh \
	$(NULL)

# partition filter test.
TESTS += test-partition1.sh
TESTS += test-partition2.sh

# rate filter test.
TESTS += \
	test-rate.sh \
	test-rate-dynamic.sh \
	$(NULL)

# readahead filter test.
LIBGUESTFS_TESTS += test-readahead
TESTS += test-readahead-copy.sh

test_readahead_SOURCES = test-readahead.c test.h
test_readahead_CFLAGS = $(WARNINGS_CFLAGS) $(LIBGUESTFS_CFLAGS)
test_readahead_LDADD = libtest.la $(LIBGUESTFS_LIBS)

# retry filter test.
TESTS += \
	test-retry.sh \
	test-retry-readonly.sh \
	test-retry-extents.sh \
	test-retry-size.sh \
	test-retry-reopen-fail.sh \
	test-retry-zero-flags.sh \
	$(NULL)

# truncate filter tests.
TESTS += \
	test-truncate1.sh \
	test-truncate2.sh \
	test-truncate3.sh \
	test-truncate4.sh \
	test-truncate-extents.sh \
	$(NULL)

# xz filter test.
if HAVE_LIBLZMA
LIBGUESTFS_TESTS += test-xz
check_DATA += disk.xz
CLEANFILES += disk.xz

test_xz_SOURCES = test-xz.c test.h
test_xz_CFLAGS = $(WARNINGS_CFLAGS) $(LIBGUESTFS_CFLAGS)
test_xz_LDADD = libtest.la $(LIBGUESTFS_LIBS)

disk.xz: disk
	rm -f $@
# We choose a very small block size here only for testing.  Normally
# you should choose a 16M block size.
	xz --best --block-size=32768 -c disk > $@

# xz filter + curl.
if HAVE_CURL
LIBGUESTFS_TESTS += test-xz-curl

test_xz_curl_SOURCES = \
	test-xz-curl.c \
	web-server.c \
	web-server.h \
	test.h \
	$(NULL)
test_xz_curl_CPPFLAGS = \
	-I$(top_srcdir)/common/utils
test_xz_curl_CFLAGS = \
	$(WARNINGS_CFLAGS) \
	$(LIBGUESTFS_CFLAGS) \
	$(PTHREAD_CFLAGS) \
	$(NULL)
test_xz_curl_LDFLAGS = \
	$(top_builddir)/common/utils/libutils.la \
	$(PTHREAD_LIBS) \
	$(NULL)
test_xz_curl_LDADD = \
	libtest.la \
	$(LIBGUESTFS_LIBS) \
	$(NULL)

endif HAVE_CURL
endif HAVE_LIBLZMA

endif HAVE_PLUGINS

#----------------------------------------------------------------------

if HAVE_LIBNBD
check_PROGRAMS += $(LIBNBD_TESTS)
TESTS += $(LIBNBD_TESTS)
endif HAVE_LIBNBD

if HAVE_LIBGUESTFS
check_PROGRAMS += $(LIBGUESTFS_TESTS)
TESTS += $(LIBGUESTFS_TESTS)
endif HAVE_LIBGUESTFS
