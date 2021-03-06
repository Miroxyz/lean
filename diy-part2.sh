#!/bin/bash

# 添加第三方软件包
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-openclash package/kenzok8/luci-app-openclash
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-eqos package/kenzok8/luci-app-eqos
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-atmaterial package/kenzok8/luci-theme-atmaterial
# svn co https://github.com/destan19/OpenAppFilter/trunk package/destan19/OpenAppFilter
svn co https://github.com/tty228/luci-app-serverchan/trunk package/tty228/luci-app-serverchan

# 替换更新默认 argon 主题
rm -rf package/lean/luci-theme-argon && svn co https://github.com/jerrykuku/luci-theme-argon/branches/18.06 package/jerrykuku/luci-theme-argon

# passwall ssrplus+ vssr
svn co https://github.com/xiaorouji/openwrt-passwall/trunk package/xiaorouji/openwrt-passwall
svn co https://github.com/fw876/helloworld/trunk package/fw876/lean/helloworld
svn co https://github.com/jerrykuku/lua-maxminddb/trunk package/jerrykuku/lua-maxminddb
svn co https://github.com/jerrykuku/luci-app-vssr/trunk package/jerrykuku/luci-app-vssr

# 替换更新 haproxy 默认版本
rm -rf feeds/packages/net/haproxy && svn co https://github.com/Lienol/openwrt-packages/trunk/net/haproxy feeds/packages/net/haproxy

# 自定义定制选项
sed -i 's#192.168.1.1#10.10.10.1#g' package/base-files/files/bin/config_generate # 定制默认 IP
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings # 取消系统默认密码
