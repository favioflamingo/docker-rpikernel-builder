#!/bin/bash

set -e

# https://github.com/raspberrypi/linux/tree/rpi-4.4.y

TARGETBRANCH=$1
APPENDNAME=$2

echo "Downloading branch=${TARGETBRANCH}" 1>&2

cd /tmp/linux

git fetch origin

git checkout ${TARGETBRANCH}

cp /src/config.txt .config

DEB_HOST_ARCH=armhf

make-kpkg --rootcmd fakeroot --arch arm --cross-compile arm-linux-gnueabihf- \
 --append-to-version=-${APPENDNAME} kernel_image kernel_headers kernel_source

cd ..

cp *.deb /tmp/target/
