# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_11 python3_12 python3_13 python3_14 )
inherit cmake python-any-r1

DESCRIPTION="Latte-Dock and WM status bar customization for the KDE Plasma panels"
HOMEPAGE="https://github.com/luisbocanegra/plasma-panel-colorizer"
SRC_URI="https://github.com/luisbocanegra/plasma-panel-colorizer/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

IUSE="previewer"

DEPEND="kde-plasma/libplasma:6
		kde-frameworks/extra-cmake-modules
		sys-devel/gettext
		kde-plasma/plasma-workspace:6
		previewer? ( kde-plasma/spectacle:6 )"
BDEPEND="${PYTHON_DEPS}
		dev-python/dbus-python
		dev-python/pygobject"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	cmake_src_prepare
	"${EPYTHON}" ./kpac i18n --no-merge
}

src_configure() {
	local mycmakeargs=(
        -DINSTALL_PLASMOID=ON
        -DBUILD_PLUGIN=ON
    )
	cmake_src_configure
}

pkg_postinst() {
	chmod 755 /usr/share/plasma/plasmoids/luisbocanegra.panel.colorizer/contents/ui/tools/list_presets.sh
	chmod 755 /usr/share/plasma/plasmoids/luisbocanegra.panel.colorizer/contents/ui/tools/gdbus_get_signal.sh
	elog "Remember to restart plasmashell after updating $PN."
}
