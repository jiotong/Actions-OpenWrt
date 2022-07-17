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

#themes
svn co https://github.com/rosywrt/luci-theme-rosy/trunk/luci-theme-rosy package/luci-theme-rosy
svn co https://github.com/thinktip/luci-theme-neobird/trunk package/luci-theme-neobird

# btrfs-progs
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=5.18/g' feeds/packages/utils/btrfs-progs/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=1de6107622b0be2f6d77261f97a2bdd40291dbb682aac7dce08632d171f7a134/g' feeds/packages/utils/btrfs-progs/Makefile
rm -rf feeds/packages/utils/btrfs-progs/patches
#sed -i '68i\	--disable-libudev \\' feeds/packages/utils/btrfs-progs/Makefile

# qBittorrent (use cmake)
#sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=4.4.0/g' feeds/packages/net/qBittorrent/Makefile
#sed -i 's/PKG_HASH:=.*/PKG_HASH:=da240744c6cc5953d7c4d298a02a0cf36d2c8897931819f1e6459bd5270a7c5c/g' feeds/packages/net/qBittorrent/Makefile
#sed -i '41i\		+qt5-sql \\' feeds/packages/net/qBittorrent/Makefile
#cp -f $GITHUB_WORKSPACE/general/qBittorrent/Makefile feeds/packages/net/qBittorrent
cp -f $GITHUB_WORKSPACE/general/qBittorrent/Makefile.qt6 feeds/packages/net/qBittorrent/Makefile

# libtorrent-rasterbar_v2
rm -rf feeds/packages/libs/libtorrent-rasterbar/patches
cp -f $GITHUB_WORKSPACE/general/libtorrent-rasterbar/Makefile feeds/packages/libs/libtorrent-rasterbar

# curl
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=7.84.0/g' feeds/packages/net/curl/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=2d118b43f547bfe5bae806d8d47b4e596ea5b25a6c1f080aef49fbcd817c5db8/g' feeds/packages/net/curl/Makefile

# Qt5 -qtbase
rm -rf feeds/packages/libs/qtbase
cp -rf $GITHUB_WORKSPACE/general/qtbase feeds/packages/libs

# Qt5 -qttools
rm -rf feeds/packages/libs/qttools
cp -rf $GITHUB_WORKSPACE/general/qttools feeds/packages/libs

# node 
sed -i "s/PKG_VERSION:=v14.18.3/PKG_VERSION:=v14.19.2/g" feeds/packages/lang/node/Makefile
sed -i "s/PKG_HASH:=783ac443cd343dd6c68d2abcf7e59e7b978a6a428f6a6025f9b84918b769d608/PKG_HASH:=ef4375a9152ff69f2823d7b20a3b53767a046164bbac7824429cb216d1688cf0/g" feeds/packages/lang/node/Makefile

# containerd
cp -f $GITHUB_WORKSPACE/general/containerd/Makefile feeds/packages/utils/containerd

# pcre
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=8.45/g' package/libs/pcre/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' package/libs/pcre/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8/g' package/libs/pcre/Makefile

# libseccomp
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2.5.4/g' feeds/packages/libs/libseccomp/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=d82902400405cf0068574ef3dc1fe5f5926207543ba1ae6f8e7a1576351dcbdb/g' feeds/packages/libs/libseccomp/Makefile

# php8
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=8.1.8/g' feeds/packages/lang/php8/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=04c065515bc347bc68e0bb1ac7182669a98a731e4a17727e5731650ad3d8de4c/g' feeds/packages/lang/php8/Makefile

# python-docker
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=5.0.3/g' feeds/packages/lang/python/python-docker/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=d916a26b62970e7c2f554110ed6af04c7ccff8e9f81ad17d0d40c75637e227fb/g' feeds/packages/lang/python/python-docker/Makefile

# expat
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2.4.8/g' feeds/packages/libs/expat/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=f79b8f904b749e3e0d20afeadecf8249c55b2e32d4ebb089ae378df479dcaf25/g' feeds/packages/libs/expat/Makefile
#cp -f $GITHUB_WORKSPACE/general/expat/Makefile feeds/packages/libs/expat

# transmission-web-control
sed -i 's/PKG_SOURCE_DATE:=.*/PKG_SOURCE_DATE:=2021-09-25/g' feeds/packages/net/transmission-web-control/Makefile
sed -i 's/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=4b2e1858f7a46ee678d5d1f3fa1a6cf2c739b88a/g' feeds/packages/net/transmission-web-control/Makefile
sed -i 's/PKG_MIRROR_HASH:=.*/PKG_MIRROR_HASH:=ea014c295766e2efc7b890dc6a6940176ba9c5bdcf85a029090f2bb850e59708/g' feeds/packages/net/transmission-web-control/Makefile

# python-yaml
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=6.0/g' feeds/packages/lang/python/python-yaml/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/lang/python/python-yaml/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=68fb519c14306fec9720a2a5b45bc9f0c8d1b9c72adf45c37baedfcd949c35a2/g' feeds/packages/lang/python/python-yaml/Makefile
sed -i '22i\HOST_PYTHON3_PACKAGE_BUILD_DEPENDS:=Cython\n' feeds/packages/lang/python/python-yaml/Makefile

# python-websocket-client
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.3.3/g' feeds/packages/lang/python/python-websocket-client/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=d58c5f284d6a9bf8379dab423259fe8f85b70d5fa5d2916d5791a84594b122b1/g' feeds/packages/lang/python/python-websocket-client/Makefile

# python-texttable
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.6.4/g' feeds/packages/lang/python/python-texttable/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=42ee7b9e15f7b225747c3fa08f43c5d6c83bc899f80ff9bae9319334824076e9/g' feeds/packages/lang/python/python-texttable/Makefile

# python-urllib3
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.26.9/g' feeds/packages/lang/python/python-urllib3/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=aabaf16477806a5e1dd19aa41f8c2b7950dd3c746362d7e3223dbe6de6ac448e/g' feeds/packages/lang/python/python-urllib3/Makefile

# python-sqlalchemy
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.4.37/g' feeds/packages/lang/python/python-sqlalchemy/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=3688f92c62db6c5df268e2264891078f17ecb91e3141b400f2e28d0f75796dea/g' feeds/packages/lang/python/python-sqlalchemy/Makefile

# python-simplejson
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=3.17.6/g' feeds/packages/lang/python/python-simplejson/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=cf98038d2abf63a1ada5730e91e84c642ba6c225b0198c3684151b1f80c5f8a6/g' feeds/packages/lang/python/python-simplejson/Makefile

# python-pyrsistent
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=0.18.1/g' feeds/packages/lang/python/python-pyrsistent/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=d4d61f8b993a7255ba714df3aca52700f8125289f84f704cf80916517c46eb96/g' feeds/packages/lang/python/python-pyrsistent/Makefile

# python-pycparser
rm -rf feeds/packages/lang/python/python-pycparser
svn co https://github.com/openwrt/packages/trunk/lang/python/python-pycparser feeds/packages/lang/python/python-pycparser
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2.21/g' feeds/packages/lang/python/python-pycparser/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/lang/python/python-pycparser/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206/g' feeds/packages/lang/python/python-pycparser/Makefile

# python-paramiko
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2.11.0/g' feeds/packages/lang/python/python-paramiko/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=003e6bee7c034c21fbb051bf83dc0a9ee4106204dd3c53054c71452cc4ec3938/g' feeds/packages/lang/python/python-paramiko/Makefile

# python-lxml
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=4.9.1/g' feeds/packages/lang/python/python-lxml/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=fe749b052bb7233fe5d072fcb549221a8cb1a16725c47c37e42b0b9cb3ff2c3f/g' feeds/packages/lang/python/python-lxml/Makefile

# python-idna
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=3.3/g' feeds/packages/lang/python/python-idna/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d/g' feeds/packages/lang/python/python-idna/Makefile

# python-dns
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2.2.1/g' feeds/packages/lang/python/python-dns/Makefile
sed -i 's/PYPI_SOURCE_EXT:=.*/PYPI_SOURCE_EXT:=tar.gz/g' feeds/packages/lang/python/python-dns/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=0f7569a4a6ff151958b64304071d370daa3243d15941a7beedf0c9fe5105603e/g' feeds/packages/lang/python/python-dns/Makefile

# python-certifi
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2022.5.18.1/g' feeds/packages/lang/python/python-certifi/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=9c5705e395cd70084351dd8ad5c41e65655e08ce46f2ec9cf6c2c08390f71eb7/g' feeds/packages/lang/python/python-certifi/Makefile

# bcrypt
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=3.2.2/g' feeds/packages/lang/python/bcrypt/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/lang/python/bcrypt/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=433c410c2177057705da2a9f2cd01dd157493b2a7ac14c8593a16b3dab6b6bfb/g' feeds/packages/lang/python/bcrypt/Makefile

# python-dotenv
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=0.20.0/g' feeds/packages/lang/python/python-dotenv/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=b7e3b04a59693c42c36f9ab1cc2acc46fa5df8c78e178fc33a8d4cd05c8d498f/g' feeds/packages/lang/python/python-dotenv/Makefile

# python-cffi
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.15.0/g' feeds/packages/lang/python/python-cffi/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=920f0d66a896c2d99f0adbb391f990a84091179542c205fa53ce5787aff87954/g' feeds/packages/lang/python/python-cffi/Makefile

# python-cryptography
rm -rf feeds/packages/lang/python/python-cryptography
svn co https://github.com/openwrt/packages/trunk/lang/python/python-cryptography feeds/packages/lang/python/python-cryptography

# python-distro
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.7.0/g' feeds/packages/lang/python/python-distro/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/lang/python/python-distro/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=151aeccf60c216402932b52e40ee477a939f8d58898927378a02abbe852c1c39/g' feeds/packages/lang/python/python-distro/Makefile

# python-dateutil
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2.8.2/g' feeds/packages/lang/python/python-dateutil/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/lang/python/python-dateutil/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86/g' feeds/packages/lang/python/python-dateutil/Makefile

# python-requests
rm -rf feeds/packages/lang/python/python-requests/patches
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2.28.1/g' feeds/packages/lang/python/python-requests/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/lang/python/python-requests/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=7c5599b102feddaa661c826c56ab4fee28bfd17f5abca1ebbe3e7f19d7c97983/g' feeds/packages/lang/python/python-requests/Makefile

# host-pip-requirements
sed -i 's/Cython==0.29.21 --hash=sha256:e57acb89bd55943c8d8bf813763d20b9099cc7165c0f16b707631a7654be9cad/Cython==0.29.24 --hash=sha256:cdf04d07c3600860e8c2ebaad4e8f52ac3feb212453c1764a49ac08c827e8443/g' feeds/packages/lang/python/host-pip-requirements/Cython.txt


# gzip
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.12/g' feeds/packages/utils/gzip/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/utils/gzip/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=ce5e03e519f637e1f814011ace35c4f87b33c0bbabeec35baf5fbd3479e91956/g' feeds/packages/utils/gzip/Makefile

# openssh
#sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=8.9p1/g' feeds/packages/net/openssh/Makefile
#sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/net/openssh/Makefile
#sed -i 's/PKG_HASH:=.*/PKG_HASH:=fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7/g' feeds/packages/net/openssh/Makefile
#sed -i '175i\	--with-sandbox=no \\' feeds/packages/net/openssh/Makefile
rm -rf feeds/packages/net/openssh
cp -rf $GITHUB_WORKSPACE/general/openssh feeds/packages/net

# gawk
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=5.1.1/g' feeds/packages/utils/gawk/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=d87629386e894bbea11a5e00515fc909dc9b7249529dad9e6a3a2c77085f7ea2/g' feeds/packages/utils/gawk/Makefile

# unrar
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=6.1.7/g' feeds/packages/utils/unrar/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=de75b6136958173fdfc530d38a0145b72342cf0d3842bf7bb120d336602d88ed/g' feeds/packages/utils/unrar/Makefile

# alsa-utils
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.2.6/g' feeds/packages/sound/alsa-utils/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=6a1efd8a1f1d9d38e489633eaec1fffa5c315663b316cab804be486887e6145d/g' feeds/packages/sound/alsa-utils/Makefile

# alsa-ucm-conf
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.2.6.2/g' feeds/packages/libs/alsa-ucm-conf/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=8be24fb9fe789ee2778ae6f32e18e8043fe7f8bc735871e9d17c68a04566a822/g' feeds/packages/libs/alsa-ucm-conf/Makefile

# alsa-lib
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.2.6.1/g' feeds/packages/libs/alsa-lib/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=ad582993d52cdb5fb159a0beab60a6ac57eab0cc1bdf85dc4db6d6197f02333f/g' feeds/packages/libs/alsa-lib/Makefile
rm -f feeds/packages/libs/alsa-lib/patches/*.patch
wget -P feeds/packages/libs/alsa-lib/patches https://github.com/openwrt/packages/raw/master/libs/alsa-lib/patches/100-link_fix.patch
wget -P feeds/packages/libs/alsa-lib/patches https://raw.githubusercontent.com/openwrt/packages/master/libs/alsa-lib/patches/200-usleep.patch

# hdparm
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=9.64/g' feeds/packages/utils/hdparm/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=315b956951c3fea027287de204381534217c0bd0f37b4935877fe2db0cab859a/g' feeds/packages/utils/hdparm/Makefile

# libcap-ng
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=0.8.3/g' feeds/packages/libs/libcap-ng/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=bed6f6848e22bb2f83b5f764b2aef0ed393054e803a8e3a8711cb2a39e6b492d/g' feeds/packages/libs/libcap-ng/Makefile

# pigz
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2.7/g' feeds/packages/utils/pigz/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=b4c9e60344a08d5db37ca7ad00a5b2c76ccb9556354b722d56d55ca7e8b1c707/g' feeds/packages/utils/pigz/Makefile
rm -rf feeds/packages/utils/pigz/patches

# libnl-tiny
#sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' package/libs/libnl-tiny/Makefile
sed -i 's/PKG_SOURCE_DATE:=.*/PKG_SOURCE_DATE:=2022-05-17/g' package/libs/libnl-tiny/Makefile
sed -i 's/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=b5b2ba09c4f1c8b3c21580aea7223edc2f5e92be/g' package/libs/libnl-tiny/Makefile
sed -i 's/PKG_MIRROR_HASH:=.*/PKG_MIRROR_HASH:=b957d56aa8c2e7b55184111be69eb8dea734f1feba19e670a91f302459a48a78/g' package/libs/libnl-tiny/Makefile
sed -i 's/ABI_VERSION:=.*/ABI_VERSION:=$(PKG_SOURCE_DATE)/g' package/libs/libnl-tiny/Makefile
#sed -i '19,20d' package/libs/libnl-tiny/Makefile

# shairport-sync
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=3.3.9/g' feeds/packages/sound/shairport-sync/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=17990cb2620551caa07a1c3b371889e55803071eaada04e958c356547a7e1795/g' feeds/packages/sound/shairport-sync/Makefile

# less
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=600/g' feeds/packages/utils/less/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=6633d6aa2b3cc717afb2c205778c7c42c4620f63b1d682f3d12c98af0be74d20/g' feeds/packages/utils/less/Makefile

# libupnp
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.14.12/g' feeds/packages/libs/libupnp/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=091c80aada1e939c2294245c122be2f5e337cc932af7f7d40504751680b5b5ac/g' feeds/packages/libs/libupnp/Makefile

# file
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=5.42/g' feeds/packages/libs/file/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=c076fb4d029c74073f15c43361ef572cfb868407d347190ba834af3b1639b0e4/g' feeds/packages/libs/file/Makefile

# nginx
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.21.4/g' feeds/packages/net/nginx/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/net/nginx/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=d1f72f474e71bcaaf465dcc7e6f7b6a4705e4b1ed95c581af31df697551f3bfe/g' feeds/packages/net/nginx/Makefile

# smartdns
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.2022.36.1/g' feeds/packages/net/smartdns/Makefile
sed -i 's/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=4e2161c6fc51f8f6ee233a52c9b6eed82b816370/g' feeds/packages/net/smartdns/Makefile
sed -i 's/PKG_MIRROR_HASH:=.*/PKG_MIRROR_HASH:=2c188e88365f014d172fe31cdada6f95563d5e9307a9db45648d029b3fca8d7f/g' feeds/packages/net/smartdns/Makefile
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.2022.36/g' package/luci-app-smartdns/Makefile

# readd cpufreq for aarch64
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' feeds/luci/applications/luci-app-cpufreq/Makefile
sed -i 's/services/system/g'  feeds/luci/applications/luci-app-cpufreq/luasrc/controller/cpufreq.lua

#fix ntfs3 generating empty package
sed -i 's/DEPENDS:=.*/DEPENDS:=@(LINUX_5_4||LINUX_5_10) +kmod-nls-utf8/g' package/lean/ntfs3-oot/Makefile

# fix kernel modules missing nfs_ssc.ko
cp -f $GITHUB_WORKSPACE/general/fs.mk package/kernel/linux/modules
rm -f target/linux/generic/backport-5.10/350-v5.12-NFSv4_2-SSC-helper-should-use-its-own-config.patch
rm -f target/linux/generic/backport-5.10/351-v5.13-NFSv4_2-Remove-ifdef-CONFIG_NFSD-from-client-SSC.patch
cp -f $GITHUB_WORKSPACE/general/01-export-nfs_ssc.patch target/linux/generic/backport-5.15
cp -f $GITHUB_WORKSPACE/general/003-add-module_supported_device-macro.patch target/linux/generic/backport-5.15

# replace banner
cp -f $GITHUB_WORKSPACE/general/openwrt_banner package/base-files/files/etc/banner

# boost
rm -rf feeds/packages/libs/boost
cp -r $GITHUB_WORKSPACE/general/boost feeds/packages/libs


# zsh
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=5.9/g' feeds/packages/utils/zsh/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba10ab863842d45acd5/g' feeds/packages/utils/zsh/Makefile

# libogg
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.3.5/g' feeds/packages/libs/libogg/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=c4d91be36fc8e54deae7575241e03f4211eb102afb3fc0775fbbc1b740016705/g' feeds/packages/libs/libogg/Makefile

# frp
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=0.44.0/g' feeds/packages/net/frp/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=d16c4be2a0476be039dce114401e7e8417f704eb89d9e5add7b3538dd58a2462/g' feeds/packages/net/frp/Makefile

# libssh2
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.10.0/g' feeds/packages/libs/libssh2/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/libs/libssh2/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=2d64e90f3ded394b91d3a2e774ca203a4179f69aebee03003e5a6fa621e41d51/g' feeds/packages/libs/libssh2/Makefile

# sqlite3
cp -rf $GITHUB_WORKSPACE/general/sqlite3 feeds/packages/libs

# haproxy
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/net/haproxy/Makefile

# util-linux
rm -rf package/utils/util-linux
cp -rf $GITHUB_WORKSPACE/general/util-linux package/utils

# lsof
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=4.95.0/g' feeds/packages/utils/lsof/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=e9faa0fbcc48638c1d1f143e93573ac43b65e76646150f83e24bd8c18786303c/g' feeds/packages/utils/lsof/Makefile

# nghttp2
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.47.0/g' feeds/packages/libs/nghttp2/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=68271951324554c34501b85190f22f2221056db69f493afc3bbac8e7be21e7cc/g' feeds/packages/libs/nghttp2/Makefile

# libiconv-full
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.17/g' package/libs/libiconv-full/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=8f74213b56238c85a50a5329f77e06198771e70dd9a739779f4c02f65d971313/g' package/libs/libiconv-full/Makefile

# bind
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=9.18.4/g' feeds/packages/net/bind/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=f277ae50159a00c300eb926a9c5d51953038a936bd8242d6913dfb6eac42761d/g' feeds/packages/net/bind/Makefile

./scripts/feeds update -a
./scripts/feeds install -a
