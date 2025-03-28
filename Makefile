#
# Copyright (C) 2025 luci-app-udp2raw-client
# Copyright (C) 2025 NagaseKouichi
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-udp2raw-client
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=NagaseKouichi

LUCI_TITLE:=LuCI support for U2p2raw(client).
LUCI_DESCRIPTION:=LuCI Support for U2p2raw(client).
LUCI_DEPENDS:=+udp2raw
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

define Package/udp2raw-client/conffiles
/etc/config/udp2raw-client
endef

# call BuildPackage - OpenWrt buildroot signature
