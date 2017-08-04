#!/bin/sh
export PATH=$PATH:'/home/ubt32/work/openwrt/bin/ramips/OpenWrt-Toolchain-ramips-mt7688_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-i686/toolchain-mipsel_24kec+dsp_gcc-4.8-linaro_uClibc-0.9.33.2/bin'
export STAGING_DIR="/home/ubt32/work/openwrt/staging_dir/target-mipsel_24kec+dsp_uClibc-0.9.33.2"
DIR=build-mips
mkdir $DIR
rm -rf $DIR/main.o
rm -rf $DIR/cJSON.o
rm -rf $DIR/sendmsg.o
rm -rf $DIR/opensslbio.o
rm -rf $DIR/nonblocking.o
rm -rf $DIR/openssldl.o
rm -rf $DIR/ngrokc

CC=mipsel-openwrt-linux-g++
YH="-Wall -fexceptions -DOPENSSL=1 -DOPENSSLDL=1  -O2"
$CC $YH -c $1 sendmsg.cpp -o $DIR/sendmsg.o
$CC $YH -c openssldl.cpp -o $DIR/openssldl.o
$CC $YH -c $1 cJSON.c -o $DIR/cJSON.o
$CC $YH -c $1 main.cpp -o $DIR/main.o
$CC $YH -c $1 nonblocking.cpp  -o $DIR/nonblocking.o
$CC $YH -c $1 opensslbio.cpp  -o $DIR/opensslbio.o
$CC $YH -c $1 ngrok.cpp  -o $DIR/ngrok.o
$CC -s $DIR/main.o $DIR/cJSON.o $DIR/sendmsg.o $DIR/nonblocking.o $DIR/ngrok.o $DIR/opensslbio.o  $DIR/openssldl.o  -o $DIR/ngrokc    -ldl

#buill openssl
#CC=mips-openwrt-linux-gcc
#CXX=mips-openwrt-linux-g++
#AR=mips-openwrt-linux-ar
#RANLIB=mips-openwrt-linux-ranlib 
#./Configure no-asm shared --prefix=`pwd`/../out/openssl linux-mips32
#make
#make install
