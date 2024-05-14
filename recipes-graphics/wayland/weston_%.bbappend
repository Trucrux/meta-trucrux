FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
	file://terminal_24x24.png \
	file://chromium_24x24.png \
	file://thunar.png \
	file://wallpaper.png \
"

do_install:append() {
    install -d ${D}${datadir}/weston
    install ${WORKDIR}/terminal_24x24.png ${D}${datadir}/weston
    install ${WORKDIR}/chromium_24x24.png ${D}${datadir}/weston
    install ${WORKDIR}/thunar.png ${D}${datadir}/weston
    install ${WORKDIR}/wallpaper.png ${D}${datadir}/weston
}
