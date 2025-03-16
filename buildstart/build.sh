#!/bin/bash

echo "$(date '+%Y-%m-%d %H:%M:%S') - Starting build process..."

PACKAGES=""
PACKAGES="$PACKAGES -dnsmasq"
PACKAGES="$PACKAGES dnsmasq-full"
PACKAGES="$PACKAGES luci"
PACKAGES="$PACKAGES curl"

make image PACKAGES="$PACKAGES" ROOFS_PARTSIZE="512"

if [ $? -ne 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Error: Build failed!"
    exit 1
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') - Build completed successfully."
