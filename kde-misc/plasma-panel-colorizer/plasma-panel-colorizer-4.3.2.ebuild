# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Latte-Dock and WM status bar customization for the KDE Plasma panels"
HOMEPAGE="https://github.com/luisbocanegra/plasma-panel-colorizer"
SRC_URI="https://github.com/luisbocanegra/plasma-panel-colorizer/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

IUSE="previewer"

DEPEND=""
RDEPEND="kde-plasma/plasma-workspace:6
		dev-python/dbus-python
		dev-python/pygobject
		previewer? ( kde-plasma/spectacle:6 )"
BDEPEND=""
