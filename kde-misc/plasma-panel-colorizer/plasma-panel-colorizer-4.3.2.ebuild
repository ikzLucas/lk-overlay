# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="Latte-Dock and WM status bar customization for the KDE Plasma panels"
HOMEPAGE="https://github.com/luisbocanegra/plasma-panel-colorizer"
SRC_URI="https://github.com/luisbocanegra/plasma-panel-colorizer/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

IUSE="previewer"

DEPEND=">=dev-lang/python-3.11
		dev-python/setuptools
		kde-plasma/libplasma:6
		kde-frameworks/extra-cmake-modules"
RDEPEND="kde-plasma/plasma-workspace:6
		dev-python/dbus-python
		dev-python/pygobject
		previewer? ( kde-plasma/spectacle:6 )"

src_prepare() {
	default
	python3 ./kpac i18n --no-merge
}

src_configure() {
	cmake_src_configure \
		-DINSTALL_PLASMOID=ON \
		-DBUILD_PLUGIN=ON
}

src_install() {
	cmake_src_install
	chmod 755 "${D}/usr/share/plasma/plasmoids/luisbocanegra.panel.colorizer/contents/ui/tools/list_presets.sh"
	chmod 755 "${D}/usr/share/plasma/plasmoids/luisbocanegra.panel.colorizer/contents/ui/tools/gdbus_get_signal.sh"
}

pkg_postinst() {
	elog "Remember to restart plasmashell after updating $PN."
}
