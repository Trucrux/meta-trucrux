FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://trucrux-blacklist.conf \
	file://NetworkManager.conf \
"

do_install:append() {
	install -d ${D}${sysconfdir}/NetworkManager
	install -m 0755 -d ${D}${sysconfdir}/modprobe.d
	install -m 0644 ${WORKDIR}/trucrux-blacklist.conf ${D}${sysconfdir}/modprobe.d
	cp -r ${WORKDIR}/NetworkManager.conf ${D}${sysconfdir}/NetworkManager/NetworkManager.conf
}
