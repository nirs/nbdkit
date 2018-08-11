#!/usr/bin/env bash
# nbdkit
# Copyright (C) 2018 Red Hat Inc.
# All rights reserved.
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

# Test the truncate filter using the pattern plugin.

set -e
set -x

files="truncate2.out truncate2.pid truncate2.sock"
rm -f $files

# Test that qemu-io works
if ! qemu-io --help >/dev/null; then
    echo "$0: missing or broken qemu-io"
    exit 77
fi

# Run nbdkit with pattern plugin and truncate filter in front.
nbdkit -P truncate2.pid -U truncate2.sock \
       --filter=truncate \
       pattern size=503 \
       round-up=512

# We may have to wait a short time for the pid file to appear.
for i in `seq 1 10`; do
    if test -f truncate2.pid; then
        break
    fi
    sleep 1
done
if ! test -f truncate2.pid; then
    echo "$0: PID file was not created"
    exit 1
fi

pid="$(cat truncate2.pid)"

# Kill the nbdkit process on exit.
cleanup ()
{
    status=$?
    trap '' INT QUIT TERM EXIT ERR
    echo $0: cleanup: exit code $status

    kill $pid
    rm -f $files

    exit $status
}
trap cleanup INT QUIT TERM EXIT ERR

qemu-io -r -f raw 'nbd+unix://?socket=truncate2.sock' \
        -c 'r -v 0 512' | grep -E '^[[:xdigit:]]+:' > truncate2.out
if [ "$(cat truncate2.out)" != "00000000:  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 08  ................
00000010:  00 00 00 00 00 00 00 10 00 00 00 00 00 00 00 18  ................
00000020:  00 00 00 00 00 00 00 20 00 00 00 00 00 00 00 28  ................
00000030:  00 00 00 00 00 00 00 30 00 00 00 00 00 00 00 38  .......0.......8
00000040:  00 00 00 00 00 00 00 40 00 00 00 00 00 00 00 48  ...............H
00000050:  00 00 00 00 00 00 00 50 00 00 00 00 00 00 00 58  .......P.......X
00000060:  00 00 00 00 00 00 00 60 00 00 00 00 00 00 00 68  ...............h
00000070:  00 00 00 00 00 00 00 70 00 00 00 00 00 00 00 78  .......p.......x
00000080:  00 00 00 00 00 00 00 80 00 00 00 00 00 00 00 88  ................
00000090:  00 00 00 00 00 00 00 90 00 00 00 00 00 00 00 98  ................
000000a0:  00 00 00 00 00 00 00 a0 00 00 00 00 00 00 00 a8  ................
000000b0:  00 00 00 00 00 00 00 b0 00 00 00 00 00 00 00 b8  ................
000000c0:  00 00 00 00 00 00 00 c0 00 00 00 00 00 00 00 c8  ................
000000d0:  00 00 00 00 00 00 00 d0 00 00 00 00 00 00 00 d8  ................
000000e0:  00 00 00 00 00 00 00 e0 00 00 00 00 00 00 00 e8  ................
000000f0:  00 00 00 00 00 00 00 f0 00 00 00 00 00 00 00 f8  ................
00000100:  00 00 00 00 00 00 01 00 00 00 00 00 00 00 01 08  ................
00000110:  00 00 00 00 00 00 01 10 00 00 00 00 00 00 01 18  ................
00000120:  00 00 00 00 00 00 01 20 00 00 00 00 00 00 01 28  ................
00000130:  00 00 00 00 00 00 01 30 00 00 00 00 00 00 01 38  .......0.......8
00000140:  00 00 00 00 00 00 01 40 00 00 00 00 00 00 01 48  ...............H
00000150:  00 00 00 00 00 00 01 50 00 00 00 00 00 00 01 58  .......P.......X
00000160:  00 00 00 00 00 00 01 60 00 00 00 00 00 00 01 68  ...............h
00000170:  00 00 00 00 00 00 01 70 00 00 00 00 00 00 01 78  .......p.......x
00000180:  00 00 00 00 00 00 01 80 00 00 00 00 00 00 01 88  ................
00000190:  00 00 00 00 00 00 01 90 00 00 00 00 00 00 01 98  ................
000001a0:  00 00 00 00 00 00 01 a0 00 00 00 00 00 00 01 a8  ................
000001b0:  00 00 00 00 00 00 01 b0 00 00 00 00 00 00 01 b8  ................
000001c0:  00 00 00 00 00 00 01 c0 00 00 00 00 00 00 01 c8  ................
000001d0:  00 00 00 00 00 00 01 d0 00 00 00 00 00 00 01 d8  ................
000001e0:  00 00 00 00 00 00 01 e0 00 00 00 00 00 00 01 e8  ................
000001f0:  00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00  ................" ]
then
    echo "$0: unexpected pattern:"
    cat truncate2.out
    exit 1
fi

# The cleanup() function is called implicitly on exit.
