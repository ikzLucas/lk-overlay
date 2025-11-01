# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg

DESCRIPTION="A Crystal icon theme for modern Linux desktop environments"
HOMEPAGE="https://github.com/dangvd/crystal-remix-icon-theme"
SRC_URI="https://github.com/dangvd/crystal-remix-icon-theme/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

src_prepare() {
	default
	eapply -p0 "${FILESDIR}/theme-fallback.patch"
}

src_install() {
	rm install.sh README.md
	insinto /usr/share/icons/crystal-remix
	doins -r ./
}
