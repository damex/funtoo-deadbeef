# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit eutils git-2

DESCRIPTION="bs2b DSP plugin for DeaDBeeF, using libbs2b."
HOMEPAGE="https://gitorious.org/deadbeef-sm-plugins/bs2b"
EGIT_REPO_URI="git://gitorious.org/deadbeef-sm-plugins/bs2b.git"
EGIT_COMMIT="d563ff57fd1cc5d24644e0a0981896d50d2f3b1f"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~*"
IUSE=""

RDEPEND="media-libs/libbs2b
	media-sound/deadbeef"

DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PN}.patch"
}

src_install(){
	insinto "/usr/$(get_libdir)/deadbeef"
	doins "${S}/ddb_bs2b.so" || die
	dodoc "${S}/COPYING" || die
}
