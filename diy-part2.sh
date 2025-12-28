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

# Modify default IP
sudo apt install libfuse-dev
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

# 在 diy-part2.sh 中执行，此时 feeds 已经下载完毕

# 全局扫描：删除所有配置文件中包含 vsean.net 的行，但不触碰其他官方源
find ./ -name "distfeeds.conf" | xargs sed -i '/vsean.net/d'
find ./ -name "distfeeds.conf" | xargs sed -i '/immortalwrt_kiddin9/d'

# 针对你提到的那个 MTK 插件路径进行精准清理
[ -f package/mtk/applications/luci-app-openfi/root/usr/opkg/distfeeds.conf ] && \
sed -i '/vsean.net/d' package/mtk/applications/luci-app-openfi/root/usr/opkg/distfeeds.conf
