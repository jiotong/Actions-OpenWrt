#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# autocore
sed -i 's/DEPENDS:=@(.*/DEPENDS:=@(TARGET_bcm27xx||TARGET_bcm53xx||TARGET_ipq40xx||TARGET_ipq806x||TARGET_ipq807x||TARGET_mvebu||TARGET_rockchip||TARGET_armvirt) \\/g' package/lean/autocore/Makefile

# 替换默认IP
sed -i 's/192.168.1.1/192.168.1.254/g' package/base-files/files/bin/config_generate

#添加额外软件包
#cp -rf $GITHUB_WORKSPACE/general/luci-app-gost package/luci-app-gost
git clone https://github.com/semigodking/redsocks.git package/redsocks2
#svn co https://github.com/halldong/luci-app-speederv2/trunk package/luci-app-speederv2

#添加luci-app-amlogic
#svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
#修改晶晨宝盒默认配置
# 1.设置OpenWrt 文件的下载仓库
#sed -i "s|https.*/OpenWrt|https://github.com/sxml/Actions-OpenWrt|g" package/luci-app-amlogic/root/etc/config/amlogic
# 2.设置 Releases 里 Tags 的关键字
#sed -i "s|ARMv8|ARMv8|g" package/luci-app-amlogic/root/etc/config/amlogic
# 3.设置 Releases 里 OpenWrt 文件的后缀
#sed -i "s|.img.gz|.img.gz|g" package/luci-app-amlogic/root/etc/config/amlogic
# 4.设置 OpenWrt 内核的下载路径
#sed -i "s|opt/kernel|BuildARMv8|g" package/luci-app-amlogic/root/etc/config/amlogic
#sed -i "s|http.*/library|https://github.com/breakings/OpenWrt/tree/main/opt/kernel|g" package/luci-app-amlogic/root/etc/config/amlogic

#themes
svn co https://github.com/rosywrt/luci-theme-rosy/trunk/luci-theme-rosy package/luci-theme-rosy
svn co https://github.com/thinktip/luci-theme-neobird/trunk package/luci-theme-neobird

# btrfs-progs
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=5.18/g' feeds/packages/utils/btrfs-progs/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=1de6107622b0be2f6d77261f97a2bdd40291dbb682aac7dce08632d171f7a134/g' feeds/packages/utils/btrfs-progs/Makefile
rm -rf feeds/packages/utils/btrfs-progs/patches
#sed -i '68i\	--disable-libudev \\' feeds/packages/utils/btrfs-progs/Makefile

# qBittorrent (use cmake)
cp -f $GITHUB_WORKSPACE/general/qBittorrent/Makefile.qt6 feeds/packages/net/qBittorrent/Makefile

# containerd
cp -f $GITHUB_WORKSPACE/general/containerd/Makefile feeds/packages/utils/containerd

# Qt5 -qtbase
rm -rf feeds/packages/libs/qtbase
cp -rf $GITHUB_WORKSPACE/general/qtbase feeds/packages/libs

# Qt5 -qttools
rm -rf feeds/packages/libs/qttools
cp -rf $GITHUB_WORKSPACE/general/qttools feeds/packages/libs

# transmission-web-control
sed -i 's/PKG_SOURCE_DATE:=.*/PKG_SOURCE_DATE:=2021-09-25/g' feeds/packages/net/transmission-web-control/Makefile
sed -i 's/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=4b2e1858f7a46ee678d5d1f3fa1a6cf2c739b88a/g' feeds/packages/net/transmission-web-control/Makefile
sed -i 's/PKG_MIRROR_HASH:=.*/PKG_MIRROR_HASH:=ea014c295766e2efc7b890dc6a6940176ba9c5bdcf85a029090f2bb850e59708/g' feeds/packages/net/transmission-web-control/Makefile

# openssh
#sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=8.9p1/g' feeds/packages/net/openssh/Makefile
#sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/net/openssh/Makefile
#sed -i 's/PKG_HASH:=.*/PKG_HASH:=fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7/g' feeds/packages/net/openssh/Makefile
#sed -i '175i\	--with-sandbox=no \\' feeds/packages/net/openssh/Makefile
rm -rf feeds/packages/net/openssh
cp -rf $GITHUB_WORKSPACE/general/openssh feeds/packages/net

# replace banner
cp -f $GITHUB_WORKSPACE/general/openwrt_banner package/base-files/files/etc/banner

# sqlite3
cp -rf $GITHUB_WORKSPACE/general/sqlite3 feeds/packages/libs


./scripts/feeds update -a
./scripts/feeds install -a
