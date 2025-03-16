echo "$(date '+%Y-%m-%d %H:%M:%S') - Starting build process..."


echo 'src-git lucip https://github.com/xiaorouji/openwrt-passwall' >> /etc/opkg/feeds.conf.default
echo 'src-git packagep https://github.com/xiaorouji/openwrt-passwall-packages' >> /etc/opkg/feeds.conf.default

PACKAGES=""
PACKAGES="$PACKAGES luci-app-passwall"
PACKAGES="$PACKAGES luci-app-passwall_Iptables_Transparent_Proxy"
PACKAGES="$PACKAGES luci-app-passwall_Nftables_Transparent_Proxy"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_Geoview"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_Haproxy"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_Hysteria"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_NaiveProxy"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_Shadowsocks_Libev_Client"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_Shadowsocks_Libev_Server"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_Shadowsocks_Rust_Client"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_Shadowsocks_Rust_Server"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_ShadowsocksR_Libev_Client"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_ShadowsocksR_Libev_Server"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_Simple_Obfs"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_Trojan_Plus"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_tuic_client"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_V2ray_Geodata"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_V2ray_Plugin"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_Xray"
PACKAGES="$PACKAGES luci-app-passwall_INCLUDE_Xray_Plugin"
make image PROFILE=$PROFILE PACKAGES="$PACKAGES" FILES="/home/build/openwrt/files"

if [ $? -ne 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Error: Build failed!"
    exit 1
fi
echo "$(date '+%Y-%m-%d %H:%M:%S') - Build completed successfully."
